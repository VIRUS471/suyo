<?php
require "connection.php";

$user_name = $_POST["user_name"];
$user_pass = $_POST["password"];

$query = "Select * FROM admin where username='$user_name' and password='$user_pass'";

$result = mysqli_query($conn, $query);
if(mysqli_num_rows($result) > 0){
  echo " login good";
}
else{
  echo " log bad";
}
 ?>
