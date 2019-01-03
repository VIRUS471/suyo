<?php


$db_username = 'root';
$db_password = '';
$db_name = 'suyoofficialfinale';
$db_host = 'localhost:84';

//connect to MySql
$mysqli = new mysqli($db_host, $db_username, $db_password,$db_name);
if (mysqli_connect_errno()) {
    printf("Connect failed UWU: %s\n", mysqli_connect_error());
    exit();
}else{
  printf("Connection sucesss");
}



// if ($mysqli->connect_error) {
//     die('Error : ('. $mysqli->connect_errno .') '. $mysqli->connect_error);
// }

?>
