<?php
// Database connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "basic form";

// Create connection
$conn = new mysqli($servername, $username, $password);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// Create database if it doesn't exist
$sql_create_db = "CREATE DATABASE IF NOT EXISTS $dbname";
if ($conn->query($sql_create_db) === TRUE) {
  // Select database
  $conn->select_db($dbname);
  
  // Create users table
  $sql_create_table = "CREATE TABLE IF NOT EXISTS users (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fullname VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    age VARCHAR(255) NOT NULL,
    gender VARCHAR(255) NOT NULL,
    profile BLOB NOT NULL,
    upload_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  )";
  
  if ($conn->query($sql_create_table) === TRUE) {
    echo "Table created successfully<br>";
} else {
    echo "Error creating table: " . $conn->error . "<br>";
}

// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Validate inputs
    $fullname = $_POST['fname'];
    $email = $_POST['email'];
    $age = $_POST['age'];
    $gender = $_POST['gender'];
    $profile = $_FILES["profile"];

    // Validate name
    if (empty($fullName)) {
        echo "Error: Full Name is required.<br>";
        exit;
    }

    // Validate email
    if (empty($email) || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo "Error: Invalid email format.<br>";
        exit;
    }

    // Check if file was uploaded without errors
    if ($profile["error"] == UPLOAD_ERR_OK) {
        // Check file type
        $fileType = strtolower(pathinfo($profile["name"], PATHINFO_EXTENSION));
        if ($fileType != "img") {
            echo "Error: Only image files are allowed.<br>";
            exit;
        }

        // Check file size
        if ($profile["size"] > 2 * 1024 * 1024) { // 2MB
            echo "Error: File size must be less than 2MB.<br>";
            exit;
        }

        // Open and read the file data
        $profileData = file_get_contents($profile["tmp_name"]);

    // Insert into database
    $sql_insert_user = "INSERT INTO users (fullname, email, age, gender, profileData, profileType) VALUES ('$fullname', '$email', '$age', '$gender', '$profile')";

    if ($conn->query($sql_insert_user) === TRUE) {
      echo "Registration successful!";
    } else {
      echo "Error: " . $sql_insert_user . "<br>" . $conn->error;
    }
  } else {
    echo "Error creating table: " . $conn->error;
  }
} else {
  echo "Error creating database: " . $conn->error;
}

$conn->close();
?>
 