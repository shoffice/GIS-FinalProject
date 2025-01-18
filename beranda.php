<?php
$current_page = basename($_SERVER['PHP_SELF']);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Beranda</title>
    <link rel="icon" href="images/map.png" type="image/x-icon">
    <link rel="stylesheet" href="style/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&family=Poppins:ital,wght@0,400;1,400&display=swap" rel="stylesheet">
</head>

<body>
    <?php include 'header.php'; ?>
    <div class="container">
        <div class="left-side">
            <h1>JELAJAHI POLIBAN <br><span class="highlight-text">TANPA BATAS!</span></h1>
            <p>Selamat datang di Web-GIS Kampus Poliban! Dengan aplikasi ini, Anda dapat menjelajahi setiap sudut kampus, menemukan gedung, fasilitas, dan mendapatkan petunjuk arah dengan mudah. Jelajahi kampus tanpa kebingungan, langsung dari layar Anda!</p>
            <a href="peta/peta.php" class="button">Mulai</a>
        </div>

        <div class=" right-side">
            <img src="images/Maps.jpg" class="foto">
        </div>
    </div>
    <?php include 'footer.php'; ?>
</body>

</html>