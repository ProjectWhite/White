<?php
    include 'conn.php';
    
    $username = $_POST['username'];
    $message = $_POST['message'];
    date_default_timezone_set('Asia/Bangkok');
    $date = date('Y-m-d H:i:s');
   
    
    $connect->query("INSERT INTO message(username,date,text,AI) VALUES('".$username."','".$date."','".$message."',true)");

    ?>
