<?php
    include 'conn.php';
    
    $username = $_POST['username'];
    $message = $_POST['message'];
    date_default_timezone_set('Asia/Bangkok');
    $date = date('Y-m-d H:i:s');
    
    $queryResult=$connect->query("INSERT INTO milestone(username,date,diary) VALUES('".$username."','".$date."','".$message."')");
    
    
    ?>
