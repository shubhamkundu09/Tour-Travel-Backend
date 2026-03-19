<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - AnandaHolidays</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        :root { --sidebar: 240px; --dark: #1e2a38; --accent: #e67e22; }
        body { background: #f0f2f5; }
        #sidebar {
            width: var(--sidebar);
            min-height: 100vh;
            background: var(--dark);
            color: white;
            position: fixed;
            top: 0; left: 0;
            transition: transform 0.3s;
            z-index: 200;
        }
        #sidebar.collapsed { transform: translateX(calc(-1 * var(--sidebar))); }
        #main { margin-left: var(--sidebar); transition: margin 0.3s; }
        #main.expanded { margin-left: 0; }
        .sidebar-brand { padding: 22px 20px; border-bottom: 1px solid rgba(255,255,255,0.1); }
        .sidebar-link {
            display: flex; align-items: center; gap: 10px;
            padding: 12px 20px;
            color: rgba(255,255,255,0.75);
            text-decoration: none;
            transition: all 0.2s;
            border-left: 3px solid transparent;
        }
        .sidebar-link:hover, .sidebar-link.active {
            color: white;
            background: rgba(255,255,255,0.07);
            border-left-color: var(--accent);
        }
        .topbar {
            background: white;
            padding: 12px 20px;
            box-shadow: 0 1px 4px rgba(0,0,0,0.08);
            display: flex;
            align-items: center;
            gap: 14px;
        }
        .stat-card { border: none; border-radius: 12px; box-shadow: 0 2px 10px rgba(0,0,0,0.07); }
        .stat-icon { width: 48px; height: 48px; border-radius: 10px; display: flex; align-items: center; justify-content: center; font-size: 1.4rem; }
        .content-card { background: white; border-radius: 12px; padding: 20px; box-shadow: 0 2px 8px rgba(0,0,0,0.06); }
        .tour-thumb { width: 52px; height: 44px; object-fit: cover; border-radius: 6px; }
        /* Login */
        #loginWrap { display: flex; align-items: center; justify-content: center; min-height: 100vh; background: var(--dark); }
        .login-box { background: white; border-radius: 16px; padding: 36px 32px; width: 100%; max-width: 380px; box-shadow: 0 8px 32px rgba(0,0,0,0.3); }
    </style>
</head>
<body>

<!-- LOGIN -->
<div id="loginWrap">
    <div class="login-box">
        <div class="text-center mb-4">
            <i class="bi bi-shield-lock-fill text-warning fs-1"></i>
            <h4 class="mt-2 fw-bold">Admin Login</h4>
            <p class="text-muted small">AnandaHolidays Management</p>
        </div>
        <div id="loginErr" class="alert alert-danger d-none py-2 small"></div>
        <div class="mb-3">
            <label class="form-label fw-semibold">Username</label>
            <input type="text" class="form-control" id="uname" value="admin">
        </div>
        <div class="mb-4">
            <label class="form-label fw-semibold">Password</label>
            <input type="password" class="form-control" id="upass" value="admin123">
        </div>
        <button class="btn btn-warning w-100 fw-bold" onclick="doLogin()">
            <i class="bi bi-box-arrow-in-right me-2"></i>Login
        </button>
    </div>
</div>

<!-- DASHBOARD -->
<div id="dashWrap" style="display:none">

    <!-- Sidebar -->
    <div id="sidebar">
        <div class="sidebar-brand">
            <div class="fw-bold fs-5"><i class="bi bi-tree-fill text-warning me-2"></i>AnandaHolidays</div>
            <div class="small text-white-50">Admin Panel</div>
        </div>
        <nav class="mt-2">
            <a href="#" class="sidebar-link active" id="navDash" onclick="showSection('dash',this)">
                <i class="bi bi-speedometer2"></i> Dashboard
            </a>
            <a href="#" class="sidebar-link" id="navTours" onclick="showSection('tours',this)">
                <i class="bi bi-briefcase"></i> Tours
            </a>
            <a href="#" class="sidebar-link" id="navBookings" onclick="showSection('bookings',this)">
                <i class="bi bi-calendar-check"></i> Bookings
            </a>
            <a href="#" class="sidebar-link mt-4" onclick="doLogout()">
                <i class="bi bi-box-arrow-right"></i> Logout
            </a>
        </nav>
    </div>

    <!-- Main -->
    <div id="main">
        <div class="topbar">
            <button class="btn btn-sm btn-outline-secondary" onclick="toggleSidebar()">
                <i class="bi bi-list fs-5"></i>
            </button>
            <span class="fw-semibold" id="adminGreet"></span>
            <span class="ms-auto badge bg-warning text-dark" id="sectionLabel">Dashboard</span>
        </div>

        <div class="p-4">

            <!-- DASHBOARD SECTION -->
            <div id="secDash">
                <h5 class="fw-bold mb-4">Dashboard Overview</h5>
                <div class="row g-3 mb-4">
                    <div class="col-6 col-lg-3">
                        <div class="stat-card card p-3">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <div class="text-muted small">Total Tours</div>
                                    <div class="fs-3 fw-bold" id="stTotal">0</div>
                                </div>
                                <div class="stat-icon bg-primary bg-opacity-10 text-primary"><i class="bi bi-briefcase"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3">
                        <div class="stat-card card p-3">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <div class="text-muted small">Upcoming</div>
                                    <div class="fs-3 fw-bold" id="stUpcoming">0</div>
                                </div>
                                <div class="stat-icon bg-info bg-opacity-10 text-info"><i class="bi bi-calendar-event"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3">
                        <div class="stat-card card p-3">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <div class="text-muted small">Bookings</div>
                                    <div class="fs-3 fw-bold" id="stBookings">0</div>
                                </div>
                                <div class="stat-icon bg-warning bg-opacity-10 text-warning"><i class="bi bi-calendar-check"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3">
                        <div class="stat-card card p-3">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <div class="text-muted small">Revenue</div>
                                    <div class="fs-3 fw-bold" id="stRevenue">&#8377;0</div>
                                </div>
                                <div class="stat-icon bg-success bg-opacity-10 text-success"><i class="bi bi-currency-rupee"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row g-3">
                    <div class="col-md-6">
                        <div class="content-card">
                            <h6 class="fw-bold mb-3">Recent Bookings</h6>
                            <div id="recentBk"></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="content-card">
                            <h6 class="fw-bold mb-3">Upcoming Tours</h6>
                            <div id="upcomingTr"></div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- TOURS SECTION -->
            <div id="secTours" style="display:none">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h5 class="fw-bold mb-0">Manage Tours</h5>
                    <button class="btn btn-warning fw-semibold" onclick="openTourModal()">
                        <i class="bi bi-plus-circle me-1"></i>Add Tour
                    </button>
                </div>
                <!-- Tour filter tabs -->
                <ul class="nav nav-tabs mb-3">
                    <li class="nav-item"><button class="nav-link active" onclick="filterTours('ALL',this)">All</button></li>
                    <li class="nav-item"><button class="nav-link" onclick="filterTours('UPCOMING',this)">Upcoming</button></li>
                    <li class="nav-item"><button class="nav-link" onclick="filterTours('ONGOING',this)">Ongoing</button></li>
                    <li class="nav-item"><button class="nav-link" onclick="filterTours('COMPLETED',this)">Completed</button></li>
                </ul>
                <div class="content-card">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th>Image</th><th>Name</th><th>Destination</th>
                                    <th>Price</th><th>Duration</th><th>Dates</th>
                                    <th>Status</th><th>Actions</th>
                                </tr>
                            </thead>
                            <tbody id="toursTbody"></tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- BOOKINGS SECTION -->
            <div id="secBookings" style="display:none">
                <h5 class="fw-bold mb-3">Manage Bookings</h5>
                <div class="content-card">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th>#</th><th>Customer</th><th>Tour</th>
                                    <th>Pax</th><th>Amount</th><th>Date</th>
                                    <th>Status</th><th>Action</th>
                                </tr>
                            </thead>
                            <tbody id="bookingsTbody"></tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div><!-- /p-4 -->
    </div><!-- /main -->
</div><!-- /dashWrap -->

<!-- Tour Modal -->
<div class="modal fade" id="tourModal" tabindex="-1" data-bs-backdrop="static">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header bg-warning">
                <h5 class="modal-title fw-bold" id="tourModalTitle">Add Tour</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <input type="hidden" id="tId">
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Tour Name *</label>
                        <input type="text" class="form-control" id="tName">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Price (&#8377;) *</label>
                        <input type="number" class="form-control" id="tPrice" min="0">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Destination *</label>
                        <input type="text" class="form-control" id="tDest">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Location *</label>
                        <input type="text" class="form-control" id="tLoc">
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Days *</label>
                        <input type="number" class="form-control" id="tDays" min="1">
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Nights *</label>
                        <input type="number" class="form-control" id="tNights" min="0">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Type *</label>
                        <select class="form-select" id="tType">
                            <option value="ADVENTURE">Adventure</option>
                            <option value="BEACH">Beach</option>
                            <option value="HILL_STATION">Hill Station</option>
                            <option value="HERITAGE">Heritage</option>
                            <option value="FAMILY">Family</option>
                            <option value="HONEYMOON">Honeymoon</option>
                            <option value="RELIGIOUS">Religious</option>
                            <option value="WILDLIFE">Wildlife</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Start Date *</label>
                        <input type="date" class="form-control" id="tStart">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">End Date *</label>
                        <input type="date" class="form-control" id="tEnd">
                    </div>
                    <div class="col-12">
                        <label class="form-label">Description</label>
                        <textarea class="form-control" id="tDesc" rows="3"></textarea>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Inclusions <small class="text-muted">(comma separated)</small></label>
                        <input type="text" class="form-control" id="tInc" placeholder="Hotel, Meals, Guide">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Exclusions <small class="text-muted">(comma separated)</small></label>
                        <input type="text" class="form-control" id="tExc" placeholder="Flights, Insurance">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Services <small class="text-muted">(comma separated)</small></label>
                        <input type="text" class="form-control" id="tSvc" placeholder="WiFi, Parking">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Helpline Number</label>
                        <input type="text" class="form-control" id="tHelp">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Map Embed URL</label>
                        <input type="text" class="form-control" id="tMap">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Main Image</label>
                        <input type="file" class="form-control" id="tMainImg" accept="image/*">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Additional Images</label>
                        <input type="file" class="form-control" id="tExtraImgs" accept="image/*" multiple>
                    </div>
                    <div class="col-12" id="currentImgsWrap" style="display:none">
                        <label class="form-label">Current Images</label>
                        <div id="currentImgs" class="d-flex flex-wrap gap-2"></div>
                    </div>
                </div>
                <div id="tErr" class="mt-3"></div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button class="btn btn-warning fw-semibold" id="saveTourBtn" onclick="saveTour()">
                    <i class="bi bi-save me-1"></i>Save Tour
                </button>
            </div>
        </div>
    </div>
</div>

<!-- Toast -->
<div class="position-fixed bottom-0 end-0 p-3" style="z-index:9999">
    <div id="adToast" class="toast align-items-center text-white border-0">
        <div class="d-flex">
            <div class="toast-body fw-semibold" id="adToastMsg"></div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
var API = 'http://localhost:8080/api';
var token = localStorage.getItem('ah_token');
var adminData = null;
try { adminData = JSON.parse(localStorage.getItem('ah_admin') || 'null'); } catch(e) {}
var allToursAdmin = [];
var currentFilter = 'ALL';

function toast(msg, ok) {
    var t = document.getElementById('adToast');
    t.className = 'toast align-items-center text-white border-0 ' + (ok !== false ? 'bg-success' : 'bg-danger');
    document.getElementById('adToastMsg').textContent = msg;
    new bootstrap.Toast(t).show();
}

function toggleSidebar() {
    document.getElementById('sidebar').classList.toggle('collapsed');
    document.getElementById('main').classList.toggle('expanded');
}

function showSection(name, el) {
    if (el) {
        document.querySelectorAll('.sidebar-link').forEach(function(a) { a.classList.remove('active'); });
        el.classList.add('active');
    }
    document.getElementById('secDash').style.display = name === 'dash' ? '' : 'none';
    document.getElementById('secTours').style.display = name === 'tours' ? '' : 'none';
    document.getElementById('secBookings').style.display = name === 'bookings' ? '' : 'none';
    var labels = { dash: 'Dashboard', tours: 'Tours', bookings: 'Bookings' };
    document.getElementById('sectionLabel').textContent = labels[name] || '';
    if (name === 'tours') loadAdminTours();
    if (name === 'bookings') loadAdminBookings();
}

// Check auth on load
if (token && adminData) {
    document.getElementById('loginWrap').style.display = 'none';
    document.getElementById('dashWrap').style.display = '';
    document.getElementById('adminGreet').textContent = 'Welcome, ' + adminData.username;
    loadDashboard();
}

async function doLogin() {
    var u = document.getElementById('uname').value;
    var p = document.getElementById('upass').value;
    var errEl = document.getElementById('loginErr');
    errEl.classList.add('d-none');
    try {
        var r = await fetch(API + '/auth/login', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ username: u, password: p })
        });
        if (r.ok) {
            var d = await r.json();
            token = d.token;
            adminData = d;
            localStorage.setItem('ah_token', token);
            localStorage.setItem('ah_admin', JSON.stringify(d));
            document.getElementById('loginWrap').style.display = 'none';
            document.getElementById('dashWrap').style.display = '';
            document.getElementById('adminGreet').textContent = 'Welcome, ' + d.username;
            loadDashboard();
        } else {
            errEl.textContent = 'Invalid username or password.';
            errEl.classList.remove('d-none');
        }
    } catch (e) {
        errEl.textContent = 'Cannot connect to server.';
        errEl.classList.remove('d-none');
    }
}

function doLogout() {
    localStorage.removeItem('ah_token');
    localStorage.removeItem('ah_admin');
    location.reload();
}

async function authFetch(url, opts) {
    opts = opts || {};
    opts.headers = opts.headers || {};
    opts.headers['Authorization'] = 'Bearer ' + token;
    var r = await fetch(url, opts);
    if (r.status === 401) { doLogout(); throw new Error('Unauthorized'); }
    return r;
}

async function loadDashboard() {
    try {
        var tr = await (await authFetch(API + '/admin/tours')).json();
        var bk = await (await authFetch(API + '/admin/bookings')).json();
        document.getElementById('stTotal').textContent = tr.length;
        document.getElementById('stUpcoming').textContent = tr.filter(function(t) { return t.status === 'UPCOMING'; }).length;
        document.getElementById('stBookings').textContent = bk.length;
        var rev = bk.reduce(function(s, b) { return s + (b.totalAmount || 0); }, 0);
        document.getElementById('stRevenue').innerHTML = '&#8377;' + rev.toLocaleString();
        // Recent bookings
        var rbHtml = '';
        bk.slice(0, 5).forEach(function(b) {
            var sc = b.bookingStatus === 'CONFIRMED' ? 'success' : b.bookingStatus === 'CANCELLED' ? 'danger' : 'warning';
            rbHtml += '<div class="d-flex justify-content-between align-items-center py-2 border-bottom">';
            rbHtml += '<div><div class="fw-semibold small">' + b.customerName + '</div>';
            rbHtml += '<div class="text-muted" style="font-size:0.78rem">' + (b.tour ? b.tour.tourName : '') + '</div></div>';
            rbHtml += '<span class="badge bg-' + sc + '">' + b.bookingStatus + '</span></div>';
        });
        document.getElementById('recentBk').innerHTML = rbHtml || '<p class="text-muted small">No bookings yet.</p>';
        // Upcoming tours
        var utHtml = '';
        tr.filter(function(t) { return t.status === 'UPCOMING'; }).slice(0, 5).forEach(function(t) {
            utHtml += '<div class="d-flex justify-content-between align-items-center py-2 border-bottom">';
            utHtml += '<div><div class="fw-semibold small">' + t.tourName + '</div>';
            utHtml += '<div class="text-muted" style="font-size:0.78rem">' + t.tourStartingDate + '</div></div>';
            utHtml += '<span class="badge bg-warning text-dark">' + t.tourDays + 'D</span></div>';
        });
        document.getElementById('upcomingTr').innerHTML = utHtml || '<p class="text-muted small">No upcoming tours.</p>';
    } catch (e) { console.error(e); }
}

function imgThumb(images) {
    if (images && images.length > 0 && images[0]) return API + '/images/' + images[0];
    return 'https://via.placeholder.com/52x44';
}

async function loadAdminTours() {
    try {
        var r = await authFetch(API + '/admin/tours');
        allToursAdmin = await r.json();
        renderToursTable(allToursAdmin, currentFilter);
    } catch (e) { console.error(e); }
}

function filterTours(f, btn) {
    currentFilter = f;
    document.querySelectorAll('#secTours .nav-link').forEach(function(b) { b.classList.remove('active'); });
    btn.classList.add('active');
    renderToursTable(allToursAdmin, f);
}

function renderToursTable(tours, filter) {
    var list = filter === 'ALL' ? tours : tours.filter(function(t) { return t.status === filter; });
    var tb = document.getElementById('toursTbody');
    if (!list.length) {
        tb.innerHTML = '<tr><td colspan="8" class="text-center text-muted py-4">No tours found</td></tr>';
        return;
    }
    var html = '';
    list.forEach(function(t) {
        var sc = t.status === 'UPCOMING' ? 'info' : t.status === 'ONGOING' ? 'success' : 'secondary';
        html += '<tr>';
        html += '<td><img src="' + imgThumb(t.tourImages) + '" class="tour-thumb" alt="" onerror="this.src=\'https://via.placeholder.com/52x44\'"></td>';
        html += '<td class="fw-semibold">' + t.tourName + '</td>';
        html += '<td>' + t.tourDestination + '</td>';
        html += '<td>&#8377;' + t.tourPrice + '</td>';
        html += '<td>' + t.tourDays + 'D/' + t.tourNights + 'N</td>';
        html += '<td class="small">' + t.tourStartingDate + '<br>' + t.tourEndingDate + '</td>';
        html += '<td><span class="badge bg-' + sc + '">' + (t.status || 'N/A') + '</span></td>';
        html += '<td>';
        html += '<button class="btn btn-sm btn-outline-primary me-1" onclick="editTour(' + t.id + ')"><i class="bi bi-pencil"></i></button>';
        html += '<button class="btn btn-sm btn-outline-danger" onclick="deleteTour(' + t.id + ')"><i class="bi bi-trash"></i></button>';
        html += '</td></tr>';
    });
    tb.innerHTML = html;
}

async function loadAdminBookings() {
    try {
        var r = await authFetch(API + '/admin/bookings');
        var bk = await r.json();
        var tb = document.getElementById('bookingsTbody');
        if (!bk.length) {
            tb.innerHTML = '<tr><td colspan="8" class="text-center text-muted py-4">No bookings found</td></tr>';
            return;
        }
        var html = '';
        bk.forEach(function(b) {
            var sc = b.bookingStatus === 'CONFIRMED' ? 'success' : b.bookingStatus === 'CANCELLED' ? 'danger' : b.bookingStatus === 'COMPLETED' ? 'secondary' : 'warning';
            html += '<tr>';
            html += '<td>#' + b.id + '</td>';
            html += '<td><div class="fw-semibold small">' + b.customerName + '</div><div class="text-muted" style="font-size:0.78rem">' + b.customerEmail + '</div><div class="text-muted" style="font-size:0.78rem">' + b.customerPhone + '</div></td>';
            html += '<td class="small">' + (b.tour ? b.tour.tourName : 'N/A') + '</td>';
            html += '<td>' + b.numberOfAdults + 'A/' + b.numberOfChildren + 'C</td>';
            html += '<td>&#8377;' + b.totalAmount + '</td>';
            html += '<td class="small">' + (b.bookingDate ? b.bookingDate.substring(0,10) : '') + '</td>';
            html += '<td>';
            html += '<select class="form-select form-select-sm" onchange="updateStatus(' + b.id + ',this.value)">';
            html += '<option value="CONFIRMED"' + (b.bookingStatus === 'CONFIRMED' ? ' selected' : '') + '>Confirmed</option>';
            html += '<option value="PENDING"' + (b.bookingStatus === 'PENDING' ? ' selected' : '') + '>Pending</option>';
            html += '<option value="CANCELLED"' + (b.bookingStatus === 'CANCELLED' ? ' selected' : '') + '>Cancelled</option>';
            html += '<option value="COMPLETED"' + (b.bookingStatus === 'COMPLETED' ? ' selected' : '') + '>Completed</option>';
            html += '</select></td>';
            html += '<td><button class="btn btn-sm btn-outline-danger" onclick="deleteBooking(' + b.id + ')"><i class="bi bi-trash"></i></button></td>';
            html += '</tr>';
        });
        tb.innerHTML = html;
    } catch (e) { console.error(e); }
}

function openTourModal() {
    document.getElementById('tourModalTitle').textContent = 'Add New Tour';
    ['tId','tName','tPrice','tDest','tLoc','tDays','tNights','tDesc','tInc','tExc','tSvc','tHelp','tMap'].forEach(function(id) {
        document.getElementById(id).value = '';
    });
    document.getElementById('tType').value = 'ADVENTURE';
    document.getElementById('tMainImg').value = '';
    document.getElementById('tExtraImgs').value = '';
    document.getElementById('currentImgsWrap').style.display = 'none';
    document.getElementById('tErr').innerHTML = '';
    new bootstrap.Modal(document.getElementById('tourModal')).show();
}

async function editTour(id) {
    try {
        var r = await authFetch(API + '/admin/tours/' + id);
        var t = await r.json();
        document.getElementById('tourModalTitle').textContent = 'Edit Tour';
        document.getElementById('tId').value = t.id;
        document.getElementById('tName').value = t.tourName || '';
        document.getElementById('tPrice').value = t.tourPrice || '';
        document.getElementById('tDest').value = t.tourDestination || '';
        document.getElementById('tLoc').value = t.tourLocation || '';
        document.getElementById('tDays').value = t.tourDays || '';
        document.getElementById('tNights').value = t.tourNights || '';
        document.getElementById('tType').value = t.tourType || 'ADVENTURE';
        document.getElementById('tStart').value = t.tourStartingDate || '';
        document.getElementById('tEnd').value = t.tourEndingDate || '';
        document.getElementById('tDesc').value = t.tourDescription || '';
        document.getElementById('tInc').value = t.tourInclusions ? t.tourInclusions.join(', ') : '';
        document.getElementById('tExc').value = t.tourExclusions ? t.tourExclusions.join(', ') : '';
        document.getElementById('tSvc').value = t.tourServices ? t.tourServices.join(', ') : '';
        document.getElementById('tHelp').value = t.tourHelplineNumber || '';
        document.getElementById('tMap').value = t.tourMapEmbedUrl || '';
        document.getElementById('tMainImg').value = '';
        document.getElementById('tExtraImgs').value = '';
        document.getElementById('tErr').innerHTML = '';
        if (t.tourImages && t.tourImages.length) {
            var iHtml = t.tourImages.map(function(img) {
                return '<img src="' + API + '/images/' + img + '" style="width:60px;height:48px;object-fit:cover;border-radius:6px" onerror="this.style.display=\'none\'">';
            }).join('');
            document.getElementById('currentImgs').innerHTML = iHtml;
            document.getElementById('currentImgsWrap').style.display = '';
        } else {
            document.getElementById('currentImgsWrap').style.display = 'none';
        }
        new bootstrap.Modal(document.getElementById('tourModal')).show();
    } catch (e) { toast('Error loading tour', false); }
}

async function saveTour() {
    var name = document.getElementById('tName').value.trim();
    var price = document.getElementById('tPrice').value;
    var dest = document.getElementById('tDest').value.trim();
    var loc = document.getElementById('tLoc').value.trim();
    var days = document.getElementById('tDays').value;
    var nights = document.getElementById('tNights').value;
    var start = document.getElementById('tStart').value;
    var end = document.getElementById('tEnd').value;
    var errEl = document.getElementById('tErr');

    if (!name || !price || !dest || !loc || !days || !nights || !start || !end) {
        errEl.innerHTML = '<div class="alert alert-warning py-2">Please fill all required fields (*).</div>';
        return;
    }

    var btn = document.getElementById('saveTourBtn');
    btn.disabled = true;
    btn.innerHTML = '<span class="spinner-border spinner-border-sm me-1"></span>Saving...';

    var fd = new FormData();
    var split = function(s) { return s ? s.split(',').map(function(x) { return x.trim(); }).filter(function(x) { return x; }) : []; };
    var data = {
        tourName: name,
        tourPrice: parseFloat(price),
        tourDestination: dest,
        tourLocation: loc,
        tourDays: parseInt(days),
        tourNights: parseInt(nights),
        tourType: document.getElementById('tType').value,
        tourStartingDate: start,
        tourEndingDate: end,
        tourDescription: document.getElementById('tDesc').value,
        tourInclusions: split(document.getElementById('tInc').value),
        tourExclusions: split(document.getElementById('tExc').value),
        tourServices: split(document.getElementById('tSvc').value),
        tourHelplineNumber: document.getElementById('tHelp').value,
        tourMapEmbedUrl: document.getElementById('tMap').value
    };
    fd.append('tour', JSON.stringify(data));
    var mi = document.getElementById('tMainImg').files[0];
    if (mi) fd.append('mainImage', mi);
    var ei = document.getElementById('tExtraImgs').files;
    for (var i = 0; i < ei.length; i++) fd.append('additionalImages', ei[i]);

    var tid = document.getElementById('tId').value;
    var url = tid ? API + '/admin/tours/' + tid : API + '/admin/tours';
    var method = tid ? 'PUT' : 'POST';

    try {
        var r = await authFetch(url, { method: method, body: fd });
        if (r.ok) {
            bootstrap.Modal.getInstance(document.getElementById('tourModal')).hide();
            await loadAdminTours();
            toast('Tour saved successfully!', true);
        } else {
            var txt = await r.text();
            errEl.innerHTML = '<div class="alert alert-danger py-2 small">' + txt + '</div>';
        }
    } catch (e) {
        errEl.innerHTML = '<div class="alert alert-danger py-2 small">Network error. Please try again.</div>';
    } finally {
        btn.disabled = false;
        btn.innerHTML = '<i class="bi bi-save me-1"></i>Save Tour';
    }
}

async function deleteTour(id) {
    if (!confirm('Delete this tour? This cannot be undone.')) return;
    try {
        var r = await authFetch(API + '/admin/tours/' + id, { method: 'DELETE' });
        if (r.ok || r.status === 204) { await loadAdminTours(); toast('Tour deleted', true); }
        else toast('Delete failed', false);
    } catch (e) { toast('Error deleting tour', false); }
}

async function updateStatus(id, status) {
    try {
        await authFetch(API + '/admin/bookings/' + id + '/status?status=' + status, { method: 'PUT' });
        toast('Status updated to ' + status, true);
    } catch (e) { toast('Update failed', false); }
}

async function deleteBooking(id) {
    if (!confirm('Delete this booking?')) return;
    try {
        var r = await authFetch(API + '/admin/bookings/' + id, { method: 'DELETE' });
        if (r.ok || r.status === 204) { await loadAdminBookings(); toast('Booking deleted', true); }
        else toast('Delete failed', false);
    } catch (e) { toast('Error', false); }
}
</script>
</body>
</html>
