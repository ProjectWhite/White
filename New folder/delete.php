<?php
    include 'conn.php';

    $username = $_POST['username'];
    $connect->query("DELETE FROM user WHERE username = '".$username."'");
    ?>
    

