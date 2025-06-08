<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

// Allow only POST requests
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['success' => false, 'message' => 'Only POST requests allowed']);
    exit;
}

$email = $_POST['email'] ?? '';

if (empty($email)) {
    echo json_encode(['success' => false, 'message' => 'Email is required']);
    exit;
}

// Connect to the MySQL database
$servername = "localhost";
$username = "root"; // Default XAMPP MySQL username
$password = "";     // Default XAMPP MySQL password is empty
$dbname = "flutter_signup_db"; // Your database name

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    echo json_encode(['success' => false, 'message' => 'Database connection failed']);
    exit;
}

// Check if the email exists
$email = $conn->real_escape_string($email);
$query = "SELECT * FROM users WHERE email = '$email'";
$result = $conn->query($query);

if ($result && $result->num_rows > 0) {
    echo json_encode(['success' => true, 'message' => 'Reset link sent to your email (simulated)']);
} else {
    echo json_encode(['success' => false, 'message' => 'Email not found']);
}

$conn->close();
?>
