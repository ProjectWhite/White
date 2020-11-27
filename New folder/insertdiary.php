<?php
    include 'conn.php';
    
    $username = $_POST['username'];
    $message = $_POST['message'];
    date_default_timezone_set('Asia/Bangkok');
    $date = date('Y-m-d H:i:s');
    
    $connect->query("INSERT INTO milestone(username,MILESTONE_DATE,MILESTONE_DIARY) VALUES('".$username."','".$date."','".$message."')");


    ?>
