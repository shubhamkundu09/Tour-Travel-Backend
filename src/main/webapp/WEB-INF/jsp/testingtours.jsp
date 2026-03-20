<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="true" %>
<!DOCTYPE html>
<html lang="en" data-theme="three">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Ananda Holidays - Tour List</title>

    <!-- CSS first - same pattern as index.jsp -->
    <link rel="stylesheet" crossorigin href="/static/assets/main-DDi0A8kK.css" />

    <!-- JS module - same pattern as index.jsp -->
    <script type="module" crossorigin src="/static/assets/main-C7XYgASq.js"></script>

    <style>
        /* ── Filter Bar ── */
        .tour-filter-bar {
            background: #fff;
            border-bottom: 1px solid #e8e8e8;
            padding: 20px 0;
            position: sticky;
            top: 0;
            z-index: 99;
            box-shadow: 0 2px 12px rgba(0,0,0,.07);
        }
        .filter-inner {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            align-items: flex-end;
        }
        .filter-group {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }
        .filter-group label {
            font-size: 11px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: .06em;
            color: #888;
        }
        .filter-group input,
        .filter-group select {
            border: 1.5px solid #e0e0e0;
            border-radius: 8px;
            padding: 9px 14px;
            font-size: 13px;
            font-family: inherit;
            background: #fafafa;
            color: #222;
            outline: none;
            min-width: 130px;
            transition: border-color .2s;
        }
        .filter-group input:focus,
        .filter-group select:focus { border-color: #c8622a; }
        .filter-btn-group { display: flex; gap: 8px; align-self: flex-end; }
        .btn-filter-search {
            padding: 10px 24px;
            background: #c8622a;
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: opacity .2s;
        }
        .btn-filter-search:hover { opacity: .85; }
        .btn-filter-clear {
            padding: 10px 18px;
            background: transparent;
            color: #888;
            border: 1.5px solid #e0e0e0;
            border-radius: 8px;
            font-size: 13px;
            cursor: pointer;
        }
        .btn-filter-clear:hover { border-color: #aaa; color: #444; }

        /* ── Status Tabs ── */
        .status-tabs {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
            margin-bottom: 28px;
            padding-top: 8px;
        }
        .status-tab {
            padding: 7px 20px;
            border-radius: 999px;
            font-size: 13px;
            font-weight: 500;
            cursor: pointer;
            border: 1.5px solid #e0e0e0;
            background: transparent;
            color: #888;
            transition: all .2s;
        }
        .status-tab.active,
        .status-tab:hover {
            background: #c8622a;
            color: #fff;
            border-color: #c8622a;
        }

        /* ── Tour count ── */
        .tour-count-text {
            font-size: 13px;
            color: #999;
            margin-bottom: 20px;
        }

        /* ── Status badge on card image ── */
        .trip-card { position: relative; overflow: hidden; }
        .tour-status-badge {
            position: absolute;
            top: 12px;
            right: 12px;
            padding: 3px 12px;
            border-radius: 999px;
            font-size: 11px;
            font-weight: 700;
            letter-spacing: .05em;
            text-transform: uppercase;
            z-index: 3;
        }
        .badge-UPCOMING  { background: #fff3e0; color: #e65100; }
        .badge-ONGOING   { background: #e8f5e9; color: #2e7d32; }
        .badge-COMPLETED { background: #f0f0f0; color: #757575; }

        /* ── Card image height ── */
        .trip-card > img {
            width: 100%;
            height: 220px;
            object-fit: cover;
            display: block;
        }

        /* ── Loading / Empty state ── */
        .tours-state-box {
            text-align: center;
            padding: 60px 20px;
            color: #aaa;
            font-size: 15px;
        }
        .spinner-ring {
            width: 42px; height: 42px;
            border: 3px solid #eee;
            border-top-color: #c8622a;
            border-radius: 50%;
            animation: spin .7s linear infinite;
            margin: 0 auto 16px;
        }
        @keyframes spin { to { transform: rotate(360deg); } }

        @media (max-width: 576px) {
            .filter-inner { flex-direction: column; }
            .filter-btn-group { width: 100%; }
            .btn-filter-search, .btn-filter-clear { flex: 1; text-align: center; }
        }
    </style>
</head>
<body>

    <!-- Preloader -->
    <div class="preloader" id="preloader">
        <div class="spinner-grow" role="status">
            <span class="visually-hidden">Loading...</span>
        </div>
    </div>

    <!-- Popup Video Container -->
    <div id="videoPopup" class="video-popup-iframe">
        <div class="video-content">
            <span class="close-btn" id="videoCloseButton"><i class="ti ti-x"></i></span>
            <div class="ratio ratio-16x9">
                <iframe id="videoFrame" allowfullscreen></iframe>
            </div>
        </div>
    </div>

    <jsp:include page="rightsideoffcanvas.jsp" />
    <jsp:include page="header.jsp" />

    <!-- Smooth Wrapper -->
    <div id="smooth-wrapper">
      <div id="smooth-content">

        <!-- Breadcrumb -->
        <div class="breadcrumb-section bg-img jarallax"
             style="background-image: url('/static/assets/97-4pYTyMSj.jpg')">
            <div class="container">
                <div class="breadcrumb-content">
                    <div class="divider"></div>
                    <h2>Tour List</h2>
                    <ul class="list-unstyled">
                        <li><a href="/index">Home</a></li>
                        <li>Tour List</li>
                    </ul>
                </div>
            </div>
            <div class="divider"></div>
        </div>

        <!-- ── Filter Bar ── -->
        <div class="tour-filter-bar">
            <div class="container">
                <div class="filter-inner">
                    <div class="filter-group">
                        <label>Destination</label>
                        <input id="fDest" type="text" placeholder="e.g. Goa, Manali">
                    </div>
                    <div class="filter-group">
                        <label>Min Price (Rs.)</label>
                        <input id="fMin" type="number" placeholder="0" min="0" style="min-width:110px;">
                    </div>
                    <div class="filter-group">
                        <label>Max Price (Rs.)</label>
                        <input id="fMax" type="number" placeholder="Any" min="0" style="min-width:110px;">
                    </div>
                    <div class="filter-group">
                        <label>From Date</label>
                        <input id="fStart" type="date">
                    </div>
                    <div class="filter-group">
                        <label>To Date</label>
                        <input id="fEnd" type="date">
                    </div>
                    <div class="filter-btn-group">
                        <button class="btn-filter-search" onclick="applySearch()">
                            <i class="ti ti-search"></i> Search
                        </button>
                        <button class="btn-filter-clear" onclick="clearFilters()">Clear</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Tour List Section -->
        <section class="tour-list-section">
            <div class="divider"></div>
            <div class="container">

                <!-- Status Tabs -->
                <div class="status-tabs">
                    <button class="status-tab active" onclick="filterStatus('ALL',this)">All Tours</button>
                    <button class="status-tab" onclick="filterStatus('UPCOMING',this)">Upcoming</button>
                    <button class="status-tab" onclick="filterStatus('ONGOING',this)">Ongoing</button>
                    <button class="status-tab" onclick="filterStatus('COMPLETED',this)">Completed</button>
                </div>

                <div class="tour-count-text" id="tourCount"></div>

                <!-- Cards Grid -->
                <div class="row g-4" id="toursGrid">
                    <div class="col-12">
                        <div class="tours-state-box">
                            <div class="spinner-ring"></div>
                            Loading tours...
                        </div>
                    </div>
                </div>

                <div class="divider-sm"></div>
            </div>
            <div class="divider"></div>
        </section>

        <jsp:include page="footer.jsp" />
      </div>
    </div>

    <!-- Scroll To Top -->
    <button id="scrollTopButton" class="touria-scrolltop scrolltop-hide">
        <i class="icon-arrow-up"></i>
    </button>

    <jsp:include page="emailjs.jsp" />

<script>
    var API = '/api/tours';
    var allTours = [];
    var currentStatus = 'ALL';

    function loadTours(url) {
        document.getElementById('toursGrid').innerHTML =
            '<div class="col-12"><div class="tours-state-box"><div class="spinner-ring"></div>Loading tours...</div></div>';
        document.getElementById('tourCount').textContent = '';

        fetch(url)
            .then(function(r) { if (!r.ok) throw new Error('API error'); return r.json(); })
            .then(function(data) { allTours = data; renderFiltered(); })
            .catch(function() {
                document.getElementById('toursGrid').innerHTML =
                    '<div class="col-12"><div class="tours-state-box">Could not load tours. Please try again.</div></div>';
            });
    }

    function renderFiltered() {
        var tours = (currentStatus === 'ALL') ? allTours
            : allTours.filter(function(t) { return t.status === currentStatus; });

        var cnt = document.getElementById('tourCount');
        cnt.textContent = tours.length
            ? (tours.length + ' tour' + (tours.length > 1 ? 's' : '') + ' found')
            : '';

        var grid = document.getElementById('toursGrid');
        if (!tours.length) {
            grid.innerHTML = '<div class="col-12"><div class="tours-state-box">No tours found matching your criteria.</div></div>';
            return;
        }

        var html = '';
        for (var i = 0; i < tours.length; i++) { html += buildCard(tours[i]); }
        grid.innerHTML = html;
    }

    function esc(s) {
        return s ? String(s)
            .replace(/&/g,'&amp;').replace(/</g,'&lt;')
            .replace(/>/g,'&gt;').replace(/"/g,'&quot;') : '';
    }

    function buildCard(t) {
        var imgSrc = (t.tourImages && t.tourImages[0])
            ? ('/uploads/tours/' + esc(t.tourImages[0]))
            : '/static/assets/08-CuDdMt6H.png';

        var badgeCls = 'tour-status-badge badge-' + (t.status || 'UPCOMING');
        var price = 'Rs.' + Number(t.tourPrice).toLocaleString('en-IN') + '/-';
        var days = t.tourDays + ' Days - ' + t.tourNights + ' Nights';

        return '<div class="col-12 col-lg-4">'
            + '<div class="trip-card fadeInUp" data-delay="0.2">'
            + '<span class="' + badgeCls + '">' + esc(t.status) + '</span>'
            + '<img src="' + imgSrc + '" alt="' + esc(t.tourName) + '" '
            + 'onerror="this.src=\'/static/assets/08-CuDdMt6H.png\'">'
            + '<div class="trip-body">'
            + '<h4 class="mb-4 trip-title">' + esc(t.tourName) + '</h4>'
            + '<div class="trip-meta d-flex align-items-center justify-content-between gap-3">'
            + '<ul class="list-unstyled d-flex flex-column gap-2">'
            + '<li><i class="ti ti-map-pin-filled"></i> ' + esc(t.tourDestination) + '</li>'
            + '<li><i class="ti ti-clock"></i> ' + days + '</li>'
            + (t.tourStartingDate ? '<li><i class="ti ti-calendar"></i> ' + t.tourStartingDate + '</li>' : '')
            + '</ul>'
            + '<div class="line"></div>'
            + '<div class="text-end"><h2 class="mb-0 trip-price">' + price + '</h2></div>'
            + '</div>'
            + '<a href="/tour-detail?id=' + t.id + '" class="btn btn-light w-100 mt-3">Book Now</a>'
            + '</div></div></div>';
    }

    function applySearch() {
        var dest  = document.getElementById('fDest').value.trim();
        var min   = document.getElementById('fMin').value;
        var max   = document.getElementById('fMax').value;
        var start = document.getElementById('fStart').value;
        var end   = document.getElementById('fEnd').value;

        if (!dest && !min && !max && !start && !end) { loadTours(API); return; }

        var p = new URLSearchParams();
        if (dest)  p.set('destination', dest);
        if (min)   p.set('minPrice', min);
        if (max)   p.set('maxPrice', max);
        if (start) p.set('startDate', start);
        if (end)   p.set('endDate', end);
        loadTours(API + '/search?' + p.toString());
    }

    function clearFilters() {
        ['fDest','fMin','fMax','fStart','fEnd'].forEach(function(id) {
            document.getElementById(id).value = '';
        });
        loadTours(API);
    }

    function filterStatus(status, btn) {
        currentStatus = status;
        document.querySelectorAll('.status-tab').forEach(function(t) { t.classList.remove('active'); });
        btn.classList.add('active');
        renderFiltered();
    }

    document.addEventListener('keydown', function(e) { if (e.key === 'Enter') applySearch(); });

    loadTours(API);
</script>
</body>
</html>
