<?php
    include 'conn.php';

    $username = $_POST['username'];
    $connect->query("DELETE FROM admin WHERE username = '".$username."'");
    ?>
    

