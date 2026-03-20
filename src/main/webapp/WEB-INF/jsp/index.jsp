<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="true" %>
<!DOCTYPE html>
<html lang="en" data-theme="three">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Ananda Holidays</title>

    <link rel="stylesheet" crossorigin href="/static/assets/main-DDi0A8kK.css" />
    <script type="module" crossorigin src="/static/assets/main-C7XYgASq.js"></script>

    <style>
        .destination-image { width:100%; height:450px; overflow:hidden; border-radius:10px; }
        .destination-image img { width:100%; height:100%; object-fit:cover; display:block; }
        .destination-content { text-align:center; }
        .destination-content ul { justify-content:center; }
        .destination-rattiing { justify-content:center; }
        .loading-spinner { text-align:center; padding:50px; min-height:200px; display:flex; align-items:center; justify-content:center; }
        .error-message { color:#dc3545; text-align:center; padding:20px; }
        .success-message { color:#28a745; text-align:center; padding:10px; margin-bottom:10px; background:rgba(255,255,255,0.9); border-radius:5px; }
        .form-clt select { width:100%; padding:12px 20px; border:1px solid #ddd; border-radius:5px; background:white; }
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

        <!-- Hero Section -->
        <section class="hero-section bg-img style-five jarallax"
            style="background-image: url('/static/assets/227-CV0XzQD3.jpg')">
            <div class="container">
                <div class="row g-xl-5 justify-content-center">
                    <div class="col-12 col-md-8">
                        <div class="hero-content home-one text-center">
                            <h2 class="text-white mb-4 heading-line" data-delay="0.6">
                                Wander Freely, Travel with Ananda
                            </h2>
                            <p class="text-white heading-line mb-5" data-delay="0.7">
                                Explore breathtaking destinations across India and beyond
                                with Ananda Holidays - where every journey is designed to
                                inspire, refresh, and create lifelong memories.
                            </p>
                            <a href="/contact" class="btn btn-primary">
                                Contact Us <i class="icon-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hero-img">
                <img src="/static/assets/cloud-Ghgi75-N.png" alt="cloud" />
            </div>
            <div class="plane-img" data-speed="0.9">
                <div class="container">
                    <img src="/static/assets/plane4-DFMLV2Vc.png" alt="plane" />
                </div>
            </div>
        </section>

        <!-- Premier Destination Section -->
        <section style="padding:60px 0;background:#fff;">
            <div class="divider"></div>
            <div class="container">
                <div style="display:flex;align-items:flex-end;justify-content:space-between;flex-wrap:wrap;gap:16px;margin-bottom:36px;">
                    <div>
                        <span style="font-size:13px;font-weight:600;letter-spacing:.08em;text-transform:uppercase;color:#c8622a;">Popular Destinations</span>
                        <h2 style="margin:6px 0 0;font-size:clamp(1.6rem,3vw,2.2rem);font-weight:700;">Premier Tours</h2>
                    </div>
                    <div style="display:flex;gap:10px;">
                        <button id="tc-prev" onclick="tcSlide(-1)" style="width:44px;height:44px;border-radius:50%;border:1.5px solid #e0d9ce;background:#fff;cursor:pointer;font-size:18px;display:flex;align-items:center;justify-content:center;transition:all .2s;" onmouseover="this.style.background='#c8622a';this.style.borderColor='#c8622a';this.style.color='#fff'" onmouseout="this.style.background='#fff';this.style.borderColor='#e0d9ce';this.style.color=''">&#8592;</button>
                        <button id="tc-next" onclick="tcSlide(1)"  style="width:44px;height:44px;border-radius:50%;border:1.5px solid #e0d9ce;background:#fff;cursor:pointer;font-size:18px;display:flex;align-items:center;justify-content:center;transition:all .2s;" onmouseover="this.style.background='#c8622a';this.style.borderColor='#c8622a';this.style.color='#fff'" onmouseout="this.style.background='#fff';this.style.borderColor='#e0d9ce';this.style.color=''">&#8594;</button>
                    </div>
                </div>

                <!-- Loading state -->
                <div id="tc-loading" style="text-align:center;padding:60px 0;color:#aaa;">
                    <div style="width:40px;height:40px;border:3px solid #eee;border-top-color:#c8622a;border-radius:50%;animation:tcspin .7s linear infinite;margin:0 auto 12px;"></div>
                    Loading tours...
                </div>

                <!-- Carousel viewport -->
                <div id="tc-viewport" style="overflow:hidden;display:none;">
                    <div id="tc-track" style="display:flex;gap:24px;transition:transform .45s cubic-bezier(.4,0,.2,1);will-change:transform;">
                        <!-- Cards injected here -->
                    </div>
                </div>

                <!-- Dot indicators -->
                <div id="tc-dots" style="display:flex;justify-content:center;gap:8px;margin-top:28px;"></div>
            </div>
            <div class="divider"></div>
        </section>

        <style>
        @keyframes tcspin { to { transform:rotate(360deg); } }
        .tc-card {
            min-width: 0;
            flex-shrink: 0;
            border-radius: 16px;
            overflow: hidden;
            background: #fff;
            border: 1px solid #e8e0d6;
            transition: transform .25s, box-shadow .25s;
            cursor: pointer;
            text-decoration: none;
            display: block;
            color: inherit;
        }
        .tc-card:hover { transform: translateY(-6px); box-shadow: 0 18px 40px rgba(0,0,0,.10); }
        .tc-card-img {
            width: 100%;
            height: 220px;
            object-fit: cover;
            display: block;
        }
        .tc-card-body { padding: 20px 22px 22px; }
        .tc-badge {
            display: inline-block;
            padding: 3px 10px;
            border-radius: 999px;
            font-size: 11px;
            font-weight: 700;
            letter-spacing: .05em;
            text-transform: uppercase;
            margin-bottom: 10px;
        }
        .tc-badge-UPCOMING  { background:#fff3e0; color:#e65100; }
        .tc-badge-ONGOING   { background:#e8f5e9; color:#2e7d32; }
        .tc-badge-COMPLETED { background:#f0f0f0; color:#757575; }
        .tc-card-title { font-size:1rem; font-weight:700; margin:0 0 8px; line-height:1.35; }
        .tc-card-dest  { font-size:.8rem; color:#888; margin:0 0 14px; }
        .tc-card-dest span { color:#2a6e6e; font-weight:600; }
        .tc-card-meta  { display:flex; justify-content:space-between; align-items:center; border-top:1px solid #f0ebe4; padding-top:14px; }
        .tc-card-days  { font-size:.78rem; color:#999; }
        .tc-card-price { font-size:1.15rem; font-weight:800; color:#c8622a; }
        .tc-btn {
            display:block; margin-top:14px; padding:10px;
            background:#2a6e6e; color:#fff; border:none;
            border-radius:8px; font-size:.85rem; font-weight:600;
            text-align:center; cursor:pointer; transition:opacity .2s;
            text-decoration:none;
        }
        .tc-btn:hover { opacity:.85; color:#fff; }
        .tc-dot {
            width:8px; height:8px; border-radius:50%;
            background:#e0d9ce; border:none; cursor:pointer;
            transition:all .2s; padding:0;
        }
        .tc-dot.active { background:#c8622a; width:24px; border-radius:4px; }
        </style>

        <!-- About Company Section -->
        <section class="about-company-section style-two bg-secondary bg-img"
            style="background-image: url('/static/assets/shape23-BO3punaR.png')">
            <div class="divider"></div>
            <div class="container">
                <div class="row g-5 align-items-center">
                    <div class="col-12 col-lg-6">
                        <div class="about-content pe-md-5">
                            <div class="section-heading">
                                <span class="sub-title">Wander. Discover. Live.</span>
                                <h2 class="mb-4">Creating Memories with Beautiful Journeys</h2>
                                <p class="mb-5">
                                    Embark on sacred yatras and divine journeys with Ananda
                                    Holidays - your trusted partner for spiritual travel
                                    experiences that connect heart, soul, and tradition.
                                </p>
                            </div>
                            <ul class="about-list-two list-unstyled mb-5">
                                <li>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="none">
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M10 20C4.477 20 0 15.523 0 10C0 4.477 4.477 0 10 0C15.523 0 20 4.477 20 10C20 15.523 15.523 20 10 20ZM8.823 12.14L6.058 9.373L5 10.431L8.119 13.552C8.30653 13.7395 8.56084 13.8448 8.826 13.8448C9.09116 13.8448 9.34547 13.7395 9.533 13.552L15.485 7.602L14.423 6.54L8.823 12.14Z" fill="#02A5CE"></path>
                                    </svg>
                                    Adventure Awaits You
                                </li>
                                <li>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="none">
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M10 20C4.477 20 0 15.523 0 10C0 4.477 4.477 0 10 0C15.523 0 20 4.477 20 10C20 15.523 15.523 20 10 20ZM8.823 12.14L6.058 9.373L5 10.431L8.119 13.552C8.30653 13.7395 8.56084 13.8448 8.826 13.8448C9.09116 13.8448 9.34547 13.7395 9.533 13.552L15.485 7.602L14.423 6.54L8.823 12.14Z" fill="#02A5CE"></path>
                                    </svg>
                                    Experienced Tour Guides
                                </li>
                                <li>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="none">
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M10 20C4.477 20 0 15.523 0 10C0 4.477 4.477 0 10 0C15.523 0 20 4.477 20 10C20 15.523 15.523 20 10 20ZM8.823 12.14L6.058 9.373L5 10.431L8.119 13.552C8.30653 13.7395 8.56084 13.8448 8.826 13.8448C9.09116 13.8448 9.34547 13.7395 9.533 13.552L15.485 7.602L14.423 6.54L8.823 12.14Z" fill="#02A5CE"></path>
                                    </svg>
                                    Best Price Guarantee
                                </li>
                            </ul>
                            <a href="/about" class="btn btn-primary">
                                More About Us <i class="icon-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                    <div class="col-12 col-lg-6">
                        <div class="about-thumbnail">
                            <img src="/static/assets/276-CSWytjYe.png" alt="about" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="divider"></div>
        </section>

        <!-- Destination Section -->
        <section style="padding:70px 0;background:#f7f4ef;position:relative;overflow:hidden;">
            <div class="divider"></div>
            <div class="shape1" style="position:absolute;top:0;left:0;opacity:.5;pointer-events:none;"><img src="/static/assets/01-zhSTL4l3.png" alt="" /></div>
            <div class="shape2" style="position:absolute;bottom:0;right:0;opacity:.5;pointer-events:none;"><img src="/static/assets/02-BOeYn-Nv.png" alt="" /></div>

            <div class="container">

                <!-- Heading -->
                <div style="text-align:center;margin-bottom:40px;">
                    <span style="font-size:13px;font-weight:600;letter-spacing:.08em;text-transform:uppercase;color:#c8622a;">Comfort. Class. Exploration.</span>
                    <h2 style="margin:8px 0 0;font-size:clamp(1.6rem,3vw,2.2rem);font-weight:700;">Travel in Style with Ananda</h2>
                </div>

                <!-- Filter Tabs -->
                <div style="display:flex;justify-content:center;flex-wrap:wrap;gap:10px;margin-bottom:36px;" id="dc-tabs">
                    <button class="dc-tab active" data-type="ALL"      onclick="dcFilter('ALL',this)">All Tours</button>
                    <button class="dc-tab"        data-type="RELIGIOUS" onclick="dcFilter('RELIGIOUS',this)">Devotional</button>
                    <button class="dc-tab"        data-type="ADVENTURE" onclick="dcFilter('ADVENTURE',this)">Adventure</button>
                    <button class="dc-tab"        data-type="BEACH"     onclick="dcFilter('BEACH',this)">Beach</button>
                    <button class="dc-tab"        data-type="HILL_STATION" onclick="dcFilter('HILL_STATION',this)">Hill Station</button>
                    <button class="dc-tab"        data-type="HONEYMOON"  onclick="dcFilter('HONEYMOON',this)">Honeymoon</button>
                    <button class="dc-tab"        data-type="FAMILY"     onclick="dcFilter('FAMILY',this)">Family</button>
                    <button class="dc-tab"        data-type="HERITAGE"   onclick="dcFilter('HERITAGE',this)">Heritage</button>
                </div>

                <!-- Carousel controls row -->
                <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:20px;">
                    <span id="dc-count" style="font-size:13px;color:#999;"></span>
                    <div style="display:flex;gap:10px;">
                        <button id="dc-prev" onclick="dcSlide(-1)" style="width:40px;height:40px;border-radius:50%;border:1.5px solid #e0d9ce;background:#fff;cursor:pointer;font-size:16px;display:flex;align-items:center;justify-content:center;transition:all .2s;" onmouseover="this.style.background='#c8622a';this.style.borderColor='#c8622a';this.style.color='#fff'" onmouseout="this.style.background='#fff';this.style.borderColor='#e0d9ce';this.style.color=''">&#8592;</button>
                        <button id="dc-next" onclick="dcSlide(1)"  style="width:40px;height:40px;border-radius:50%;border:1.5px solid #e0d9ce;background:#fff;cursor:pointer;font-size:16px;display:flex;align-items:center;justify-content:center;transition:all .2s;" onmouseover="this.style.background='#c8622a';this.style.borderColor='#c8622a';this.style.color='#fff'" onmouseout="this.style.background='#fff';this.style.borderColor='#e0d9ce';this.style.color=''">&#8594;</button>
                    </div>
                </div>

                <!-- Loading -->
                <div id="dc-loading" style="text-align:center;padding:50px 0;color:#aaa;">
                    <div style="width:38px;height:38px;border:3px solid #eee;border-top-color:#c8622a;border-radius:50%;animation:tcspin .7s linear infinite;margin:0 auto 12px;"></div>
                    Loading tours...
                </div>

                <!-- Carousel viewport -->
                <div id="dc-viewport" style="overflow:hidden;display:none;">
                    <div id="dc-track" style="display:flex;gap:24px;transition:transform .45s cubic-bezier(.4,0,.2,1);will-change:transform;"></div>
                </div>

                <!-- Empty state -->
                <div id="dc-empty" style="display:none;text-align:center;padding:50px;color:#aaa;background:#fff;border-radius:12px;border:1px dashed #ddd;">
                    No tours found in this category.
                </div>

                <!-- Dots -->
                <div id="dc-dots" style="display:flex;justify-content:center;gap:8px;margin-top:28px;"></div>

                <!-- CTA -->
                <div style="text-align:center;margin-top:44px;">
                    <a href="/tours" class="btn btn-primary">Check All Tours <i class="icon-arrow-right"></i></a>
                </div>

            </div>
            <div class="divider"></div>
        </section>

        <style>
        .dc-tab {
            padding: 9px 22px;
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
        .dc-tab:hover { border-color: #c8622a; color: #c8622a; }
        .dc-tab.active { background: #c8622a; color: #fff; border-color: #c8622a; }
        .dc-card {
            min-width: 0;
            flex-shrink: 0;
            border-radius: 16px;
            overflow: hidden;
            background: #fff;
            border: 1px solid #e8e0d6;
            transition: transform .25s, box-shadow .25s;
            text-decoration: none;
            display: block;
            color: inherit;
        }
        .dc-card:hover { transform: translateY(-6px); box-shadow: 0 18px 40px rgba(0,0,0,.10); }
        .dc-card-img-wrap { position:relative; overflow:hidden; height:200px; }
        .dc-card-img { width:100%; height:200px; object-fit:cover; display:block; transition:transform .4s; }
        .dc-card:hover .dc-card-img { transform:scale(1.05); }
        .dc-card-type {
            position:absolute; top:12px; left:12px;
            background:rgba(0,0,0,.55); color:#fff;
            font-size:11px; font-weight:700; letter-spacing:.05em;
            text-transform:uppercase; padding:3px 10px;
            border-radius:999px; backdrop-filter:blur(4px);
        }
        .dc-card-status {
            position:absolute; top:12px; right:12px;
            font-size:11px; font-weight:700; letter-spacing:.05em;
            text-transform:uppercase; padding:3px 10px; border-radius:999px;
        }
        .dc-s-UPCOMING  { background:#fff3e0; color:#e65100; }
        .dc-s-ONGOING   { background:#e8f5e9; color:#2e7d32; }
        .dc-s-COMPLETED { background:#f0f0f0; color:#757575; }
        .dc-card-body { padding:18px 20px 20px; }
        .dc-card-title { font-size:.95rem; font-weight:700; margin:0 0 6px; line-height:1.35; color:#1a1208; }
        .dc-card-dest  { font-size:.78rem; color:#999; margin:0 0 14px; }
        .dc-card-dest b { color:#2a6e6e; font-weight:600; }
        .dc-card-footer { display:flex; justify-content:space-between; align-items:center; border-top:1px solid #f0ebe4; padding-top:12px; }
        .dc-card-meta  { font-size:.75rem; color:#bbb; line-height:1.6; }
        .dc-card-price { font-size:1.1rem; font-weight:800; color:#c8622a; }
        .dc-card-btn   { display:block; margin-top:12px; padding:9px; background:#2a6e6e; color:#fff; border:none; border-radius:8px; font-size:.82rem; font-weight:600; text-align:center; transition:opacity .2s; text-decoration:none; }
        .dc-card-btn:hover { opacity:.85; color:#fff; }
        .dc-dot {
            width:8px; height:8px; border-radius:50%;
            background:#d9d2c9; border:none; cursor:pointer;
            transition:all .2s; padding:0;
        }
        .dc-dot.active { background:#c8622a; width:24px; border-radius:4px; }
        </style>

        <!-- Choose Us Section -->
        <section class="choose-us-section-four">
            <div class="divider"></div>
            <div class="container">
                <div class="hotair-ballon" data-speed="0.8" data-lag="0">
                    <img src="/static/assets/hotair-ballon-BTZcyqQs.png" alt="balloon" />
                </div>
                <div class="choose-us-wrapper">
                    <div class="row g-4 align-items-center">
                        <div class="col-md-6">
                            <div class="choose-us-content">
                                <div class="section-heading">
                                    <span class="sub-title fadeInUp">Why Choose Us</span>
                                    <h2 class="mb-0 fadeInUp" data-delay="0.2">
                                        Turning Every Journey Into Beautiful Memories
                                    </h2>
                                </div>
                                <p class="choose-text fadeInUp" data-delay="0.3">
                                    Embark on divine journeys and sacred pilgrimages with
                                    Ananda Holidays. Experience the spiritual beauty of
                                    India's holy destinations, connect with tradition, and
                                    create meaningful, memorable travel experiences.
                                </p>
                            </div>
                        </div>
                        <div class="col-md-6 fadeInUp" data-delay="0.4">
                            <div class="choose-us-main-img">
                                <div class="choose-us-image">
                                    <img src="/static/assets/163-GeSCqKuK.jpg" alt="choose" />
                                </div>
                                <div class="choose-us-one">
                                    <img src="/static/assets/164-C2V8UI-m.jpg" alt="choose" />
                                </div>
                                <div class="choose-us-two">
                                    <img src="/static/assets/165-BoBtrJ-J.jpg" alt="choose" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="divider"></div>
        </section>

        <!-- Booking Form Section -->
        <section class="contact-section-four bg-img jarallax"
            style="background-image: url('/static/assets/168-CLAQXMIu.jpg');">
            <div class="divider"></div>
            <div class="top1"><img src="/static/assets/03-CPafVWBR.png" alt="top" /></div>
            <div class="top2"><img src="/static/assets/04-DoI1WOdK.png" alt="top" /></div>

            <div class="container pt-5 pb-5">
                <div class="contact-items">
                    <div id="formMessage" class="success-message" style="display:none;"></div>
                    <form id="bookingForm" class="contact-form-box" onsubmit="handleBookingSubmit(event)">
                        <div class="section-heading text-center mb-5">
                            <span class="sub-title text-white fadeInUp">Get in Touch</span>
                            <h2 class="text-white fadeInUp" data-delay="0.2">With Our Travel Experts</h2>
                        </div>
                        <div class="row g-4 align-items-center justify-content-center">
                            <div class="col-lg-6 col-md-6">
                                <div class="form-clt">
                                    <input type="text" id="bkName" placeholder="Your Name" required />
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <div class="form-clt">
                                    <input type="email" id="bkEmail" placeholder="Email Address" required />
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <div class="form-clt">
                                    <input type="tel" id="bkPhone" placeholder="Your Phone" required />
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <div class="form-clt">
                                    <select id="bkTourSelect" required>
                                        <option value="">Select a Tour</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <div class="form-clt">
                                    <input type="number" id="bkAdults" placeholder="Number of Adults" min="1" required />
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <div class="form-clt">
                                    <input type="number" id="bkChildren" placeholder="Number of Children" min="0" value="0" />
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-clt">
                                    <textarea id="bkMessage" placeholder="Special Requests (Optional)"></textarea>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="btn-button text-center">
                                    <button type="submit" id="submitBtn" class="btn btn-primary">
                                        Send Message <i class="icon-arrow-right"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="divider"></div>
        </section>

        <!-- Instagram Section -->
        <div class="follow-instagram-section">
            <div class="divider"></div>
            <div class="container">
                <div class="section-title"><span>Follow Instagram</span></div>
            </div>
            <div class="divider-sm"></div>
            <div class="container">
                <div class="row g-4">
                    <div class="col-6 col-sm-4 col-md-3">
                        <div class="follow-instagram-card">
                            <img src="/static/assets/30-DT8xzuM4.jpg" alt="instagram" />
                            <a href="#" class="instagram-btn"><i class="ti ti-brand-instagram"></i></a>
                        </div>
                    </div>
                    <div class="col-6 col-sm-4 col-md-3">
                        <div class="follow-instagram-card">
                            <img src="/static/assets/31-D9J9EuaO.jpg" alt="instagram" />
                            <a href="#" class="instagram-btn"><i class="ti ti-brand-instagram"></i></a>
                        </div>
                    </div>
                    <div class="col-6 col-sm-4 col-md-3">
                        <div class="follow-instagram-card">
                            <img src="/static/assets/32-9UsYD5oL.jpg" alt="instagram" />
                            <a href="#" class="instagram-btn"><i class="ti ti-brand-instagram"></i></a>
                        </div>
                    </div>
                    <div class="col-6 col-sm-4 col-md-3">
                        <div class="follow-instagram-card">
                            <img src="/static/assets/33-UYB5R0QM.jpg" alt="instagram" />
                            <a href="#" class="instagram-btn"><i class="ti ti-brand-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="divider"></div>
        </div>

        <jsp:include page="footer.jsp" />
      </div>
    </div>

    <button id="scrollTopButton" class="touria-scrolltop scrolltop-hide">
        <i class="icon-arrow-up"></i>
    </button>

    <jsp:include page="emailjs.jsp" />

<script>
    var allToursCache = [];

    // ── Utility ──
    function esc(s) {
        return s ? String(s).replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/"/g,'&quot;') : '';
    }
    function fmtPrice(p) {
        return p ? Number(p).toLocaleString('en-IN') : '0';
    }
    function fmtDate(d) {
        if (!d) return 'TBD';
        try { return new Date(d).toLocaleDateString('en-IN', {day:'2-digit',month:'short',year:'numeric'}); }
        catch(e) { return d; }
    }
    function imgUrl(tourImages) {
        return (tourImages && tourImages[0])
            ? '/uploads/tours/' + esc(tourImages[0])
            : '/static/assets/08-CuDdMt6H.png';
    }

    // ── Premier Destination Cards ──
    function buildPremierCard(t) {
        var img = imgUrl(t.tourImages);
        var badgeCls = 'tc-badge tc-badge-' + (t.status || 'UPCOMING');
        var days = (t.tourDays || 0) + 'D / ' + (t.tourNights || 0) + 'N';
        var price = 'Rs.' + fmtPrice(t.tourPrice) + '/-';
        var date = t.tourStartingDate ? fmtDate(t.tourStartingDate) : '';
        return '<a class="tc-card" href="/tour-detail?id=' + t.id + '" onclick="event.stopPropagation()">'
            + '<img class="tc-card-img" src="' + img + '" alt="' + esc(t.tourName) + '" onerror="this.src=\'/static/assets/08-CuDdMt6H.png\'">'
            + '<div class="tc-card-body">'
            + '<span class="' + badgeCls + '">' + esc(t.status || 'UPCOMING') + '</span>'
            + '<div class="tc-card-title">' + esc(t.tourName) + '</div>'
            + '<div class="tc-card-dest"><i class="ti ti-map-pin-filled" style="font-size:12px;"></i> <span>' + esc(t.tourDestination) + '</span>, ' + esc(t.tourLocation || '') + '</div>'
            + '<div class="tc-card-meta">'
            + '<span class="tc-card-days"><i class="ti ti-clock" style="font-size:12px;"></i> ' + days + (date ? ' &nbsp;|&nbsp; ' + date : '') + '</span>'
            + '<span class="tc-card-price">' + price + '</span>'
            + '</div>'
            + '<span class="tc-btn">Book Now &#8594;</span>'
            + '</div></a>';
    }

    // ── Destination Section Cards ──
    function buildDestCard(t) {
        var img = imgUrl(t.tourImages);
        var type = (t.tourType || '').replace('_', ' ');
        var statusCls = 'dc-s-' + (t.status || 'UPCOMING');
        var price = 'Rs.' + fmtPrice(t.tourPrice) + '/-';
        var days = (t.tourDays || 0) + 'D / ' + (t.tourNights || 0) + 'N';
        var date = t.tourStartingDate ? fmtDate(t.tourStartingDate) : '';
        return '<a class="dc-card" href="/tour-detail?id=' + t.id + '">'
            + '<div class="dc-card-img-wrap">'
            + '<img class="dc-card-img" src="' + img + '" alt="' + esc(t.tourName) + '" onerror="this.src=\'/static/assets/08-CuDdMt6H.png\'">'
            + (type ? '<span class="dc-card-type">' + esc(type) + '</span>' : '')
            + '<span class="dc-card-status ' + statusCls + '">' + esc(t.status || 'UPCOMING') + '</span>'
            + '</div>'
            + '<div class="dc-card-body">'
            + '<div class="dc-card-title">' + esc(t.tourName) + '</div>'
            + '<div class="dc-card-dest"><b>' + esc(t.tourDestination) + '</b>' + (t.tourLocation ? ', ' + esc(t.tourLocation) : '') + '</div>'
            + '<div class="dc-card-footer">'
            + '<div class="dc-card-meta"><div>' + days + '</div><div>' + date + '</div></div>'
            + '<div class="dc-card-price">' + price + '</div>'
            + '</div>'
            + '<span class="dc-card-btn">View Details &#8594;</span>'
            + '</div></a>';
    }

    // ── Tour Carousel State ──
    var tcTours = [];
    var tcIndex = 0;
    var tcVisible = 3;

    function tcGetVisible() {
        var w = window.innerWidth;
        if (w < 640) return 1;
        if (w < 1024) return 2;
        return 3;
    }

    function tcRender() {
        var track = document.getElementById('tc-track');
        if (!track || !tcTours.length) return;
        tcVisible = tcGetVisible();
        var cardW = (track.parentElement.offsetWidth - (tcVisible - 1) * 24) / tcVisible;
        track.querySelectorAll('.tc-card').forEach(function(c) {
            c.style.width = cardW + 'px';
            c.style.minWidth = cardW + 'px';
        });
        var offset = tcIndex * (cardW + 24);
        track.style.transform = 'translateX(-' + offset + 'px)';
        // Dots
        var dots = document.getElementById('tc-dots');
        var pages = Math.ceil(tcTours.length / tcVisible);
        var currentPage = Math.floor(tcIndex / tcVisible);
        var dh = '';
        for (var i = 0; i < pages; i++) {
            dh += '<button class="tc-dot' + (i === currentPage ? ' active' : '') + '" onclick="tcGoPage(' + i + ')"></button>';
        }
        dots.innerHTML = dh;
    }

    function tcSlide(dir) {
        var max = tcTours.length - tcVisible;
        tcIndex = Math.max(0, Math.min(tcIndex + dir, max));
        tcRender();
    }

    function tcGoPage(page) {
        tcIndex = page * tcVisible;
        var max = tcTours.length - tcVisible;
        tcIndex = Math.max(0, Math.min(tcIndex, max));
        tcRender();
    }

    window.addEventListener('resize', function() {
        dcVisible = dcGetVisible();
        dcRender();
    });
    window.addEventListener('resize', function() {
        tcVisible = tcGetVisible();
        var max = tcTours.length - tcVisible;
        if (tcIndex > max) tcIndex = Math.max(0, max);
        tcRender();
    });

    // ── Load Premier (Upcoming) Tours ──
    function loadPremierTours() {
        fetch('/api/tours/upcoming')
            .then(function(r) { return r.json(); })
            .then(function(tours) {
                document.getElementById('tc-loading').style.display = 'none';
                if (!tours || !tours.length) {
                    document.getElementById('tc-loading').innerHTML = 'No upcoming tours at the moment.';
                    document.getElementById('tc-loading').style.display = 'block';
                    return;
                }
                tcTours = tours.slice(0, 9);
                var track = document.getElementById('tc-track');
                var html = '';
                for (var i = 0; i < tcTours.length; i++) { html += buildPremierCard(tcTours[i]); }
                track.innerHTML = html;
                document.getElementById('tc-viewport').style.display = 'block';
                setTimeout(tcRender, 50);
            })
            .catch(function() {
                document.getElementById('tc-loading').textContent = 'Could not load tours.';
            });
    }

    // ── Load All Destination Tours ──
    function loadDestinationTours() {
        fetch('/api/tours')
            .then(function(r) { return r.json(); })
            .then(function(tours) {
                allToursCache = tours || [];
                document.getElementById('dc-loading').style.display = 'none';
                if (!allToursCache.length) {
                    document.getElementById('dc-empty').style.display = 'block';
                    return;
                }
                dcTours = allToursCache;
                var html = '';
                for (var i = 0; i < dcTours.length; i++) { html += buildDestCard(dcTours[i]); }
                document.getElementById('dc-track').innerHTML = html;
                document.getElementById('dc-viewport').style.display = 'block';
                setTimeout(dcRender, 50);
                loadToursDropdown(allToursCache);
            })
            .catch(function() {
                document.getElementById('dc-loading').textContent = 'Could not load tours.';
            });
    }

    // ── Destination Carousel State ──
    var dcTours = [];
    var dcIndex = 0;
    var dcVisible = 3;

    function dcGetVisible() {
        var w = window.innerWidth;
        if (w < 640) return 1;
        if (w < 1024) return 2;
        return 3;
    }

    function dcRender() {
        var track = document.getElementById('dc-track');
        if (!track) return;
        dcVisible = dcGetVisible();
        var vp = document.getElementById('dc-viewport');
        var cardW = (vp.offsetWidth - (dcVisible - 1) * 24) / dcVisible;
        track.querySelectorAll('.dc-card').forEach(function(c) {
            c.style.width = cardW + 'px';
            c.style.minWidth = cardW + 'px';
        });
        var max = Math.max(0, dcTours.length - dcVisible);
        if (dcIndex > max) dcIndex = max;
        track.style.transform = 'translateX(-' + (dcIndex * (cardW + 24)) + 'px)';
        // Dots
        var pages = Math.max(1, Math.ceil(dcTours.length / dcVisible));
        var curPage = Math.floor(dcIndex / Math.max(1, dcVisible));
        var dh = '';
        for (var i = 0; i < pages; i++) {
            dh += '<button class="dc-dot' + (i === curPage ? ' active' : '') + '" onclick="dcGoPage(' + i + ')"></button>';
        }
        document.getElementById('dc-dots').innerHTML = dh;
        // Count
        document.getElementById('dc-count').textContent = dcTours.length + ' tour' + (dcTours.length !== 1 ? 's' : '') + ' found';
    }

    function dcSlide(dir) {
        var max = Math.max(0, dcTours.length - dcVisible);
        dcIndex = Math.max(0, Math.min(dcIndex + dir, max));
        dcRender();
    }

    function dcGoPage(page) {
        dcIndex = page * dcVisible;
        dcRender();
    }

    function dcFilter(type, btn) {
        document.querySelectorAll('.dc-tab').forEach(function(t) { t.classList.remove('active'); });
        btn.classList.add('active');
        dcIndex = 0;
        dcTours = type === 'ALL' ? allToursCache : allToursCache.filter(function(t) { return t.tourType === type; });
        var track = document.getElementById('dc-track');
        var empty = document.getElementById('dc-empty');
        var vp = document.getElementById('dc-viewport');
        if (!dcTours.length) {
            vp.style.display = 'none';
            empty.style.display = 'block';
            document.getElementById('dc-dots').innerHTML = '';
            document.getElementById('dc-count').textContent = '0 tours found';
            return;
        }
        empty.style.display = 'none';
        vp.style.display = 'block';
        var html = '';
        for (var i = 0; i < dcTours.length; i++) { html += buildDestCard(dcTours[i]); }
        track.innerHTML = html;
        setTimeout(dcRender, 30);
    }

    // kept for backward compat
    function filterDestTours(type) { dcFilter(type, document.querySelector('.dc-tab[data-type="' + type + '"]')); }
    function renderDestTours(tours) { dcTours = tours; dcIndex = 0; dcFilter('ALL', document.querySelector('.dc-tab[data-type="ALL"]')); }

    // ── Booking Form Dropdown ──
    function loadToursDropdown(tours) {
        var sel = document.getElementById('bkTourSelect');
        if (!sel) return;
        var opts = '<option value="">Select a Tour</option>';
        for (var i = 0; i < tours.length; i++) {
            var t = tours[i];
            opts += '<option value="' + t.id + '">' + esc(t.tourName) + ' - Rs.' + fmtPrice(t.tourPrice) + '</option>';
        }
        sel.innerHTML = opts;
    }

    // ── Booking Submit ──
    function handleBookingSubmit(e) {
        e.preventDefault();
        var btn = document.getElementById('submitBtn');
        var msg = document.getElementById('formMessage');

        var name    = document.getElementById('bkName').value.trim();
        var email   = document.getElementById('bkEmail').value.trim();
        var phone   = document.getElementById('bkPhone').value.trim();
        var tourId  = parseInt(document.getElementById('bkTourSelect').value) || 0;
        var adults  = parseInt(document.getElementById('bkAdults').value) || 0;
        var children= parseInt(document.getElementById('bkChildren').value) || 0;
        var special = document.getElementById('bkMessage').value.trim();

        if (!name || !email || !phone || !tourId || adults < 1) {
            msg.textContent = 'Please fill all required fields.';
            msg.className = 'error-message';
            msg.style.display = 'block';
            return;
        }

        btn.disabled = true;
        btn.innerHTML = 'Sending... <i class="icon-arrow-right"></i>';
        msg.style.display = 'none';

        fetch('/api/bookings', {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({
                customerName: name, customerEmail: email, customerPhone: phone,
                numberOfAdults: adults, numberOfChildren: children,
                tourId: tourId, specialRequests: special
            })
        })
        .then(function(r) { if (!r.ok) throw new Error('err'); return r.json(); })
        .then(function() {
            msg.textContent = 'Booking successful! Check your email for confirmation.';
            msg.className = 'success-message';
            msg.style.display = 'block';
            document.getElementById('bookingForm').reset();
            setTimeout(function() { msg.style.display = 'none'; }, 5000);
        })
        .catch(function() {
            msg.textContent = 'Booking failed. Please try again.';
            msg.className = 'error-message';
            msg.style.display = 'block';
        })
        .finally(function() {
            btn.disabled = false;
            btn.innerHTML = 'Send Message <i class="icon-arrow-right"></i>';
        });
    }

    // ── Init ──
    loadPremierTours();
    loadDestinationTours();
</script>
</body>
</html>
