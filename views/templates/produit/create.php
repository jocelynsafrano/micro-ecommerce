<?php $title = 'Liste des produits'?>

<?php ob_start(); ?>
<div class="container mt-4" >
    <div class="col-md-6 offset-md-3 mt-4">
        <form action="index.php?controller=produit&amp;action=store" method="POST">
        <div class="form-group">
            <label for="nom">Nom du produit :</label>
            <input name="nom" type="text" class="form-control" id="nom" placeholder="Grimbergen">
        </div>
        <div class="form-group">
            <label for="description">Description :</label>
            <input name="description" type="text" class="form-control" id="description" placeholder="">
        </div>

        <div class="form-group">
            <label for="prix_ht">Prix hors taxes :</label>
            <input name="prix_ht" type="text" class="form-control" id="prix_ht" placeholder="4.00">
        </div>

        <div class="form-group">
            <?= $categorieSelectList ?>
        </div>

        <button type="submit" class="btn btn-primary produits mt-4">Créer</button>
        </form>
    </div>
</div>
<?php $content = ob_get_clean(); ?>

<?php require '../views/index.php';?>