<?php
    include 'conn.php';
    
    $username = $_POST['username'];
    $name = $_POST['name'];
    $connect->query("UPDATE admin SET nickname = '".$name."' WHERE username = '".$username."'");
    ?>
