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
    $com = $_POST['comment'];
    $star = $_POST['stars'];
    $aux = $_POST["aux"];
    /* Start transaction */
    $db->begin_transaction();
    try {
        $db->query("INSERT INTO stele (Nume,Despre) VALUES ('$star','$com')");
        $sKey = $db->insert_id;
        $db->query("INSERT INTO filme_stele (Filme_idFilme, Stele_idStele) VALUES ('$aux','$sKey')");
        $db->commit();
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
        <p style="color: white; font-size: large;">Felicitari! Comentariul a fost adaugat cu succes!</p>
    </div>
</body>

</html>