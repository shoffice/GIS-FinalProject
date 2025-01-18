<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style/style.css">
    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&family=Poppins:ital,wght@0,400;1,400&display=swap"
        rel="stylesheet">
</head>

<body>
    <header>
        <nav class="nav-container">
            <a href="beranda.php">
                <div class="logo-section">
                    <img src="images/logo.jpg" alt="Logo" class="logo-img">
                </div>
            </a>
            <div class="nav-links">
                <a class="nav-link <?php echo $current_page == 'beranda.php' ? 'active' : ''; ?>" href="beranda.php">Beranda</a>
                <a class="nav-link <?php echo $current_page == 'peta/peta.php' ? 'active' : ''; ?>" href="peta/peta.php">Peta</a>
                <a class="nav-link <?php echo $current_page == 'kontak.php' ? 'active' : ''; ?>" href="kontak.php">Kontak</a>
            </div>
        </nav>
    </header>

</body>

</html>