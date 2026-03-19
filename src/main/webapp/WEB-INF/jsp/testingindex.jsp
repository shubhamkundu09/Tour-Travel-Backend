<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AnandaHolidays - Discover Your Next Adventure</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body { font-family: 'Segoe UI', sans-serif; }
        .hero {
            background-color: #1a252f;
            background-image: url('https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=1400&auto=format');
            background-size: cover;
            background-position: center;
            position: relative;
            padding: 120px 0;
            color: white;
        }
        .hero::before {
            content: '';
            position: absolute;
            inset: 0;
            background: rgba(0,0,0,0.55);
        }
        .hero .container { position: relative; z-index: 1; }
        .tour-card {
            border: none;
            border-radius: 14px;
            overflow: hidden;
            box-shadow: 0 4px 14px rgba(0,0,0,0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            cursor: pointer;
            height: 100%;
        }
        .tour-card:hover { transform: translateY(-6px); box-shadow: 0 10px 28px rgba(0,0,0,0.18); }
        .tour-card img { height: 200px; object-fit: cover; width: 100%; }
        .price-tag { font-size: 1.4rem; font-weight: 700; color: #e67e22; }
        .status-badge {
            position: absolute;
            top: 10px; right: 10px;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 0.78rem;
            font-weight: 600;
            color: white;
        }
        .filter-box {
            background: white;
            padding: 18px 20px;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.09);
            margin-bottom: 28px;
        }
        .navbar-brand { font-weight: 700; font-size: 1.3rem; }
        .section-title { font-weight: 700; margin-bottom: 24px; }
        .spinner-wrap { text-align: center; padding: 60px 0; }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm sticky-top">
    <div class="container">
        <a class="navbar-brand text-success" href="/">
            <i class="bi bi-tree-fill"></i> AnandaHolidays
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#nav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="nav">
            <ul class="navbar-nav ms-auto align-items-center gap-2">
                <li class="nav-item"><a class="nav-link fw-semibold" href="/">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#tours">Tours</a></li>
                <li class="nav-item">
                    <a class="btn btn-warning btn-sm px-3" href="#" data-bs-toggle="modal" data-bs-target="#bookingModal">
                        Book Now
                    </a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-outline-dark btn-sm px-3" href="/admin">
                        <i class="bi bi-shield-lock"></i> Admin
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero -->
<section class="hero text-center">
    <div class="container">
        <h1 class="display-4 fw-bold mb-3">Discover Your Next Adventure</h1>
        <p class="lead mb-4">Explore amazing destinations with AnandaHolidays</p>
        <a href="#tours" class="btn btn-warning btn-lg px-5 fw-semibold">Explore Tours</a>
    </div>
</section>

<!-- Main -->
<div class="container py-5" id="tours">

    <!-- Filter -->
    <div class="filter-box">
        <div class="row g-2 align-items-end">
            <div class="col-md-3">
                <label class="form-label small fw-semibold">Destination</label>
                <input type="text" class="form-control" id="searchDest" placeholder="Search...">
            </div>
            <div class="col-md-2">
                <label class="form-label small fw-semibold">Min Price</label>
                <input type="number" class="form-control" id="minPrice" placeholder="0">
            </div>
            <div class="col-md-2">
                <label class="form-label small fw-semibold">Max Price</label>
                <input type="number" class="form-control" id="maxPrice" placeholder="Any">
            </div>
            <div class="col-md-2">
                <label class="form-label small fw-semibold">From Date</label>
                <input type="date" class="form-control" id="fromDate">
            </div>
            <div class="col-md-2">
                <label class="form-label small fw-semibold">To Date</label>
                <input type="date" class="form-control" id="toDate">
            </div>
            <div class="col-md-1">
                <button class="btn btn-primary w-100" onclick="applyFilters()">
                    <i class="bi bi-search"></i>
                </button>
            </div>
        </div>
    </div>

    <!-- Tabs -->
    <ul class="nav nav-tabs mb-4" id="tabs">
        <li class="nav-item">
            <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#tabAll">All Tours</button>
        </li>
        <li class="nav-item">
            <button class="nav-link" data-bs-toggle="tab" data-bs-target="#tabUpcoming">Upcoming</button>
        </li>
        <li class="nav-item">
            <button class="nav-link" data-bs-toggle="tab" data-bs-target="#tabOngoing">Ongoing</button>
        </li>
        <li class="nav-item">
            <button class="nav-link" data-bs-toggle="tab" data-bs-target="#tabCompleted">Completed</button>
        </li>
    </ul>

    <div class="tab-content">
        <div class="tab-pane fade show active" id="tabAll">
            <div id="allToursGrid" class="row g-4">
                <div class="spinner-wrap col-12"><div class="spinner-border text-warning"></div><p class="mt-2 text-muted">Loading tours...</p></div>
            </div>
        </div>
        <div class="tab-pane fade" id="tabUpcoming">
            <div id="upcomingGrid" class="row g-4"></div>
        </div>
        <div class="tab-pane fade" id="tabOngoing">
            <div id="ongoingGrid" class="row g-4"></div>
        </div>
        <div class="tab-pane fade" id="tabCompleted">
            <div id="completedGrid" class="row g-4"></div>
        </div>
    </div>
</div>

<!-- Booking Modal -->
<div class="modal fade" id="bookingModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-warning">
                <h5 class="modal-title fw-bold">Book Your Tour</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Select Tour *</label>
                        <select class="form-select" id="bkTour" onchange="calcTotal()">
                            <option value="">-- Choose a tour --</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Full Name *</label>
                        <input type="text" class="form-control" id="bkName">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Email *</label>
                        <input type="email" class="form-control" id="bkEmail">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Phone *</label>
                        <input type="tel" class="form-control" id="bkPhone">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Adults *</label>
                        <input type="number" class="form-control" id="bkAdults" value="1" min="1" onchange="calcTotal()">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Children</label>
                        <input type="number" class="form-control" id="bkChildren" value="0" min="0">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Total Amount</label>
                        <input type="text" class="form-control" id="bkTotal" readonly>
                    </div>
                    <div class="col-12">
                        <label class="form-label">Special Requests</label>
                        <textarea class="form-control" id="bkRequests" rows="2"></textarea>
                    </div>
                </div>
                <div id="bkMsg" class="mt-3"></div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button class="btn btn-warning fw-semibold" onclick="submitBooking()">Confirm Booking</button>
            </div>
        </div>
    </div>
</div>

<!-- Tour Detail Modal -->
<div class="modal fade" id="detailModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="dtName"></h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-5">
                        <img id="dtImg" src="" class="img-fluid rounded" alt="">
                    </div>
                    <div class="col-md-7">
                        <table class="table table-sm table-borderless">
                            <tr><td class="fw-semibold">Destination</td><td id="dtDest"></td></tr>
                            <tr><td class="fw-semibold">Location</td><td id="dtLoc"></td></tr>
                            <tr><td class="fw-semibold">Duration</td><td id="dtDur"></td></tr>
                            <tr><td class="fw-semibold">Dates</td><td id="dtDates"></td></tr>
                            <tr><td class="fw-semibold">Type</td><td id="dtType"></td></tr>
                            <tr><td class="fw-semibold">Status</td><td id="dtStatus"></td></tr>
                            <tr><td class="fw-semibold">Helpline</td><td id="dtHelpline"></td></tr>
                        </table>
                        <h4 class="text-warning fw-bold" id="dtPrice"></h4>
                    </div>
                    <div class="col-12 mt-3">
                        <p id="dtDesc" class="text-muted"></p>
                    </div>
                    <div class="col-md-4">
                        <h6 class="fw-semibold">Inclusions</h6>
                        <ul id="dtInc" class="small ps-3"></ul>
                    </div>
                    <div class="col-md-4">
                        <h6 class="fw-semibold">Exclusions</h6>
                        <ul id="dtExc" class="small ps-3"></ul>
                    </div>
                    <div class="col-md-4">
                        <h6 class="fw-semibold">Services</h6>
                        <ul id="dtSvc" class="small ps-3"></ul>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button class="btn btn-warning fw-semibold" onclick="bookThisTour()">Book This Tour</button>
            </div>
        </div>
    </div>
</div>

<!-- Toast -->
<div class="position-fixed bottom-0 end-0 p-3" style="z-index:9999">
    <div id="toast" class="toast align-items-center text-white border-0" role="alert">
        <div class="d-flex">
            <div class="toast-body fw-semibold" id="toastMsg"></div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
var API = 'http://localhost:8080/api';
var allTours = [];
var selectedTour = null;

function imgUrl(images) {
    if (images && images.length > 0 && images[0]) {
        return API + '/images/' + images[0];
    }
    return 'https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=400&h=250&fit=crop';
}

function statusColor(s) {
    if (s === 'UPCOMING') return 'bg-info';
    if (s === 'ONGOING') return 'bg-success';
    if (s === 'COMPLETED') return 'bg-secondary';
    return 'bg-warning';
}

function renderTours(tours, gridId) {
    var g = document.getElementById(gridId);
    if (!g) return;
    if (!tours || tours.length === 0) {
        g.innerHTML = '<div class="col-12 text-center py-5 text-muted"><i class="bi bi-compass fs-1"></i><p class="mt-2">No tours found</p></div>';
        return;
    }
    var html = '';
    for (var i = 0; i < tours.length; i++) {
        var t = tours[i];
        var sc = statusColor(t.status);
        html += '<div class="col-sm-6 col-lg-4 col-xl-3">';
        html += '<div class="tour-card card" onclick="showDetail(' + t.id + ')">';
        html += '<div class="position-relative">';
        html += '<img src="' + imgUrl(t.tourImages) + '" alt="' + t.tourName + '" onerror="this.src=\'https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=400&h=250&fit=crop\'">';
        html += '<span class="status-badge ' + sc + '">' + (t.status || 'ACTIVE') + '</span>';
        html += '</div>';
        html += '<div class="card-body">';
        html += '<h6 class="card-title fw-bold mb-1">' + t.tourName + '</h6>';
        html += '<p class="text-muted small mb-2"><i class="bi bi-geo-alt-fill text-danger"></i> ' + t.tourDestination + '</p>';
        html += '<p class="text-muted small mb-2"><i class="bi bi-calendar3"></i> ' + t.tourDays + 'D / ' + t.tourNights + 'N</p>';
        html += '<div class="d-flex justify-content-between align-items-center">';
        html += '<span class="price-tag">&#8377;' + t.tourPrice + '</span>';
        html += '<span class="text-muted small">per adult</span>';
        html += '</div></div></div></div>';
    }
    g.innerHTML = html;
}

function showDetail(id) {
    var t = null;
    for (var i = 0; i < allTours.length; i++) {
        if (allTours[i].id === id) { t = allTours[i]; break; }
    }
    if (!t) return;
    selectedTour = t;
    document.getElementById('dtName').textContent = t.tourName;
    document.getElementById('dtImg').src = imgUrl(t.tourImages);
    document.getElementById('dtDest').textContent = t.tourDestination;
    document.getElementById('dtLoc').textContent = t.tourLocation;
    document.getElementById('dtDur').textContent = t.tourDays + ' Days / ' + t.tourNights + ' Nights';
    document.getElementById('dtDates').textContent = t.tourStartingDate + ' to ' + t.tourEndingDate;
    document.getElementById('dtType').textContent = t.tourType;
    document.getElementById('dtStatus').textContent = t.status || '';
    document.getElementById('dtHelpline').textContent = t.tourHelplineNumber || 'N/A';
    document.getElementById('dtPrice').textContent = '\u20B9' + t.tourPrice + ' per adult';
    document.getElementById('dtDesc').textContent = t.tourDescription || 'No description available.';
    var mkList = function(id, arr) {
        var el = document.getElementById(id);
        if (arr && arr.length) {
            el.innerHTML = arr.map(function(x) { return '<li>' + x + '</li>'; }).join('');
        } else {
            el.innerHTML = '<li class="text-muted">None listed</li>';
        }
    };
    mkList('dtInc', t.tourInclusions);
    mkList('dtExc', t.tourExclusions);
    mkList('dtSvc', t.tourServices);
    new bootstrap.Modal(document.getElementById('detailModal')).show();
}

function bookThisTour() {
    bootstrap.Modal.getInstance(document.getElementById('detailModal')).hide();
    setTimeout(function() {
        if (selectedTour) {
            document.getElementById('bkTour').value = selectedTour.id;
            calcTotal();
        }
        new bootstrap.Modal(document.getElementById('bookingModal')).show();
    }, 400);
}

function calcTotal() {
    var sel = document.getElementById('bkTour');
    var adults = parseInt(document.getElementById('bkAdults').value) || 0;
    var opt = sel.options[sel.selectedIndex];
    if (opt && opt.value && adults > 0) {
        var price = parseFloat(opt.getAttribute('data-price')) || 0;
        document.getElementById('bkTotal').value = '\u20B9' + (price * adults).toLocaleString();
    } else {
        document.getElementById('bkTotal').value = '';
    }
}

function populateSelect(tours) {
    var sel = document.getElementById('bkTour');
    sel.innerHTML = '<option value="">-- Choose a tour --</option>';
    tours.forEach(function(t) {
        if (t.status !== 'COMPLETED') {
            var o = document.createElement('option');
            o.value = t.id;
            o.setAttribute('data-price', t.tourPrice);
            o.textContent = t.tourName + ' - \u20B9' + t.tourPrice;
            sel.appendChild(o);
        }
    });
}

async function loadAllTours() {
    try {
        var r = await fetch(API + '/tours');
        var tours = await r.json();
        allTours = tours;
        renderTours(tours, 'allToursGrid');
        populateSelect(tours);
    } catch (e) {
        document.getElementById('allToursGrid').innerHTML = '<div class="col-12 text-center text-danger py-4">Failed to load tours. Please try again.</div>';
    }
}

async function loadByStatus(status, gridId) {
    try {
        var r = await fetch(API + '/tours/' + status);
        var tours = await r.json();
        renderTours(tours, gridId);
    } catch (e) {
        document.getElementById(gridId).innerHTML = '<div class="col-12 text-center text-danger py-4">Failed to load.</div>';
    }
}

async function applyFilters() {
    var params = new URLSearchParams();
    var d = document.getElementById('searchDest').value;
    var mn = document.getElementById('minPrice').value;
    var mx = document.getElementById('maxPrice').value;
    var fd = document.getElementById('fromDate').value;
    var td = document.getElementById('toDate').value;
    if (d) params.append('destination', d);
    if (mn) params.append('minPrice', mn);
    if (mx) params.append('maxPrice', mx);
    if (fd) params.append('startDate', fd);
    if (td) params.append('endDate', td);
    try {
        var r = await fetch(API + '/tours/search?' + params.toString());
        var tours = await r.json();
        allTours = tours;
        renderTours(tours, 'allToursGrid');
    } catch (e) {
        showToast('Filter failed', false);
    }
}

async function submitBooking() {
    var tourId = document.getElementById('bkTour').value;
    var name = document.getElementById('bkName').value.trim();
    var email = document.getElementById('bkEmail').value.trim();
    var phone = document.getElementById('bkPhone').value.trim();
    var adults = document.getElementById('bkAdults').value;
    var msgEl = document.getElementById('bkMsg');

    if (!tourId || !name || !email || !phone || !adults) {
        msgEl.innerHTML = '<div class="alert alert-warning py-2">Please fill all required fields.</div>';
        return;
    }

    var body = {
        tourId: parseInt(tourId),
        customerName: name,
        customerEmail: email,
        customerPhone: phone,
        numberOfAdults: parseInt(adults),
        numberOfChildren: parseInt(document.getElementById('bkChildren').value) || 0,
        specialRequests: document.getElementById('bkRequests').value
    };

    try {
        var r = await fetch(API + '/bookings', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(body)
        });
        if (r.ok) {
            msgEl.innerHTML = '<div class="alert alert-success py-2"><i class="bi bi-check-circle-fill me-2"></i>Booking confirmed! Check your email.</div>';
            setTimeout(function() {
                bootstrap.Modal.getInstance(document.getElementById('bookingModal')).hide();
                msgEl.innerHTML = '';
                document.getElementById('bkName').value = '';
                document.getElementById('bkEmail').value = '';
                document.getElementById('bkPhone').value = '';
                document.getElementById('bkAdults').value = '1';
                document.getElementById('bkChildren').value = '0';
                document.getElementById('bkRequests').value = '';
                document.getElementById('bkTour').value = '';
                document.getElementById('bkTotal').value = '';
            }, 2500);
        } else {
            var err = await r.json();
            msgEl.innerHTML = '<div class="alert alert-danger py-2">' + (err.message || 'Booking failed. Please try again.') + '</div>';
        }
    } catch (e) {
        msgEl.innerHTML = '<div class="alert alert-danger py-2">Network error. Please try again.</div>';
    }
}

function showToast(msg, success) {
    var t = document.getElementById('toast');
    t.className = 'toast align-items-center text-white border-0 ' + (success !== false ? 'bg-success' : 'bg-danger');
    document.getElementById('toastMsg').textContent = msg;
    new bootstrap.Toast(t).show();
}

// Tab handlers
document.addEventListener('DOMContentLoaded', function() {
    loadAllTours();
    document.querySelectorAll('#tabs .nav-link').forEach(function(btn) {
        btn.addEventListener('shown.bs.tab', function(e) {
            var target = e.target.getAttribute('data-bs-target');
            if (target === '#tabUpcoming') loadByStatus('upcoming', 'upcomingGrid');
            if (target === '#tabOngoing') loadByStatus('ongoing', 'ongoingGrid');
            if (target === '#tabCompleted') loadByStatus('completed', 'completedGrid');
        });
    });
    document.getElementById('bkAdults').addEventListener('input', calcTotal);
    document.getElementById('bkTour').addEventListener('change', calcTotal);
});
</script>
</body>
</html>
