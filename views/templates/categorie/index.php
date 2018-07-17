<?php $title = 'Liste des catégories'?>

<?php ob_start(); ?>
<div class="container pt-4">
  <h1 class="text-left"><?= $title ?></h1>
  <?php if($_SESSION['role_id'] == 1):?>
  <a class="btn btn-primary produits m-4" href="index.php?controller=categorie&amp;action=create" role="button">Créer une catégorie</a>
<?php endif; ?>
  <table class="table">
    <thead class="thead-dark">
      <tr>
        <th scope="col">#</th>
        <th scop="col">Nom</th>
        <th scop="col">Description</th>
        <th scop="col">Date de création</th>
        <th scop="col">Date de modification</th>
        <th scope="col">Actions</th>
        <th scope="col"></th>
      </tr>
    </thead>
    <tbody>
  <?php 
  $i = 1;
  foreach($categories as $categorie):?>
      <tr>
      
      <th scope="row"><?= $i ?></td>
      <td><?= $categorie['nom'] ?></td>
      <td><?= $categorie['description'] ?></td>
      <td><?= $categorie['date_creation'] ?></td>
      <td><?= $categorie['date_modification'] ?></td>
      <td><a class="btn btn-primary produits" href="index.php?controller=categorie&amp;action=edit&amp;categorie_id=<?= $categorie['id'] ?>">Modifier la catégorie</a></td>
      <td>
      <form method="GET" class="delete-form">
        <input type="hidden" name="controller" value="categorie">
        <input type="hidden" name="action" value="destroy">
        <input type="hidden" name="categorie_id" value="<?= $categorie['id'] ?>">
        <button class="btn btn-primary produits" type="submit" >Supprimer la catégorie</button> 
      </form>       
      </tr>
  <?php 
  $i++;
  endforeach;?>
    </tbody>
  </table>

</div>  

<?php $content = ob_get_clean(); ?>

<?php require '../views/index.php';?>