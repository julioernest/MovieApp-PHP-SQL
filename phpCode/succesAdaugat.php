<?php

// This is the php code with mysqli in order to insert values in one table 
//and secure the nXn relation with the right tabel

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
$db = new mysqli("localhost", "root", "", "mydb");

/* The table engine has to support transactions */
$db->query("CREATE TABLE IF NOT EXISTS language (
        Code text NOT NULL,
        Speakers int(11) NOT NULL
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;");

if (isset($_POST['signup'])) {

    $title = $_POST['titlu'];
    $directori = $_POST['directori'];
    $country = $_POST['tara'];
    $descriere = $_POST['descriere'];
    $url = $_POST['url'];
    $year = $_POST['an'];
    $ddir = $_POST['ddirectori'];
    $gen = $_POST['gen'];
    /* Start transaction */
    $db->begin_transaction();
    try {

        //VERIFIC DACA EXISTA TITLU IN BAZA DE DATE
        //DACA EXITA PRINTEZ CA EXISTA DEJA.
        $rez = $db->query("SELECT * FROM filme f WHERE f.Titlu = '" . $title . "'");
        if ($rez && ($rez->num_rows !== 0)) {
            echo "<p> Deja exista filmul </p>";
        } else {
            //VERIFC DACA TARA EXISTA DEJA
            //DACA EXISTA II IAU ID-UL SI PUN FK IN TITLU 
            $tara = $db->query("SELECT * FROM tara t WHERE t.nume = '" . $country . "'");
            if ($tara && ($tara->num_rows !== 0)) {
                $row = mysqli_fetch_array($tara);
                $tKey = $row["idTara"];
                $db->query("INSERT INTO filme (Titlu, An, Descriere, url, Tara_idTara) VALUES ('" . $title . "', '" . $year . "', '" . $descriere . "', '" . $url . "', '" . $tKey . "')");
            } else {
                $db->query("INSERT INTO tara (nume) VALUES ('$country')");
                $tKey = $db->insert_id;
                $db->query("INSERT INTO filme (Titlu, An, Descriere, url, Tara_idTara) VALUES ('$title', '$year', '$descriere', '$url', '$tKey')");
            }

            $fKey = $db->insert_id;
            $dir = $db->query("SELECT * FROM directori d WHERE d.Nume = '" . $directori . "'");
            if ($dir && ($dir->num_rows !== 0)) {
                $row = mysqli_fetch_array($dir);
                $dKey = $row["idDirectori"];
                $db->query("INSERT INTO filme_directori (Filme_idFilme, Directori_idDirectori) VALUES ('$fKey','$dKey')");
            } else {
                $db->query("INSERT INTO directori (Nume, Despre) VALUES ('$directori','$ddir')");
                $dKey = $db->insert_id;
                $db->query("INSERT INTO filme_directori (Filme_idFilme, Directori_idDirectori) VALUES ('$fKey','$dKey')");
            }

            $genuri = $db->query("SELECT * FROM genuri g WHERE g.nume = '" . $gen . "'");
            if ($genuri && ($genuri->num_rows !== 0)) {
                $row = mysqli_fetch_array($genuri);
                $gKey = $row["idGenuri"];
                $db->query("INSERT INTO filme_genuri (Filme_idFilme, Genuri_idGenuri) VALUES ('$fKey','$gKey')");
            } else {
                $db->query("INSERT INTO genuri (nume) VALUES ('$gen')");
                $gKey = $db->insert_id;
                $db->query("INSERT INTO filme_genuri (Filme_idFilme, Genuri_idGenuri) VALUES ('$fKey','$gKey')");
            }
            $db->query("INSERT INTO filme_stele (Filme_idFilme, Stele_idStele) VALUES ('$fKey', '18')");
            //o sa-i atribuim nota doi de baza :)
            $db->commit();
        }
    } catch (mysqli_sql_exception $exception) {
        $db->rollback();
        throw $exception;
    }
} ?>
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
    include("navBar.php")
    ?>
    <div class="row">
        <p style="color: white; font-size: large;">Poate a mers poate nu.</p>
    </div>
</body>

</html>