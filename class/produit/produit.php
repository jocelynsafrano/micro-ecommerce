<?php

class produit{
    use Genos;
    
    public $id;
    public $nom;
    public $description;
    public $utilisateur_id;
    public $prix_ht = '0000000000';
    public $date_creation;
    public $date_modification;
    public $is_deleted;
    public $post;
    public $get;
    public $categorie;
    public $cp;
    

    public function __construct($post = NULL, $get = NULL, categorie $categorie = NULL, categorie_produit $cp = NULL){
        $this->post = $post;
        $this->get = $get;
        $this->date_creation = date('Y-m-d');
        $this->categorie = $categorie;
        $this->cp = $cp;
    }

    public function index(){
        $query = 'SELECT p.id, p.nom, p.description, GROUP_CONCAT(c.nom) AS nom_categorie, p.prix_ht, p.date_creation, p.date_modification FROM produit AS p LEFT JOIN categorie_produit AS cp ON p.id = cp.produit_id LEFT JOIN categorie AS c ON cp.categorie_id = c.id WHERE p.is_deleted = 0 GROUP BY p.id DESC';
    
        $returnFields = ['id', 'nom', 'description', 'nom_categorie', 'prix_ht', 'date_creation', 'date_modification'];
        
        $produits = $this->StructList($query, $returnFields);
        
        if(isset($_SESSION['role_id'])){
            if($_SESSION['id'] == 1){
                $config['attr']['id'] = "categorie-filter-admin"; 
            }else{
                $config['attr']['id'] = "categorie-filter-customer"; 
            }
        }else{
            $config['attr']['id'] = "categorie-filter-customer"; 
        }
        
        $config['attr']['class'] = "custom-select col-sm-2 "; 
        ob_start();
        $this->categorie->SelectList( "categorie_id" , "id" , "nom" , $config);
        $categorieListe = ob_get_clean();

        if(isset($_SESSION['id'])){
            if($_SESSION['role_id'] == 1){
                return require '../views/templates/produit/index.php';
            }
        }
        
        return require '../views/templates/produit/front/index.php';
    }

    public function nouveautes(){
        if($_SESSION['role_id'] != 1 && $_SESSION['role_id'] != 2) {
            $_SESSION['messages'] = [
                'body' => "Vous devrez connecté en tant que client pour pouvoir effectuer cette tâche !",
                'type' => "danger"
            ];

            if(isset($_SERVER['HTTP_REFERER'])){
                header('Location: ' . $_SERVER['HTTP_REFERER']);
                exit;
            } 

            header('Location: index.php?controller=auth&action=index');
            exit;
        }
        
        $query = 'SELECT p.id, p.nom, p.description, GROUP_CONCAT(c.nom) AS nom_categorie, p.prix_ht, p.date_creation, p.date_modification FROM produit AS p LEFT JOIN categorie_produit AS cp ON p.id = cp.produit_id LEFT JOIN categorie AS c ON cp.categorie_id = c.id WHERE p.is_deleted = 0 GROUP BY p.id DESC LIMIT 0, 10';
    
        $returnFields = ['id', 'nom', 'description', 'nom_categorie', 'prix_ht', 'date_creation', 'date_modification'];
        
        $produits = $this->StructList($query, $returnFields);
        
        if(isset($_SESSION['role_id'])){
            if($_SESSION['id'] == 1){
                $config['attr']['id'] = "categorie-filter-admin"; 
            }else{
                $config['attr']['id'] = "categorie-filter-customer"; 
            }
        }else{
            $config['attr']['id'] = "categorie-filter-customer"; 
        }
        
        $_SESSION['messages'] = [
            'body' => "Voici la liste des 10 nouveautés",
            'type' => "success"
        ];

        $config['attr']['class'] = "custom-select col-sm-2 "; 
        ob_start();
        $this->categorie->SelectList( "categorie_id" , "id" , "nom" , $config);
        $categorieListe = ob_get_clean();
        
        return require '../views/templates/produit/front/index.php';
    }

    
    public function meilleuresventes(){
        if($_SESSION['role_id'] != 1 && $_SESSION['role_id'] != 2) {
            $_SESSION['messages'] = [
                'body' => "Vous devrez connecté en tant que client pour pouvoir effectuer cette tâche !",
                'type' => "danger"
            ];

            if(isset($_SERVER['HTTP_REFERER'])){
                header('Location: ' . $_SERVER['HTTP_REFERER']);
                exit;
            } 
            
            header('Location: index.php?controller=auth&action=index');
            exit;
        }
        
        $query = 'SELECT p.id, p.nom, p.description, GROUP_CONCAT(c.nom) AS nom_categorie, p.prix_ht, p.date_creation, p.date_modification FROM produit AS p LEFT JOIN categorie_produit AS cp ON p.id = cp.produit_id LEFT JOIN categorie AS c ON cp.categorie_id = c.id LEFT JOIN commande_produit ON p.id = commande_produit.produit_id WHERE p.is_deleted = 0 GROUP BY p.id DESC LIMIT 0 , 10';
    
        $returnFields = ['id', 'nom', 'description', 'nom_categorie', 'prix_ht', 'date_creation', 'date_modification'];
        
        $produits = $this->StructList($query, $returnFields);
        
        if(isset($_SESSION['role_id'])){
            if($_SESSION['id'] == 1){
                $config['attr']['id'] = "categorie-filter-admin"; 
            }else{
                $config['attr']['id'] = "categorie-filter-customer"; 
            }
        }else{
            $config['attr']['id'] = "categorie-filter-customer"; 
        }
        
        $_SESSION['messages'] = [
            'body' => "Voici la liste de nos meilleures ventes !",
            'type' => "success"
        ];

        $config['attr']['class'] = "custom-select col-sm-2 "; 
        ob_start();
        $this->categorie->SelectList( "categorie_id" , "id" , "nom" , $config);
        $categorieListe = ob_get_clean();
        
        return require '../views/templates/produit/front/index.php';
    }

    public function create(){
        ob_start();
        $options['class'] = "custom-select";
        $options['attr']['multiple'] = "multiple";
        // selected="selected" 
        $this->categorie->SelectList("categorie_id[]", "id", "nom", $options);
        $categorieSelectList = ob_get_clean();

        return require '../views/templates/produit/create.php';
    }

    public function search(){
        if(!isset($this->post['query']) || empty($this->post['query'])){
            $query = 'SELECT p.id, p.nom, p.description, GROUP_CONCAT(c.nom) AS nom_categorie, p.prix_ht, p.date_creation, p.date_modification FROM produit AS p LEFT JOIN categorie_produit AS cp ON p.id = cp.produit_id LEFT JOIN categorie AS c ON cp.categorie_id = c.id WHERE p.is_deleted = 0 GROUP BY p.id DESC';
        }else{
            $query = "SELECT p.id, p.nom, p.description, GROUP_CONCAT(c.nom) AS nom_categorie, p.prix_ht, p.date_creation, p.date_modification FROM produit AS p LEFT JOIN categorie_produit AS cp ON p.id = cp.produit_id LEFT JOIN categorie AS c ON cp.categorie_id = c.id WHERE p.is_deleted = 0 AND p.is_deleted = 0 AND p.nom LIKE :nom OR p.description LIKE :description OR c.nom LIKE :nom_categorie GROUP BY p.id";

            $bind = [
                'nom' => '%' . $this->post['query'] . '%',
                'description' => '%' . $this->post['query'] . '%',
                'nom_categorie' => '%' . $this->post['query'] . '%',
            ];
        }

        $returnFields = ['id', 'nom_categorie', 'date_creation', 'date_modification', 'nom', 'description', 'prix_ht'];
        
        if(isset($bind)){
            echo $produits = $this->StructList($query, $returnFields, $bind, "json");        
        }else{
            echo $produits = $this->StructList($query, $returnFields, "json");        
        }
        
        return true;
    }

    public function store(){
        if(!isset($_SESSION['id'])){

            $_SESSION['messages'] = [
                'body' => "Vous devrez être connecté pour effectuer cette action !",
                'type' => "danger"
            ];

            if(isset($_SERVER['HTTP_REFERER'])){
                header('Location: ' . $_SERVER['HTTP_REFERER']);
                exit;
            } 
            
            header('Location: index.php?controller=auth&action=index');
            exit;
        }

        if(!isset($this->post['nom']) || empty($this->post['nom'])){
            echo "Can't find any product name";
            return;
        }

        if(!isset($this->post['description']) || empty($this->post['description'])){
            echo "Can't find any product description";
            return;
        }

        if(!isset($this->post['prix_ht']) || empty($this->post['prix_ht'])){
            echo "Can't find any HT price";
            return;
        }

        $this->Set('utilisateur_id', $_SESSION['id']);
        $this->Set('nom', $this->post['nom']);
        $this->Set('description', $this->post['description']);
        $this->Set('prix_ht', intval($this->post['prix_ht']));
        $this->Set('is_deleted', 0);
        
        $produit_id = $this->Add();

        if(isset($this->post['categorie_id'])){
            
            foreach($this->post['categorie_id'] as $categorie_id){

                $array = ['categorie_id' => $categorie_id];
                $array = ['produit_id' => $produit_id];
                
                $isFound = $this->cp->Find($array);


                if(empty($isFound)){
                    $this->cp->Set('categorie_id', $categorie_id);
                    $this->cp->Set('produit_id', $produit_id);
                    $this->cp->Add();
                }
                
            }
        }

        $this->index();

    }

    public function edit(){
        if(!isset($_SESSION['id'])){

            $_SESSION['messages'] = [
                'body' => "Vous devrez être connecté pour effectuer cette action !",
                'type' => "danger"
            ];

            if(isset($_SERVER['HTTP_REFERER'])){
                header('Location: ' . $_SERVER['HTTP_REFERER']);
                exit;
            } 
            
            header('Location: index.php?controller=auth&action=index');
            exit;
        }

        if($_SESSION['role_id'] != 1){
            echo 'Vous n\'êtes pas autorisé visualiser la liste des clients';
            return;
        }

        $query = 'SELECT id, nom, description, prix_ht FROM produit WHERE id = :id';
        $returnFields = ['id','nom', 'description', 'prix_ht'];
        
        $bind = ['id' => $this->get['produit_id']];
        
        $produit = $this->StructList($query, $returnFields, $bind);
        $produit = $produit[0];
        // todo : preselect the desired categories

        ob_start();
        $options['class'] = "custom-select";
        $options['attr']['multiple'] = "multiple";
        $this->categorie->SelectList("categorie_id[]", "id", "nom", $options);
        $categorieSelectList = ob_get_clean();


        if(!empty($produit)){
            return require '../views/templates/produit/edit.php';
        }

        header('Location: ' . $_SERVER['HTTP_REFERER']);
        exit;
    }


    public function updateDb(){

        if(!isset($_SESSION['id'])){

            $_SESSION['messages'] = [
                'body' => "Vous devrez être connecté pour effectuer cette action !",
                'type' => "danger"
            ];

            if(isset($_SERVER['HTTP_REFERER'])){
                header('Location: ' . $_SERVER['HTTP_REFERER']);
                exit;
            } 
            
            header('Location: index.php?controller=auth&action=index');
            exit;
        }

        if(!isset($this->post['nom']) || empty($this->post['nom'])){
            echo "Aucun nom n'est attribué";
            return;
        }
        if(!isset($this->post['description']) || empty($this->post['description'])){
            echo "Aucun prenom n'est attribué";
            return;
        }
        if(!isset($this->post['prix_ht']) || empty($this->post['prix_ht'])){
            echo "Aucun email n'est attribué";
            return;
        }

        if(!isset($this->post['produit_id']) || empty($this->post['produit_id'])){
            echo "Aucun email n'est attribué";
            return;
        }


        $this->Set('id', $this->post['produit_id']);

        $this->Load();

        $this->Set('nom', $this->post['nom']);
        $this->Set('description',$this->post['description']);
        $this->Set('prix_ht', intval($this->post['prix_ht']));
        $this->Set('date_modification', date('Y-m-d'));

        $this->Update();
       
        if(isset($this->post['categorie_id'])){
            
            foreach($this->post['categorie_id'] as $categorie_id){

                $array['categorie_id'] = $categorie_id;
                $array['produit_id'] = $this->id;
                
                $isFound = $this->cp->Find($array);


                if(empty($isFound)){
                    $this->cp->Set('categorie_id', $categorie_id);
                    $this->cp->Set('produit_id', $this->id);
                    $this->cp->Add();
                }
            }
        }
        $_SESSION['messages'] = [
            'body' => "Produit a été modifé!",
            'type' => "success"
        ];


        header('Location: index.php?controller=produit&action=index');
        exit;    
    }

    public function destroy(){
        if(!isset($_SESSION['id'])){

            $_SESSION['messages'] = [
                'body' => "Vous devrez être connecté pour effectuer cette action !",
                'type' => "danger"
            ];

            if(isset($_SERVER['HTTP_REFERER'])){
                header('Location: ' . $_SERVER['HTTP_REFERER']);
                exit;
            } 
            
            header('Location: index.php?controller=auth&action=index');
            exit;
        }

        if($_SESSION['role_id'] != 1){

            $_SESSION['messages'] = [
                'body' => "vous n'êtes pas autorisé à effectuer cette tâche administrative",
                'type' => "danger"
            ];

            if(isset($_SERVER['HTTP_REFERER'])){
                header('Location: ' . $_SERVER['HTTP_REFERER']);
                exit;
            } 
            
            header('Location: index.php?controller=auth&action=index');
            exit;
        }
        
        if(!isset($this->get['produit_id']) || empty($this->get['produit_id'])){
            echo "Can't find any product id";
            return;
        }

        $req = "UPDATE produit SET is_deleted = 1 WHERE id = :id" ;
        
        $bind = ['id' => $this->get['produit_id']];
        
        $deleted = $this->Sql($req, $bind);
        
        $_SESSION['messages'] = [
            'body' => "Produit supprimé avec succès !",
            'type' => "success"
        ];

        if(isset($_SERVER['HTTP_REFERER'])){
            header('Location: ' . $_SERVER['HTTP_REFERER']);
            exit;
        } 
        
        header('Location: index.php?controller=auth&action=index');
        exit;
    }

    public function filter() {
         
        if(!isset($this->get['categorie_id']) || empty($this->get['categorie_id'])){
            echo "Can't find any product id";
            return;
        }

        $query = 'SELECT p.id, p.nom, p.description, c.nom AS nom_categorie, p.prix_ht, p.date_creation, p.date_modification FROM produit AS p LEFT JOIN categorie_produit AS cp ON p.id = cp.produit_id LEFT JOIN categorie AS c ON cp.categorie_id = c.id WHERE p.is_deleted = 0 AND c.id = :id_categorie';

        $bind = ['id_categorie' => $this->get['categorie_id']];
        
        $returnFields = ['id', 'nom', 'description', 'nom_categorie', 'prix_ht', 'date_creation', 'date_modification'];

        $json  = $this->StructList($query, $returnFields, $bind,"json");
        
        echo $json;
    }
}