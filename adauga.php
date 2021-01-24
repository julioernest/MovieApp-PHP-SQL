<?php
include("config.php");
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Filme</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="./styleF.css">
</head>

<body>

    <?php
    include("navBar.php");
    ?>

    <div class="info">
        <div class="head1">
            <strong style="color: white;"> Bine ai venit la pagina de Adaugare!</strong>
        </div>
    </div>
    <div class="adauga">
        <form action="succesAdaugat.php" method="POST">
            <label for="titlu" style="color:white">Titlu:</label><br>
            <input type="text" id="titlu" name="titlu"><br>

            <label for="an" style="color:white">An:</label><br>
            <input type="text" id="an" name="an"><br>

            <label for="directori" style="color:white">Director:</label><br>
            <input type="text" id="director" name="directori"><br>

            <label for="ddirectori" style="color:white">Despre Director:</label><br>
            <input type="text" id="ddirector" name="ddirectori"><br>

            <?php
            $query = "SELECT * FROM genuri";
            $query_run = mysqli_query($db, $query) or die(mysqli_error($db));
            ?>
            <label for="gen" style="color:white">Genuri:</label><br>
            <select name="gen">
                <?php
                while ($row = mysqli_fetch_array($query_run)) {
                    echo "<option value=" . $row['nume'] . ">" . $row["nume"] . "</option>";
                }
                ?>
            </select><br>
            <label for="tara" style="color:white">Tara:</label><br>
            <input type="text" id="tara" name="tara"><br>

            <label for="descriere" style="color:white">Descriere:</label><br>
            <textarea id="descriere" name="descriere" rows="4" cols="50"></textarea><br>

            <label for="url" style="color: white;">URL link</label><br>
            <input type="text" id="url" name="url"><br>

            <button type="submit" value="Submit" name="signup" class="btn btn-danger">Submit</button>
        </form>
    </div>


</body>

</html>