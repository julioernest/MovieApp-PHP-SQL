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
    <?php

    $query = "SELECT F.Titlu,F.idFilme, F.url, CAST(AVG(S.Nume) AS DECIMAL(10,2)) AS med FROM filme F
                    LEFT JOIN filme_stele FS ON F.idFilme = FS.Filme_idFilme
                    JOIN stele S ON FS.Stele_idStele = S.idStele
                    GROUP BY F.idFilme
                    ORDER BY med DESC";
    $query_run = mysqli_query($db, $query);

    ?>
    <div id="buttons3">
        <a href="filmeActiune.php">
            <button type="button" class="btn btn-outline-danger">Actiune</button>
        </a>
        <a href="filmeHorror.php">
            <button type="button" class="btn btn-outline-dark">Horror</button>
        </a>
        <a href="filmeDrama.php">
            <button type="button" class="btn btn-outline-warning">Drama</button>
        </a>
    </div>
    <div class="intro">
        <strong style="color:white"> Aceasta este lista noastra de filme </strong>
    </div>

    <div class="tabel">

        <!-- PHP CODE -->

        <?php while ($row = mysqli_fetch_array($query_run)) { ?>
            <div class="columnTF" style="background-color: grey;">
                <form action="descriereFilm.php" method="POST">
                    <input type="image" name="movie_<?php echo $row["idFilme"]; ?>" src="<?php echo $row["url"]; ?>" alt="film">
                </form>
                <strong><?php echo $row["Titlu"] ?></strong>
                <strong id="steaTop"><?php echo $row["med"] ?>/10</strong>
            </div>

        <?php
        } ?>


    </div>

</body>

</html>