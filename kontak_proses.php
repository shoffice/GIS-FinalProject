<?php
// Menghubungkan ke database
include 'connection.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = !empty($_POST['name']) ? htmlspecialchars($_POST['name']) : null;
    $email = !empty($_POST['email']) ? htmlspecialchars($_POST['email']) : null;
    $message = htmlspecialchars($_POST['message']);

    if (!empty($message)) {
        $stmt = $conn->prepare("INSERT INTO tb_kontak (name, email, message) VALUES (?, ?, ?)");
        if ($stmt) {
            $stmt->bind_param("sss", $name, $email, $message);
            if ($stmt->execute()) {
                header("Location: kontak.php?status=success");
                exit;
            } else {
                header("Location: kontak.php?status=error");
                exit;
            }
            $stmt->close();
        } else {
            header("Location: kontak.php?status=error");
            exit;
        }
    } else {
        header("Location: kontak.php?status=empty");
        exit;
    }
}

// Menutup koneksi
$conn->close();
