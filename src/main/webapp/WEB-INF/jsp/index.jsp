<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<jsp:include page="includes/header.jsp">
    <jsp:param name="title" value="Home" />
</jsp:include>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">
            <i class="bi bi-tree-fill text-success"></i> AnandaHolidays
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#tours">Tours</a></li>
                <li class="nav-item"><a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#bookingModal">Book Now</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin" target="_blank"><i class="bi bi-shield-lock"></i> Admin</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero-section text-center">
    <div class="container">
        <h1 class="display-4 fw-bold mb-4">Discover Your Next Adventure</h1>
        <p class="lead mb-4">Explore amazing destinations with AnandaHolidays</p>
        <a href="#tours" class="btn btn-warning btn-lg px-5">Explore Tours</a>
    </div>
</section>

<!-- Main Content -->
<div class="container mb-5">
    <!-- Filter Section -->
    <div class="filter-section">
        <div class="row g-3">
            <div class="col-md-3">
                <input type="text" class="form-control" id="searchDestination" placeholder="Destination">
            </div>
            <div class="col-md-2">
                <input type="number" class="form-control" id="minPrice" placeholder="Min Price">
            </div>
            <div class="col-md-2">
                <input type="number" class="form-control" id="maxPrice" placeholder="Max Price">
            </div>
            <div class="col-md-2">
                <input type="date" class="form-control" id="startDate">
            </div>
            <div class="col-md-2">
                <input type="date" class="form-control" id="endDate">
            </div>
            <div class="col-md-1">
                <button class="btn btn-primary w-100" onclick="applyFilters()">
                    <i class="bi bi-search"></i>
                </button>
            </div>
        </div>
    </div>

    <!-- Status Tabs -->
    <ul class="nav nav-tabs mb-4" id="tourTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="all-tab" data-bs-toggle="tab" data-bs-target="#all" type="button">All Tours</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="upcoming-tab" data-bs-toggle="tab" data-bs-target="#upcoming" type="button">Upcoming</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="ongoing-tab" data-bs-toggle="tab" data-bs-target="#ongoing" type="button">Ongoing</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="completed-tab" data-bs-toggle="tab" data-bs-target="#completed" type="button">Completed</button>
        </li>
    </ul>

    <!-- Tours Grid -->
    <div class="tab-content">
        <div class="tab-pane fade show active" id="all">
            <div class="row g-4" id="allTours"></div>
        </div>
        <div class="tab-pane fade" id="upcoming">
            <div class="row g-4" id="upcomingTours"></div>
        </div>
        <div class="tab-pane fade" id="ongoing">
            <div class="row g-4" id="ongoingTours"></div>
        </div>
        <div class="tab-pane fade" id="completed">
            <div class="row g-4" id="completedTours"></div>
        </div>
    </div>
</div>

<!-- Booking Modal -->
<div class="modal fade booking-modal" id="bookingModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-warning">
                <h5 class="modal-title">Book Your Tour</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form id="bookingForm">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Select Tour</label>
                            <select class="form-select" id="tourSelect" required>
                                <option value="">Choose a tour...</option>
                            </select>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Your Name</label>
                            <input type="text" class="form-control" id="customerName" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" class="form-control" id="customerEmail" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Phone</label>
                            <input type="tel" class="form-control" id="customerPhone" required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label class="form-label">Adults</label>
                            <input type="number" class="form-control" id="adults" min="1" value="1" required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label class="form-label">Children</label>
                            <input type="number" class="form-control" id="children" min="0" value="0">
                        </div>
                        <div class="col-md-4 mb-3">
                            <label class="form-label">Total Amount</label>
                            <input type="text" class="form-control" id="totalAmount" readonly>
                        </div>
                        <div class="col-12 mb-3">
                            <label class="form-label">Special Requests</label>
                            <textarea class="form-control" id="specialRequests" rows="3"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-warning" onclick="submitBooking()">Confirm Booking</button>
            </div>
        </div>
    </div>
</div>

<!-- Tour Details Modal -->
<div class="modal fade" id="tourDetailModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="detailTourName"></h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-6">
                        <img src="" id="detailTourImage" class="img-fluid rounded mb-3" alt="">
                    </div>
                    <div class="col-md-6">
                        <h6 class="text-muted">Destination: <span id="detailDestination"></span></h6>
                        <h6 class="text-muted">Location: <span id="detailLocation"></span></h6>
                        <h6 class="text-muted">Duration: <span id="detailDuration"></span></h6>
                        <h6 class="text-muted">Type: <span id="detailType"></span></h6>
                        <h6 class="text-muted">Status: <span id="detailStatus"></span></h6>
                        <h3 class="text-warning mt-3"><span id="detailPrice"></span></h3>
                    </div>
                    <div class="col-12 mt-3">
                        <h6>Description:</h6>
                        <p id="detailDescription"></p>
                    </div>
                    <div class="col-12 mt-3">
                        <h6>Inclusions:</h6>
                        <ul id="detailInclusions" class="list-unstyled"></ul>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-warning" onclick="openBookingWithTour()">Book This Tour</button>
            </div>
        </div>
    </div>
</div>

<!-- Toast for notifications -->
<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
    <div id="liveToast" class="toast" role="alert">
        <div class="toast-header bg-success text-white">
            <strong class="me-auto">Success</strong>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="toast"></button>
        </div>
        <div class="toast-body" id="toastMessage"></div>
    </div>
</div>

<script>
    const API_BASE = 'http://localhost:8080/api';
    const CONTEXT_PATH = '${pageContext.request.contextPath}';
    let currentTours = [];
    let selectedTour = null;

    // Load tours on page load
    document.addEventListener('DOMContentLoaded', () => {
        loadAllTours();
        setupEventListeners();
    });

    function setupEventListeners() {
        document.getElementById('adults').addEventListener('input', calculateTotal);
        document.getElementById('tourSelect').addEventListener('change', calculateTotal);
    }

    async function loadAllTours() {
        try {
            const response = await fetch(`${API_BASE}/tours`);
            const tours = await response.json();
            currentTours = tours;
            displayTours(tours, 'allTours');
            populateTourSelect(tours);
        } catch (error) {
            showToast('Error loading tours', 'error');
        }
    }

    async function loadToursByStatus(status, elementId) {
        try {
            const response = await fetch(`${API_BASE}/tours/${status}`);
            const tours = await response.json();
            displayTours(tours, elementId);
        } catch (error) {
            showToast(`Error loading ${status} tours`, 'error');
        }
    }

    function displayTours(tours, containerId) {
        const container = document.getElementById(containerId);
        if (!container) return;

        if (tours.length === 0) {
            container.innerHTML = '<div class="col-12 text-center py-5"><h5>No tours found</h5></div>';
            return;
        }

        container.innerHTML = tours.map(tour => `
            <div class="col-md-4 col-lg-3">
                <div class="card tour-card" onclick='showTourDetail(${JSON.stringify(tour)})'>
                    <div class="position-relative">
                        <img src="${API_BASE}/images/${tour.tourImages?.[0] || 'default-tour.jpg'}"
                             class="card-img-top tour-image" alt="${tour.tourName}">
                        <span class="badge-status bg-${tour.status === 'UPCOMING' ? 'info' : tour.status === 'ONGOING' ? 'success' : 'secondary'} text-white">${tour.status || 'UPCOMING'}</span>
                    </div>
                    <div class="card-body">
                        <h6 class="card-title fw-bold">${tour.tourName}</h6>
                        <p class="card-text text-muted small">
                            <i class="bi bi-geo-alt"></i> ${tour.tourDestination}<br>
                            <span class="badge bg-light text-dark">
                                <i class="bi bi-calendar"></i> ${tour.tourDays}D/${tour.tourNights}N
                            </span>
                        </p>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="price-tag">₹${tour.tourPrice}</span>
                            <span class="text-muted small">per adult</span>
                        </div>
                    </div>
                </div>
            </div>
        `).join('');
    }

    function showTourDetail(tour) {
        selectedTour = tour;
        document.getElementById('detailTourName').textContent = tour.tourName;
        document.getElementById('detailTourImage').src = `${API_BASE}/images/${tour.tourImages?.[0] || 'default-tour.jpg'}`;
        document.getElementById('detailDestination').textContent = tour.tourDestination;
        document.getElementById('detailLocation').textContent = tour.tourLocation;
        document.getElementById('detailDuration').textContent = `${tour.tourDays} Days / ${tour.tourNights} Nights`;
        document.getElementById('detailType').textContent = tour.tourType;
        document.getElementById('detailStatus').textContent = tour.status;
        document.getElementById('detailPrice').textContent = `₹${tour.tourPrice}`;
        document.getElementById('detailDescription').textContent = tour.tourDescription || 'No description available';

        const inclusions = document.getElementById('detailInclusions');
        if (tour.tourInclusions && tour.tourInclusions.length) {
            inclusions.innerHTML = tour.tourInclusions.map(inc =>
                `<li><i class="bi bi-check-circle-fill text-success me-2"></i>${inc}</li>`
            ).join('');
        } else {
            inclusions.innerHTML = '<li>No inclusions listed</li>';
        }

        new bootstrap.Modal(document.getElementById('tourDetailModal')).show();
    }

    function openBookingWithTour() {
        bootstrap.Modal.getInstance(document.getElementById('tourDetailModal')).hide();
        setTimeout(() => {
            document.getElementById('tourSelect').value = selectedTour.id;
            calculateTotal();
            new bootstrap.Modal(document.getElementById('bookingModal')).show();
        }, 500);
    }

    function populateTourSelect(tours) {
        const select = document.getElementById('tourSelect');
        select.innerHTML = '<option value="">Choose a tour...</option>' +
            tours.filter(t => t.status !== 'COMPLETED').map(tour =>
                `<option value="${tour.id}" data-price="${tour.tourPrice}">${tour.tourName} - ₹${tour.tourPrice}</option>`
            ).join('');
    }

    function calculateTotal() {
        const select = document.getElementById('tourSelect');
        const adults = document.getElementById('adults').value;
        const selected = select.options[select.selectedIndex];

        if (selected && selected.value && adults) {
            const price = selected.dataset.price;
            document.getElementById('totalAmount').value = `₹${price * adults}`;
        }
    }

    async function submitBooking() {
        const bookingData = {
            customerName: document.getElementById('customerName').value,
            customerEmail: document.getElementById('customerEmail').value,
            customerPhone: document.getElementById('customerPhone').value,
            numberOfAdults: parseInt(document.getElementById('adults').value),
            numberOfChildren: parseInt(document.getElementById('children').value),
            tourId: parseInt(document.getElementById('tourSelect').value),
            specialRequests: document.getElementById('specialRequests').value
        };

        try {
            const response = await fetch(`${API_BASE}/bookings`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(bookingData)
            });

            if (response.ok) {
                showToast('Booking confirmed! Check your email for details.');
                bootstrap.Modal.getInstance(document.getElementById('bookingModal')).hide();
                document.getElementById('bookingForm').reset();
            } else {
                const error = await response.json();
                showToast('Booking failed: ' + (error.message || 'Unknown error'), 'error');
            }
        } catch (error) {
            showToast('Error submitting booking', 'error');
        }
    }

    async function applyFilters() {
        const params = new URLSearchParams({
            destination: document.getElementById('searchDestination').value,
            minPrice: document.getElementById('minPrice').value,
            maxPrice: document.getElementById('maxPrice').value,
            startDate: document.getElementById('startDate').value,
            endDate: document.getElementById('endDate').value
        });

        try {
            const response = await fetch(`${API_BASE}/tours/search?${params}`);
            const tours = await response.json();
            displayTours(tours, 'allTours');
        } catch (error) {
            showToast('Error applying filters', 'error');
        }
    }

    // Tab change handlers
    document.querySelectorAll('[data-bs-toggle="tab"]').forEach(tab => {
        tab.addEventListener('shown.bs.tab', (e) => {
            const target = e.target.getAttribute('data-bs-target');
            if (target === '#upcoming') loadToursByStatus('upcoming', 'upcomingTours');
            if (target === '#ongoing') loadToursByStatus('ongoing', 'ongoingTours');
            if (target === '#completed') loadToursByStatus('completed', 'completedTours');
        });
    });

    function showToast(message, type = 'success') {
        const toastEl = document.getElementById('liveToast');
        const toastBody = document.getElementById('toastMessage');
        const toastHeader = toastEl.querySelector('.toast-header');

        toastHeader.className = `toast-header bg-${type === 'success' ? 'success' : 'danger'} text-white`;
        toastBody.textContent = message;

        const toast = new bootstrap.Toast(toastEl);
        toast.show();
    }
</script>

<jsp:include page="includes/footer.jsp" />