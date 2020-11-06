<?php
    include 'conn.php';
    
    $username = $_POST['username'];
    $message = $_POST['message'];
    date_default_timezone_set('Asia/Bangkok');
    $date = date('Y-m-d H:i:s');
    
    $queryResult=$connect->query("INSERT INTO report(username,reportDatail,date) VALUES('".$username."','".$message."','".$date."')");
    
    ?>
