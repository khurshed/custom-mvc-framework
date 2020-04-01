<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Preview data before submit</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>

        <div class="container">
            <h1>Preview data before submit</h1>
            <form action="index.php?c=Index&a=save" method="post" enctype="multipart/form-data">
                <?php
                foreach($list as $data){
                ?>
                <div class="form-group">
                    <label><?= $data['filed']?></label>
                    <input readonly="" required="" class="form-group" type="text" name="<?= strtolower($data['filed'])?>" value="<?=$data['value']?>">
                </div>
                <?php } ?>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>

    </body>
</html> 