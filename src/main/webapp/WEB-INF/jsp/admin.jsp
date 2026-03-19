<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Ananda Holidays</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- SweetAlert2 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <!-- Flatpickr -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

    <style>
        :root {
            --primary-color: #3CB371;
            --secondary-color: #02A5CE;
            --dark-color: #161920;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f9;
        }

        .sidebar {
            min-height: 100vh;
            background: linear-gradient(135deg, var(--dark-color) 0%, #2c3e50 100%);
            color: white;
            box-shadow: 2px 0 10px rgba(0,0,0,0.1);
            position: fixed;
            width: 250px;
            transition: all 0.3s;
            z-index: 1000;
        }

        .sidebar.active {
            margin-left: -250px;
        }

        .sidebar .brand {
            padding: 20px;
            font-size: 24px;
            font-weight: bold;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            text-align: center;
        }

        .sidebar .brand span {
            color: var(--primary-color);
        }

        .sidebar .nav-link {
            color: rgba(255,255,255,0.8);
            padding: 15px 25px;
            transition: all 0.3s;
            margin: 5px 10px;
            border-radius: 5px;
        }

        .sidebar .nav-link:hover,
        .sidebar .nav-link.active {
            background: var(--primary-color);
            color: white;
            transform: translateX(5px);
        }

        .sidebar .nav-link i {
            margin-right: 10px;
            width: 20px;
        }

        .content {
            margin-left: 250px;
            padding: 20px;
            transition: all 0.3s;
        }

        .content.active {
            margin-left: 0;
        }

        .navbar-top {
            background: white;
            padding: 15px 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }

        .stats-card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            transition: transform 0.3s;
            border-left: 4px solid var(--primary-color);
        }

        .stats-card:hover {
            transform: translateY(-5px);
        }

        .stats-card i {
            font-size: 40px;
            color: var(--primary-color);
        }

        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }

        .card-header {
            background: white;
            border-bottom: 2px solid #f0f0f0;
            padding: 20px;
            font-weight: bold;
        }

        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .btn-primary:hover {
            background-color: #2e8b57;
            border-color: #2e8b57;
        }

        .status-badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
        }

        .status-upcoming {
            background-color: #ffc107;
            color: #000;
        }

        .status-ongoing {
            background-color: #17a2b8;
            color: #fff;
        }

        .status-completed {
            background-color: #6c757d;
            color: #fff;
        }

        .tour-image-preview {
            width: 50px;
            height: 50px;
            object-fit: cover;
            border-radius: 5px;
        }

        .image-upload-container {
            border: 2px dashed #ddd;
            padding: 20px;
            text-align: center;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .image-upload-container:hover {
            border-color: var(--primary-color);
            background-color: rgba(60, 179, 113, 0.05);
        }

        .image-preview {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 10px;
        }

        .preview-item {
            position: relative;
            width: 100px;
            height: 100px;
        }

        .preview-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 5px;
        }

        .preview-item .remove-image {
            position: absolute;
            top: -5px;
            right: -5px;
            background: red;
            color: white;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            font-size: 12px;
        }

        .login-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, var(--dark-color) 0%, #2c3e50 100%);
        }

        .login-box {
            background: white;
            border-radius: 10px;
            padding: 40px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }

        .login-box h2 {
            color: var(--dark-color);
            margin-bottom: 30px;
            text-align: center;
        }

        .login-box h2 span {
            color: var(--primary-color);
        }

        .table-actions {
            display: flex;
            gap: 5px;
        }

        .filter-section {
            background: white;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .loading-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255,255,255,0.8);
            display: none;
            justify-content: center;
            align-items: center;
            z-index: 9999;
        }

        .loading-overlay.active {
            display: flex;
        }
    </style>
</head>
<body>

<!-- Loading Overlay -->
<div class="loading-overlay" id="loadingOverlay">
    <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
        <span class="visually-hidden">Loading...</span>
    </div>
</div>

<!-- Login Page -->
<div id="loginPage" class="login-container">
    <div class="login-box">
        <h2>Ananda <span>Holidays</span></h2>
        <h5 class="text-center mb-4">Admin Login</h5>

        <div id="loginError" class="alert alert-danger" style="display: none;"></div>

        <form id="loginForm">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" required>
            </div>
            <button type="submit" class="btn btn-primary w-100" id="loginBtn">
                Login <i class="fas fa-sign-in-alt ms-2"></i>
            </button>
        </form>
    </div>
</div>

<!-- Admin Dashboard -->
<div id="dashboardPage" style="display: none;">
    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <div class="brand">
            Ananda <span>Holidays</span>
        </div>

        <div class="mt-4">
            <div class="text-center mb-4">
                <i class="fas fa-user-circle fa-3x" style="color: var(--primary-color);"></i>
                <p class="mt-2 mb-0" id="adminName">Admin User</p>
                <small id="adminEmail">admin@anandaholidays.com</small>
            </div>

            <nav class="nav flex-column">
                <a class="nav-link active" href="#" onclick="showSection('dashboard')">
                    <i class="fas fa-tachometer-alt"></i> Dashboard
                </a>
                <a class="nav-link" href="#" onclick="showSection('tours')">
                    <i class="fas fa-map-marked-alt"></i> Manage Tours
                </a>
                <a class="nav-link" href="#" onclick="showSection('bookings')">
                    <i class="fas fa-calendar-check"></i> Manage Bookings
                </a>
                <a class="nav-link" href="#" onclick="logout()">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </nav>
        </div>
    </div>

    <!-- Main Content -->
    <div class="content" id="content">
        <!-- Top Navbar -->
        <div class="navbar-top d-flex justify-content-between align-items-center">
            <div>
                <i class="fas fa-bars menu-toggle" onclick="toggleSidebar()" style="cursor: pointer; font-size: 20px;"></i>
            </div>
            <div class="d-flex align-items-center gap-3">
                <span id="currentDateTime"></span>
                <span class="badge bg-primary">Admin</span>
            </div>
        </div>

        <!-- Dashboard Section -->
        <div id="dashboardSection">
            <h4 class="mb-4"><i class="fas fa-tachometer-alt me-2"></i>Dashboard</h4>

            <!-- Stats Cards -->
            <div class="row g-4 mb-4">
                <div class="col-md-3">
                    <div class="stats-card">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="text-muted mb-2">Total Tours</h6>
                                <h3 id="totalTours">0</h3>
                            </div>
                            <i class="fas fa-map-marked-alt"></i>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stats-card">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="text-muted mb-2">Total Bookings</h6>
                                <h3 id="totalBookings">0</h3>
                            </div>
                            <i class="fas fa-calendar-check"></i>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stats-card">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="text-muted mb-2">Upcoming Tours</h6>
                                <h3 id="upcomingTours">0</h3>
                            </div>
                            <i class="fas fa-clock"></i>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stats-card">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="text-muted mb-2">Ongoing Tours</h6>
                                <h3 id="ongoingTours">0</h3>
                            </div>
                            <i class="fas fa-play-circle"></i>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Recent Tours -->
            <div class="row">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <i class="fas fa-clock me-2"></i>Upcoming Tours
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Tour Name</th>
                                            <th>Start Date</th>
                                            <th>Price</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="recentUpcomingTours"></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <i class="fas fa-play-circle me-2"></i>Ongoing Tours
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Tour Name</th>
                                            <th>End Date</th>
                                            <th>Price</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="recentOngoingTours"></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Recent Bookings -->
            <div class="row mt-4">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <i class="fas fa-calendar-check me-2"></i>Recent Bookings
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Booking ID</th>
                                            <th>Customer</th>
                                            <th>Tour</th>
                                            <th>Date</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="recentBookings"></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Tours Management Section -->
        <div id="toursSection" style="display: none;">
            <h4 class="mb-4"><i class="fas fa-map-marked-alt me-2"></i>Manage Tours</h4>

            <!-- Filter and Add Button -->
            <div class="filter-section">
                <div class="row align-items-center">
                    <div class="col-md-6">
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-outline-primary active" onclick="filterTours('all')">All</button>
                            <button type="button" class="btn btn-outline-warning" onclick="filterTours('UPCOMING')">Upcoming</button>
                            <button type="button" class="btn btn-outline-info" onclick="filterTours('ONGOING')">Ongoing</button>
                            <button type="button" class="btn btn-outline-secondary" onclick="filterTours('COMPLETED')">Completed</button>
                        </div>
                    </div>
                    <div class="col-md-6 text-end">
                        <button class="btn btn-primary" onclick="openTourModal()">
                            <i class="fas fa-plus me-2"></i>Add New Tour
                        </button>
                    </div>
                </div>
            </div>

            <!-- Tours Table -->
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover" id="toursTable">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Image</th>
                                    <th>Tour Name</th>
                                    <th>Destination</th>
                                    <th>Duration</th>
                                    <th>Price</th>
                                    <th>Start Date</th>
                                    <th>End Date</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody id="toursTableBody"></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bookings Management Section -->
        <div id="bookingsSection" style="display: none;">
            <h4 class="mb-4"><i class="fas fa-calendar-check me-2"></i>Manage Bookings</h4>

            <!-- Bookings Table -->
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover" id="bookingsTable">
                            <thead>
                                <tr>
                                    <th>Booking ID</th>
                                    <th>Customer</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Tour</th>
                                    <th>Adults/Children</th>
                                    <th>Booking Date</th>
                                    <th>Total</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody id="bookingsTableBody"></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Tour Modal (Add/Edit) -->
<div class="modal fade" id="tourModal" tabindex="-1">
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="tourModalTitle">Add New Tour</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form id="tourForm" enctype="multipart/form-data">
                    <input type="hidden" id="tourId">

                    <!-- Basic Information -->
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label">Tour Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="tourName" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Tour Price <span class="text-danger">*</span></label>
                            <input type="number" class="form-control" id="tourPrice" min="0" step="0.01" required>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label">Destination <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="tourDestination" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Location</label>
                            <input type="text" class="form-control" id="tourLocation">
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label">Days <span class="text-danger">*</span></label>
                            <input type="number" class="form-control" id="tourDays" min="1" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Nights <span class="text-danger">*</span></label>
                            <input type="number" class="form-control" id="tourNights" min="0" required>
                        </div>
                    </div>

                    <!-- Dates -->
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label">Start Date <span class="text-danger">*</span></label>
                            <input type="text" class="form-control datepicker" id="tourStartingDate" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">End Date <span class="text-danger">*</span></label>
                            <input type="text" class="form-control datepicker" id="tourEndingDate" required>
                        </div>
                    </div>

                    <!-- Tour Type -->
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label">Tour Type <span class="text-danger">*</span></label>
                            <select class="form-control" id="tourType" required>
                                <option value="">Select Type</option>
                                <option value="ADVENTURE">Adventure</option>
                                <option value="RELIGIOUS">Religious</option>
                                <option value="BEACH">Beach</option>
                                <option value="HILL_STATION">Hill Station</option>
                                <option value="WILDLIFE">Wildlife</option>
                                <option value="HERITAGE">Heritage</option>
                                <option value="FAMILY">Family</option>
                                <option value="HONEYMOON">Honeymoon</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Helpline Number</label>
                            <input type="text" class="form-control" id="tourHelplineNumber">
                        </div>
                    </div>

                    <!-- Description -->
                    <div class="mb-3">
                        <label class="form-label">Description</label>
                        <textarea class="form-control" id="tourDescription" rows="3"></textarea>
                    </div>

                    <!-- Map Embed URL -->
                    <div class="mb-3">
                        <label class="form-label">Map Embed URL</label>
                        <input type="text" class="form-control" id="tourMapEmbedUrl">
                        <small class="text-muted">Google Maps embed URL</small>
                    </div>

                    <!-- Inclusions, Exclusions, Services -->
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <label class="form-label">Inclusions</label>
                            <textarea class="form-control" id="tourInclusions" rows="3" placeholder="Enter each item on new line"></textarea>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Exclusions</label>
                            <textarea class="form-control" id="tourExclusions" rows="3" placeholder="Enter each item on new line"></textarea>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Services</label>
                            <textarea class="form-control" id="tourServices" rows="3" placeholder="Enter each item on new line"></textarea>
                        </div>
                    </div>

                    <!-- Image Upload -->
                    <div class="mb-3">
                        <label class="form-label">Main Image</label>
                        <div class="image-upload-container" onclick="document.getElementById('mainImage').click()">
                            <i class="fas fa-cloud-upload-alt fa-2x mb-2"></i>
                            <p>Click to upload main image</p>
                            <input type="file" id="mainImage" accept="image/*" style="display: none;" onchange="previewMainImage(this)">
                        </div>
                        <div class="image-preview" id="mainImagePreview"></div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Additional Images</label>
                        <div class="image-upload-container" onclick="document.getElementById('additionalImages').click()">
                            <i class="fas fa-cloud-upload-alt fa-2x mb-2"></i>
                            <p>Click to upload additional images</p>
                            <input type="file" id="additionalImages" accept="image/*" multiple style="display: none;" onchange="previewAdditionalImages(this)">
                        </div>
                        <div class="image-preview" id="additionalImagesPreview"></div>
                    </div>

                    <!-- Existing Images (for edit) -->
                    <div id="existingImagesContainer" style="display: none;">
                        <label class="form-label">Existing Images</label>
                        <div class="image-preview" id="existingImagesPreview"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" onclick="saveTour()" id="saveTourBtn">Save Tour</button>
            </div>
        </div>
    </div>
</div>

<!-- Booking Status Modal -->
<div class="modal fade" id="bookingStatusModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Update Booking Status</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <input type="hidden" id="updateBookingId">
                <div class="mb-3">
                    <label class="form-label">Select Status</label>
                    <select class="form-control" id="bookingStatusSelect">
                        <option value="PENDING">Pending</option>
                        <option value="CONFIRMED">Confirmed</option>
                        <option value="CANCELLED">Cancelled</option>
                        <option value="COMPLETED">Completed</option>
                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" onclick="updateBookingStatus()">Update</button>
            </div>
        </div>
    </div>
</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>



<script>
    // API Configuration
    const API_BASE_URL = window.location.origin + '/api';

    // Create axios instance with interceptor for token
    const api = axios.create({
        baseURL: API_BASE_URL
    });

    // Request interceptor to add token to every request
    api.interceptors.request.use(
        function(config) {
            const token = localStorage.getItem('adminToken');
            if (token) {
                config.headers.Authorization = 'Bearer ' + token;
            }
            return config;
        },
        function(error) {
            return Promise.reject(error);
        }
    );

    // Response interceptor to handle 401 errors
    api.interceptors.response.use(
        function(response) {
            return response;
        },
        function(error) {
            if (error.response && error.response.status === 401) {
                // Token expired or invalid
                localStorage.removeItem('adminToken');
                localStorage.removeItem('adminName');
                localStorage.removeItem('adminEmail');
                showLoginPage();
                Swal.fire({
                    icon: 'error',
                    title: 'Session Expired',
                    text: 'Please login again'
                });
            }
            return Promise.reject(error);
        }
    );

    // Store JWT token
    let authToken = null;

    // Initialize date pickers
    flatpickr(".datepicker", {
        dateFormat: "Y-m-d",
        minDate: "today"
    });

    // Check if user is logged in
    document.addEventListener('DOMContentLoaded', function() {
        const token = localStorage.getItem('adminToken');
        if (token) {
            authToken = token;
            showDashboard();
            loadDashboardData();
        }
    });

    // Show/hide loading overlay
    function showLoading() {
        document.getElementById('loadingOverlay').classList.add('active');
    }

    function hideLoading() {
        document.getElementById('loadingOverlay').classList.remove('active');
    }

    function showLoginPage() {
        document.getElementById('loginPage').style.display = 'flex';
        document.getElementById('dashboardPage').style.display = 'none';
    }

    // ==================== LOGIN FUNCTIONS ====================

    document.getElementById('loginForm').addEventListener('submit', async function(e) {
        e.preventDefault();

        const username = document.getElementById('username').value;
        const password = document.getElementById('password').value;
        const loginBtn = document.getElementById('loginBtn');
        const loginError = document.getElementById('loginError');

        loginBtn.disabled = true;
        loginBtn.innerHTML = 'Logging in... <i class="fas fa-spinner fa-spin ms-2"></i>';
        loginError.style.display = 'none';

        try {
            // Use regular axios for login (no token needed)
            const response = await axios.post(API_BASE_URL + '/auth/login', {
                username: username,
                password: password
            });

            const data = response.data;
            authToken = data.token;

            // Store token
            localStorage.setItem('adminToken', authToken);
            localStorage.setItem('adminName', data.username);
            localStorage.setItem('adminEmail', data.email);

            showDashboard();
            loadDashboardData();

        } catch (error) {
            console.error('Login error:', error);
            loginError.textContent = error.response?.data?.message || 'Invalid username or password';
            loginError.style.display = 'block';
        } finally {
            loginBtn.disabled = false;
            loginBtn.innerHTML = 'Login <i class="fas fa-sign-in-alt ms-2"></i>';
        }
    });

    function showDashboard() {
        document.getElementById('loginPage').style.display = 'none';
        document.getElementById('dashboardPage').style.display = 'block';

        document.getElementById('adminName').textContent = localStorage.getItem('adminName') || 'Admin User';
        document.getElementById('adminEmail').textContent = localStorage.getItem('adminEmail') || 'admin@anandaholidays.com';

        // Update date/time
        updateDateTime();
        setInterval(updateDateTime, 1000);
    }

    function logout() {
        Swal.fire({
            title: 'Logout',
            text: 'Are you sure you want to logout?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#3CB371',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, logout'
        }).then((result) => {
            if (result.isConfirmed) {
                localStorage.removeItem('adminToken');
                localStorage.removeItem('adminName');
                localStorage.removeItem('adminEmail');
                authToken = null;
                showLoginPage();
            }
        });
    }

    function updateDateTime() {
        const now = new Date();
        document.getElementById('currentDateTime').textContent = now.toLocaleString();
    }

    function toggleSidebar() {
        document.getElementById('sidebar').classList.toggle('active');
        document.getElementById('content').classList.toggle('active');
    }

    function showSection(section) {
        // Update active nav link
        const navLinks = document.querySelectorAll('.sidebar .nav-link');
        for (let i = 0; i < navLinks.length; i++) {
            navLinks[i].classList.remove('active');
        }
        event.target.closest('.nav-link').classList.add('active');

        // Show selected section
        document.getElementById('dashboardSection').style.display = section === 'dashboard' ? 'block' : 'none';
        document.getElementById('toursSection').style.display = section === 'tours' ? 'block' : 'none';
        document.getElementById('bookingsSection').style.display = section === 'bookings' ? 'block' : 'none';

        if (section === 'tours') {
            loadTours();
        } else if (section === 'bookings') {
            loadBookings();
        }
    }

    // ==================== DASHBOARD FUNCTIONS ====================

    async function loadDashboardData() {
        showLoading();
        try {
            const toursRes = await api.get('/admin/tours');
            const bookingsRes = await api.get('/admin/bookings');

            const tours = toursRes.data;
            const bookings = bookingsRes.data;

            // Update stats
            document.getElementById('totalTours').textContent = tours.length;
            document.getElementById('totalBookings').textContent = bookings.length;

            // Calculate tour statuses
            const now = new Date();
            let upcoming = 0;
            let ongoing = 0;

            for (let i = 0; i < tours.length; i++) {
                const tour = tours[i];
                const start = new Date(tour.tourStartingDate);
                const end = new Date(tour.tourEndingDate);

                if (start > now) {
                    upcoming++;
                } else if (start <= now && end >= now) {
                    ongoing++;
                }
            }

            document.getElementById('upcomingTours').textContent = upcoming;
            document.getElementById('ongoingTours').textContent = ongoing;

            // Recent upcoming tours
            const upcomingTours = [];
            for (let i = 0; i < tours.length; i++) {
                const tour = tours[i];
                if (new Date(tour.tourStartingDate) > now) {
                    upcomingTours.push(tour);
                }
            }
            upcomingTours.sort((a, b) => new Date(a.tourStartingDate) - new Date(b.tourStartingDate));

            let upcomingHtml = '';
            for (let i = 0; i < Math.min(5, upcomingTours.length); i++) {
                const tour = upcomingTours[i];
                upcomingHtml += '<tr>' +
                    '<td>' + escapeHtml(tour.tourName) + '</td>' +
                    '<td>' + formatDate(tour.tourStartingDate) + '</td>' +
                    '<td>₹' + formatPrice(tour.tourPrice) + '</td>' +
                    '<td><button class="btn btn-sm btn-primary" onclick="editTour(' + tour.id + ')"><i class="fas fa-edit"></i></button></td>' +
                '</tr>';
            }
            document.getElementById('recentUpcomingTours').innerHTML = upcomingHtml || '<tr><td colspan="4" class="text-center">No upcoming tours</td></tr>';

            // Recent ongoing tours
            const ongoingTours = [];
            for (let i = 0; i < tours.length; i++) {
                const tour = tours[i];
                const start = new Date(tour.tourStartingDate);
                const end = new Date(tour.tourEndingDate);
                if (start <= now && end >= now) {
                    ongoingTours.push(tour);
                }
            }

            let ongoingHtml = '';
            for (let i = 0; i < Math.min(5, ongoingTours.length); i++) {
                const tour = ongoingTours[i];
                ongoingHtml += '<tr>' +
                    '<td>' + escapeHtml(tour.tourName) + '</td>' +
                    '<td>' + formatDate(tour.tourEndingDate) + '</td>' +
                    '<td>₹' + formatPrice(tour.tourPrice) + '</td>' +
                    '<td><button class="btn btn-sm btn-primary" onclick="editTour(' + tour.id + ')"><i class="fas fa-edit"></i></button></td>' +
                '</tr>';
            }
            document.getElementById('recentOngoingTours').innerHTML = ongoingHtml || '<tr><td colspan="4" class="text-center">No ongoing tours</td></tr>';

            // Recent bookings
            const recentBookings = bookings.slice(0, 5);
            let bookingsHtml = '';
            for (let i = 0; i < recentBookings.length; i++) {
                const booking = recentBookings[i];
                let statusClass = '';
                if (booking.bookingStatus === 'CONFIRMED') statusClass = 'bg-success';
                else if (booking.bookingStatus === 'PENDING') statusClass = 'bg-warning';
                else if (booking.bookingStatus === 'CANCELLED') statusClass = 'bg-danger';
                else if (booking.bookingStatus === 'COMPLETED') statusClass = 'bg-secondary';

                bookingsHtml += '<tr>' +
                    '<td>#' + booking.id + '</td>' +
                    '<td>' + escapeHtml(booking.customerName) + '</td>' +
                    '<td>' + escapeHtml(booking.tour?.tourName || 'N/A') + '</td>' +
                    '<td>' + formatDate(booking.bookingDate) + '</td>' +
                    '<td><span class="badge ' + statusClass + '">' + (booking.bookingStatus || 'PENDING') + '</span></td>' +
                    '<td><button class="btn btn-sm btn-info" onclick="updateBookingStatusModal(' + booking.id + ', \'' + (booking.bookingStatus || 'PENDING') + '\')"><i class="fas fa-sync-alt"></i></button></td>' +
                '</tr>';
            }
            document.getElementById('recentBookings').innerHTML = bookingsHtml || '<tr><td colspan="6" class="text-center">No recent bookings</td></tr>';

        } catch (error) {
            console.error('Error loading dashboard:', error);
            if (error.response?.status === 401) {
                logout();
            }
        } finally {
            hideLoading();
        }
    }

    // ==================== TOURS FUNCTIONS ====================

    async function loadTours(filter) {
        showLoading();
        try {
            const response = await api.get('/admin/tours');
            let tours = response.data;

            // Filter tours based on status
            const now = new Date();
            if (filter && filter !== 'all') {
                const filteredTours = [];
                for (let i = 0; i < tours.length; i++) {
                    const tour = tours[i];
                    const start = new Date(tour.tourStartingDate);
                    const end = new Date(tour.tourEndingDate);

                    if (filter === 'UPCOMING' && start > now) {
                        filteredTours.push(tour);
                    } else if (filter === 'ONGOING' && start <= now && end >= now) {
                        filteredTours.push(tour);
                    } else if (filter === 'COMPLETED' && end < now) {
                        filteredTours.push(tour);
                    }
                }
                tours = filteredTours;
            }

            displayTours(tours);

        } catch (error) {
            console.error('Error loading tours:', error);
            if (error.response?.status === 401) {
                logout();
            } else {
                Swal.fire('Error', 'Failed to load tours', 'error');
            }
        } finally {
            hideLoading();
        }
    }

    function displayTours(tours) {
        const tbody = document.getElementById('toursTableBody');

        if (!tours || tours.length === 0) {
            tbody.innerHTML = '<tr><td colspan="10" class="text-center">No tours found</td></tr>';
            return;
        }

        let html = '';
        const now = new Date();

        for (let i = 0; i < tours.length; i++) {
            const tour = tours[i];
            const start = new Date(tour.tourStartingDate);
            const end = new Date(tour.tourEndingDate);

            let statusClass = 'status-upcoming';
            let statusText = 'UPCOMING';

            if (start <= now && end >= now) {
                statusClass = 'status-ongoing';
                statusText = 'ONGOING';
            } else if (end < now) {
                statusClass = 'status-completed';
                statusText = 'COMPLETED';
            }

            const imageUrl = tour.tourImages && tour.tourImages.length > 0
                ? API_BASE_URL + '/images/' + tour.tourImages[0]
                : '${pageContext.request.contextPath}/static/assets/default-tour.jpg';

            html += '<tr>' +
                '<td>' + tour.id + '</td>' +
                '<td><img src="' + imageUrl + '" class="tour-image-preview" alt="tour" onerror="this.src=\'${pageContext.request.contextPath}/static/assets/default-tour.jpg\'"></td>' +
                '<td>' + escapeHtml(tour.tourName) + '</td>' +
                '<td>' + escapeHtml(tour.tourDestination || 'N/A') + '</td>' +
                '<td>' + (tour.tourDays || 0) + 'D / ' + (tour.tourNights || 0) + 'N</td>' +
                '<td>₹' + formatPrice(tour.tourPrice) + '</td>' +
                '<td>' + formatDate(tour.tourStartingDate) + '</td>' +
                '<td>' + formatDate(tour.tourEndingDate) + '</td>' +
                '<td><span class="status-badge ' + statusClass + '">' + statusText + '</span></td>' +
                '<td><div class="table-actions">' +
                    '<button class="btn btn-sm btn-primary" onclick="editTour(' + tour.id + ')"><i class="fas fa-edit"></i></button>' +
                    '<button class="btn btn-sm btn-danger" onclick="deleteTour(' + tour.id + ')"><i class="fas fa-trash"></i></button>' +
                '</div></td>' +
            '</tr>';
        }

        tbody.innerHTML = html;
    }

    function filterTours(status) {
        // Update active button
        const buttons = document.querySelectorAll('.filter-section .btn');
        for (let i = 0; i < buttons.length; i++) {
            buttons[i].classList.remove('active');
        }
        event.target.classList.add('active');

        loadTours(status);
    }

    function openTourModal() {
        document.getElementById('tourModalTitle').textContent = 'Add New Tour';
        document.getElementById('tourForm').reset();
        document.getElementById('tourId').value = '';
        document.getElementById('existingImagesContainer').style.display = 'none';
        document.getElementById('mainImagePreview').innerHTML = '';
        document.getElementById('additionalImagesPreview').innerHTML = '';

        new bootstrap.Modal(document.getElementById('tourModal')).show();
    }

    async function editTour(id) {
        showLoading();
        try {
            const response = await api.get('/admin/tours/' + id);
            const tour = response.data;

            document.getElementById('tourModalTitle').textContent = 'Edit Tour';
            document.getElementById('tourId').value = tour.id;
            document.getElementById('tourName').value = tour.tourName || '';
            document.getElementById('tourPrice').value = tour.tourPrice || '';
            document.getElementById('tourDestination').value = tour.tourDestination || '';
            document.getElementById('tourLocation').value = tour.tourLocation || '';
            document.getElementById('tourDays').value = tour.tourDays || '';
            document.getElementById('tourNights').value = tour.tourNights || '';
            document.getElementById('tourStartingDate').value = tour.tourStartingDate || '';
            document.getElementById('tourEndingDate').value = tour.tourEndingDate || '';
            document.getElementById('tourType').value = tour.tourType || '';
            document.getElementById('tourHelplineNumber').value = tour.tourHelplineNumber || '';
            document.getElementById('tourDescription').value = tour.tourDescription || '';
            document.getElementById('tourMapEmbedUrl').value = tour.tourMapEmbedUrl || '';

            // Handle inclusions/exclusions/services
            document.getElementById('tourInclusions').value = (tour.tourInclusions || []).join('\n');
            document.getElementById('tourExclusions').value = (tour.tourExclusions || []).join('\n');
            document.getElementById('tourServices').value = (tour.tourServices || []).join('\n');

            // Handle existing images
            if (tour.tourImages && tour.tourImages.length > 0) {
                document.getElementById('existingImagesContainer').style.display = 'block';

                let previewHtml = '';
                for (let i = 0; i < tour.tourImages.length; i++) {
                    const image = tour.tourImages[i];
                    previewHtml += '<div class="preview-item">' +
                        '<img src="' + API_BASE_URL + '/images/' + image + '" alt="tour image">' +
                        '<div class="remove-image" onclick="markImageForDelete(' + i + ', \'' + image + '\')">' +
                            '<i class="fas fa-times"></i>' +
                        '</div>' +
                    '</div>';
                }
                document.getElementById('existingImagesPreview').innerHTML = previewHtml;

                // Store existing images for delete tracking
                window.imagesToDelete = [];
            }

            new bootstrap.Modal(document.getElementById('tourModal')).show();

        } catch (error) {
            console.error('Error loading tour:', error);
            Swal.fire('Error', 'Failed to load tour details', 'error');
        } finally {
            hideLoading();
        }
    }

    async function saveTour() {
        const formData = new FormData();
        const tourId = document.getElementById('tourId').value;

        // Prepare tour data
        const tourData = {
            tourName: document.getElementById('tourName').value,
            tourPrice: parseFloat(document.getElementById('tourPrice').value),
            tourDestination: document.getElementById('tourDestination').value,
            tourLocation: document.getElementById('tourLocation').value,
            tourDays: parseInt(document.getElementById('tourDays').value),
            tourNights: parseInt(document.getElementById('tourNights').value),
            tourType: document.getElementById('tourType').value,
            tourStartingDate: document.getElementById('tourStartingDate').value,
            tourEndingDate: document.getElementById('tourEndingDate').value,
            tourDescription: document.getElementById('tourDescription').value,
            tourHelplineNumber: document.getElementById('tourHelplineNumber').value,
            tourMapEmbedUrl: document.getElementById('tourMapEmbedUrl').value,
            tourInclusions: document.getElementById('tourInclusions').value.split('\n').filter(function(i) { return i.trim(); }),
            tourExclusions: document.getElementById('tourExclusions').value.split('\n').filter(function(i) { return i.trim(); }),
            tourServices: document.getElementById('tourServices').value.split('\n').filter(function(i) { return i.trim(); })
        };

        formData.append('tour', new Blob([JSON.stringify(tourData)], { type: 'application/json' }));

        // Add images
        const mainImage = document.getElementById('mainImage').files[0];
        if (mainImage) {
            formData.append('mainImage', mainImage);
        }

        const additionalImages = document.getElementById('additionalImages').files;
        for (let i = 0; i < additionalImages.length; i++) {
            formData.append('additionalImages', additionalImages[i]);
        }

        // Add existing images and images to delete for edit mode
        if (tourId) {
            if (window.existingImages) {
                formData.append('existingImages', JSON.stringify(window.existingImages));
            }
            if (window.imagesToDelete && window.imagesToDelete.length > 0) {
                formData.append('imagesToDelete', JSON.stringify(window.imagesToDelete));
            }
        }

        const saveBtn = document.getElementById('saveTourBtn');
        saveBtn.disabled = true;
        saveBtn.innerHTML = 'Saving... <i class="fas fa-spinner fa-spin ms-2"></i>';

        try {
            let response;
            if (tourId) {
                response = await api.put('/admin/tours/' + tourId, formData, {
                    headers: { 'Content-Type': 'multipart/form-data' }
                });
            } else {
                response = await api.post('/admin/tours', formData, {
                    headers: { 'Content-Type': 'multipart/form-data' }
                });
            }

            bootstrap.Modal.getInstance(document.getElementById('tourModal')).hide();

            Swal.fire({
                icon: 'success',
                title: 'Success',
                text: 'Tour ' + (tourId ? 'updated' : 'created') + ' successfully!',
                timer: 2000
            });

            loadTours();

        } catch (error) {
            console.error('Error saving tour:', error);
            Swal.fire('Error', error.response?.data?.message || 'Failed to save tour', 'error');
        } finally {
            saveBtn.disabled = false;
            saveBtn.innerHTML = 'Save Tour';
        }
    }

    async function deleteTour(id) {
        const result = await Swal.fire({
            title: 'Delete Tour',
            text: 'Are you sure you want to delete this tour? This action cannot be undone.',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Yes, delete it!'
        });

        if (result.isConfirmed) {
            showLoading();
            try {
                await api.delete('/admin/tours/' + id);

                Swal.fire({
                    icon: 'success',
                    title: 'Deleted!',
                    text: 'Tour has been deleted.',
                    timer: 2000
                });

                loadTours();

            } catch (error) {
                console.error('Error deleting tour:', error);
                Swal.fire('Error', 'Failed to delete tour', 'error');
            } finally {
                hideLoading();
            }
        }
    }

    // ==================== BOOKINGS FUNCTIONS ====================

    async function loadBookings() {
        showLoading();
        try {
            const response = await api.get('/admin/bookings');
            displayBookings(response.data);
        } catch (error) {
            console.error('Error loading bookings:', error);
            if (error.response?.status === 401) {
                logout();
            }
        } finally {
            hideLoading();
        }
    }

    function displayBookings(bookings) {
        const tbody = document.getElementById('bookingsTableBody');

        if (!bookings || bookings.length === 0) {
            tbody.innerHTML = '<tr><td colspan="10" class="text-center">No bookings found</td></tr>';
            return;
        }

        let html = '';

        for (let i = 0; i < bookings.length; i++) {
            const booking = bookings[i];
            let statusClass = '';
            if (booking.bookingStatus === 'CONFIRMED') statusClass = 'bg-success';
            else if (booking.bookingStatus === 'PENDING') statusClass = 'bg-warning';
            else if (booking.bookingStatus === 'CANCELLED') statusClass = 'bg-danger';
            else if (booking.bookingStatus === 'COMPLETED') statusClass = 'bg-secondary';

            html += '<tr>' +
                '<td>#' + booking.id + '</td>' +
                '<td>' + escapeHtml(booking.customerName) + '</td>' +
                '<td>' + escapeHtml(booking.customerEmail) + '</td>' +
                '<td>' + escapeHtml(booking.customerPhone) + '</td>' +
                '<td>' + escapeHtml(booking.tour?.tourName || 'N/A') + '</td>' +
                '<td>' + (booking.numberOfAdults || 0) + ' / ' + (booking.numberOfChildren || 0) + '</td>' +
                '<td>' + formatDate(booking.bookingDate) + '</td>' +
                '<td>₹' + formatPrice(booking.totalAmount) + '</td>' +
                '<td><span class="badge ' + statusClass + '">' + (booking.bookingStatus || 'PENDING') + '</span></td>' +
                '<td><div class="table-actions">' +
                    '<button class="btn btn-sm btn-info" onclick="updateBookingStatusModal(' + booking.id + ', \'' + (booking.bookingStatus || 'PENDING') + '\')"><i class="fas fa-sync-alt"></i></button>' +
                    '<button class="btn btn-sm btn-danger" onclick="deleteBooking(' + booking.id + ')"><i class="fas fa-trash"></i></button>' +
                '</div></td>' +
            '</tr>';
        }

        tbody.innerHTML = html;
    }

    function updateBookingStatusModal(id, currentStatus) {
        document.getElementById('updateBookingId').value = id;
        document.getElementById('bookingStatusSelect').value = currentStatus || 'PENDING';
        new bootstrap.Modal(document.getElementById('bookingStatusModal')).show();
    }

    async function updateBookingStatus() {
        const id = document.getElementById('updateBookingId').value;
        const status = document.getElementById('bookingStatusSelect').value;

        showLoading();
        try {
            await api.put('/admin/bookings/' + id + '/status?status=' + status);

            bootstrap.Modal.getInstance(document.getElementById('bookingStatusModal')).hide();

            Swal.fire({
                icon: 'success',
                title: 'Success',
                text: 'Booking status updated successfully!',
                timer: 2000
            });

            loadBookings();

        } catch (error) {
            console.error('Error updating booking:', error);
            Swal.fire('Error', 'Failed to update booking status', 'error');
        } finally {
            hideLoading();
        }
    }

    async function deleteBooking(id) {
        const result = await Swal.fire({
            title: 'Delete Booking',
            text: 'Are you sure you want to delete this booking?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Yes, delete it!'
        });

        if (result.isConfirmed) {
            showLoading();
            try {
                await api.delete('/admin/bookings/' + id);

                Swal.fire({
                    icon: 'success',
                    title: 'Deleted!',
                    text: 'Booking has been deleted.',
                    timer: 2000
                });

                loadBookings();

            } catch (error) {
                console.error('Error deleting booking:', error);
                Swal.fire('Error', 'Failed to delete booking', 'error');
            } finally {
                hideLoading();
            }
        }
    }

    // ==================== IMAGE HANDLING ====================

    function previewMainImage(input) {
        const preview = document.getElementById('mainImagePreview');
        preview.innerHTML = '';

        if (input.files && input.files[0]) {
            const reader = new FileReader();
            reader.onload = function(e) {
                preview.innerHTML = '<div class="preview-item"><img src="' + e.target.result + '" alt="main image"></div>';
            };
            reader.readAsDataURL(input.files[0]);
        }
    }

    function previewAdditionalImages(input) {
        const preview = document.getElementById('additionalImagesPreview');
        preview.innerHTML = '';

        if (input.files) {
            for (let i = 0; i < input.files.length; i++) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const div = document.createElement('div');
                    div.className = 'preview-item';
                    div.innerHTML = '<img src="' + e.target.result + '" alt="additional image">';
                    preview.appendChild(div);
                };
                reader.readAsDataURL(input.files[i]);
            }
        }
    }

    function markImageForDelete(index, imageName) {
        if (!window.imagesToDelete) window.imagesToDelete = [];
        window.imagesToDelete.push(imageName);

        // Remove from UI
        event.target.closest('.preview-item').remove();
    }

    // ==================== UTILITY FUNCTIONS ====================

    function formatPrice(price) {
        if (!price && price !== 0) return '0';
        return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    }

    function formatDate(dateString) {
        if (!dateString) return 'N/A';
        try {
            const date = new Date(dateString);
            return date.toLocaleDateString('en-IN', {
                day: '2-digit',
                month: 'short',
                year: 'numeric'
            });
        } catch (e) {
            return dateString;
        }
    }

    function escapeHtml(unsafe) {
        if (!unsafe) return '';
        return String(unsafe)
            .replace(/&/g, "&amp;")
            .replace(/</g, "&lt;")
            .replace(/>/g, "&gt;")
            .replace(/"/g, "&quot;")
            .replace(/'/g, "&#039;");
    }
</script>




</body>
</html>