<!DOCTYPE html>
<html>
<body>

<?php
echo "hi There Php working properly";
$servername = "localhost:3307";
$username = "myusername";
$password = "P@ssw0rd";
$dbname = "mydb";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT id, firstname  FROM testtable";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "<br> id: ". $row["id"]. " - Name: ". $row["firstname"]. " " . "<br>";
    }
} else {
    echo "0 results";
}

$conn->close();
?> 

</body>
</html>
