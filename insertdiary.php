<?php
    include 'conn.php';
    
    $username = $_POST['username'];
    $message = $_POST['diary'];
    $date = $_POST['date'];
    
    $queryResult=$connect->query("INSERT INTO milestone(username,date,diary) VALUES('".$username."','".$date."','".$message."')");
    
    
    ?>
