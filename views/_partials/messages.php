<?php if(isset($_SESSION['messages']) && is_array($_SESSION['messages'])):?>

        <div class="alert alert-dismissible fade show alert-<?= $_SESSION['messages']['type'] ?>" role="alert">
                <?= $_SESSION['messages']['body'] ?>
                <?php unset($_SESSION['messages']); ?>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                </button>
        </div>

<?php endif;?>
