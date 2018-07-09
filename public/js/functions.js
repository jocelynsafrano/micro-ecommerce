$('.delete-form').on('click', function(event){
    event.preventDefault();

    var ok = confirm('Voulez vous vraiment supprimer ce produit ?');
    
    if(ok){
        event.currentTarget.submit();
    }
});