<?php
ini_set('display_errors', 1);
ini_set('error_reporting', E_ALL);
ini_set('memory_limit', '128M');
set_time_limit(0);


require_once 'app/ClassGetPage.php';
require_once 'app/ClassPageResolve.php';
require_once 'vendor/simple_html_dom.php';

use app\ClassGetPage;
use app\ClassPageResolve;

$search_string = null; // или null если надо выбирать всех пользователей со страницы

$cURL = new ClassGetPage;

$conn = pg_connect("host=localhost port=5432 dbname=free_lance user= password=")  or die('connection DB failed');

$data = str_get_html($cURL->getPage('https://freelansim.ru/users/sign_in'));

if (count($data->find('form.js-signin-form')) != 0) {
    $auth = array(
        'user[email]' => 'jz@codedone.io',
        'user[password]' => 'testfree',
        'authenticity_token' => $data->find('input[name="authenticity_token"]', 0)->value,
        'utf8' => $data->find('input[name="utf8"]', 0)->value
    );
    $data = str_get_html($cURL->getPage('https://freelansim.ru/users/sign_in', $auth));
}

//Получаем максимальный номер страницы
$pAGE = new ClassPageResolve;

for( $i= 1; $i<=500; $i++){

$data = str_get_html( $cURL->getPage('https://freelansim.ru/freelancers?page=' . $i ) );

$user_arr = [];
foreach ($data->find('.user__tags') as $key => $value) {

        if( is_null( $search_string ) ){
            foreach ($data->find('.user-data__title a') as $k => $v) {
                $link = $v->href;
                $user_arr[md5( $link )]['link'] = $link;
            }
        } else {
            foreach ($value->find('.tags__item a') as $k => $v) {
            if( is_in_str($v->plaintext, $search_string ) ){
                $search[] = $v->plaintext;
                $par = $v;
                while (true) {
                    $par = $par->parent();

                    if( $par->class == 'user__info') {
                        $user_link = $par->find( '.user-data__title a' );
                        $link = $user_link[0]->href;

                        $user_arr[md5( $link )]['link'] = $link;
                        if( isset( $user_arr[md5( $link )]['count'] )) {
                            $user_arr[md5( $link )]['count'] =  $user_arr[md5( $link )]['count'] + 1;
                        } else {
                            $user_arr[md5( $link )]['count'] = 1;
                        }
                        break;
                    }
                    if( $par->tag == 'body') {
                        break;
                    }
                }
            }
        }
    }
}

foreach ( $user_arr as $key_user => $value_user ){
    $data = str_get_html($cURL->getPage('https://freelansim.ru/' . $value_user['link']));
    $user = $data->find('.user__name_large a' );
    $user_arr[$key_user]['name'] = $user[0]->plaintext;
    $user = $data->find('.user-params_inline .user-params__value');

        $user_arr[$key_user]['price'] =  isset($user[0]->plaintext) ? $user[0]->plaintext: null ;
        $user_arr[$key_user]['experience'] = isset($user[1]->plaintext) ? $user[1]->plaintext: null ;
        $user_arr[$key_user]['ownership'] = isset($user[2]->plaintext) ? $user[2]->plaintext: null ;
        $user_arr[$key_user]['payment'] = isset( $user[3]->plaintext ) ? $user[3]->plaintext: null;

    $user = $data->find('.user-data__about' );
    $user_arr[$key_user]['about'] = $user[0]->plaintext;

    $user_arr[$key_user]['about'] = str_replace(['Telegram', 'telegram:', 'Skype', 'skype'], [' Telegram', ' telegram:', ' Skype', ' skype'], $user_arr[$key_user]['about'] );

    preg_match_all( "/[^@\s]++@\S++/", $user_arr[$key_user]['about'], $a);
    if( isset( $a[0])) {
        foreach ( $a[0] as $key=>$val) {
            $user_arr[$key_user]['contact']['mail'][md5( $val )] = $val;
        }
    }

    preg_match_all('/(http|https|ftp|ftps|)\:\/\/[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(\/\S*)?/', $user_arr[$key_user]['about'], $a );
    foreach ( $a[0] as $key=>$val) {
        $user_arr[$key_user]['contact']['http'][md5( $val )] = $val;
    }

    preg_match_all('/Skype:(.*?\r\n)|Skype:(.*)?/is', $user_arr[$key_user]['about'], $a);
    foreach ( $a as $key=>$val) {
        if( isset( $val[0]) AND $val[0] != ''){
            $user_skype = trim( str_replace(['Skype:', 'skype:', 'Skype', 'skype'], "", $val[0] ) );
            $user_arr[$key_user]['contact']['skype'][md5( $user_skype )] = $user_skype;
        }

    }

    preg_match_all('/Telegram:(.*?\r\n)|Telegram:(.*)?/is', $user_arr[$key_user]['about'], $a);
    foreach ( $a as $key=>$val) {
        if( isset( $val[0]) AND $val[0] != ''){
            $user_telegram = str_replace(['Telegram:', 'telegram:', 'Telegram', 'telegram'], "", $val[0] );
            $user_arr[$key_user]['contact']['telegramm'][md5( $user_telegram )] = $user_telegram;
        }

    }

    preg_match_all('/(8|7|\+7){0,1}[- \\\\(]{0,}([9][0-9]{2})[- \\\\)]{0,}(([0-9]{2}[- ]{0,}[0-9]{2}[- ]{0,}[0-9]{3})|([0-9]{3}[- ]{0,}[0-9]{2}[- ]{0,}[0-9]{2})|([0-9]{3}[- ]{0,}[0-9]{1}[- ]{0,}[0-9]{3})|([0-9]{2}[- ]{0,}[0-9]{3}[- ]{0,}[0-9]{2}))/', $user_arr[$key_user]['about'], $a );
    if( isset( $a[0])){
        foreach ( $a[0] as $key=>$val) {
            $user_arr[$key_user]['contact']['phone'][md5( $val )] = $val;
        }
    }

    foreach( $data->find( '.user-params__value_tags a' ) as $key => $value ){
        $user_arr[$key_user]['tags'][] = $value->plaintext;
    }

}

//Записываем данные со страницы в базу
    $ins_user = '';
    $del = 'DELETE FROM lancers.users AS U WHERE U.hash IN( ';
    foreach ($user_arr as $key_user => $value_user) {
        $del = $del . "'" . $key_user . "',";
        $ins_user = $ins_user . 'INSERT INTO lancers.users( hash, name_user, tag_rank, page_number, link, price, experience, ownership, payment, about, date_insert) VALUES (';
        $ins_user = $ins_user . "'" . $key_user . "',";
        $ins_user = $ins_user . "'" . pg_escape_string($value_user['name']) . "',";
        $ins_user = $ins_user . "'" . ( isset( $value_user['count'] ) ? pg_escape_string( $value_user['count'] ): 0 ) . "',";
        $ins_user = $ins_user . $i .",";
        $ins_user = $ins_user . "'" . pg_escape_string($value_user['link']) . "',";
        $ins_user = $ins_user . "'" . pg_escape_string($value_user['price']) . "',";
        $ins_user = $ins_user . "'" . pg_escape_string($value_user['experience']) . "',";
        $ins_user = $ins_user . "'" . pg_escape_string($value_user['ownership']) . "',";
        $ins_user = $ins_user . "'" . pg_escape_string($value_user['payment']) . "',";
        $ins_user = $ins_user . "'" . pg_escape_string(str_replace(['\n', '\r', '\r\n'], ' ', $value_user['about'])) . "',";
        $ins_user = $ins_user . 'now());';
        if (isset($value_user['contact']['mail'])) {
            foreach ($value_user['contact']['mail'] as $key_phone => $val_phone) {
                $ins_user = $ins_user . "INSERT INTO lancers.mail(user_mail, link_user) VALUES ( '" . $val_phone . "'," . "'" . $key_user . "');";
            }
        }
        if (isset($value_user['contact']['http'])) {
            foreach ($value_user['contact']['http'] as $key_http => $val_http) {
                $ins_user = $ins_user . "INSERT INTO lancers.http(url, link_user) VALUES ( '" . $val_http . "'," . "'" . $key_user . "');";
            }
        }
        if (isset($value_user['contact']['skype'])) {
            foreach ($value_user['contact']['skype'] as $key_skype => $val_skype) {
                $ins_user = $ins_user . "INSERT INTO lancers.skype(login, link_user) VALUES ( '" . $val_skype . "'," . "'" . $key_user . "');";
            }
        }
        if (isset($value_user['contact']['telegramm'])) {
            foreach ($value_user['contact']['telegramm'] as $key_telegramm => $val_telegramm) {
                $ins_user = $ins_user . "INSERT INTO lancers.telegramm(login, link_user) VALUES ( '" . $val_telegramm . "'," . "'" . $key_user . "');";
            }
        }
        if (isset($value_user['contact']['telegramm'])) {
            foreach ($value_user['contact']['telegramm'] as $key_telegramm => $val_telegramm) {
                $ins_user = $ins_user . "INSERT INTO lancers.telegramm(login, link_user) VALUES ( '" . $val_telegramm . "'," . "'" . $key_user . "');";
            }
        }
        if (isset($value_user['tags'])) {
            foreach ($value_user['tags'] as $key_tags => $val_tags) {
                $ins_user = $ins_user . "INSERT INTO lancers.tags(tag, link_user) VALUES ( '" . $val_tags . "'," . "'" . $key_user . "');";
            }
        }
    }

  if ( count( $user_arr)>0) {
      pg_query($conn, substr($del, 0, -1) . ')');
      pg_query($conn, $ins_user);
  }

}

function is_in_str($str,$substr)
{
    $result = strripos ($str, $substr);
    if ($result === FALSE) // если это действительно FALSE, а не ноль, например
        return false;
    else
        return true;
}










