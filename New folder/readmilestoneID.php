<?php
    include 'conn.php';
    
    $username = $_POST['username'];
    
    $queryResult=$connect->query("SELECT * FROM milestone WHERE USERNAME='".$username."'");
    
    $result=array();
    
    while($fetchData=$queryResult->fetch_assoc()){
        $result[]=$fetchData;
    }
    
    echo json_encode($result);

    ?>
