<?php
    include 'conn.php';
    
    $username = $_POST['username'];
    
    $queryResult=$connect->query("SELECT * FROM admin WHERE username='".$username."'");
    
    $result=array();
    
    while($fetchData=$queryResult->fetch_assoc()){
        $result[]=$fetchData;
    }
    
    echo json_encode($result);
    
?>

