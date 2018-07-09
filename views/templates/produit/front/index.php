<?php $title = 'Liste de nos produits'?>
<?= $_SESSION['id']?>
<?php ob_start(); ?>
<div class="container pt-4">
  <h1 class="text-left"><?= $title ?></h1>
  <div class="row mb-4">
      <input name="nom_produit" class="form-control mr-sm-2 col-sm-9" type="search" id="search-customer" placeholder="Search" aria-label="Search">
  <?php 
      //categorie::select_cat();
      echo $categorieListe;
  ?>
  </div>
<div class="row">
  <div id="product-boxes" class="d-flex justify-content-around flex-wrap">
  <?php foreach($produits as $produit):?>
    <div class="card mb-4" style="width: 20rem">
      <h5 class="card-header"><?= $produit['nom'] ?></h5>
      <div class="card-body">
        <h5 class="card-title">Prix HT :<?= $produit['prix_ht'] ?> €</h5>
        <p class="card-text"><?= $produit['description'] ?></p>
        <p class="card-text">Categories : <?= $produit['nom_categorie'] ?></p>
        <a class="btn btn-primary" href="index.php?controller=panier_produit&amp;action=store&amp;produit_id=<?= $produit['id'] ?>">Ajouter au panier</a>

      </div>
    </div>
<?php endforeach;?>
    </div>
  </div>
</div>

<?php $content = ob_get_clean(); ?>

<?php require '../views/index.php'; ?>