<?php
    include 'conn.php';

    $username = $_POST['username'];
    $date = $_POST['date'];
    $connect->query("DELETE FROM milestone WHERE USERNAME = '".$username."' and MILESTONE_DATE = '".$date."'");
    ?>
    

