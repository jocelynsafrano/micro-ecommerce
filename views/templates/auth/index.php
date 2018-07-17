<?php $title = 'Login Form' ?>

<?php ob_start();?>
<div class="login-container">
  <div class="login-box">   
    <div class="header">
      <h3>CONNEXION</h3>
    </div>
    <form method="POST" action="index.php?controller=auth&amp;action=login" class="content">
        <div class="input-box">
          <input name="email" type="text" placeholder=" ">
          <span>E-Mail</span>
          <span></span>
        </div>
        <div class="input-box">
          <input name="mdp" type="password" placeholder=" ">
          <span>Mot de passe</span>
          <span></span>
        </div>
        <div class="input-box">
          <button type="submit">Se connecter</button>
      <!-- TODO : Maybe code this functioannlity and add password confirmation
           <div>
            <a href="#">Forgot your password?</a>
          </div> -->
        </div>

      </form>
    </div>

  
  <div class="login-box register-box">
    <span class="close">+</span>
    <div class="header">
      <h3>INSCRIPTION</h3>
    </div>
    <form method="POST" action="index.php?controller=auth&amp;action=signup" class="content">
        <div class="input-box">
          <input name="nom" type="text">
          <span>Nom</span>
          <span></span>
        </div>
        <div class="input-box">
          <input name="prenom" type="text" >
          <span>Prénom</span>
          <span></span>
        </div>
        <div class="input-box">
          <input name="email" type="text">
          <span>E-Mail</span>
          <span></span>
        </div>
        <div class="input-box">
          <input name="mdp" type="password">
          <span>Mot de passe</span>
          <span></span>
        </div>
         <div class="input-box">
          <select name="role_id" id="monselect">
            <option value="1">Admin</option> 
            <option value="2" selected>Client</option>
          </select>
        </div>
        
        <div class="input-box">
          <button type="submit">S'inscrire</button>          
        </div>
</form>
  </div>
  </div>
 
</div>

<?php $content = ob_get_clean();?>

<?php require('../views/index.php'); ?>