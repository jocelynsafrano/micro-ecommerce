<?php

class categorie_produit{
    use Genos;
    
    public $id;
    public $categorie_id;
    public $produit_id;
    public $post;
    public $get;

    public function __construct($post = NULL, $get = NULL){
        $this->post = $post;
        $this->get = $get;
    }    
}
    