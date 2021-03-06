  
    $('#categorie').change(function() {
        var id = $(this).val();
        $.ajax({
          url:"index.php?controller=produit&action=filter&categorie_id=" + id,
          type:"GET",          
          success:function(data){
            data = JSON.parse(data);
            var content = "";       
            for(i=0; i<data.length; i++){
              
              content += '<tr> <td>' + data[i].id +'</td> <td>' + data[i].nom + '</td> <td>' + data[i].description + '</td> <td>' + data[i].nom_categorie + '</td> <td>' + data[i].prix_ht + '</td> <td>' + data[i].date_creation + '</td> <td>' + data[i].date_modification + '</td> <td>  <a class="btn btn-default" href="index.php?controller=panier_produit&amp;action=store&amp;produit_id=' + data[i].id+ '>Ajouter au panier</a> </td> </tr>';
            }
            
            $('#display_products').html(content);
          }
        });
      });
   
      $('#categorie-filter-customer').change(function() {
        var id = $(this).val();
        $.ajax({
          url:"index.php?controller=produit&action=filter&categorie_id=" + id,
          type:"GET",          
          success:function(data){

            data = JSON.parse(data);
            var content = "";   
            var dataLength = data.length;
            if(dataLength > 0){

              for(i=0; i<data.length; i++){
                content += `
                <div class="card mb-4" style="width: 22rem">
                <h5 class="card-header">` + data[i].nom + `</h5>
                <div class="card-body">
                  <h5 class="card-title">Prix HT :` + data[i].prix_ht + ` €</h5>
                  <p class="card-text">` + data[i].description + `</p>
                  <p class="card-text">Categories : ` + data[i].nom_categorie + `</p>
                  <a class="btn btn-primary produits" href="index.php?controller=panier_produit&amp;action=store&amp;produit_id=`  + data[i].id + `">Ajouter au panier</a>
          
                </div>
              </div>`
                  ;

              }
            }else{
              content = `<h3 style="color: black;" class="mt-4">Pas de produit sur cette catégorie, désolé !<h3>`;
            }
              
            
            $('#product-boxes').html(content);
          }
        });
      });

      $('#categorie-filter-admin').change(function() {
        var id = $(this).val();
        $.ajax({
          url:"index.php?controller=produit&action=filter&categorie_id=" + id,
          type:"GET",          
          success:function(data){
            data = JSON.parse(data);
            var content = "";   
            var dataLength = data.length;
            if(dataLength > 0){

              for(i=0; i<data.length; i++){
                content += `
                <div class="col-sm-4 mt-4">
                  <div class="card">
                    <div class="card-body">
                      <h5 class="card-title">` + data[i].nom + `</h5>`
                      + `<p class="card-text">` + data[i].description + `</p>`
                      + `<a class="btn btn-primary produits" href="index.php?controller=panier_produit&amp;action=store&amp;produit_id=` + data[i].id + `">Ajouter au panier</a>
                  
                    </div>
                  </div>
                </div>`
                  ;

              }
            }else{
              content = `<h3 style="color: black;" class="mt-4">Pas de produit sur cette catégorie, désolé !<h3>`;
            }
              
            
            $('#product-boxes').html(content);
          }
        });
      });

      $('#search-admin').on("keyup", function() {
        var query = $(this).val();

        if(!query){
          return;
        }
        $.ajax({
          
          url: "index.php?controller=produit&action=search",
          
          type: "POST",          
          
          data: {
            query : query
          },

          success:function(data){
  
            data = JSON.parse(data);
            var content = "";       
            for(let   i=0; i<data.length; i++){
              
              content += '<tr> <td>' + data[i].id +'</td> <td>' + data[i].nom + '</td> <td>' + data[i].description + '</td> <td>' + data[i].nom_categorie + '</td> <td>' + data[i].prix_ht + '</td> <td>' + data[i].date_creation + '</td> <td>' + data[i].date_modification + '</td> <td>  <a class="btn btn-primary produits" href="index.php?controller=produit&amp;action=edit&amp;produit_id=' + data[i].id + '">Modifier produit</a> </td><td>  <a class="btn btn-primary produits" href="index.php?controller=produit&amp;action=destroy&amp;produit_id=' + data[i].id + '">Supprimer produit</a> </td> </tr>';
            }
            
            $('#display_products').html(content);
          }
        });
      });
      
      
      $('#search-customer').on("keyup", function() {
        var query = $(this).val();

        if(!query){
          return;
        }
        $.ajax({
          
          url: "index.php?controller=produit&action=search",
          
          type: "POST",          
          
          data: {
            query : query
          },

          success:function(data){
  
            data = JSON.parse(data);
            var content = "";       
            for(let i=0; i<data.length; i++){
              
              content += `
                <div class="card mb-4" style="width: 22rem">
                <h5 class="card-header">` + data[i].nom + `</h5>
                <div class="card-body">
                  <h5 class="card-title">Prix HT :` + data[i].prix_ht + ` €</h5>
                  <p class="card-text">` + data[i].description + `</p>
                  <p class="card-text">Categories : ` + data[i].nom_categorie + `</p>
                  <a class="btn btn-primary produits" href="index.php?controller=panier_produit&amp;action=store&amp;produit_id=`  + data[i].id + `">Ajouter au panier</a>
          
                </div>
              </div>`
                  ;
            }
            
            $('#product-boxes').html(content);
          }
        });
      });
