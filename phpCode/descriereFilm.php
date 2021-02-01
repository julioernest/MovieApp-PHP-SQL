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
    $query = "SELECT MAX(idFilme) AS n from filme";
    $query_run = mysqli_query($db, $query);
    $nrFilme = mysqli_fetch_array($query_run);
    ?>

    <div class="box">
        <?php
        //var_dump($_POST); //see what $_POST holds;
        for ($index = 1; $index <= $nrFilme["n"]; $index++) {

            if (isset($_POST['movie_' . $index . '_x'])) {
                $aux = $index;
                $query = "SELECT f.Titlu, f.An, f.Descriere, f.url, t.nume FROM filme f
                JOIN tara t ON t.idTara = f.Tara_idTara
                WHERE idFilme = '" . $index . "'";
                $query_run = mysqli_query($db, $query);
                $row = mysqli_fetch_array($query_run);
        ?>
                <div>
                    <img src="<?php echo $row["url"]; ?>" alt="<?php echo $row["Titlu"]; ?>">
                </div>



        <?php

            }
        } ?>
    </div>
    <div id="showDetails">
        <p id="desT" style="color: white;"><?php echo $row["Titlu"]; ?></p>
        <p style="color: white;">An:<?php echo $row["An"]; ?></p>
        <p style="color: white;">Tara:<?php echo $row["nume"]; ?></p>
        <p style="color: white;">Descriere: <?php echo $row["Descriere"]; ?></p>
        <?php
        $query = "SELECT s.Nume, s.Despre, CAST(AVG(s.Nume) AS DECIMAL(10,2)) AS med FROM stele s
                    JOIN filme_stele fs ON s.idStele = fs.Stele_idStele
                    JOIN filme f ON fs.Filme_idFilme = f.idFilme
                    WHERE f.idFilme = $aux
                    GROUP BY s.Nume";
        $query_run = mysqli_query($db, $query);
        ?>
        <?php
        while ($row = mysqli_fetch_array($query_run)) {
            $med = $row["med"]; ?>
            <div>
                <p style="color: white;">Stea: <?php echo $row["Nume"] ?> Comentariu: <?php echo $row["Despre"] ?></p>
            </div>
        <?php
        }
        ?>
    </div>
    <div id="notaR">
        <p style="font-size: medium; color: white;"><?php echo $med ?></p>
    </div>
    <div id="commentBox">
        <form action="sendComments.php" method="post">
            <input type="hidden" name="aux" value="<?php echo $aux ?>">
            <label for="comment" style="color:white">Scrie aici comentariul tau:</label><br>
            <textarea id="comment" name="comment" rows="4" cols="60"></textarea><br>
            <label for="stars" style="color: white;">Selecteaza steaua:</label><br>
            <select name="stars" id="stars">
                <option value="1">1-STAR</option>
                <option value="2">2-STAR</option>
                <option value="3">3-STAR</option>
                <option value="4">4-STAR</option>
                <option value="5">5-STAR</option>
                <option value="6">6-STAR</option>
                <option value="7">7-STAR</option>
                <option value="8">8-STAR</option>
                <option value="9">9-STAR</option>
                <option value="10">10-STAR</option>
            </select>
            <br><br>
            <input type="submit" name="signup" value="Trimite">
        </form>
    </div>




</body>

</html>