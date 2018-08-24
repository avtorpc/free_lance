<?php
/**
 * Created by PhpStorm.
 * User: avtorpc
 * Date: 24.08.18
 * Time: 16:31
 */

namespace app;


class ClassPageResolve {

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