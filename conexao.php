<?php
// Conexão PDO com MySQL/MariaDB.
$host = 'localhost';
$banco = 'empresa';
$usuario = 'root';
$senha = ''; // Altere caso seu MySQL tenha senha.

try {
    $pdo = new PDO(
        "mysql:host={$host};dbname={$banco};charset=utf8mb4",
        $usuario,
        $senha,
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES => false,
        ]
    );
} catch (PDOException $e) {
    http_response_code(500);
    exit('Falha na conexão com o banco de dados. Confira o arquivo conexao.php e se o MySQL está ativo.');
}
