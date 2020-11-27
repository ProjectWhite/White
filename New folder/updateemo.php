<?php
    include 'conn.php';
    
    $username = $_POST['username'];
    $emotion = $_POST['emotion'];
    $diary = $_POST['diary'];
    $type = $_POST['type'];
    $connect->query("UPDATE milestone SET MILESTONE_EMOTION = '".$emotion."',  MILESTONE_TYPE = '".$type."' WHERE USERNAME = '".$username."' and MILESTONE_DIARY = '".$diary."' and MILESTONE_EMOTION  = 'fine'");
    
    ?>
