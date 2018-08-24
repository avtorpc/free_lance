<?php
/**
 * Created by PhpStorm.
 * User: avtorpc
 * Date: 23.08.18
 * Time: 14:50
 */

namespace app;
class ClassGetPage{

    public function getPage( $url, $post = 0 ){
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url ); // отправляем на
        curl_setopt($ch, CURLOPT_HEADER, 0); // пустые заголовки
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); // возвратить то что вернул сервер
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1); // следовать за редиректами
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 30);// таймаут4
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        //curl_setopt($ch, CURLOPT_HEADERFUNCTION, [ $this, "HandleHeaderLine"]);
        curl_setopt($ch, CURLOPT_COOKIEJAR, dirname(__FILE__).'/cookie.txt'); // сохранять куки в файл
        curl_setopt($ch, CURLOPT_COOKIEFILE,  dirname(__FILE__).'/cookie.txt');
        curl_setopt($ch, CURLOPT_POST, $post!==0 ); // использовать данные в post
        if($post) {
            curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
        }
        $data = curl_exec($ch);
        curl_close($ch);
        return $data;
    }

    private function HandleHeaderLine( $curl, $header_line ) {
        echo "<pre>";
        print_r(  "<br>YEAH: ".$header_line ); // or do whatever
        echo "</pre>";
        return strlen($header_line);
    }


    public function getMaxNumberPage( $data ){
        foreach( $data->find( '.pagination a' ) as $key=>$value ) {
            if( ctype_digit( $value->plaintext ) ){
                $m[$value->plaintext] = $value->plaintext;
            }
        }
        ksort( $m );

        return array_pop( $m );
    }
}