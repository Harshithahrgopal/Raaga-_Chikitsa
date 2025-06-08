<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *'); // Allow requests from anywhere (adjust for security)
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Content-Type');

$servername = "localhost";
$username = "root"; // default xampp mysql username
$password = ""; // default xampp mysql password is empty
$dbname = "flutter_signup_db";

// Connect to MySQL
$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
  http_response_code(500);
  echo json_encode(['error' => 'Database connection failed']);
  exit();
}

// Get POST data
$data = json_decode(file_get_contents("php://input"));

if (
  empty($data->username) || empty($data->email) || empty($data->phone) || empty($data->password)
) {
  http_response_code(400);
  echo json_encode(['error' => 'Missing required fields']);
  exit();
}

// Prepare data (sanitize inputs)
$username = $conn->real_escape_string($data->username);
$email = $conn->real_escape_string($data->email);
$phone = $conn->real_escape_string($data->phone);

// Store password as plain text (no hashing)
$password_plain = $conn->real_escape_string($data->password);

// Check if email already exists
$emailCheckQuery = "SELECT id FROM users WHERE email='$email'";
$result = $conn->query($emailCheckQuery);
if ($result->num_rows > 0) {
  http_response_code(409); // Conflict
  echo json_encode(['error' => 'Email already registered']);
  exit();
}

// Insert user with plain text password
$sql = "INSERT INTO users (username, email, phone, password) VALUES ('$username', '$email', '$phone', '$password_plain')";
if ($conn->query($sql) === TRUE) {
  http_response_code(201); // Created
  echo json_encode(['message' => 'User registered successfully']);
} else {
  http_response_code(500);
  echo json_encode(['error' => 'Failed to register user']);
}

$conn->close();
?>
