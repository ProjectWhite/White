<?php
    include 'conn.php';
    
    $username = $_POST['username'];
    $password = $_POST['password'];
    
    $connect->query("UPDATE admin SET password = '".$password."' WHERE username = '".$username."'");
    ?>
