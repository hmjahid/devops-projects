<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <title>6 Tier Php Application</title>
</head>
<body>
    

<?php
// MySQLi Connection
$host = 'db';  // MySQL container hostname (defined in docker-compose.yml)
$dbname = 'app_db';
$username = 'user';
$password = 'password';

// Create connection using MySQLi
$mysqli = new mysqli($host, $username, $password, $dbname);

// Check connection
if ($mysqli->connect_error) {
    die("<h2>MySQL Connection failed: " . $mysqli->connect_error . "</h2>");
} else {
    echo "<h2>Connected to MySQL successfully!</h2>";
}


// Redis Connection
$redisHost = 'cache';  // Redis container hostname (defined in docker-compose.yml)
$redisPort = 6379;

try {
    $redis = new Redis();
    $redis->connect($redisHost, $redisPort);
    $redis->set("welcome_message", "Welcome to the 6-Tier PHP Application with MySQLi and Redis!");
    $message = $redis->get("welcome_message");
    echo "<h2>$message</h2>";
} catch (Exception $e) {
    echo "<h2>Redis Connection failed: " . $e->getMessage() . "</h2>";
}
?>

<?php
// Display a simple welcome message with some static content
echo "<h1>Welcome to the 6-Tier PHP Application!</h1>";
echo "<img src='/images/logo.png' alt='Logo' />";
echo "<p>CSS and JS are served as static files.</p>";
?>

    <script src="js/script.js"></script>
</body>
</html>

