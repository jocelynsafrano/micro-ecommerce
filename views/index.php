<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><?php if(isset($title)){echo $title;}else{ echo 'Home page';} ?></title>
    <?php include '../views/_partials/scripts_top.php';?>
    <?php include '../views/_partials/stylesheets.php';?>
</head>
<body>
    
    <?php include '../views/_partials/header.php';?>

    

<div id="content">
    <?php if(isset($_SESSION['id'])) :?>
        <?php if($_SESSION['role_id'] != 1 && $_GET['controller'] != "auth") :?>
            <?php include '../views/_partials/navbar.php';?>
        <?php endif;?>
        <?php else :?>
        <div class="menu-trigger ml-4"></div>

<?php endif; ?>
<div class="container m-4">
        <?php include '../views/_partials/messages.php';?>

</div>

<?php  if(isset($content)){echo $content;}else{ echo 'Bienvenue';} ?>
</div>

    <?php include '../views/_partials/scripts_bottom.php';?>
</body>
</html>