<?php $title = 'Liste des produits'?>

<?php ob_start(); ?>
  <h1 class="text-left"><?= $title ?></h1>

    <a class="btn btn-primary m-4" href="index.php?controller=produit&amp;action=create" role="button">Créer un produit</a>
    <input name="nom_produit" class="form-control mr-sm-2 col-sm-6 ml-auto" style="display: inline-block;" type="search" id="search-admin" placeholder="Search" aria-label="Search">


  <table class="table">
    <thead class="thead-dark">
      <tr>
        <th scope="col">#</th>
        <th scope="col">Nom</th>
        <th scope="col">Description</th>
        <th scope="col">Catégorie</th>
        <th scope="col">Prix HT</th>
        <th scope="col">Date de création</th>
        <th scope="col">Date de modification</th>
        <th scope="col">Action</th>
        <th scope="col"></th>
      </tr>
    </thead>
    <tbody id='display_products'>
      <?php 
      $i = 0;
      foreach($produits as $produit):?>
          <tr>
          
            <th scope="row"><?= $produit['id'] ?></td>
            <td><?= $produit['nom'] ?></td>
            <td><?= $produit['description'] ?></td>
            <td><?= $produit['nom_categorie'] ?></td>
            <td><?= $produit['prix_ht'] ?></td>
            <td><?= $produit['date_creation'] ?></td>
            <td><?= $produit['date_modification'] ?></td>

            <td>
            <?php if($_SESSION['role_id'] == 1): ?>
            
            <a class="btn btn-primary" type="submit" href="index.php?controller=produit&amp;action=edit&amp;produit_id=<?= $produit['id'] ?>" >Modifier</a></td>
            <td> 
           <form method="GET" class="delete-form">
            <input type="hidden" name="controller" value="produit">
            <input type="hidden" name="action" value="destroy">
            <input type="hidden" name="produit_id" value="<?= $produit['id'] ?>">
            <button class="btn btn-primary" type="submit" >Supprimer</button> 
            </form>
            </td>
            
            <?php else:  ?>
            <a class="btn btn-primary" href="index.php?controller=panier_produit&amp;action=store&amp;produit_id=<?= $produit['id'] ?>">Ajouter au panier</a>
            
            <?php endif;  ?>
            </td>
          </tr>
      <?php 
      $i++;
      endforeach;?>
    </tbody>
  </table>
</div>
<script>

  </script>
<?php $content = ob_get_clean(); ?>

<?php require '../views/index.php'; ?>