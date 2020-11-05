<?php
    include 'conn.php';
    
    $username = $_POST['username'];
    
    $queryResult=$connect->query("SELECT * FROM message WHERE username='".$username."' and text like 'diary%'");
    
    $result=array();
    
    while($fetchData=$queryResult->fetch_assoc()){
        $result[]=$fetchData;
    }
    
    echo json_encode($result);

    ?>
