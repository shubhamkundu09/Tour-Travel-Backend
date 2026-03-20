<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" data-theme="three">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>About Us - Ananda Holidays</title>

    <link rel="stylesheet" crossorigin href="/static/assets/main-DDi0A8kK.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@3.34.0/dist/tabler-icons.min.css" />
    <script type="module" crossorigin src="/static/assets/main-C7XYgASq.js"></script>

    <style>
        /* ── Hero About ── */
        .about-hero-img {
            width: 100%;
            height: 480px;
            object-fit: cover;
            border-radius: 20px;
            display: block;
        }
        .about-hero-badge {
            position: absolute;
            bottom: -24px;
            left: 32px;
            background: #c8622a;
            color: #fff;
            border-radius: 14px;
            padding: 20px 28px;
            box-shadow: 0 8px 30px rgba(200,98,42,.35);
        }
        .about-hero-badge .num {
            font-size: 2.4rem;
            font-weight: 800;
            line-height: 1;
        }
        .about-hero-badge .lbl {
            font-size: .82rem;
            opacity: .85;
            margin-top: 4px;
        }

        /* ── Value cards ── */
        .value-card {
            background: #fff;
            border: 1px solid #e8e0d6;
            border-radius: 14px;
            padding: 28px 24px;
            height: 100%;
            transition: transform .25s, box-shadow .25s;
        }
        .value-card:hover { transform: translateY(-5px); box-shadow: 0 14px 36px rgba(0,0,0,.08); }
        .value-icon {
            width: 56px;
            height: 56px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            margin-bottom: 18px;
        }
        .value-card h4 { font-size: 1rem; font-weight: 700; margin-bottom: 10px; }
        .value-card p  { font-size: .88rem; color: #888; line-height: 1.7; margin: 0; }

        /* ── Team cards ── */
        .team-card {
            background: #fff;
            border: 1px solid #e8e0d6;
            border-radius: 16px;
            overflow: hidden;
            text-align: center;
            transition: transform .25s, box-shadow .25s;
        }
        .team-card:hover { transform: translateY(-5px); box-shadow: 0 14px 36px rgba(0,0,0,.08); }
        .team-card img {
            width: 100%;
            height: 220px;
            object-fit: cover;
            display: block;
        }
        .team-card-body { padding: 20px 16px 22px; }
        .team-card-body h5 { font-size: 1rem; font-weight: 700; margin-bottom: 4px; }
        .team-card-body span { font-size: .8rem; color: #c8622a; font-weight: 600; }
        .team-social { display: flex; justify-content: center; gap: 10px; margin-top: 14px; }
        .team-social a {
            width: 34px; height: 34px; border-radius: 50%;
            border: 1.5px solid #e0d9ce;
            display: flex; align-items: center; justify-content: center;
            color: #888; font-size: 15px;
            transition: all .2s;
            text-decoration: none;
        }
        .team-social a:hover { background: #c8622a; border-color: #c8622a; color: #fff; }

        /* ── Timeline ── */
        .timeline { position: relative; padding-left: 0; }
        .timeline::before {
            content: '';
            position: absolute;
            left: 50%;
            top: 0; bottom: 0;
            width: 2px;
            background: #e8e0d6;
            transform: translateX(-50%);
        }
        .tl-item {
            display: flex;
            justify-content: flex-end;
            padding-right: calc(50% + 32px);
            margin-bottom: 40px;
            position: relative;
        }
        .tl-item:nth-child(even) {
            justify-content: flex-start;
            padding-right: 0;
            padding-left: calc(50% + 32px);
        }
        .tl-dot {
            position: absolute;
            left: 50%;
            top: 20px;
            transform: translateX(-50%);
            width: 18px; height: 18px;
            border-radius: 50%;
            background: #c8622a;
            border: 3px solid #fff;
            box-shadow: 0 0 0 3px #e8e0d6;
            z-index: 1;
        }
        .tl-card {
            background: #fff;
            border: 1px solid #e8e0d6;
            border-radius: 12px;
            padding: 20px 22px;
            max-width: 360px;
        }
        .tl-year {
            font-size: .75rem;
            font-weight: 700;
            color: #c8622a;
            letter-spacing: .06em;
            text-transform: uppercase;
            margin-bottom: 6px;
        }
        .tl-card h5 { font-size: .95rem; font-weight: 700; margin-bottom: 6px; }
        .tl-card p  { font-size: .83rem; color: #888; margin: 0; line-height: 1.6; }

        /* ── Testimonials ── */
        .testimonial-card {
            background: #fff;
            border: 1px solid #e8e0d6;
            border-radius: 16px;
            padding: 28px 24px;
            height: 100%;
        }
        .stars { color: #f5a623; font-size: 14px; margin-bottom: 14px; }
        .testimonial-card p { font-size: .9rem; color: #555; line-height: 1.75; font-style: italic; margin-bottom: 20px; }
        .tcard-author { display: flex; align-items: center; gap: 12px; }
        .tcard-avatar {
            width: 44px; height: 44px; border-radius: 50%;
            background: #2a6e6e;
            display: flex; align-items: center; justify-content: center;
            font-weight: 700; color: #fff; font-size: 15px;
            flex-shrink: 0;
        }
        .tcard-name { font-size: .88rem; font-weight: 700; }
        .tcard-loc  { font-size: .78rem; color: #aaa; }

        @media (max-width: 768px) {
            .timeline::before { left: 16px; }
            .tl-item, .tl-item:nth-child(even) {
                padding-left: 48px;
                padding-right: 0;
                justify-content: flex-start;
            }
            .tl-dot { left: 16px; }
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
                <h2>About Us</h2>
                <ul class="list-unstyled">
                    <li><a href="/index">Home</a></li>
                    <li>About Us</li>
                </ul>
            </div>
        </div>
        <div class="divider"></div>
    </div>

    <!-- ── Who We Are ── -->
    <section style="padding:80px 0;background:#fff;">
        <div class="divider"></div>
        <div class="container">
            <div class="row g-5 align-items-center">
                <div class="col-12 col-lg-6">
                    <div style="position:relative;padding-bottom:28px;">
                        <img src="/static/shubham/tour1.jpg" class="about-hero-img" alt="About Ananda Holidays"
                             onerror="this.src='/static/assets/163-GeSCqKuK.jpg'">
                        <div class="about-hero-badge">
                            <div class="num">10+</div>
                            <div class="lbl">Years of Trusted Travel</div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-6">
                    <span style="font-size:13px;font-weight:600;letter-spacing:.08em;text-transform:uppercase;color:#c8622a;">Who We Are</span>
                    <h2 style="margin:10px 0 20px;font-size:clamp(1.7rem,3vw,2.4rem);font-weight:700;line-height:1.2;">
                        Your Trusted Partner for Sacred & Leisure Journeys
                    </h2>
                    <p style="color:#666;line-height:1.8;margin-bottom:18px;">
                        Ananda Holidays was founded with a single purpose — to make travel meaningful. We specialise in devotional yatras, spiritual pilgrimages, and leisure tours across India and beyond, crafting every itinerary with care, comfort, and cultural sensitivity.
                    </p>
                    <p style="color:#666;line-height:1.8;margin-bottom:28px;">
                        Based in Greater Noida, we have guided hundreds of families through life-changing journeys to the most sacred and scenic destinations — from the Char Dham peaks of Uttarakhand to the golden sands of Andaman, from the spiritual trails of Nepal to the vibrant markets of Dubai.
                    </p>
                    <ul style="list-style:none;padding:0;margin:0 0 32px;">
                        <li style="display:flex;align-items:center;gap:10px;margin-bottom:12px;font-size:.92rem;color:#444;">
                            <i class="ti ti-circle-check-filled" style="color:#2a6e6e;font-size:18px;"></i>
                            Expert-curated itineraries for every budget
                        </li>
                        <li style="display:flex;align-items:center;gap:10px;margin-bottom:12px;font-size:.92rem;color:#444;">
                            <i class="ti ti-circle-check-filled" style="color:#2a6e6e;font-size:18px;"></i>
                            Dedicated 24/7 on-trip support
                        </li>
                        <li style="display:flex;align-items:center;gap:10px;margin-bottom:12px;font-size:.92rem;color:#444;">
                            <i class="ti ti-circle-check-filled" style="color:#2a6e6e;font-size:18px;"></i>
                            Group discounts and family packages
                        </li>
                        <li style="display:flex;align-items:center;gap:10px;font-size:.92rem;color:#444;">
                            <i class="ti ti-circle-check-filled" style="color:#2a6e6e;font-size:18px;"></i>
                            Transparent pricing, no hidden charges
                        </li>
                    </ul>
                    <a href="/contact" class="btn btn-primary">Get In Touch <i class="icon-arrow-right"></i></a>
                </div>
            </div>
        </div>
        <div class="divider"></div>
    </section>

    <!-- ── Stats ── -->
    <section style="padding:60px 0;background:#2a6e6e;">
        <div class="container">
            <div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(160px,1fr));gap:32px;text-align:center;">
                <div>
                    <div style="font-size:2.8rem;font-weight:800;color:#fff;">500+</div>
                    <div style="font-size:.85rem;color:rgba(255,255,255,.75);margin-top:6px;text-transform:uppercase;letter-spacing:.06em;">Happy Travelers</div>
                </div>
                <div>
                    <div style="font-size:2.8rem;font-weight:800;color:#fff;">50+</div>
                    <div style="font-size:.85rem;color:rgba(255,255,255,.75);margin-top:6px;text-transform:uppercase;letter-spacing:.06em;">Destinations</div>
                </div>
                <div>
                    <div style="font-size:2.8rem;font-weight:800;color:#fff;">10+</div>
                    <div style="font-size:.85rem;color:rgba(255,255,255,.75);margin-top:6px;text-transform:uppercase;letter-spacing:.06em;">Years Experience</div>
                </div>
                <div>
                    <div style="font-size:2.8rem;font-weight:800;color:#fff;">200+</div>
                    <div style="font-size:.85rem;color:rgba(255,255,255,.75);margin-top:6px;text-transform:uppercase;letter-spacing:.06em;">Tours Completed</div>
                </div>
            </div>
        </div>
    </section>

    <!-- ── Our Values ── -->
    <section style="padding:80px 0;background:#f7f4ef;">
        <div class="divider"></div>
        <div class="container">
            <div style="text-align:center;margin-bottom:48px;">
                <span style="font-size:13px;font-weight:600;letter-spacing:.08em;text-transform:uppercase;color:#c8622a;">What Drives Us</span>
                <h2 style="margin:10px 0 0;font-size:clamp(1.6rem,3vw,2.2rem);font-weight:700;">Our Core Values</h2>
            </div>
            <div class="row g-4">
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="value-card">
                        <div class="value-icon" style="background:#fff3e0;">
                            <i class="ti ti-heart-filled" style="color:#c8622a;"></i>
                        </div>
                        <h4>Passion for Travel</h4>
                        <p>Every journey we plan comes from a genuine love for exploration and a desire to share the world's wonders with our guests.</p>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="value-card">
                        <div class="value-icon" style="background:#e8f5e9;">
                            <i class="ti ti-shield-check-filled" style="color:#2e7d32;"></i>
                        </div>
                        <h4>Trust & Transparency</h4>
                        <p>No hidden costs, no surprises. We believe in honest communication and building long-term relationships with every traveler.</p>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="value-card">
                        <div class="value-icon" style="background:#e3f2fd;">
                            <i class="ti ti-users-filled" style="color:#1565c0;"></i>
                        </div>
                        <h4>People First</h4>
                        <p>From solo pilgrims to large families, every traveler receives the same personalized care and attention throughout their journey.</p>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="value-card">
                        <div class="value-icon" style="background:#f3e5f5;">
                            <i class="ti ti-stars-filled" style="color:#7b1fa2;"></i>
                        </div>
                        <h4>Quality Experience</h4>
                        <p>We hand-pick every hotel, vehicle, and guide to ensure each aspect of your trip meets our high standards of comfort and safety.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="divider"></div>
    </section>

    <!-- ── Our Story / Timeline ── -->
    <section style="padding:80px 0;background:#fff;">
        <div class="divider"></div>
        <div class="container">
            <div style="text-align:center;margin-bottom:56px;">
                <span style="font-size:13px;font-weight:600;letter-spacing:.08em;text-transform:uppercase;color:#c8622a;">Our Journey</span>
                <h2 style="margin:10px 0 0;font-size:clamp(1.6rem,3vw,2.2rem);font-weight:700;">How We Grew</h2>
            </div>
            <div class="timeline">
                <div class="tl-item">
                    <div class="tl-dot"></div>
                    <div class="tl-card">
                        <div class="tl-year">2013</div>
                        <h5>The Beginning</h5>
                        <p>Ananda Holidays was founded in Greater Noida with a small team and a big dream — to make spiritual travel accessible and comfortable for every family.</p>
                    </div>
                </div>
                <div class="tl-item">
                    <div class="tl-dot"></div>
                    <div class="tl-card">
                        <div class="tl-year">2015</div>
                        <h5>First 100 Pilgrims</h5>
                        <p>We successfully completed our first Char Dham Yatra with 100+ pilgrims, setting the standard for devotional group travel.</p>
                    </div>
                </div>
                <div class="tl-item">
                    <div class="tl-dot"></div>
                    <div class="tl-card">
                        <div class="tl-year">2018</div>
                        <h5>Expanding Horizons</h5>
                        <p>We launched international tours to Nepal, Dubai, and South-East Asia, growing our portfolio beyond religious yatras.</p>
                    </div>
                </div>
                <div class="tl-item">
                    <div class="tl-dot"></div>
                    <div class="tl-card">
                        <div class="tl-year">2021</div>
                        <h5>Digital Transformation</h5>
                        <p>Launched online booking and a dedicated customer support system, making it easier than ever to plan and book your dream journey.</p>
                    </div>
                </div>
                <div class="tl-item">
                    <div class="tl-dot"></div>
                    <div class="tl-card">
                        <div class="tl-year">2024</div>
                        <h5>500+ Happy Travelers</h5>
                        <p>Crossed the milestone of 500 satisfied travelers and 200 completed tours across India and abroad. The journey continues.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="divider"></div>
    </section>

    <!-- ── Testimonials ── -->
    <section style="padding:80px 0;background:#f7f4ef;">
        <div class="divider"></div>
        <div class="container">
            <div style="text-align:center;margin-bottom:48px;">
                <span style="font-size:13px;font-weight:600;letter-spacing:.08em;text-transform:uppercase;color:#c8622a;">What They Say</span>
                <h2 style="margin:10px 0 0;font-size:clamp(1.6rem,3vw,2.2rem);font-weight:700;">Traveler Testimonials</h2>
            </div>
            <div class="row g-4">
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="testimonial-card">
                        <div class="stars">
                            <i class="ti ti-star-filled"></i><i class="ti ti-star-filled"></i><i class="ti ti-star-filled"></i><i class="ti ti-star-filled"></i><i class="ti ti-star-filled"></i>
                        </div>
                        <p>"Our Char Dham Yatra with Ananda Holidays was a life-changing experience. Every detail was perfectly arranged — from hotels to puja darshan timings. Highly recommended for any devotional tour."</p>
                        <div class="tcard-author">
                            <div class="tcard-avatar">RK</div>
                            <div>
                                <div class="tcard-name">Rajesh Kumar</div>
                                <div class="tcard-loc"><i class="ti ti-map-pin" style="font-size:11px;"></i> Delhi</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="testimonial-card">
                        <div class="stars">
                            <i class="ti ti-star-filled"></i><i class="ti ti-star-filled"></i><i class="ti ti-star-filled"></i><i class="ti ti-star-filled"></i><i class="ti ti-star-filled"></i>
                        </div>
                        <p>"We booked the Andaman group tour for our family of 8. The team was extremely supportive throughout. The pricing was transparent and the hospitality was wonderful. Will book again!"</p>
                        <div class="tcard-author">
                            <div class="tcard-avatar" style="background:#c8622a;">PS</div>
                            <div>
                                <div class="tcard-name">Priya Sharma</div>
                                <div class="tcard-loc"><i class="ti ti-map-pin" style="font-size:11px;"></i> Noida</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="testimonial-card">
                        <div class="stars">
                            <i class="ti ti-star-filled"></i><i class="ti ti-star-filled"></i><i class="ti ti-star-filled"></i><i class="ti ti-star-filled"></i><i class="ti ti-star-half-filled"></i>
                        </div>
                        <p>"The Dubai tour exceeded all expectations. Professional guides, clean accommodation and an action-packed itinerary. Ananda Holidays made international travel feel easy and affordable."</p>
                        <div class="tcard-author">
                            <div class="tcard-avatar" style="background:#1565c0;">AM</div>
                            <div>
                                <div class="tcard-name">Amit Mehta</div>
                                <div class="tcard-loc"><i class="ti ti-map-pin" style="font-size:11px;"></i> Faridabad</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="divider"></div>
    </section>

    <!-- ── CTA ── -->
    <section style="padding:80px 0;background:#2a6e6e;text-align:center;">
        <div class="container">
            <h2 style="color:#fff;font-size:clamp(1.6rem,3vw,2.4rem);font-weight:700;margin-bottom:16px;">
                Ready to Start Your Journey?
            </h2>
            <p style="color:rgba(255,255,255,.8);margin-bottom:36px;max-width:500px;margin-left:auto;margin-right:auto;line-height:1.7;">
                Let us plan the perfect trip for you — devotional, leisure, or adventure. Contact our travel experts today.
            </p>
            <div style="display:flex;gap:16px;justify-content:center;flex-wrap:wrap;">
                <a href="/tours" class="btn btn-primary">Explore Tours <i class="icon-arrow-right"></i></a>
                <a href="/contact" style="padding:12px 28px;border-radius:8px;border:2px solid rgba(255,255,255,.5);color:#fff;font-weight:600;text-decoration:none;transition:all .2s;"
                   onmouseover="this.style.background='rgba(255,255,255,.15)'"
                   onmouseout="this.style.background='transparent'">
                    Contact Us
                </a>
            </div>
        </div>
    </section>

    <jsp:include page="footer.jsp" />
  </div>
</div>

<button id="scrollTopButton" class="touria-scrolltop scrolltop-hide">
    <i class="icon-arrow-up"></i>
</button>

<jsp:include page="emailjs.jsp" />

</body>
</html>
