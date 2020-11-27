<?php
    include 'conn.php';
    
    $username = $_POST['username'];
    
    $queryResult=$connect->query("SELECT MILESTONE_EMOTION,count(MILESTONE_EMOTION) from milestone WHERE USERNAME = '".$username."' and MILESTONE_EMOTION is not null GROUP BY MILESTONE_EMOTION");
    
    $result=array();
    
    while($fetchData=$queryResult->fetch_assoc()){
        $result[]=$fetchData;
    }
    
    echo json_encode($result);

    ?>
