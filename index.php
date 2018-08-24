<?php
ini_set('display_errors', 1);
ini_set('error_reporting', E_ALL);


require_once 'app/ClassGetPage.php';
require_once 'app/ClassPageResolve.php';
require_once 'vendor/simple_html_dom.php';

use app\ClassGetPage;
use app\ClassPageResolve;


$cURL = new ClassGetPage;

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

//Получаем максимальный адрес страницы
$pAGE = new ClassPageResolve;

$data = str_get_html($cURL->getPage('https://freelansim.ru/freelancers'));

$max_page = $pAGE->getMaxNumberPage($data);
//  echo $max_page;

//Парсим первую страницу
foreach ($data->find('.user__tags') as $key => $value) {
    foreach ($value->find('.tags__item a') as $k => $v) {
        if( is_in_str($v->plaintext, 'дизайн') ){
            $search[] = $v->plaintext;
        }
        $all_tags[md5(str_replace(array(' ', '\r', '\n', '\t'), '', $v->plaintext))] = $v->plaintext;
    }
}
echo "<pre>";
print_r($all_tags);
echo "</pre>";
echo "<pre>";
print_r($search);

function is_in_str($str,$substr)
{
    $result = strripos ($str, $substr);
    if ($result === FALSE) // если это действительно FALSE, а не ноль, например
        return false;
    else
        return true;
}










