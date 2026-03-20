<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" data-theme="three">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Destinations - Ananda Holidays</title>

    <link rel="stylesheet" crossorigin href="/static/assets/main-DDi0A8kK.css" />
    <script type="module" crossorigin src="/static/assets/main-C7XYgASq.js"></script>

    <style>
        .featured-destination-card { position: relative; overflow: hidden; border-radius: 12px; }
        .featured-destination-card img {
            width: 100%; height: 280px; object-fit: cover; display: block;
            transition: transform .45s ease;
        }
        .featured-destination-card:hover img { transform: scale(1.06); }
        .featured-destination-card .overlay-content {
            position: absolute; bottom: 0; left: 0; right: 0;
            padding: 20px 20px 16px;
            background: linear-gradient(to top, rgba(0,0,0,.7) 0%, rgba(0,0,0,0) 100%);
        }

        /* ── Search / Filter bar ── */
        .dest-search-bar {
            background: #fff;
            border-radius: 12px;
            border: 1px solid #e8e0d6;
            padding: 18px 22px;
            margin-bottom: 32px;
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            align-items: center;
        }
        .dest-search-bar input {
            flex: 1;
            min-width: 180px;
            border: 1.5px solid #e0d9ce;
            border-radius: 8px;
            padding: 9px 14px;
            font-size: 13px;
            font-family: inherit;
            outline: none;
            background: #fafafa;
        }
        .dest-search-bar input:focus { border-color: #c8622a; }
        .dest-search-bar button {
            padding: 9px 22px;
            background: #c8622a;
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
        }
        .dest-search-bar button:hover { opacity: .85; }
        #dest-clear-btn {
            background: transparent;
            color: #888;
            border: 1.5px solid #e0d9ce;
        }
        #dest-clear-btn:hover { opacity: 1; border-color: #aaa; color: #444; }

        /* ── Region tabs ── */
        .region-tabs {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            margin-bottom: 28px;
        }
        .region-tab {
            padding: 7px 18px;
            border-radius: 999px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            border: 1.5px solid #e0d9ce;
            background: #fff;
            color: #888;
            transition: all .2s;
        }
        .region-tab:hover { border-color: #c8622a; color: #c8622a; }
        .region-tab.active { background: #c8622a; color: #fff; border-color: #c8622a; }

        /* ── Count ── */
        #dest-count { font-size: 13px; color: #999; margin-bottom: 18px; }

        /* ── Empty state ── */
        #dest-empty {
            display: none;
            text-align: center;
            padding: 60px 20px;
            color: #aaa;
            background: #fff;
            border-radius: 12px;
            border: 1px dashed #ddd;
            margin-top: 8px;
        }
    </style>
</head>
<body>

<div class="preloader" id="preloader">
    <div class="spinner-grow" role="status">
        <span class="visually-hidden">Loading...</span>
    </div>
</div>

<div id="videoPopup" class="video-popup-iframe">
    <div class="video-content">
        <span class="close-btn" id="videoCloseButton"><i class="ti ti-x"></i></span>
        <div class="ratio ratio-16x9"><iframe id="videoFrame" allowfullscreen></iframe></div>
    </div>
</div>

<%@ include file="rightsideoffcanvas.jsp" %>
<%@ include file="header.jsp" %>

<div id="smooth-wrapper">
  <div id="smooth-content">

    <!-- Breadcrumb -->
    <div class="breadcrumb-section bg-img jarallax"
         style="background-image: url('/static/assets/97-4pYTyMSj.jpg')">
        <div class="container">
            <div class="breadcrumb-content">
                <div class="divider"></div>
                <h2>Destinations</h2>
                <ul class="list-unstyled">
                    <li><a href="/index">Home</a></li>
                    <li>Destinations</li>
                </ul>
            </div>
        </div>
        <div class="divider"></div>
    </div>

    <!-- Featured Destinations Section -->
    <section class="featured-destination bg-secondary">
        <div class="shape">
            <img src="/static/assets/shape2-D52FcS43.png" alt="" />
        </div>
        <div class="divider"></div>

        <div class="container">

            <!-- Search + Filter bar -->
            <div class="dest-search-bar">
                <input type="text" id="dest-search" placeholder="Search destinations... e.g. Goa, Kerala, Rajasthan">
                <button onclick="applyDestFilter()"><i class="ti ti-search"></i> Search</button>
                <button id="dest-clear-btn" onclick="clearDestFilter()">Clear</button>
            </div>

            <!-- Region tabs -->
            <div class="region-tabs">
                <button class="region-tab active" data-region="ALL"   onclick="filterByRegion('ALL',this)">All States</button>
                <button class="region-tab" data-region="North"  onclick="filterByRegion('North',this)">North India</button>
                <button class="region-tab" data-region="South"  onclick="filterByRegion('South',this)">South India</button>
                <button class="region-tab" data-region="East"   onclick="filterByRegion('East',this)">East India</button>
                <button class="region-tab" data-region="West"   onclick="filterByRegion('West',this)">West India</button>
                <button class="region-tab" data-region="NE"     onclick="filterByRegion('NE',this)">North East</button>
                <button class="region-tab" data-region="Central" onclick="filterByRegion('Central',this)">Central</button>
            </div>

            <!-- Count -->
            <div id="dest-count"></div>

            <!-- Cards grid -->
            <div class="row g-4" id="dest-grid">
                <!-- Cards rendered by JS -->
            </div>

            <!-- Empty -->
            <div id="dest-empty">No destinations match your search.</div>

        </div>
        <div class="divider"></div>
    </section>

    <%@ include file="footer.jsp" %>
  </div>
</div>

<button id="scrollTopButton" class="touria-scrolltop scrolltop-hide">
    <i class="icon-arrow-up"></i>
</button>

<%@ include file="emailjs.jsp" %>

<script>
    // ── All destinations data ──
    var DESTINATIONS = [
        { name: 'Haryana',          img: '/static/shubham/haryana.jpg',              tours: 3,  region: 'North' },
        { name: 'Delhi',            img: '/static/shubham/delhi.jpeg',              tours: 4,  region: 'North' },
        { name: 'Bihar',            img: '/static/shubham/bihar.webp',              tours: 4,  region: 'East' },
        { name: 'Jharkhand',        img: '/static/shubham/jharkhand.jpeg',          tours: 4,  region: 'East' },
        { name: 'Gujarat',          img: '/static/shubham/gujrat.jpg',              tours: 4,  region: 'West' },
        { name: 'Uttarakhand',      img: '/static/shubham/uttrakhand.jpg',          tours: 4,  region: 'North' },
        { name: 'Madhya Pradesh',   img: '/static/shubham/madhyapradesh.jpg',       tours: 4,  region: 'Central' },
        { name: 'Kerala',           img: '/static/shubham/kerala.jpg',              tours: 4,  region: 'South' },
        { name: 'Maharashtra',      img: '/static/shubham/maharastra.jpeg',         tours: 4,  region: 'West' },
        { name: 'Goa',              img: '/static/shubham/goa.webp',               tours: 4,  region: 'West' },
        { name: 'Andhra Pradesh',   img: '/static/shubham/andhrapradesh.webp',      tours: 4,  region: 'South' },
        { name: 'Assam',            img: '/static/shubham/assam.jpg',               tours: 4,  region: 'NE' },
        { name: 'Arunachal Pradesh',img: '/static/shubham/arunachal pradesh.avif',  tours: 4,  region: 'NE' },
        { name: 'Chhattisgarh',     img: '/static/shubham/chhattisgarh.webp',       tours: 4,  region: 'Central' },
        { name: 'Himachal Pradesh', img: '/static/shubham/himachalpradesh.webp',    tours: 4,  region: 'North' },
        { name: 'Manipur',          img: '/static/shubham/manipur.avif',            tours: 4,  region: 'NE' },
        { name: 'Karnataka',        img: '/static/shubham/karnataka.webp',          tours: 4,  region: 'South' },
        { name: 'Meghalaya',        img: '/static/shubham/meghalaya.jpg',           tours: 4,  region: 'NE' },
        { name: 'Mizoram',          img: '/static/shubham/mizoram.jpg',             tours: 4,  region: 'NE' },
        { name: 'Nagaland',         img: '/static/shubham/nagaland.webp',           tours: 4,  region: 'NE' },
        { name: 'Odisha',           img: '/static/shubham/odisha.jpeg',             tours: 4,  region: 'East' },
        { name: 'Punjab',           img: '/static/shubham/punjab.webp',             tours: 4,  region: 'North' },
        { name: 'Rajasthan',        img: '/static/shubham/rajasthan.jpeg',          tours: 4,  region: 'North' },
        { name: 'Sikkim',           img: '/static/shubham/sikkim.jpg',              tours: 4,  region: 'East' },
        { name: 'Tamil Nadu',       img: '/static/shubham/tamilnadu.jpg',           tours: 4,  region: 'South' },
        { name: 'Telangana',        img: '/static/shubham/telangana.jpg',           tours: 4,  region: 'South' },
        { name: 'Tripura',          img: '/static/shubham/tripura.jpg',             tours: 4,  region: 'NE' },
        { name: 'Uttar Pradesh',    img: '/static/shubham/uttarpradesh.jpg',        tours: 4,  region: 'North' },
        { name: 'West Bengal',      img: '/static/shubham/westbengal.jpg',          tours: 4,  region: 'East' }
    ];

    var currentRegion = 'ALL';
    var currentSearch = '';

    function esc(s) {
        return s ? String(s).replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/"/g,'&quot;') : '';
    }

    function buildCard(d) {
        return '<div class="col-12 col-sm-6 col-lg-4">'
            + '<div class="featured-destination-card fadeInUp" data-delay="0.2" onclick="searchTours(\"' + d.name + '\")" style="cursor:pointer;">'
            + '<img src="' + d.img + '" alt="' + esc(d.name) + '" loading="lazy" onerror="this.src=\'/static/assets/08-CuDdMt6H.png\'">'
            + '<div class="overlay-content d-flex flex-wrap gap-4 align-items-end justify-content-between">'
            + '<div><p class="mb-1 text-white" style="font-size:.8rem;opacity:.85;">Travel To</p><h4 class="mb-0 text-white">' + esc(d.name) + '</h4></div>'
            + '<span class="badge bg-primary">' + d.tours + ' Tours</span>'
            + '</div></div></div>';
    }

    function renderDests() {
        var filtered = DESTINATIONS.filter(function(d) {
            var matchRegion = currentRegion === 'ALL' || d.region === currentRegion;
            var matchSearch = !currentSearch || d.name.toLowerCase().indexOf(currentSearch.toLowerCase()) !== -1;
            return matchRegion && matchSearch;
        });

        var grid = document.getElementById('dest-grid');
        var empty = document.getElementById('dest-empty');
        var count = document.getElementById('dest-count');

        count.textContent = filtered.length + ' destination' + (filtered.length !== 1 ? 's' : '') + ' found';

        if (!filtered.length) {
            grid.innerHTML = '';
            empty.style.display = 'block';
            return;
        }

        empty.style.display = 'none';
        var html = '';
        for (var i = 0; i < filtered.length; i++) { html += buildCard(filtered[i]); }
        grid.innerHTML = html;
    }

    function filterByRegion(region, btn) {
        currentRegion = region;
        document.querySelectorAll('.region-tab').forEach(function(t) { t.classList.remove('active'); });
        btn.classList.add('active');
        renderDests();
    }

    function applyDestFilter() {
        currentSearch = document.getElementById('dest-search').value.trim();
        renderDests();
    }

    function clearDestFilter() {
        currentSearch = '';
        document.getElementById('dest-search').value = '';
        currentRegion = 'ALL';
        document.querySelectorAll('.region-tab').forEach(function(t) { t.classList.remove('active'); });
        document.querySelector('.region-tab[data-region="ALL"]').classList.add('active');
        renderDests();
    }

    function searchTours(destination) {
        window.location.href = '/tours?destination=' + encodeURIComponent(destination);
    }

    // Allow Enter key search
    document.getElementById('dest-search').addEventListener('keydown', function(e) {
        if (e.key === 'Enter') applyDestFilter();
    });

    // Initial render
    renderDests();
</script>
</body>
</html>
