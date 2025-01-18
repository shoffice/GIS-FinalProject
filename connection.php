<?php
$servername = "localhost";
$username = "root";
$password = "123456789";
$dbname = "webgis";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM tb_gedung";
$result = $conn->query($sql);

$locations = [];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $location_coords = json_decode($row['location_coords'], true);

        // Menambahkan lokasi ke array
        $locations[] = [
            'code' => $row['code'],
            'name' => $row['name'],
            'building_function' => $row['building_function'],
            'department' => $row['department'],
            'num_of_classes' => $row['num_of_classes'],
            'num_of_floors' => $row['num_of_floors'],
            'hours' => $row['hours'],
            'photo' => $row['photo'],
            'description' => $row['description'],
            'website' => $row['website'],
            'location_coords' => $location_coords
        ];
    }
}
