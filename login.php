<?php
header('Content-Type: application/json');
$conn = new mysqli("localhost", "root", "", "flutter_signup_db");

$email = $_POST['email'];
$password = $_POST['password'];

$result = $conn->query("SELECT * FROM users WHERE email='$email'");

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    
    if ($row['password'] === $password) {
        echo json_encode(["success" => true, "message" => "Login successful"]);
    } else {
        echo json_encode(["success" => false, "message" => "Incorrect password"]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Email is not registered"]);
}
?>
