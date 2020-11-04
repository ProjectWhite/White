<?php
    include 'conn.php';
    
    $username = $_POST['username'];
    $message = $_POST['message'];
    
    $connect->query("INSERT INTO message(username,text) VALUES('".$username."','".$message."')");
    
    
    
    ?>
