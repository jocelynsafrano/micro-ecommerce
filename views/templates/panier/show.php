<?php $title = 'Panier'?>

<?php ob_start(); ?>
<div class="container pt-4">
  <h1 class="text-left"><?= $title . '(' . $nombreProduits[0]['COUNT(*)'] . ')'?></h1>

  <table class="table">
    <thead class="thead-dark">
      <tr>
        <th scope="col">#</th>
        <th scope="col">Nom</th>
        <th scope="col">Description</th>
        <th scope="col">Prix HT</th>
        <th scope="col">Actions</th>
      </tr>
    </thead>
    <tbody>
  <?php 
  $i = 0;
  foreach($produits as $produit):?>
      <tr>
      
        <th scope="row"><?= $i ?></td>
        <td><?= $produit['nom'] ?></td>
        <td><?= $produit['description'] ?></td>
        <td><?= $produit['prix_ht'] . "€" ?></td>
        <td>
        
        <form method="GET" class="delete-form">
          <input type="hidden" name="controller" value="panier_produit">
          <input type="hidden" name="action" value="destroy">
          <input type="hidden" name="panier_produit_id" value="<?= $produit['id'] ?>">
          <button class="btn btn-primary produits" type="submit" >Retirer du panier</button> 
        </form>
        </td>
        
      </tr>
  <?php 
  $i++;
  endforeach;?>
    </tbody>
  </table>
<br />
<div class="row">
  <div class="col-sm-6 panier">
  <?= "Montant HT : <strong>" . number_format($totalPanier[0]['total_panier_ht'], 2, ',', ' ') . "€</strong>"?>
  <br>
  <?= "Montant : <strong>" . number_format($totalPanier[0]['total_panier'], 2, ',', ' ') . "€</strong>"?>
  </div>
  <div class="col-sm-6 panier">
    <a class="btn btn-primary produits" href="index.php?controller=commande_produit&amp;action=store" role="button">Valider la commande</a>
    </div>
</div>
  
</div>  

<?php $content = ob_get_clean(); ?>

<?php require '../views/index.php';?>