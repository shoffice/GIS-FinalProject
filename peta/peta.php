<?php
// Mengatur halaman aktif berdasarkan nama file
include '../connection.php';
$current_page = basename($_SERVER['PHP_SELF']);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Peta</title>
    <link rel="icon" href="../images/map.png" type="image/x-icon">
    <link rel="stylesheet" href="../style/style.css">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
        integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin="" />
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
        integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin=""></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
</head>

<body>
    <?php include 'header.php'; ?>

    <div id="search-container">
        <input type="text" id="searchInput" placeholder="Cari Gedung" />
    </div>

    <div id="map"></div>

    <div id="filterContainer" class="leaflet-control">
        <button id="filterButton">Filter</button>
        <div id="filterMenu" style="display: none;">
            <h3>Filter Berdasarkan:</h3>
            <label for="departmentFilter">Jurusan:</label>
            <select id="departmentFilter">
                <!-- Opsi diisi menggunakan JavaScript -->
            </select>
            <br>
            <label for="buildingFilter">Fungsi Gedung:</label>
            <select id="buildingFilter">
                <option value="all">Semua</option>
                <option value="Kantor">Kantor</option>
                <option value="Gedung Jurusan">Gedung Jurusan</option>
                <option value="Gedung Teori">Gedung Teori</option>
                <option value="Laboratorium">Laboratorium</option>
                <option value="Bengkel">Bengkel</option>
                <option value="Ibadah">Ibadah</option>
                <option value="Olahraga">Olahraga</option>
                <option value="Ormawa">Organisasi & UKM</option>
                <option value="Perpustakaan">Perpustakaan</option>
                <option value="Kantin">Kantin</option>
            </select>
        </div>
    </div>

    <div id="overlay" class="overlay"></div>

    <div id="sidebar">
        <button id="closeSidebar" onclick="closeSidebar()">&#10006;</button>
        <div class="header-row">
            <h3 id="placeCode"></h3>
            <h3 id="placeName"></h3>
        </div>
        <img id="placePhoto" src="" alt="Photo" style="width: 100%; height: auto;" loading="lazy">
        <p><strong>Deskripsi:</strong> <span id="placeDescription"></span></p>
        <p><strong>Jumlah kelas:</strong> <span id="placeClasses"></span></p>
        <p><strong>Jumlah lantai:</strong> <span id="placeFloors"></span></p>
        <p><strong>Jam Operasional:</strong><br><span id="placeHours"></span></p>
        <p><strong>Website:</strong> <a id="placeWebsite" href="" target="_blank">Visit Website</a></p>
    </div>

    <script>
        const DEPARTMENT_COLORS = {
            'Elektro': '#C11B17',
            'Akuntansi': '#FFFF33',
            'Mesin': '#3D3C3A',
            'Sipil': '#C19A6B',
            'Bisnis': '#12AD2B',
            'Institusi': '#18788f',
            'Tambang': '#F62217',
            'default': '#18788f'
        };

        const DEFAULT_POLYGON_STYLE = {
            weight: 2,
            opacity: 1,
            fillOpacity: 0.70,
            dashArray: '6, 5',
        };

        const HOVER_POLYGON_STYLE = {
            weight: 3,
            opacity: 1,
            fillOpacity: 0.8,
            dashArray: null,
        };

        // Inisialisasi peta
        function initializeMap() {
            var map = L.map('map').setView([-3.295882, 114.582623], 18);
            var osmLayer = L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
                maxZoom: 19,
                attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
            });

            var satelliteLayer = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
                maxZoom: 19,
                attribution: 'Tiles © Esri & contributors'
            });

            osmLayer.addTo(map);

            // Fitur Layer
            L.control.layers({
                "Mode Biasa (OSM)": osmLayer,
                "Mode Satelit": satelliteLayer
            }).addTo(map);

            const polibanArea = [
                [-3.297124, 114.580868],
                [-3.296878, 114.58118],
                [-3.296273, 114.581373],
                [-3.296214, 114.581518],
                [-3.295807, 114.581378],
                [-3.294918, 114.582065],
                [-3.294564, 114.582108],
                [-3.293847, 114.582609],
                [-3.295097, 114.58413],
                [-3.297938, 114.581786],
                [-3.297938, 114.581786],
                [-3.297938, 114.581786],
                [-3.297124, 114.580868]
            ];

            const polygon = L.polygon(polibanArea, {
                color: '#A68487',
                weight: 5,
                opacity: 1,
                fillColor: 'gray',
                fillOpacity: 0.15
            }).addTo(map);

            return map;
        }

        // Inisialisasi semua lokasi pada peta
        function initializeLocations(map, locations) {
            const polygons = {};

            locations.forEach(location => {
                if (location.location_coords && Array.isArray(location.location_coords[0])) {
                    const polygon = L.polygon(location.location_coords[0],
                        createPolygonStyle(location.department)).addTo(map);

                    polygons[location.department] = polygons[location.department] || [];
                    polygons[location.department].push(polygon);

                    if (location.code) {
                        createPolygonLabel(polygon, location.code);
                    }

                    addPolygonEventListeners(polygon, location, map);
                }
            });

            return polygons;
        }

        function getDepartmentColor(department) {
            return DEPARTMENT_COLORS[department] || DEPARTMENT_COLORS['default'];
        }

        function createPolygonStyle(department, isDefault = true) {
            const color = getDepartmentColor(department);
            return isDefault ? {
                    ...DEFAULT_POLYGON_STYLE,
                    color,
                    fillColor: color
                } :
                HOVER_POLYGON_STYLE;
        }

        // Membuat label untuk poligon
        function createPolygonLabel(polygon, labelContent) {
            return polygon.bindTooltip(labelContent, {
                permanent: true,
                direction: 'center',
                className: 'polygon-label',
                offset: [0, 0],
                opacity: 1
            }).openTooltip();
        }

        function addPolygonEventListeners(polygon, location, map) {
            polygon.on('mouseover', function(e) {
                e.target.setStyle(createPolygonStyle(location.department, false));
                // Tampilkan hanya nama jika code tidak ada atau NULL
                const departmentName = location.department || location.building_function;
                const popupContent = location.code ?
                    `<div class="popup-content">
                <strong>${location.name} (${location.code})</strong><br>
                ${departmentName}<br>
            </div>` :
                    `<div class="popup-content">
                <strong>${location.name}</strong><br>
                ${departmentName}<br>
            </div>`;
                e.target.bindPopup(popupContent).openPopup();
            });

            polygon.on('mouseout', function(e) {
                e.target.setStyle(createPolygonStyle(location.department));
                e.target.closePopup();
            });

            polygon.on('click', function() {
                updateSidebar(location);
                openSidebar();
            });
        }

        // Memperbarui sidebar
        function updateSidebar(location) {
            const placeNameElement = document.getElementById('placeName');
            const placeCode = location.code ? ` (${location.code})` : ''; // Tambahkan kode jika ada
            const placeName = location.name ? location.name + placeCode : ''; // Format nama dan kode

            // Perbarui elemen HTML dengan hasil format
            placeNameElement.textContent = placeName;

            const sidebarElements = {
                'placeClasses': location.num_of_classes,
                'placeFloors': location.num_of_floors,
                'placeDescription': location.description,
                'placeHours': location.hours
            };

            Object.entries(sidebarElements).forEach(([id, value]) => {
                const element = document.getElementById(id);
                if (value) {
                    element.parentElement.style.display = 'block';

                    // Cek jika id adalah 'placeHours' dan kita perlu memformat jam operasional
                    if (id === 'placeHours') {
                        // Pisahkan jam yang ada di dalam value
                        const hoursArray = value.split(' ');
                        const formattedHours = hoursArray.map((part, index) => {
                            // Cek apakah bagian ini adalah jam (misalnya "07.00-18.00")
                            if (part.match(/\d{2}.\d{2}-\d{2}.\d{2}/)) {
                                // Jika ini adalah jam, tambahkan baris baru setelah hari sebelumnya
                                return `${part}<br>`;
                            }
                            // Jika bukan jam, biarkan tetap
                            return part;
                        }).join(' ');
                        // Gabungkan kembali dan set innerHTML agar <br> dapat ditampilkan
                        element.innerHTML = formattedHours;
                    } else {
                        element.textContent = value;
                    }
                } else {
                    element.parentElement.style.display = 'none'; // Sembunyikan elemen jika tidak ada nilai
                }
            });
            document.getElementById('placePhoto').src = location.photo || 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvX7ghSY75PvK5S-RvhkFxNz88MWEALSBDvA&s'; // Atur default jika tidak ada foto
            document.getElementById('placeWebsite').href = location.website || 'https://poliban.ac.id'; // Atur default jika tidak ada website
        }

        function populateDepartmentFilter() {
            const departmentFilter = document.getElementById('departmentFilter');
            departmentFilter.innerHTML = `<option value="all">Semua</option> ${Object.keys(DEPARTMENT_COLORS).filter(k => k !== 'default').map(dept => `<option value="${dept}">${dept}</option>`).join('')}`;
        }

        function createFilterControl(map, locations, polygons) {
            // Panggil fungsi untuk mengisi dropdown
            populateDepartmentFilter();

            var container = document.getElementById('filterContainer');

            document.getElementById('filterButton').addEventListener('click', () => {
                var menu = document.getElementById('filterMenu');
                menu.style.display = menu.style.display === 'none' ? 'block' : 'none';
            });

            document.getElementById('departmentFilter').addEventListener('change', () => {
                filterLocations(map, locations, polygons);
            });

            document.getElementById('buildingFilter').addEventListener('change', () => {
                filterLocations(map, locations, polygons);
            });

            var filterControl = L.Control.extend({
                options: {
                    position: 'topright'
                },
                onAdd: function() {
                    return container;
                }
            });

            map.addControl(new filterControl());
        }

        // Fitur pencarian
        function searchLocations(map, locations, polygons) {
            const searchInput = document.getElementById('searchInput').value.toLowerCase();
            console.log("Searching for:", searchInput);

            const filteredLocations = locations.filter(location => {
                const name = location.name ? location.name.toLowerCase() : '';
                const department = location.department ? location.department.toLowerCase() : '';
                const buildingFunction = location.building_function ? location.building_function.toLowerCase() : '';
                const code = location.code ? location.code.toLowerCase() : '';

                if (searchInput.startsWith('gedung')) {
                    const searchTerm = searchInput.replace('gedung', '').trim(); // Hapus 'gedung' dari input

                    // Jika input yang dimasukkan hanya dua karakter, prioritaskan pencocokan kode gedung
                    if (searchTerm.length < 3) {
                        return code.includes(searchTerm);
                    }

                    return name.includes(searchTerm);
                }

                return name.includes(searchInput) ||
                    department.includes(searchInput) ||
                    buildingFunction.includes(searchInput) ||
                    code.includes(searchInput);
            });

            // Membersihkan poligon
            Object.values(polygons).flat().forEach(polygon => map.removeLayer(polygon));
            Object.keys(polygons).forEach(key => {
                polygons[key] = [];
            });

            // Tambahkan poligon berdasarkan hasil pencarian
            filteredLocations.forEach(location => {
                if (location.location_coords && Array.isArray(location.location_coords[0])) {
                    const polygon = L.polygon(location.location_coords[0], createPolygonStyle(location.department)).addTo(map);

                    if (!polygons[location.department]) {
                        polygons[location.department] = [];
                    }
                    polygons[location.department].push(polygon);

                    if (location.code) {
                        createPolygonLabel(polygon, location.code);
                    }

                    addPolygonEventListeners(polygon, location, map);
                }
            });

            return polygons;
        }

        // Fungsi tombol filter
        function filterLocations(map, locations, polygons) {
            const selectedDepartment = document.getElementById('departmentFilter').value;
            const selectedBuilding = document.getElementById('buildingFilter').value;

            // Hapus semua poligon dari peta
            Object.values(polygons).flat().forEach(polygon => map.removeLayer(polygon));

            // Reset objek polygons
            Object.keys(polygons).forEach(key => {
                polygons[key] = [];
            });

            locations.forEach(location => {
                if ((selectedDepartment === 'all' || location.department === selectedDepartment) &&
                    (selectedBuilding === 'all' || location.building_function === selectedBuilding)) {

                    if (location.location_coords && Array.isArray(location.location_coords[0])) {
                        const polygon = L.polygon(location.location_coords[0],
                            createPolygonStyle(location.department)).addTo(map);

                        // Tambahkan poligon baru ke array yang sesuai
                        if (!polygons[location.department]) {
                            polygons[location.department] = [];
                        }
                        polygons[location.department].push(polygon);

                        if (location.code) {
                            createPolygonLabel(polygon, location.code);
                        }

                        addPolygonEventListeners(polygon, location, map);
                    }
                }
            });

            return polygons;
        }

        // Fungsi untuk membuka/menutup sidebar
        function openSidebar() {
            document.getElementById('sidebar').classList.add('open');
            document.getElementById('map').style.marginLeft = "300px";
            document.getElementById('overlay').style.display = "block";
            setTimeout(function() {
                const photoElement = document.getElementById('placePhoto');
                if (photoElement && !photoElement.src) {
                    photoElement.src = "../images/Maps.jpg"; // Ganti dengan path foto yang sesuai
                }
            }, 500);
        }

        function closeSidebar() {
            document.getElementById('sidebar').classList.remove('open');
            document.getElementById('map').style.marginLeft = "0";
            document.getElementById('overlay').style.display = "none";
        }
        document.addEventListener('keydown', function(event) {
            if (event.key === 'Escape') {
                closeSidebar();
            }
        });

        // Inisialisasi utama
        function main() {
            const locations = <?php echo json_encode($locations); ?>;
            const map = initializeMap();
            const polygons = initializeLocations(map, locations);
            createFilterControl(map, locations, polygons);
            // Tambahkan event listener untuk tombol cari
            document.getElementById('searchInput').addEventListener('input', () => {
                searchLocations(map, locations, polygons);
            });
        }

        main();
    </script>
</body>

</html>