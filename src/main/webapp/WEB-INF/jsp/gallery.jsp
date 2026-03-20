<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" data-theme="three">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Gallery - Ananda Holidays</title>

    <link rel="stylesheet" crossorigin href="/static/assets/main-DDi0A8kK.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@3.34.0/dist/tabler-icons.min.css" />
    <script type="module" crossorigin src="/static/assets/main-C7XYgASq.js"></script>

    <style>
        /* ── Filter tabs ── */
        .gallery-filters {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 10px;
            margin-bottom: 40px;
        }
        .gf-tab {
            padding: 8px 22px;
            border-radius: 999px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            border: 1.5px solid #e0d9ce;
            background: #fff;
            color: #888;
            transition: all .2s;
            letter-spacing: .01em;
        }
        .gf-tab:hover { border-color: #c8622a; color: #c8622a; }
        .gf-tab.active { background: #c8622a; color: #fff; border-color: #c8622a; }

        /* ── Masonry grid ── */
        .gallery-grid {
            columns: 4;
            column-gap: 16px;
        }
        @media (max-width: 1100px) { .gallery-grid { columns: 3; } }
        @media (max-width: 768px)  { .gallery-grid { columns: 2; } }
        @media (max-width: 480px)  { .gallery-grid { columns: 1; } }

        .gallery-item {
            break-inside: avoid;
            margin-bottom: 16px;
            border-radius: 12px;
            overflow: hidden;
            position: relative;
            cursor: pointer;
            display: block;
        }
        .gallery-item img {
            width: 100%;
            display: block;
            transition: transform .4s ease;
        }
        .gallery-item:hover img { transform: scale(1.06); }

        /* Overlay */
        .gallery-item .gi-overlay {
            position: absolute;
            inset: 0;
            background: linear-gradient(to top, rgba(0,0,0,.65) 0%, transparent 55%);
            opacity: 0;
            transition: opacity .3s;
            display: flex;
            align-items: flex-end;
            padding: 16px;
        }
        .gallery-item:hover .gi-overlay { opacity: 1; }
        .gi-overlay span {
            color: #fff;
            font-size: 13px;
            font-weight: 600;
            letter-spacing: .03em;
        }
        .gi-overlay .gi-zoom {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 48px;
            height: 48px;
            border-radius: 50%;
            background: rgba(255,255,255,.2);
            backdrop-filter: blur(4px);
            border: 2px solid rgba(255,255,255,.6);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            color: #fff;
        }

        /* Category badge */
        .gi-cat {
            position: absolute;
            top: 10px;
            left: 10px;
            background: rgba(0,0,0,.5);
            color: #fff;
            font-size: 11px;
            font-weight: 700;
            letter-spacing: .05em;
            text-transform: uppercase;
            padding: 3px 10px;
            border-radius: 999px;
            backdrop-filter: blur(4px);
        }

        /* ── Lightbox ── */
        .lb-overlay {
            display: none;
            position: fixed;
            inset: 0;
            background: rgba(0,0,0,.92);
            z-index: 9999;
            align-items: center;
            justify-content: center;
            flex-direction: column;
        }
        .lb-overlay.open { display: flex; }
        .lb-img-wrap {
            max-width: 90vw;
            max-height: 80vh;
            position: relative;
        }
        .lb-img-wrap img {
            max-width: 90vw;
            max-height: 80vh;
            border-radius: 10px;
            object-fit: contain;
            display: block;
        }
        .lb-caption {
            color: #fff;
            font-size: 14px;
            margin-top: 14px;
            text-align: center;
            opacity: .8;
        }
        .lb-close {
            position: fixed;
            top: 24px;
            right: 28px;
            width: 44px;
            height: 44px;
            border-radius: 50%;
            background: rgba(255,255,255,.15);
            border: none;
            color: #fff;
            font-size: 22px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background .2s;
        }
        .lb-close:hover { background: rgba(255,255,255,.3); }
        .lb-nav {
            position: fixed;
            top: 50%;
            transform: translateY(-50%);
            width: 48px;
            height: 48px;
            border-radius: 50%;
            background: rgba(255,255,255,.15);
            border: none;
            color: #fff;
            font-size: 22px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background .2s;
        }
        .lb-nav:hover { background: rgba(255,255,255,.3); }
        .lb-prev { left: 20px; }
        .lb-next { right: 20px; }

        /* Empty state */
        #gallery-empty {
            display: none;
            text-align: center;
            padding: 60px;
            color: #aaa;
            background: #fff;
            border-radius: 12px;
            border: 1px dashed #ddd;
        }

        /* Count */
        #gallery-count {
            text-align: center;
            font-size: 13px;
            color: #999;
            margin-bottom: 28px;
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

<jsp:include page="rightsideoffcanvas.jsp" />
<jsp:include page="header.jsp" />

<div id="smooth-wrapper">
  <div id="smooth-content">

    <!-- Breadcrumb -->
    <div class="breadcrumb-section bg-img jarallax"
         style="background-image: url('/static/assets/97-4pYTyMSj.jpg')">
        <div class="container">
            <div class="breadcrumb-content">
                <div class="divider"></div>
                <h2>Gallery</h2>
                <ul class="list-unstyled">
                    <li><a href="/index">Home</a></li>
                    <li>Gallery</li>
                </ul>
            </div>
        </div>
        <div class="divider"></div>
    </div>

    <!-- Gallery Section -->
    <section style="padding: 70px 0; background: #f7f4ef;">
        <div class="divider"></div>
        <div class="container">

            <!-- Heading -->
            <div style="text-align:center; margin-bottom:44px;">
                <span style="font-size:13px;font-weight:600;letter-spacing:.08em;text-transform:uppercase;color:#c8622a;">Our Moments</span>
                <h2 style="margin:8px 0 0;font-size:clamp(1.6rem,3vw,2.2rem);font-weight:700;">Memories We Have Created</h2>
                <p style="margin:12px auto 0;max-width:520px;color:#888;font-size:.95rem;line-height:1.7;">
                    A glimpse into the beautiful journeys, sacred pilgrimages, and unforgettable adventures with Ananda Holidays.
                </p>
            </div>

            <!-- Filter Tabs -->
            <div class="gallery-filters">
                <button class="gf-tab active" data-cat="all"        onclick="filterGallery('all',this)">All Photos</button>
                <button class="gf-tab"        data-cat="religious"  onclick="filterGallery('religious',this)">Devotional</button>
                <button class="gf-tab"        data-cat="adventure"  onclick="filterGallery('adventure',this)">Adventure</button>
                <button class="gf-tab"        data-cat="beach"      onclick="filterGallery('beach',this)">Beach</button>
                <button class="gf-tab"        data-cat="hill"       onclick="filterGallery('hill',this)">Hill Stations</button>
                <button class="gf-tab"        data-cat="heritage"   onclick="filterGallery('heritage',this)">Heritage</button>
                <button class="gf-tab"        data-cat="wildlife"   onclick="filterGallery('wildlife',this)">Wildlife</button>
            </div>

            <!-- Count -->
            <div id="gallery-count"></div>

            <!-- Grid -->
            <div class="gallery-grid" id="gallery-grid"></div>

            <!-- Empty -->
            <div id="gallery-empty">No photos in this category yet.</div>

        </div>
        <div class="divider"></div>
    </section>

    <!-- Stats Section -->
    <section style="padding:60px 0;background:#2a6e6e;">
        <div class="container">
            <div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(160px,1fr));gap:32px;text-align:center;">
                <div>
                    <div style="font-size:2.8rem;font-weight:800;color:#fff;">500+</div>
                    <div style="font-size:.88rem;color:rgba(255,255,255,.7);margin-top:6px;text-transform:uppercase;letter-spacing:.06em;">Happy Travelers</div>
                </div>
                <div>
                    <div style="font-size:2.8rem;font-weight:800;color:#fff;">50+</div>
                    <div style="font-size:.88rem;color:rgba(255,255,255,.7);margin-top:6px;text-transform:uppercase;letter-spacing:.06em;">Destinations</div>
                </div>
                <div>
                    <div style="font-size:2.8rem;font-weight:800;color:#fff;">10+</div>
                    <div style="font-size:.88rem;color:rgba(255,255,255,.7);margin-top:6px;text-transform:uppercase;letter-spacing:.06em;">Years Experience</div>
                </div>
                <div>
                    <div style="font-size:2.8rem;font-weight:800;color:#fff;">100%</div>
                    <div style="font-size:.88rem;color:rgba(255,255,255,.7);margin-top:6px;text-transform:uppercase;letter-spacing:.06em;">Satisfaction</div>
                </div>
            </div>
        </div>
    </section>

    <jsp:include page="footer.jsp" />
  </div>
</div>

<!-- Lightbox -->
<div class="lb-overlay" id="lightbox" onclick="lbClose(event)">
    <button class="lb-close" onclick="closeLightbox()"><i class="ti ti-x"></i></button>
    <button class="lb-nav lb-prev" onclick="lbNav(-1);event.stopPropagation();"><i class="ti ti-chevron-left"></i></button>
    <button class="lb-nav lb-next" onclick="lbNav(1);event.stopPropagation();"><i class="ti ti-chevron-right"></i></button>
    <div class="lb-img-wrap" onclick="event.stopPropagation()">
        <img id="lb-img" src="" alt="">
    </div>
    <div class="lb-caption" id="lb-caption"></div>
</div>

<button id="scrollTopButton" class="touria-scrolltop scrolltop-hide">
    <i class="icon-arrow-up"></i>
</button>

<jsp:include page="emailjs.jsp" />

<script>
    var GALLERY = [
        { src: '/static/shubham/dodham.webp',         cat: 'religious', label: 'Do Dham Yatra' },
        { src: '/static/shubham/jagannath.jpg',        cat: 'religious', label: 'Jagannath Puri' },
        { src: '/static/shubham/southtemple.jpg',      cat: 'religious', label: 'South India Temples' },
        { src: '/static/shubham/gangasagar.jpg',       cat: 'religious', label: 'Gangasagar' },
        { src: '/static/shubham/muktinath.webp',       cat: 'religious', label: 'Muktinath Yatra' },
        { src: '/static/shubham/pashupatinath.png',    cat: 'religious', label: 'Pashupatinath' },
        { src: '/static/shubham/baidyanath.jpg',       cat: 'religious', label: 'Baba Baidyanath' },
        { src: '/static/shubham/dubai.jpg',            cat: 'adventure', label: 'Dubai Adventure' },
        { src: '/static/shubham/gujrat.jpg',           cat: 'adventure', label: 'Gujarat Tour' },
        { src: '/static/shubham/andaman.webp',         cat: 'beach',     label: 'Andaman Islands' },
        { src: '/static/shubham/goa.webp',             cat: 'beach',     label: 'Goa Beaches' },
        { src: '/static/shubham/kerala.jpg',            cat: 'beach',     label: 'Kerala Backwaters' },
        { src: '/static/shubham/uttrakhand.jpg',        cat: 'hill',      label: 'Uttarakhand' },
        { src: '/static/shubham/himachalpradesh.webp',  cat: 'hill',      label: 'Himachal Pradesh' },
        { src: '/static/shubham/sikkim.jpg',            cat: 'hill',      label: 'Sikkim' },
        { src: '/static/shubham/meghalaya.jpg',         cat: 'hill',      label: 'Meghalaya' },
        { src: '/static/shubham/rajasthan.jpeg',        cat: 'heritage',  label: 'Rajasthan' },
        { src: '/static/shubham/madhyapradesh.jpg',     cat: 'heritage',  label: 'Madhya Pradesh' },
        { src: '/static/shubham/karnataka.webp',        cat: 'heritage',  label: 'Karnataka' },
        { src: '/static/shubham/tamilnadu.jpg',         cat: 'heritage',  label: 'Tamil Nadu' },
        { src: '/static/shubham/haryana.jpg',           cat: 'heritage',  label: 'Haryana' },
        { src: '/static/shubham/odisha.jpeg',           cat: 'heritage',  label: 'Odisha' },
        { src: '/static/shubham/assam.jpg',             cat: 'wildlife',  label: 'Assam Wildlife' },
        { src: '/static/shubham/nagaland.webp',         cat: 'wildlife',  label: 'Nagaland' },
        { src: '/static/shubham/westbengal.jpg',        cat: 'wildlife',  label: 'West Bengal' },
        { src: '/static/shubham/tour1.jpg',             cat: 'adventure', label: 'Tour Memories' },
    ];

    var currentCat = 'all';
    var filtered = [];
    var lbIndex = 0;

    function getFiltered(cat) {
        return cat === 'all' ? GALLERY : GALLERY.filter(function(g) { return g.cat === cat; });
    }

    function filterGallery(cat, btn) {
        currentCat = cat;
        document.querySelectorAll('.gf-tab').forEach(function(t) { t.classList.remove('active'); });
        btn.classList.add('active');
        renderGallery();
    }

    function renderGallery() {
        filtered = getFiltered(currentCat);
        var grid = document.getElementById('gallery-grid');
        var empty = document.getElementById('gallery-empty');
        var count = document.getElementById('gallery-count');

        count.textContent = filtered.length + ' photo' + (filtered.length !== 1 ? 's' : '');

        if (!filtered.length) {
            grid.innerHTML = '';
            empty.style.display = 'block';
            return;
        }
        empty.style.display = 'none';

        var html = '';
        for (var i = 0; i < filtered.length; i++) {
            var g = filtered[i];
            html += '<div class="gallery-item" onclick="openLightbox(' + i + ')">'
                + '<img src="' + g.src + '" alt="' + g.label + '" loading="lazy" onerror="this.parentElement.style.display='none'">'
                + '<span class="gi-cat">' + catLabel(g.cat) + '</span>'
                + '<div class="gi-overlay">'
                + '<div class="gi-zoom"><i class="ti ti-zoom-in"></i></div>'
                + '<span>' + g.label + '</span>'
                + '</div></div>';
        }
        grid.innerHTML = html;
    }

    function catLabel(cat) {
        var map = { religious:'Devotional', adventure:'Adventure', beach:'Beach', hill:'Hill Station', heritage:'Heritage', wildlife:'Wildlife' };
        return map[cat] || cat;
    }

    function openLightbox(idx) {
        lbIndex = idx;
        updateLightbox();
        document.getElementById('lightbox').classList.add('open');
        document.body.style.overflow = 'hidden';
    }

    function updateLightbox() {
        var item = filtered[lbIndex];
        document.getElementById('lb-img').src = item.src;
        document.getElementById('lb-caption').textContent = item.label;
    }

    function closeLightbox() {
        document.getElementById('lightbox').classList.remove('open');
        document.body.style.overflow = '';
    }

    function lbClose(e) {
        if (e.target === document.getElementById('lightbox')) closeLightbox();
    }

    function lbNav(dir) {
        lbIndex = (lbIndex + dir + filtered.length) % filtered.length;
        updateLightbox();
    }

    // Keyboard navigation
    document.addEventListener('keydown', function(e) {
        if (!document.getElementById('lightbox').classList.contains('open')) return;
        if (e.key === 'ArrowRight') lbNav(1);
        if (e.key === 'ArrowLeft')  lbNav(-1);
        if (e.key === 'Escape')     closeLightbox();
    });

    renderGallery();
</script>
</body>
</html>
