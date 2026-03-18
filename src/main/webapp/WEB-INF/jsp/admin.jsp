<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<jsp:include page="includes/header.jsp">
    <jsp:param name="title" value="Admin Dashboard" />
</jsp:include>

<style>
    :root {
        --sidebar-width: 250px;
        --primary-color: #2c3e50;
        --secondary-color: #e67e22;
    }
    .wrapper {
        display: flex;
        width: 100%;
    }
    #sidebar {
        width: var(--sidebar-width);
        position: fixed;
        height: 100vh;
        background: var(--primary-color);
        color: white;
        transition: all 0.3s;
        box-shadow: 2px 0 10px rgba(0,0,0,0.1);
    }
    #sidebar.active {
        margin-left: calc(-1 * var(--sidebar-width));
    }
    #content {
        width: calc(100% - var(--sidebar-width));
        margin-left: var(--sidebar-width);
        transition: all 0.3s;
        min-height: 100vh;
    }
    #content.active {
        width: 100%;
        margin-left: 0;
    }
    #sidebar .sidebar-header {
        padding: 20px;
        background: rgba(0,0,0,0.2);
        border-bottom: 1px solid rgba(255,255,255,0.1);
    }
    #sidebar ul.components {
        padding: 20px 0;
    }
    #sidebar ul li a {
        padding: 10px 20px;
        display: block;
        color: rgba(255,255,255,0.8);
        text-decoration: none;
        transition: all 0.3s;
    }
    #sidebar ul li a:hover {
        background: rgba(255,255,255,0.1);
        color: white;
        padding-left: 25px;
    }
    #sidebar ul li.active a {
        background: var(--secondary-color);
        color: white;
    }
    .navbar {
        background: white !important;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
    .card-stats {
        border: none;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        transition: transform 0.3s;
    }
    .card-stats:hover {
        transform: translateY(-5px);
    }
    .stat-icon {
        width: 50px;
        height: 50px;
        border-radius: 10px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.5rem;
    }
    .table-container {
        background: white;
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }
    .btn-action {
        padding: 5px 10px;
        margin: 0 2px;
    }
    .login-container {
        max-width: 400px;
        margin: 100px auto;
    }
    .tour-image-preview {
        width: 50px;
        height: 50px;
        object-fit: cover;
        border-radius: 5px;
    }
    .status-badge {
        padding: 5px 10px;
        border-radius: 20px;
        font-size: 0.85rem;
        font-weight: 500;
    }
    .status-confirmed { background: #d4edda; color: #155724; }
    .status-pending { background: #fff3cd; color: #856404; }
    .status-cancelled { background: #f8d7da; color: #721c24; }
</style>

<!-- Login Page -->
<div id="loginPage" class="container">
    <div class="login-container">
        <div class="card login-card">
            <div class="login-header text-center">
                <h4><i class="bi bi-shield-lock"></i> Admin Login</h4>
            </div>
            <div class="card-body p-4">
                <form id="loginForm">
                    <div class="mb-3">
                        <label class="form-label">Username</label>
                        <input type="text" class="form-control" id="username" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" required>
                    </div>
                    <button type="submit" class="btn btn-warning w-100">Login</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Dashboard Page -->
<div id="dashboardPage" style="display: none;">
    <div class="wrapper">
        <!-- Sidebar -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h5><i class="bi bi-tree-fill"></i> AnandaHolidays</h5>
                <small>Admin Panel</small>
            </div>
            <ul class="list-unstyled components">
                <li class="active"><a href="#" onclick="showSection('dashboard')"><i class="bi bi-speedometer2 me-2"></i> Dashboard</a></li>
                <li><a href="#" onclick="showSection('tours')"><i class="bi bi-briefcase me-2"></i> Tours</a></li>
                <li><a href="#" onclick="showSection('bookings')"><i class="bi bi-calendar-check me-2"></i> Bookings</a></li>
                <li><a href="#" onclick="logout()"><i class="bi bi-box-arrow-right me-2"></i> Logout</a></li>
            </ul>
        </nav>

        <!-- Content -->
        <div id="content">
            <nav class="navbar navbar-expand-lg">
                <div class="container-fluid">
                    <button type="button" id="sidebarCollapse" class="btn btn-outline-secondary">
                        <i class="bi bi-list"></i>
                    </button>
                    <span class="navbar-text" id="adminName"></span>
                </div>
            </nav>

            <div class="container-fluid p-4">
                <!-- Dashboard Section -->
                <div id="dashboardSection">
                    <h4 class="mb-4">Dashboard Overview</h4>
                    <div class="row mb-4">
                        <div class="col-md-3">
                            <div class="card card-stats p-3">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <h6 class="text-muted">Total Tours</h6>
                                        <h3 id="totalTours">0</h3>
                                    </div>
                                    <div class="stat-icon bg-primary bg-opacity-10 text-primary">
                                        <i class="bi bi-briefcase"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card card-stats p-3">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <h6 class="text-muted">Active Tours</h6>
                                        <h3 id="activeTours">0</h3>
                                    </div>
                                    <div class="stat-icon bg-success bg-opacity-10 text-success">
                                        <i class="bi bi-check-circle"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card card-stats p-3">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <h6 class="text-muted">Total Bookings</h6>
                                        <h3 id="totalBookings">0</h3>
                                    </div>
                                    <div class="stat-icon bg-warning bg-opacity-10 text-warning">
                                        <i class="bi bi-calendar-check"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card card-stats p-3">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <h6 class="text-muted">Revenue</h6>
                                        <h3 id="totalRevenue">₹0</h3>
                                    </div>
                                    <div class="stat-icon bg-info bg-opacity-10 text-info">
                                        <i class="bi bi-currency-rupee"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="table-container">
                                <h6 class="mb-3">Recent Bookings</h6>
                                <div id="recentBookings"></div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="table-container">
                                <h6 class="mb-3">Upcoming Tours</h6>
                                <div id="upcomingToursList"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Tours Section -->
                <div id="toursSection" style="display: none;">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h4>Manage Tours</h4>
                        <button class="btn btn-warning" onclick="openTourModal()">
                            <i class="bi bi-plus"></i> Add Tour
                        </button>
                    </div>
                    <div class="table-container">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Image</th>
                                    <th>Name</th>
                                    <th>Destination</th>
                                    <th>Price</th>
                                    <th>Duration</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody id="toursTableBody"></tbody>
                        </table>
                    </div>
                </div>

                <!-- Bookings Section -->
                <div id="bookingsSection" style="display: none;">
                    <h4 class="mb-4">Manage Bookings</h4>
                    <div class="table-container">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Customer</th>
                                    <th>Tour</th>
                                    <th>Adults/Children</th>
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

<!-- Tour Modal -->
<div class="modal fade" id="tourModal" tabindex="-1" data-bs-backdrop="static">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-warning">
                <h5 class="modal-title" id="tourModalTitle">Add Tour</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form id="tourForm" enctype="multipart/form-data">
                    <input type="hidden" id="tourId">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Tour Name</label>
                            <input type="text" class="form-control" id="tourName" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Price (₹)</label>
                            <input type="number" class="form-control" id="tourPrice" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Destination</label>
                            <input type="text" class="form-control" id="tourDestination" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Location</label>
                            <input type="text" class="form-control" id="tourLocation" required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label class="form-label">Days</label>
                            <input type="number" class="form-control" id="tourDays" required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label class="form-label">Nights</label>
                            <input type="number" class="form-control" id="tourNights" required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label class="form-label">Type</label>
                            <select class="form-select" id="tourType" required>
                                <option value="ADVENTURE">Adventure</option>
                                <option value="BEACH">Beach</option>
                                <option value="HILL_STATION">Hill Station</option>
                                <option value="HERITAGE">Heritage</option>
                                <option value="FAMILY">Family</option>
                                <option value="HONEYMOON">Honeymoon</option>
                            </select>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Start Date</label>
                            <input type="date" class="form-control" id="tourStartDate" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">End Date</label>
                            <input type="date" class="form-control" id="tourEndDate" required>
                        </div>
                        <div class="col-12 mb-3">
                            <label class="form-label">Description</label>
                            <textarea class="form-control" id="tourDescription" rows="3"></textarea>
                        </div>
                        <div class="col-12 mb-3">
                            <label class="form-label">Inclusions (comma separated)</label>
                            <input type="text" class="form-control" id="tourInclusions" placeholder="Hotel, Meals, Guide">
                        </div>
                        <div class="col-12 mb-3">
                            <label class="form-label">Exclusions (comma separated)</label>
                            <input type="text" class="form-control" id="tourExclusions" placeholder="Flights, Insurance">
                        </div>
                        <div class="col-12 mb-3">
                            <label class="form-label">Services (comma separated)</label>
                            <input type="text" class="form-control" id="tourServices" placeholder="WiFi, Parking">
                        </div>
                        <div class="col-12 mb-3">
                            <label class="form-label">Helpline Number</label>
                            <input type="text" class="form-control" id="tourHelpline">
                        </div>
                        <div class="col-12 mb-3">
                            <label class="form-label">Main Image</label>
                            <input type="file" class="form-control" id="mainImage" accept="image/*">
                        </div>
                        <div class="col-12 mb-3">
                            <label class="form-label">Additional Images</label>
                            <input type="file" class="form-control" id="additionalImages" accept="image/*" multiple>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-warning" onclick="saveTour()">Save Tour</button>
            </div>
        </div>
    </div>
</div>

<script>
    const API_BASE = 'http://localhost:8080/api';
    const CONTEXT_PATH = '${pageContext.request.contextPath}';
    let authToken = localStorage.getItem('adminToken');
    let currentAdmin = JSON.parse(localStorage.getItem('adminData') || '{}');

    // Check authentication on load
    if (authToken) {
        document.getElementById('loginPage').style.display = 'none';
        document.getElementById('dashboardPage').style.display = 'block';
        document.getElementById('adminName').textContent = `Welcome, ${currentAdmin.username || 'Admin'}`;
        loadDashboardData();
    }

    // Login form handler
    document.getElementById('loginForm').addEventListener('submit', async (e) => {
        e.preventDefault();
        const username = document.getElementById('username').value;
        const password = document.getElementById('password').value;

        try {
            const response = await fetch(`${API_BASE}/auth/login`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ username, password })
            });

            if (response.ok) {
                const data = await response.json();
                authToken = data.token;
                localStorage.setItem('adminToken', authToken);
                localStorage.setItem('adminData', JSON.stringify(data));

                document.getElementById('loginPage').style.display = 'none';
                document.getElementById('dashboardPage').style.display = 'block';
                document.getElementById('adminName').textContent = `Welcome, ${data.username}`;

                loadDashboardData();
            } else {
                alert('Invalid credentials');
            }
        } catch (error) {
            alert('Login failed');
        }
    });

    // Sidebar toggle
    document.getElementById('sidebarCollapse').addEventListener('click', () => {
        document.getElementById('sidebar').classList.toggle('active');
        document.getElementById('content').classList.toggle('active');
    });

    // Show different sections
    function showSection(section) {
        document.querySelectorAll('#sidebar ul li').forEach(li => li.classList.remove('active'));
        event.target.closest('li').classList.add('active');

        document.getElementById('dashboardSection').style.display = section === 'dashboard' ? 'block' : 'none';
        document.getElementById('toursSection').style.display = section === 'tours' ? 'block' : 'none';
        document.getElementById('bookingsSection').style.display = section === 'bookings' ? 'block' : 'none';

        if (section === 'tours') loadTours();
        if (section === 'bookings') loadBookings();
    }

    // Load dashboard data
    async function loadDashboardData() {
        try {
            const [tours, bookings] = await Promise.all([
                fetchWithAuth(`${API_BASE}/admin/tours`),
                fetchWithAuth(`${API_BASE}/admin/bookings`)
            ]);

            document.getElementById('totalTours').textContent = tours.length;
            document.getElementById('activeTours').textContent = tours.filter(t => t.isActive).length;
            document.getElementById('totalBookings').textContent = bookings.length;

            const revenue = bookings.reduce((sum, b) => sum + (b.totalAmount || 0), 0);
            document.getElementById('totalRevenue').textContent = `₹${revenue}`;

            displayRecentBookings(bookings.slice(0, 5));
            displayUpcomingTours(tours.filter(t => t.status === 'UPCOMING').slice(0, 5));
        } catch (error) {
            console.error('Error loading dashboard:', error);
        }
    }

    // Load tours
    async function loadTours() {
        try {
            const tours = await fetchWithAuth(`${API_BASE}/admin/tours`);
            displayTours(tours);
        } catch (error) {
            console.error('Error loading tours:', error);
        }
    }

    // Load bookings
    async function loadBookings() {
        try {
            const bookings = await fetchWithAuth(`${API_BASE}/admin/bookings`);
            displayBookings(bookings);
        } catch (error) {
            console.error('Error loading bookings:', error);
        }
    }

    // Display tours in table
    function displayTours(tours) {
        const tbody = document.getElementById('toursTableBody');
        tbody.innerHTML = tours.map(tour => `
            <tr>
                <td>
                    <img src="${API_BASE}/images/${tour.tourImages?.[0] || 'default.jpg'}"
                         class="tour-image-preview" alt="">
                </td>
                <td>${tour.tourName}</td>
                <td>${tour.tourDestination}</td>
                <td>₹${tour.tourPrice}</td>
                <td>${tour.tourDays}D/${tour.tourNights}N</td>
                <td><span class="badge bg-${tour.status === 'UPCOMING' ? 'info' : tour.status === 'ONGOING' ? 'success' : 'secondary'}">${tour.status || 'ACTIVE'}</span></td>
                <td>
                    <button class="btn btn-sm btn-primary btn-action" onclick="editTour(${tour.id})">
                        <i class="bi bi-pencil"></i>
                    </button>
                    <button class="btn btn-sm btn-danger btn-action" onclick="deleteTour(${tour.id})">
                        <i class="bi bi-trash"></i>
                    </button>
                </td>
            </tr>
        `).join('');
    }

    // Display bookings in table
    function displayBookings(bookings) {
        const tbody = document.getElementById('bookingsTableBody');
        tbody.innerHTML = bookings.map(booking => `
            <tr>
                <td>#${booking.id}</td>
                <td>${booking.customerName}<br><small>${booking.customerEmail}</small></td>
                <td>${booking.tour?.tourName}</td>
                <td>${booking.numberOfAdults} / ${booking.numberOfChildren}</td>
                <td>₹${booking.totalAmount}</td>
                <td>
                    <select class="form-select form-select-sm" onchange="updateBookingStatus(${booking.id}, this.value)">
                        <option value="CONFIRMED" ${booking.bookingStatus === 'CONFIRMED' ? 'selected' : ''}>Confirmed</option>
                        <option value="PENDING" ${booking.bookingStatus === 'PENDING' ? 'selected' : ''}>Pending</option>
                        <option value="CANCELLED" ${booking.bookingStatus === 'CANCELLED' ? 'selected' : ''}>Cancelled</option>
                        <option value="COMPLETED" ${booking.bookingStatus === 'COMPLETED' ? 'selected' : ''}>Completed</option>
                    </select>
                </td>
                <td>
                    <button class="btn btn-sm btn-danger btn-action" onclick="deleteBooking(${booking.id})">
                        <i class="bi bi-trash"></i>
                    </button>
                </td>
            </tr>
        `).join('');
    }

    // Helper function for authenticated requests
    async function fetchWithAuth(url, options = {}) {
        const response = await fetch(url, {
            ...options,
            headers: {
                ...options.headers,
                'Authorization': `Bearer ${authToken}`
            }
        });

        if (response.status === 401) {
            logout();
            throw new Error('Unauthorized');
        }

        return response.json();
    }

    // Tour CRUD operations
    function openTourModal() {
        document.getElementById('tourModalTitle').textContent = 'Add New Tour';
        document.getElementById('tourForm').reset();
        document.getElementById('tourId').value = '';
        new bootstrap.Modal(document.getElementById('tourModal')).show();
    }

    async function editTour(id) {
        try {
            const tour = await fetchWithAuth(`${API_BASE}/admin/tours/${id}`);
            document.getElementById('tourModalTitle').textContent = 'Edit Tour';
            document.getElementById('tourId').value = tour.id;
            document.getElementById('tourName').value = tour.tourName || '';
            document.getElementById('tourPrice').value = tour.tourPrice || '';
            document.getElementById('tourDestination').value = tour.tourDestination || '';
            document.getElementById('tourLocation').value = tour.tourLocation || '';
            document.getElementById('tourDays').value = tour.tourDays || '';
            document.getElementById('tourNights').value = tour.tourNights || '';
            document.getElementById('tourType').value = tour.tourType || 'ADVENTURE';

            if (tour.tourStartingDate) {
                document.getElementById('tourStartDate').value = tour.tourStartingDate;
            }
            if (tour.tourEndingDate) {
                document.getElementById('tourEndDate').value = tour.tourEndingDate;
            }

            document.getElementById('tourDescription').value = tour.tourDescription || '';
            document.getElementById('tourInclusions').value = tour.tourInclusions?.join(', ') || '';
            document.getElementById('tourExclusions').value = tour.tourExclusions?.join(', ') || '';
            document.getElementById('tourServices').value = tour.tourServices?.join(', ') || '';
            document.getElementById('tourHelpline').value = tour.tourHelplineNumber || '';

            new bootstrap.Modal(document.getElementById('tourModal')).show();
        } catch (error) {
            console.error('Error loading tour details:', error);
            alert('Error loading tour details');
        }
    }

    async function saveTour() {
        const formData = new FormData();

        // Create tour data object
        const tourData = {
            tourName: document.getElementById('tourName').value,
            tourPrice: parseFloat(document.getElementById('tourPrice').value),
            tourDestination: document.getElementById('tourDestination').value,
            tourLocation: document.getElementById('tourLocation').value,
            tourDays: parseInt(document.getElementById('tourDays').value),
            tourNights: parseInt(document.getElementById('tourNights').value),
            tourType: document.getElementById('tourType').value,
            tourStartingDate: document.getElementById('tourStartDate').value,
            tourEndingDate: document.getElementById('tourEndDate').value,
            tourDescription: document.getElementById('tourDescription').value,
            tourInclusions: document.getElementById('tourInclusions').value.split(',').map(s => s.trim()).filter(s => s),
            tourExclusions: document.getElementById('tourExclusions').value.split(',').map(s => s.trim()).filter(s => s),
            tourServices: document.getElementById('tourServices').value.split(',').map(s => s.trim()).filter(s => s),
            tourHelplineNumber: document.getElementById('tourHelpline').value
        };

        // Append tour data as JSON string
        formData.append('tour', JSON.stringify(tourData));

        // Append main image if exists
        const mainImage = document.getElementById('mainImage').files[0];
        if (mainImage) {
            formData.append('mainImage', mainImage);
        }

        // Append additional images
        const additionalImages = document.getElementById('additionalImages').files;
        for (let i = 0; i < additionalImages.length; i++) {
            formData.append('additionalImages', additionalImages[i]);
        }

        const tourId = document.getElementById('tourId').value;
        const url = tourId ? `${API_BASE}/admin/tours/${tourId}` : `${API_BASE}/admin/tours`;
        const method = tourId ? 'PUT' : 'POST';

        try {
            const response = await fetch(url, {
                method: method,
                headers: {
                    'Authorization': `Bearer ${authToken}`
                },
                body: formData
            });

            if (!response.ok) {
                const error = await response.text();
                console.error('Error response:', error);
                throw new Error('Failed to save tour');
            }

            bootstrap.Modal.getInstance(document.getElementById('tourModal')).hide();
            await loadTours();
            alert('Tour saved successfully');
        } catch (error) {
            console.error('Error saving tour:', error);
            alert('Error saving tour: ' + error.message);
        }
    }

    async function deleteTour(id) {
        if (!confirm('Are you sure you want to delete this tour?')) return;

        try {
            await fetchWithAuth(`${API_BASE}/admin/tours/${id}`, { method: 'DELETE' });
            loadTours();
            alert('Tour deleted successfully');
        } catch (error) {
            alert('Error deleting tour');
        }
    }

    async function updateBookingStatus(id, status) {
        try {
            await fetchWithAuth(`${API_BASE}/admin/bookings/${id}/status?status=${status}`, { method: 'PUT' });
            loadBookings();
            alert('Booking status updated');
        } catch (error) {
            alert('Error updating status');
        }
    }

    async function deleteBooking(id) {
        if (!confirm('Are you sure you want to delete this booking?')) return;

        try {
            await fetchWithAuth(`${API_BASE}/admin/bookings/${id}`, { method: 'DELETE' });
            loadBookings();
            alert('Booking deleted');
        } catch (error) {
            alert('Error deleting booking');
        }
    }

    function displayRecentBookings(bookings) {
        const container = document.getElementById('recentBookings');
        if (!bookings.length) {
            container.innerHTML = '<p class="text-muted">No recent bookings</p>';
            return;
        }

        container.innerHTML = bookings.map(b => `
            <div class="d-flex justify-content-between align-items-center mb-2 p-2 border-bottom">
                <div>
                    <strong>${b.customerName}</strong><br>
                    <small>${b.tour?.tourName}</small>
                </div>
                <span class="status-badge status-${b.bookingStatus?.toLowerCase()}">${b.bookingStatus}</span>
            </div>
        `).join('');
    }

    function displayUpcomingTours(tours) {
        const container = document.getElementById('upcomingToursList');
        if (!tours.length) {
            container.innerHTML = '<p class="text-muted">No upcoming tours</p>';
            return;
        }

        container.innerHTML = tours.map(t => `
            <div class="d-flex justify-content-between align-items-center mb-2 p-2 border-bottom">
                <div>
                    <strong>${t.tourName}</strong><br>
                    <small>${t.tourStartingDate}</small>
                </div>
                <span class="badge bg-warning">${t.tourDays} Days</span>
            </div>
        `).join('');
    }

    function logout() {
        localStorage.removeItem('adminToken');
        localStorage.removeItem('adminData');
        location.reload();
    }
</script>

<jsp:include page="includes/footer.jsp" />