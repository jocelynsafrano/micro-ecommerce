<?php $title = 'Créer une nouvelle catégorie'?>

<?php ob_start(); ?>
<div class="container mt-4" >

<h1><?= $title ?></h1>
    <div class="col-md-6 offset-md-3 mt-4">
        <form action="index.php?controller=categorie&amp;action=store" method="POST">
        <div class="form-group">
            <label for="nom">Nom de la catégorie :</label>
            <input name="nom" type="text" class="form-control" id="nom" placeholder="Fruits et légumes">
        </div>
        <div class="form-group">
            <label for="description">Description :</label>
            <textarea name="description" type="text" class="form-control" id="description"> </textarea>
        </div>

        <button type="submit" class="btn btn-primary produits produits">Créer</button>
        </form>
    </div>
</div>
<?php $content = ob_get_clean(); ?>

<?php require '../views/index.php';?>