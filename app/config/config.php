<?php
declare(strict_types=1);

/**
 * Uu tien local XAMPP, neu co bien moi truong thi ghi de.
 */
$dbHost = '127.0.0.1';
$dbPort = '3306';
$dbName = 'tech_4_future';
$dbUser = 'root';
$dbPass = '';

$urlConn = getenv('DATABASE_URL') ?: (getenv('MYSQL_URL') ?: '');
if ($urlConn !== '') {
    $parts = parse_url($urlConn);
    if (is_array($parts) && ($parts['scheme'] ?? '') === 'mysql') {
        $dbHost = $parts['host'] ?? $dbHost;
        $dbPort = isset($parts['port']) ? (string)$parts['port'] : $dbPort;
        $dbUser = $parts['user'] ?? $dbUser;
        $dbPass = $parts['pass'] ?? $dbPass;

        if (!empty($parts['path'])) {
            $dbName = ltrim((string)$parts['path'], '/');
        }
    }
}

$dbHost = getenv('MYSQLHOST') ?: $dbHost;
$dbPort = getenv('MYSQLPORT') ?: $dbPort;
$dbName = getenv('MYSQLDATABASE') ?: $dbName;
$dbUser = getenv('MYSQLUSER') ?: $dbUser;
$dbPass = getenv('MYSQLPASSWORD') ?: $dbPass;

$dsn = "mysql:host={$dbHost};port={$dbPort};dbname={$dbName};charset=utf8mb4";

try {
    $pdo = new PDO($dsn, $dbUser, $dbPass, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false,
    ]);
} catch (Throwable $e) {
    http_response_code(500);
    exit('Khong ket noi duoc database.');
}
?>
