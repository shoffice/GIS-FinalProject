<?php
$current_page = basename($_SERVER['PHP_SELF']);

$status = isset($_GET['status']) ? $_GET['status'] : null;
$message = '';

if ($status === 'success') {
    $message = 'Pesan Anda berhasil dikirim!';
} elseif ($status === 'error') {
    $message = 'Terjadi kesalahan saat mengirim pesan.';
} elseif ($status === 'empty') {
    $message = 'Pesan tidak boleh kosong.';
}

if (!empty($status)) {
    echo '<meta http-equiv="refresh" content="3;url=' . $current_page . '">';
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kontak</title>
    <link rel="icon" href="images/map.png" type="image/x-icon">
    <link rel="stylesheet" href="style/style_kontak.css">
</head>

<body>
    <?php include 'header.php'; ?>
    <main>
        <div class="contact-container">
            <div class="contact-header">
                <h1>HUBUNGI KAMI</h1><br>
            </div>
            <?php if (!empty($message)): ?>
                <div class="notification <?php echo ($status === 'error' || $status === 'empty') ? 'error' : ''; ?>">
                    <?php echo $message; ?>
                </div>
            <?php endif; ?>
            <form action="kontak_proses.php" method="POST" class="contact-form">
                <input type="text" id="name" name="name" placeholder="Nama">
                <input type="email" id="email" name="email" placeholder="Email">
                <textarea id="message" name="message" rows="4" placeholder="*Pesan"></textarea>
                <button type="submit" class="submit-button">Kirim</button>
            </form>
        </div>
    </main>
    <?php include 'footer.php'; ?>
</body>

</html>