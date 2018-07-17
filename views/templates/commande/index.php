<?php $title = 'Liste des commandes'?>

<?php ob_start(); ?>
<div class="container pt-4">
  <h1 class="text-left"><?= $title ?></h1>

  <table class="table">
    <thead class="thead-dark">
      <tr>
        <th scope="col">#</th>
        <th scope="col">ID commande</th>
        <th scop="col">Date création</th>
        <th scope="col">Actions</th>
      </tr>
    </thead>
    <tbody>
  <?php 
  $i = 0;
  foreach($commandes as $commande):?>
      <tr>
      
      <th scope="row"><?= $i ?></td>
      <th><?= $commande['id'] ?></td>
      <th><?= $commande['date_creation'] ?></td>
      <td>
      <a class="btn btn-primary produits"  href="index.php?controller=commande_produit&amp;action=show&amp;commande_id=<?= $commande['id'] ?>">Voir ligne de commande</a>
      <form method="GET" class="delete-form">
        <input type="hidden" name="controller" value="commande">
        <input type="hidden" name="action" value="destroy">
        <input type="hidden" name="commande_id" value="<?= $commande['id'] ?>">
        <button class="btn btn-primary produits" type="submit" >Annuler la commande</button> 
      </form>
      </td>
     
      </tr>
  <?php 
  $i++;
  endforeach;?>
    </tbody>
  </table>

</div>  

<?php $content = ob_get_clean(); ?>

<?php require '../views/index.php';?>