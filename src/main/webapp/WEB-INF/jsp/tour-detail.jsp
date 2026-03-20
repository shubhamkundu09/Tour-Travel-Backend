<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" data-theme="three">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Tour Details - Ananda Holidays</title>

    <link rel="stylesheet" crossorigin href="/static/assets/main-DDi0A8kK.css" />
    <script type="module" crossorigin src="/static/assets/main-C7XYgASq.js"></script>

    <style>
        .tour-img-main {
            width: 100%;
            height: 420px;
            object-fit: cover;
            border-radius: 10px;
        }
        .tour-thumb-row {
            display: flex;
            gap: 10px;
            margin-top: 12px;
            flex-wrap: wrap;
        }
        .tour-thumb-row img {
            width: 90px;
            height: 65px;
            object-fit: cover;
            border-radius: 6px;
            cursor: pointer;
            border: 2px solid transparent;
            transition: border-color .2s;
        }
        .tour-thumb-row img.active,
        .tour-thumb-row img:hover { border-color: #c8622a; }

        /* Status badge */
        .tour-status-pill {
            display: inline-block;
            padding: 4px 14px;
            border-radius: 999px;
            font-size: 12px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: .05em;
            margin-bottom: 10px;
        }
        .pill-UPCOMING  { background: #fff3e0; color: #e65100; }
        .pill-ONGOING   { background: #e8f5e9; color: #2e7d32; }
        .pill-COMPLETED { background: #f0f0f0; color: #757575; }

        /* Inclusion / Exclusion lists */
        .inc-exc-list li {
            padding: 5px 0;
            border-bottom: 1px solid #f0f0f0;
        }
        .inc-exc-list li:last-child { border-bottom: none; }

        /* Booking form */
        .booking-form-box {
            background: #fff;
            border: 1px solid #eee;
            border-radius: 12px;
            padding: 28px 24px;
            box-shadow: 0 4px 20px rgba(0,0,0,.06);
        }
        .booking-form-box .form-control {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 10px 14px;
            font-size: 14px;
            width: 100%;
            background: #fafafa;
            margin-bottom: 14px;
        }
        .booking-form-box .form-control:focus {
            border-color: #c8622a;
            outline: none;
            background: #fff;
        }
        .booking-form-box select.form-control { cursor: pointer; }
        .booking-form-box textarea.form-control { resize: vertical; min-height: 80px; }
        .price-display {
            background: linear-gradient(135deg, #c8622a, #e8843a);
            color: #fff;
            border-radius: 10px;
            padding: 16px 20px;
            margin-bottom: 20px;
            text-align: center;
        }
        .price-display .amount { font-size: 2rem; font-weight: 800; }
        .price-display .per { font-size: 13px; opacity: .85; }

        /* Map widget */
        .map-widget iframe {
            width: 100%;
            height: 250px;
            border: none;
            border-radius: 10px;
        }

        /* Toast */
        .toast-msg {
            position: fixed;
            bottom: 30px;
            right: 30px;
            padding: 14px 24px;
            border-radius: 10px;
            font-size: 14px;
            font-weight: 500;
            z-index: 9999;
            display: none;
            box-shadow: 0 4px 20px rgba(0,0,0,.15);
        }
        .toast-success { background: #e8f5e9; color: #2e7d32; border: 1px solid #c8e6c9; }
        .toast-error   { background: #ffebee; color: #c62828; border: 1px solid #ffcdd2; }

        /* Loading skeleton */
        .skeleton {
            background: linear-gradient(90deg, #f0f0f0 25%, #e0e0e0 50%, #f0f0f0 75%);
            background-size: 200% 100%;
            animation: shimmer 1.4s infinite;
            border-radius: 8px;
        }
        @keyframes shimmer { to { background-position: -200% 0; } }

        /* Services tags */
        .service-tags { display: flex; flex-wrap: wrap; gap: 8px; margin-top: 10px; }
        .service-tag {
            background: #f5f5f5;
            border: 1px solid #e0e0e0;
            border-radius: 6px;
            padding: 4px 12px;
            font-size: 12px;
            color: #555;
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
                    <h2 id="breadcrumbTitle">Tour Details</h2>
                    <ul class="list-unstyled">
                        <li><a href="/index">Home</a></li>
                        <li><a href="/tours">Tours</a></li>
                        <li id="breadcrumbTourName">Tour Details</li>
                    </ul>
                </div>
            </div>
            <div class="divider"></div>
        </div>

        <!-- Tour Details Section -->
        <div class="tour-details-section">
            <div class="divider"></div>
            <div class="container">

                <!-- Header -->
                <div class="tour-details-header d-flex flex-wrap gap-4 align-items-end justify-content-between">
                    <div>
                        <span class="tour-status-pill" id="statusPill"></span>
                        <h2 class="mb-2" id="tourTitle">
                            <span class="skeleton" style="width:300px;height:36px;display:inline-block;"></span>
                        </h2>
                        <p class="mb-0 d-flex flex-wrap align-items-center gap-2">
                            <span id="tourLocation" style="color:#888;"><i class="ti ti-map-pin text-primary"></i> &nbsp;</span>
                        </p>
                    </div>
                    <div>
                        <a href="/tours" class="btn btn-share">All Tours <i class="ti ti-list"></i></a>
                    </div>
                </div>

                <div class="divider-sm"></div>

                <!-- Meta bar -->
                <div class="tour-details-meta">
                    <div class="divider-sm"></div>
                    <div class="d-flex flex-wrap align-items-center justify-content-between gap-4">

                        <div class="tour-single-meta">
                            <div class="icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40" fill="none">
                                    <path d="M20.0766 3.12502C19.6446 3.1219 19.2922 3.46955 19.2891 3.9008C19.286 4.33205 19.6328 4.6844 20.0649 4.68752C20.4961 4.69065 20.8485 4.34377 20.8516 3.91252C20.8547 3.48127 20.5078 3.12893 20.0766 3.12502Z" fill="#3CB371"/>
                                    <path d="M20.0411 7.81288C17.0246 7.79148 14.5542 10.225 14.5314 13.2406C14.5087 16.2559 16.9435 18.7275 19.9591 18.7503C19.9731 18.7503 19.987 18.7504 20.0009 18.7504C22.9973 18.7504 25.4461 16.3242 25.4688 13.3226C25.4915 10.3073 23.0567 7.83562 20.0411 7.81288ZM20.0008 17.188C19.9909 17.188 19.9806 17.1879 19.9708 17.1878C17.8168 17.1716 16.0776 15.4061 16.0938 13.2523C16.11 11.1081 17.8591 9.37515 19.9994 9.37515C20.0092 9.37515 20.0195 9.37523 20.0294 9.37531C22.1834 9.39156 23.9226 11.157 23.9063 13.3109C23.8901 15.455 22.1411 17.188 20.0008 17.188Z" fill="#3CB371"/>
                                    <path d="M23.4097 3.717C23.0033 3.57279 22.5565 3.78568 22.4123 4.1924C22.2681 4.59912 22.481 5.0456 22.8877 5.18982C26.3288 6.40943 28.6222 9.68686 28.5947 13.3452C28.5915 13.7766 28.9386 14.1291 29.3701 14.1323C29.3721 14.1323 29.3741 14.1323 29.3761 14.1323C29.8047 14.1323 30.1539 13.7864 30.1572 13.3569C30.1897 9.03295 27.4781 5.15896 23.4097 3.717Z" fill="#3CB371"/>
                                    <path d="M24.7938 29.4096C29.9902 22.7209 33.2376 19.233 33.2814 13.3811C33.3364 6.01837 27.3613 0 19.9991 0C12.7228 0 6.77451 5.89282 6.7192 13.1819C6.67451 19.1925 9.98225 22.6756 15.2144 29.4085C10.0094 30.1863 6.7192 32.1408 6.7192 34.5313C6.7192 36.1327 8.19936 37.5696 10.8871 38.5774C13.3334 39.4948 16.5699 40 20.0003 40C23.4307 40 26.6672 39.4948 29.1135 38.5774C31.8013 37.5695 33.2814 36.1326 33.2814 34.5312C33.2814 32.142 29.9943 30.188 24.7938 29.4096ZM8.28162 13.1937C8.33037 6.76173 13.5784 1.5625 19.9992 1.5625C26.496 1.5625 31.7675 6.87408 31.719 13.3695C31.6775 18.9268 28.2335 22.3516 22.7353 29.519C21.7546 30.7969 20.854 32.005 20.0015 33.1868C19.1515 32.0043 18.2688 30.8178 17.2734 29.5186C11.548 22.0511 8.23928 18.8851 8.28162 13.1937ZM20.0003 38.4376C13.2932 38.4376 8.28162 36.3753 8.28162 34.5313C8.28162 33.1638 11.2776 31.4363 16.3149 30.8381C17.4284 32.2991 18.4047 33.6265 19.3622 34.9821C19.5084 35.1891 19.7461 35.3124 19.9996 35.3126C19.9998 35.3126 20.0001 35.3126 20.0003 35.3126C20.2536 35.3126 20.4912 35.1898 20.6377 34.9831C21.5861 33.6451 22.5891 32.2851 23.6931 30.839C28.7257 31.4378 31.719 33.1648 31.719 34.5314C31.7189 36.3753 26.7074 38.4376 20.0003 38.4376Z" fill="#3CB371"/>
                                </svg>
                            </div>
                            <div>
                                <h4>Destination</h4>
                                <p class="mb-0" id="metaDest">—</p>
                            </div>
                        </div>

                        <div class="tour-single-meta">
                            <div class="icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40" fill="none">
                                    <path d="M35.7321 7.65131H36.968C37.3991 7.65131 37.7487 7.30169 37.7487 6.87057C37.7487 6.43945 37.3991 6.08983 36.968 6.08983H34.0012C33.5701 6.08983 33.2205 6.43945 33.2205 6.87057V9.83737C33.2205 10.2685 33.5701 10.6181 34.0012 10.6181C34.4323 10.6181 34.7819 10.2685 34.7819 9.83737V8.97833C37.1509 12.1498 38.4385 15.9978 38.4385 20C38.4385 30.1671 30.1671 38.4385 20 38.4385C9.83292 38.4385 1.56148 30.1671 1.56148 20C1.56148 9.83292 9.83292 1.56148 20 1.56148C20.7519 1.56148 21.5087 1.60715 22.2495 1.69717C22.6769 1.74885 23.0667 1.44444 23.1187 1.01636C23.1708 0.588364 22.866 0.199088 22.4379 0.147091C21.6349 0.0494988 20.8147 0 20 0C14.6578 0 9.63532 2.08035 5.85787 5.85787C2.08035 9.63532 0 14.6578 0 20C0 25.3422 2.08035 30.3647 5.85787 34.1421C9.63532 37.9196 14.6578 40 20 40C25.3422 40 30.3647 37.9196 34.1421 34.1421C37.9196 30.3647 40 25.3422 40 20C40 15.4919 38.494 11.1642 35.7321 7.65131Z" fill="#3CB371"/>
                                    <path d="M16.0868 14.9821C15.7818 14.6773 15.2876 14.6773 14.9826 14.9821C14.6777 15.2869 14.6777 15.7813 14.9826 16.0863L17.6286 18.7323C17.4258 19.1101 17.3105 19.5417 17.3105 19.9996C17.3105 21.4827 18.517 22.6893 20.0001 22.6893C21.4832 22.6893 22.6898 21.4827 22.6898 19.9996C22.6898 19.5417 22.5744 19.1101 22.3717 18.7323L27.7106 13.3933C28.0155 13.0885 28.0155 12.5941 27.7106 12.2891C27.4057 11.9843 26.9115 11.9843 26.6064 12.2891L21.2675 17.6281C20.8896 17.4253 20.4581 17.31 20.0001 17.31C19.5422 17.31 19.1106 17.4254 18.7328 17.6281L16.0868 14.9821ZM21.1283 19.9996C21.1283 20.6217 20.6222 21.1278 20.0001 21.1278C19.378 21.1278 18.872 20.6217 18.872 19.9996C18.872 19.3775 19.378 18.8715 20.0001 18.8715C20.6222 18.8715 21.1283 19.3775 21.1283 19.9996Z" fill="#3CB371"/>
                                </svg>
                            </div>
                            <div>
                                <h4>Tour Type</h4>
                                <p class="mb-0" id="metaType">—</p>
                            </div>
                        </div>

                        <div class="tour-single-meta">
                            <div class="icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40" fill="none">
                                    <path d="M35.7321 7.65131H36.968C37.3991 7.65131 37.7487 7.30169 37.7487 6.87057C37.7487 6.43945 37.3991 6.08983 36.968 6.08983H34.0012C33.5701 6.08983 33.2205 6.43945 33.2205 6.87057V9.83737C33.2205 10.2685 33.5701 10.6181 34.0012 10.6181C34.4323 10.6181 34.7819 10.2685 34.7819 9.83737V8.97833C37.1509 12.1498 38.4385 15.9978 38.4385 20C38.4385 30.1671 30.1671 38.4385 20 38.4385C9.83292 38.4385 1.56148 30.1671 1.56148 20C1.56148 9.83292 9.83292 1.56148 20 1.56148C20.7519 1.56148 21.5087 1.60715 22.2495 1.69717C22.6769 1.74885 23.0667 1.44444 23.1187 1.01636C23.1708 0.588364 22.866 0.199088 22.4379 0.147091C21.6349 0.0494988 20.8147 0 20 0C14.6578 0 9.63532 2.08035 5.85787 5.85787C2.08035 9.63532 0 14.6578 0 20C0 25.3422 2.08035 30.3647 5.85787 34.1421C9.63532 37.9196 14.6578 40 20 40C25.3422 40 30.3647 37.9196 34.1421 34.1421C37.9196 30.3647 40 25.3422 40 20C40 15.4919 38.494 11.1642 35.7321 7.65131Z" fill="#3CB371"/>
                                </svg>
                            </div>
                            <div>
                                <h4>Duration</h4>
                                <p class="mb-0" id="metaDuration">—</p>
                            </div>
                        </div>

                        <div class="tour-single-meta">
                            <div class="icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40" fill="none">
                                    <path d="M35.7321 7.65131H36.968C37.3991 7.65131 37.7487 7.30169 37.7487 6.87057C37.7487 6.43945 37.3991 6.08983 36.968 6.08983H34.0012C33.5701 6.08983 33.2205 6.43945 33.2205 6.87057V9.83737C33.2205 10.2685 33.5701 10.6181 34.0012 10.6181C34.4323 10.6181 34.7819 10.2685 34.7819 9.83737V8.97833C37.1509 12.1498 38.4385 15.9978 38.4385 20C38.4385 30.1671 30.1671 38.4385 20 38.4385C9.83292 38.4385 1.56148 30.1671 1.56148 20C1.56148 9.83292 9.83292 1.56148 20 1.56148C20.7519 1.56148 21.5087 1.60715 22.2495 1.69717C22.6769 1.74885 23.0667 1.44444 23.1187 1.01636C23.1708 0.588364 22.866 0.199088 22.4379 0.147091C21.6349 0.0494988 20.8147 0 20 0C14.6578 0 9.63532 2.08035 5.85787 5.85787C2.08035 9.63532 0 14.6578 0 20C0 25.3422 2.08035 30.3647 5.85787 34.1421C9.63532 37.9196 14.6578 40 20 40C25.3422 40 30.3647 37.9196 34.1421 34.1421C37.9196 30.3647 40 25.3422 40 20C40 15.4919 38.494 11.1642 35.7321 7.65131Z" fill="#3CB371"/>
                                </svg>
                            </div>
                            <div>
                                <h4>Dates</h4>
                                <p class="mb-0" id="metaDates">—</p>
                            </div>
                        </div>

                        <a href="#bookingForm" class="btn btn-primary" id="priceBtn">
                            Book Now <i class="icon-arrow-right"></i>
                        </a>
                    </div>
                    <div class="divider-sm"></div>
                </div>

                <div class="divider-sm"></div>

                <div class="row g-5">
                    <!-- Left: Content -->
                    <div class="col-12 col-lg-8">
                        <div class="tour-details-content">

                            <!-- Main Image + Thumbnails -->
                            <div id="imageGallery" style="margin-bottom:28px;">
                                <div class="skeleton" style="width:100%;height:420px;border-radius:10px;"></div>
                            </div>

                            <!-- Overview -->
                            <h2>Overview</h2>
                            <p id="tourDescription" style="color:#666;line-height:1.8;">
                                <span class="skeleton" style="width:100%;height:80px;display:block;"></span>
                            </p>

                            <!-- Helpline -->
                            <div id="helplineBlock" style="display:none;margin:16px 0;padding:12px 18px;background:#fff8f5;border:1px solid #fddbc8;border-radius:8px;">
                                <i class="ti ti-phone-call" style="color:#c8622a;"></i>
                                <strong style="color:#c8622a;"> Helpline: </strong>
                                <span id="helplineNum" style="font-weight:600;"></span>
                            </div>

                            <!-- Inclusions -->
                            <div id="inclusionsBlock" style="display:none;">
                                <h2>Inclusions</h2>
                                <ul class="list-unstyled inc-exc-list" id="inclusionsList"></ul>
                            </div>

                            <!-- Exclusions -->
                            <div id="exclusionsBlock" style="display:none;">
                                <h2>Exclusions</h2>
                                <ul class="list-unstyled inc-exc-list" id="exclusionsList"></ul>
                            </div>

                            <!-- Services -->
                            <div id="servicesBlock" style="display:none;">
                                <h2>Services Included</h2>
                                <div class="service-tags" id="servicesList"></div>
                            </div>

                            <!-- Tour Images Grid -->
                            <div id="imagesGridBlock" style="display:none;margin-top:28px;">
                                <h2>Tour Gallery</h2>
                                <div class="row g-3" id="imagesGrid"></div>
                            </div>

                        </div>
                        <div class="divider-sm"></div>
                    </div>

                    <!-- Right: Booking + Map -->
                    <div class="col-12 col-lg-4">
                        <div class="d-flex flex-column gap-4">

                            <!-- Booking Widget -->
                            <div class="booking-form-box">
                                <div class="price-display">
                                    <div class="per">Price Per Adult</div>
                                    <div class="amount" id="priceDisplay">—</div>
                                </div>

                                <div class="h4 fw-bold mb-3">Book This Tour</div>

                                <div id="bookingMsg" style="display:none;padding:10px 14px;border-radius:8px;margin-bottom:14px;font-size:13px;font-weight:500;"></div>

                                <form id="bookingForm" onsubmit="submitBooking(event)">
                                    <input type="hidden" id="hiddenTourId" value="">

                                    <input type="text" class="form-control" id="bName" placeholder="Your Full Name" required>
                                    <input type="email" class="form-control" id="bEmail" placeholder="Email Address" required>
                                    <input type="tel" class="form-control" id="bPhone" placeholder="Phone Number" required>
                                    <input type="number" class="form-control" id="bAdults" placeholder="Number of Adults" min="1" value="1" required>
                                    <input type="number" class="form-control" id="bChildren" placeholder="Number of Children" min="0" value="0">
                                    <textarea class="form-control" id="bRequests" placeholder="Special Requests (Optional)"></textarea>

                                    <button type="submit" class="btn btn-primary w-100" id="bookBtn">
                                        Confirm Booking <i class="icon-arrow-right"></i>
                                    </button>
                                </form>
                            </div>

                            <!-- Map Widget -->
                            <div class="map-widget" id="mapWidget" style="display:none;">
                                <iframe id="mapFrame" allowfullscreen loading="lazy"
                                    referrerpolicy="no-referrer-when-downgrade"></iframe>
                            </div>

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

    <!-- Toast -->
    <div class="toast-msg" id="toast"></div>

    <jsp:include page="emailjs.jsp" />

<script>
    // ── Get tour ID from URL query param ──
    function getQueryParam(name) {
        var url = window.location.search;
        var params = new URLSearchParams(url);
        return params.get(name);
    }

    var tourId = getQueryParam('id');

    // ── Redirect if no ID ──
    if (!tourId) {
        window.location.href = '/tours';
    }

    // ── Utility ──
    function esc(s) {
        return s ? String(s).replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/"/g,'&quot;') : '';
    }

    function showToast(msg, type) {
        var t = document.getElementById('toast');
        t.textContent = msg;
        t.className = 'toast-msg ' + (type === 'success' ? 'toast-success' : 'toast-error');
        t.style.display = 'block';
        setTimeout(function() { t.style.display = 'none'; }, 4000);
    }

    // ── Load Tour ──
    function loadTour() {
        fetch('/api/tours/' + tourId)
            .then(function(r) { if (!r.ok) throw new Error('not found'); return r.json(); })
            .then(function(tour) { renderTour(tour); })
            .catch(function() {
                document.querySelector('.tour-details-section').innerHTML =
                    '<div style="text-align:center;padding:80px 20px;color:#aaa;">'
                    + '<h3>Tour not found</h3><p>The tour you are looking for does not exist.</p>'
                    + '<a href="/tours" class="btn btn-primary">Browse Tours</a></div>';
            });
    }

    function renderTour(t) {
        // Page title
        document.title = esc(t.tourName) + ' - Ananda Holidays';

        // Breadcrumb
        document.getElementById('breadcrumbTitle').textContent = t.tourName || 'Tour Details';
        document.getElementById('breadcrumbTourName').textContent = t.tourName || 'Tour Details';

        // Header
        document.getElementById('tourTitle').textContent = t.tourName || '';
        document.getElementById('tourLocation').innerHTML = '<i class="ti ti-map-pin text-primary"></i> ' + esc(t.tourLocation || t.tourDestination);

        // Status badge
        var pill = document.getElementById('statusPill');
        pill.textContent = t.status || '';
        pill.className = 'tour-status-pill pill-' + (t.status || 'UPCOMING');

        // Meta bar
        document.getElementById('metaDest').textContent = t.tourDestination || '—';
        document.getElementById('metaType').textContent = (t.tourType || '').replace('_', ' ') || '—';
        document.getElementById('metaDuration').textContent = (t.tourDays || 0) + ' Days / ' + (t.tourNights || 0) + ' Nights';
        document.getElementById('metaDates').textContent = (t.tourStartingDate || '') + ' to ' + (t.tourEndingDate || '');

        // Price
        var price = 'Rs.' + Number(t.tourPrice).toLocaleString('en-IN') + '/-';
        document.getElementById('priceDisplay').textContent = price;
        document.getElementById('priceBtn').textContent = price + ' Per Person';
        document.getElementById('priceBtn').innerHTML = price + ' Per Person <i class="icon-arrow-right"></i>';

        // Hidden tour ID for booking form
        document.getElementById('hiddenTourId').value = t.id;

        // Description
        var desc = document.getElementById('tourDescription');
        desc.textContent = t.tourDescription || 'Explore this amazing tour with Ananda Holidays.';

        // Helpline
        if (t.tourHelplineNumber) {
            document.getElementById('helplineNum').textContent = t.tourHelplineNumber;
            document.getElementById('helplineBlock').style.display = 'block';
        }

        // Images
        renderGallery(t.tourImages || []);

        // Inclusions
        renderList('inclusionsBlock', 'inclusionsList', t.tourInclusions || [], 'ti-rosette-discount-check');

        // Exclusions
        renderList('exclusionsBlock', 'exclusionsList', t.tourExclusions || [], 'ti-x');

        // Services
        if (t.tourServices && t.tourServices.length > 0) {
            document.getElementById('servicesBlock').style.display = 'block';
            var svc = document.getElementById('servicesList');
            var sh = '';
            for (var i = 0; i < t.tourServices.length; i++) {
                sh += '<span class="service-tag"><i class="ti ti-check" style="color:#2e7d32;"></i> ' + esc(t.tourServices[i]) + '</span>';
            }
            svc.innerHTML = sh;
        }

        // Map
        if (t.tourMapEmbedUrl) {
            document.getElementById('mapWidget').style.display = 'block';
            document.getElementById('mapFrame').src = t.tourMapEmbedUrl;
        }
    }

    function renderGallery(images) {
        var galleryEl = document.getElementById('imageGallery');
        if (!images || images.length === 0) {
            galleryEl.innerHTML = '<img src="/static/assets/08-CuDdMt6H.png" class="tour-img-main" alt="Tour">';
            return;
        }

        var mainSrc = '/uploads/tours/' + esc(images[0]);
        var html = '<img id="mainImg" src="' + mainSrc + '" class="tour-img-main" alt="Tour" '
            + 'onerror="this.src=\'assets/08-CuDdMt6H.png\'">';

        if (images.length > 1) {
            html += '<div class="tour-thumb-row">';
            for (var i = 0; i < images.length; i++) {
                var src = '/uploads/tours/' + esc(images[i]);
                var active = i === 0 ? ' active' : '';
                html += '<img src="' + src + '" class="' + active + '" '
                    + 'onclick="switchMainImg(this,\'' + src + '\')" '
                    + 'onerror="this.style.display=\'none\'" alt="img' + i + '">';
            }
            html += '</div>';
        }

        galleryEl.innerHTML = html;

        // Gallery grid (all images in content area)
        if (images.length > 1) {
            document.getElementById('imagesGridBlock').style.display = 'block';
            var grid = document.getElementById('imagesGrid');
            var gh = '';
            for (var j = 0; j < images.length; j++) {
                var gsrc = '/uploads/tours/' + esc(images[j]);
                gh += '<div class="col-6"><img src="' + gsrc + '" style="width:100%;height:180px;object-fit:cover;border-radius:8px;" '
                    + 'onerror="this.parentElement.style.display=\'none\'" alt="img"></div>';
            }
            grid.innerHTML = gh;
        }
    }

    function switchMainImg(thumb, src) {
        document.getElementById('mainImg').src = src;
        document.querySelectorAll('.tour-thumb-row img').forEach(function(img) { img.classList.remove('active'); });
        thumb.classList.add('active');
    }

    function renderList(blockId, listId, items, icon) {
        if (!items || items.length === 0) return;
        document.getElementById(blockId).style.display = 'block';
        var el = document.getElementById(listId);
        var h = '';
        for (var i = 0; i < items.length; i++) {
            h += '<li><i class="ti ' + icon + '" style="color:#c8622a;margin-right:8px;"></i>' + esc(items[i]) + '</li>';
        }
        el.innerHTML = h;
    }

    // ── Booking Submit ──
    function submitBooking(e) {
        e.preventDefault();
        var btn = document.getElementById('bookBtn');
        var msg = document.getElementById('bookingMsg');

        var name    = document.getElementById('bName').value.trim();
        var email   = document.getElementById('bEmail').value.trim();
        var phone   = document.getElementById('bPhone').value.trim();
        var adults  = parseInt(document.getElementById('bAdults').value) || 0;
        var children= parseInt(document.getElementById('bChildren').value) || 0;
        var special = document.getElementById('bRequests').value.trim();
        var tId     = parseInt(document.getElementById('hiddenTourId').value) || 0;

        if (!name || !email || !phone || adults < 1 || !tId) {
            msg.textContent = 'Please fill all required fields.';
            msg.style.display = 'block';
            msg.style.background = '#ffebee';
            msg.style.color = '#c62828';
            return;
        }

        btn.disabled = true;
        btn.innerHTML = 'Processing... <i class="icon-arrow-right"></i>';
        msg.style.display = 'none';

        var payload = {
            customerName: name,
            customerEmail: email,
            customerPhone: phone,
            numberOfAdults: adults,
            numberOfChildren: children,
            tourId: tId,
            specialRequests: special
        };

        fetch('/api/bookings', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(payload)
        })
        .then(function(r) { if (!r.ok) throw new Error('err'); return r.json(); })
        .then(function() {
            msg.textContent = 'Booking confirmed! Check your email for details.';
            msg.style.display = 'block';
            msg.style.background = '#e8f5e9';
            msg.style.color = '#2e7d32';
            document.getElementById('bookingForm').reset();
            document.getElementById('hiddenTourId').value = tourId;
            showToast('Booking confirmed! Check your email.', 'success');
        })
        .catch(function() {
            msg.textContent = 'Booking failed. Please try again or call us.';
            msg.style.display = 'block';
            msg.style.background = '#ffebee';
            msg.style.color = '#c62828';
            showToast('Booking failed. Please try again.', 'error');
        })
        .finally(function() {
            btn.disabled = false;
            btn.innerHTML = 'Confirm Booking <i class="icon-arrow-right"></i>';
        });
    }

    loadTour();
</script>
</body>
</html>
