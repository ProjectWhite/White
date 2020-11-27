<?php
$db = new mysqli("localhost","root","","my_store");
if(!$db){
    echo "Connection failed";
}

$username = $_POST['username'];
$password = $_POST['password'];

$sql = "SELECT * FROM user WHERE USERNAME='".$username."'";

$result = mysqli_query($db,$sql);
$count = mysqli_num_rows($result);

if($count == 1){
    echo json_encode("Error");
}else{
    $insert = "INSERT INTO user(username,password) VALUES('".$username."','".$password."')";
    $query = mysqli_query($db,$insert);
    if($query){
        echo json_encode("Success");
    }
}

?>
