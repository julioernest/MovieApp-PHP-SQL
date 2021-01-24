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

    <div class="titlu">
        <strong>Top 3 Filme</strong>
    </div>
    <!-- Div-ul care o sa contina cele trei filme de top -->
    <!-- PHP CODE -->
    <?php

    $query = "SELECT F.idFilme, F.url, CAST(AVG(S.Nume) AS DECIMAL(10,2)) AS med FROM filme F
                LEFT JOIN filme_stele FS ON F.idFilme = FS.Filme_idFilme
                JOIN stele S ON FS.Stele_idStele = S.idStele
                GROUP BY F.idFilme
                ORDER BY med DESC
                LIMIT 3";

    $query_run = mysqli_query($db, $query);

    ?>
    <!-- PHP CODE -->
    <div class="row">
        <?php while ($row = mysqli_fetch_array($query_run)) { ?>
            <div class="column" style="background-color:#aaa;">
                <form action="descriereFilm.php" method="POST">
                    <input type="image" name="movie_<?php echo $row["idFilme"]; ?>" src="<?php echo $row["url"]; ?>" alt="film">
                </form>
                <strong id="steaTop"><?php echo $row["med"] ?>/10</strong>
            </div>

        <?php
        } ?>

    </div>



</body>

</html>