<?php
    include 'conn.php';
    
    $username = $_POST['username'];
    $name = $_POST['name'];
    $connect->query("UPDATE user SET NICKNAME = '".$name."' WHERE USERNAME = '".$username."'");
    ?>
