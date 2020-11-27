<?php
    include 'conn.php';
    
    $username = $_POST['username'];
    
    $queryResult=$connect->query("SELECT * FROM user WHERE USERNAME='".$username."'");
    
    $result=array();
    
    while($fetchData=$queryResult->fetch_assoc()){
        $result[]=$fetchData;
    }
    
    echo json_encode($result);
    
?>

