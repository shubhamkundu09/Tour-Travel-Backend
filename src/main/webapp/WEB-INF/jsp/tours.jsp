<!DOCTYPE html>
<html lang="en" data-theme="three">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Ananda Holidays - Tour List</title>

    <!-- FIX: Added context path to static resources -->
    <script type="module" crossorigin src="${pageContext.request.contextPath}/static/assets/main-C7XYgASq.js"></script>
    <link rel="stylesheet" crossorigin href="${pageContext.request.contextPath}/static/assets/main-DDi0A8kK.css" />
    <style>
      .destination-image {
        width: 100%;
        height: 450px;
        /* 🔹 Set fixed height for all images */
        overflow: hidden;
        border-radius: 10px;
      }

      .destination-image img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        /* 🔹 Keeps aspect ratio, crops excess */
        display: block;
      }

      .destination-content {
        text-align: center;
      }

      .destination-content ul {
        justify-content: center;
      }

      .destination-rattiing {
        justify-content: center;
      }
    </style>
  </head>

  <body>
    <!-- ====== Preloader ====== -->
    <div class="preloader" id="preloader">
      <div class="spinner-grow" role="status">
        <span class="visually-hidden">Loading...</span>
      </div>
    </div>

    <!-- ====== Popup Video Container ====== -->
    <div id="videoPopup" class="video-popup-iframe">
      <div class="video-content">
        <span class="close-btn" id="videoCloseButton"
          ><i class="ti ti-x"></i
        ></span>
        <div class="ratio ratio-16x9">
          <iframe id="videoFrame" allowfullscreen></iframe>
        </div>
      </div>
    </div>

     <%@ include file="rightsideoffcanvas.jsp" %>
        <%@ include file="header.jsp" %>

    <!-- ====== Smooth Wrapper ====== -->
    <div id="smooth-wrapper">
      <div id="smooth-content">
        <!-- ====== Breadcrumb Section ====== -->
        <div
          class="breadcrumb-section bg-img jarallax"
          style="background-image: url('${pageContext.request.contextPath}/static/assets/97-4pYTyMSj.jpg')"
        >
          <div class="container">
            <!-- Breadcrumb Content -->
            <div class="breadcrumb-content">
              <div class="divider"></div>
              <h2>Tour List</h2>
              <ul class="list-unstyled">
                <li><a href="/index">Home</a></li>
                <li>Tour List</li>
              </ul>
            </div>
          </div>

          <!-- Divider -->
          <div class="divider"></div>
        </div>

        <!-- ====== Tour List Section ====== -->
        <section class="tour-list-section">
          <!-- Divider -->
          <div class="divider"></div>

          <div class="container">
            <div class="row g-4">
              <div class="col-12">
                <div class="tour-list-content">
                  <div class="row g-4">
                    <!-- Trip Card -->
                    <div class="col-12 col-lg-4">
                      <div class="trip-card fadeInUp" data-delay="0.2">
                        <img src="${pageContext.request.contextPath}/static/shubham/dodham.webp" alt="shubham" />
                        <!-- Trip Body -->
                        <div class="trip-body">
                          <h4 class="mb-4 trip-title">Do Dham Yatra</h4>
                          <!-- Trip Meta -->
                          <div
                            class="trip-meta d-flex align-items-center justify-content-between gap-3 gap-xxl-4"
                          >
                            <ul class="list-unstyled d-flex flex-column gap-3">
                              <li>
                                <i class="ti ti-map-pin-filled"></i> Do Dham
                              </li>
                              <li>
                                <i class="ti ti-clock"></i> 6 Days - 5 Nights
                              </li>
                            </ul>
                            <div class="line"></div>
                            <div class="text-end">
                              <h2 class="mb-0 trip-price">31797/-</h2>
                            </div>
                          </div>
                          <!-- Button -->
                          <a
                            href="/tour-dodham"
                            class="btn btn-light w-100"
                            >Book Now</a
                          >
                        </div>
                      </div>
                    </div>
                    <!-- Trip Card -->
                    <div class="col-12 col-lg-4">
                      <div class="trip-card fadeInUp" data-delay="0.2">
                        <img src="${pageContext.request.contextPath}/static/shubham/dodham.webp" alt="shubham" />
                        <!-- Trip Body -->
                        <div class="trip-body">
                          <h4 class="mb-4 trip-title">Char Dham Yatra</h4>
                          <!-- Trip Meta -->
                          <div
                            class="trip-meta d-flex align-items-center justify-content-between gap-3 gap-xxl-4"
                          >
                            <ul class="list-unstyled d-flex flex-column gap-3">
                              <li>
                                <i class="ti ti-map-pin-filled"></i> Char Dham
                              </li>
                              <li><i class="ti ti-clock"></i> 11 Days</li>
                            </ul>
                            <div class="line"></div>
                            <div class="text-end">
                              <h2 class="mb-0 trip-price">41951/-</h2>
                            </div>
                          </div>
                          <!-- Button -->
                          <a
                            href="/tour-chardham"
                            class="btn btn-light w-100"
                            >Book Now</a
                          >
                        </div>
                      </div>
                    </div>
                    <!-- Trip Card -->
                    <div class="col-12 col-lg-4">
                      <div class="trip-card fadeInUp" data-delay="0.2">
                        <img src="${pageContext.request.contextPath}/static/shubham/dubai.jpg" alt="shubham" />
                        <!-- Trip Body -->
                        <div class="trip-body">
                          <h4 class="mb-4 trip-title">Dubai Group Tour</h4>
                          <!-- Trip Meta -->
                          <div
                            class="trip-meta d-flex align-items-center justify-content-between gap-3 gap-xxl-4"
                          >
                            <ul class="list-unstyled d-flex flex-column gap-3">
                              <li>
                                <i class="ti ti-map-pin-filled"></i> Dubai
                              </li>
                              <li>
                                <i class="ti ti-clock"></i> 6 Days - 5 Nights
                              </li>
                            </ul>
                            <div class="line"></div>
                            <div class="text-end">
                              <h2 class="mb-0 trip-price">79999/-</h2>
                            </div>
                          </div>
                          <!-- Button -->
                          <a
                            href="/tour-dubai"
                            class="btn btn-light w-100"
                            >Book Now</a
                          >
                        </div>
                      </div>
                    </div>
                    <!-- Trip Card -->
                    <div class="col-12 col-lg-4">
                      <div class="trip-card fadeInUp" data-delay="0.2">
                        <img src="${pageContext.request.contextPath}/static/shubham/gujrat.jpg" alt="shubham" />
                        <!-- Trip Body -->
                        <div class="trip-body">
                          <h4 class="mb-4 trip-title">Gujrat Group Tour</h4>
                          <!-- Trip Meta -->
                          <div
                            class="trip-meta d-flex align-items-center justify-content-between gap-3 gap-xxl-4"
                          >
                            <ul class="list-unstyled d-flex flex-column gap-3">
                              <li>
                                <i class="ti ti-map-pin-filled"></i> Gujrat
                              </li>
                              <li>
                                <i class="ti ti-clock"></i> 6 Days - 5 Nights
                              </li>
                            </ul>
                            <div class="line"></div>
                            <div class="text-end">
                              <h2 class="mb-0 trip-price">39771/-</h2>
                            </div>
                          </div>
                          <!-- Button -->
                          <a
                            href="/tour-gujrat"
                            class="btn btn-light w-100"
                            >Book Now</a
                          >
                        </div>
                      </div>
                    </div>
                    <!-- Trip Card -->
                    <div class="col-12 col-lg-4">
                      <div class="trip-card fadeInUp" data-delay="0.2">
                        <img src="${pageContext.request.contextPath}/static/shubham/andaman.webp" alt="shubham" />
                        <!-- Trip Body -->
                        <div class="trip-body">
                          <h4 class="mb-4 trip-title">Andaman Group Tour</h4>
                          <!-- Trip Meta -->
                          <div
                            class="trip-meta d-flex align-items-center justify-content-between gap-3 gap-xxl-4"
                          >
                            <ul class="list-unstyled d-flex flex-column gap-3">
                              <li>
                                <i class="ti ti-map-pin-filled"></i> Andaman
                              </li>
                              <li><i class="ti ti-clock"></i> 7 Days</li>
                            </ul>
                            <div class="line"></div>
                            <div class="text-end">
                              <h2 class="mb-0 trip-price">36711/-</h2>
                            </div>
                          </div>
                          <!-- Button -->
                          <a
                            href="/andaman"
                            class="btn btn-light w-100"
                            >Book Now</a
                          >
                        </div>
                      </div>
                    </div>

                    <!-- Trip Card -->
                    <div class="col-12 col-lg-4">
                      <div class="trip-card fadeInUp" data-delay="0.2">
                        <img src="${pageContext.request.contextPath}/static/shubham/jagannath.jpg" alt="shubham" />
                        <!-- Trip Body -->
                        <div class="trip-body">
                          <h4 class="mb-4 trip-title">Jagannath Yatra</h4>
                          <!-- Trip Meta -->
                          <div
                            class="trip-meta d-flex align-items-center justify-content-between gap-3 gap-xxl-4"
                          >
                            <ul class="list-unstyled d-flex flex-column gap-3">
                              <li>
                                <i class="ti ti-map-pin-filled"></i> Jagannath
                              </li>
                              <li>
                                <i class="ti ti-clock"></i> 4 Days - 3 Nights
                              </li>
                            </ul>
                            <div class="line"></div>
                            <div class="text-end">
                              <h2 class="mb-0 trip-price">29999/-</h2>
                            </div>
                          </div>
                          <!-- Button -->
                          <a
                            href="/tour-jagannath"
                            class="btn btn-light w-100"
                            >Book Now</a
                          >
                        </div>
                      </div>
                    </div>
                    <!-- Trip Card -->
                    <div class="col-12 col-lg-4">
                      <div class="trip-card fadeInUp" data-delay="0.2">
                        <img src="${pageContext.request.contextPath}/static/shubham/southtemple.jpg" alt="shubham" />
                        <!-- Trip Body -->
                        <div class="trip-body">
                          <h4 class="mb-4 trip-title">
                            South Indian Temple Yatra
                          </h4>
                          <!-- Trip Meta -->
                          <div
                            class="trip-meta d-flex align-items-center justify-content-between gap-3 gap-xxl-4"
                          >
                            <ul class="list-unstyled d-flex flex-column gap-3">
                              <li>
                                <i class="ti ti-map-pin-filled"></i> South India
                              </li>
                              <li>
                                <i class="ti ti-clock"></i> 7 Days - 6 Nights
                              </li>
                            </ul>
                            <div class="line"></div>
                            <div class="text-end">
                              <h2 class="mb-0 trip-price">59771/-</h2>
                            </div>
                          </div>
                          <!-- Button -->
                          <a
                            href="/south-temple"
                            class="btn btn-light w-100"
                            >Book Now</a
                          >
                        </div>
                      </div>
                    </div>
                    <!-- Trip Card -->
                    <div class="col-12 col-lg-4">
                      <div class="trip-card fadeInUp" data-delay="0.2">
                        <img src="${pageContext.request.contextPath}/static/shubham/jagannath.jpg" alt="shubham" />
                        <!-- Trip Body -->
                        <div class="trip-body">
                          <h4 class="mb-4 trip-title">
                            Jagannath Puri, Gangasagar
                          </h4>
                          <!-- Trip Meta -->
                          <div
                            class="trip-meta d-flex align-items-center justify-content-between gap-3 gap-xxl-4"
                          >
                            <ul class="list-unstyled d-flex flex-column gap-3">
                              <li>
                                <i class="ti ti-map-pin-filled"></i> Jagannath
                              </li>
                              <li>
                                <i class="ti ti-clock"></i> 6 Days - 5 Nights
                              </li>
                            </ul>
                            <div class="line"></div>
                            <div class="text-end">
                              <h2 class="mb-0 trip-price">47511/-</h2>
                            </div>
                          </div>
                          <!-- Button -->
                          <a
                            href="/jagannath-gangasagar"
                            class="btn btn-light w-100"
                            >Book Now</a
                          >
                        </div>
                      </div>
                    </div>
                    <!-- Trip Card -->
                    <div class="col-12 col-lg-4">
                      <div class="trip-card fadeInUp" data-delay="0.2">
                        <img src="${pageContext.request.contextPath}/static/shubham/muktinath.webp" alt="shubham" />
                        <!-- Trip Body -->
                        <div class="trip-body">
                          <h4 class="mb-4 trip-title">Muktinath Yatra</h4>
                          <!-- Trip Meta -->
                          <div
                            class="trip-meta d-flex align-items-center justify-content-between gap-3 gap-xxl-4"
                          >
                            <ul class="list-unstyled d-flex flex-column gap-3">
                              <li>
                                <i class="ti ti-map-pin-filled"></i> Muktinath
                              </li>
                              <li>
                                <i class="ti ti-clock"></i> 6 Days - 5 Nights
                              </li>
                            </ul>
                            <div class="line"></div>
                            <div class="text-end">
                              <h2 class="mb-0 trip-price">41411/-</h2>
                            </div>
                          </div>
                          <!-- Button -->
                          <a
                            href="/tour-muktinath"
                            class="btn btn-light w-100"
                            >Book Now</a
                          >
                        </div>
                      </div>
                    </div>
                    <!-- Trip Card -->
                    <div class="col-12 col-lg-4">
                      <div class="trip-card fadeInUp" data-delay="0.2">
                        <img src="${pageContext.request.contextPath}/static/shubham/pashupatinath.png" alt="shubham" />
                        <!-- Trip Body -->
                        <div class="trip-body">
                          <h4 class="mb-4 trip-title">Pashupatinath Yatra</h4>
                          <!-- Trip Meta -->
                          <div
                            class="trip-meta d-flex align-items-center justify-content-between gap-3 gap-xxl-4"
                          >
                            <ul class="list-unstyled d-flex flex-column gap-3">
                              <li>
                                <i class="ti ti-map-pin-filled"></i> Nepal
                              </li>
                              <li><i class="ti ti-clock"></i> Tour Days</li>
                            </ul>
                            <div class="line"></div>
                            <div class="text-end">
                              <h2 class="mb-0 trip-price">25911/-</h2>
                            </div>
                          </div>
                          <!-- Button -->
                          <a
                            href="/tour-pashupatinath"
                            class="btn btn-light w-100"
                            >Book Now</a
                          >
                        </div>
                      </div>
                    </div>
                    <!-- Trip Card -->
                    <div class="col-12 col-lg-4">
                      <div class="trip-card fadeInUp" data-delay="0.2">
                        <img src="${pageContext.request.contextPath}/static/shubham/gangasagar.jpg" alt="shubham" />
                        <!-- Trip Body -->
                        <div class="trip-body">
                          <h4 class="mb-4 trip-title">
                            Gangasagar, Baba Baidyanath Divya Darshan
                          </h4>
                          <!-- Trip Meta -->
                          <div
                            class="trip-meta d-flex align-items-center justify-content-between gap-3 gap-xxl-4"
                          >
                            <ul class="list-unstyled d-flex flex-column gap-3">
                              <li>
                                <i class="ti ti-map-pin-filled"></i> Multiple
                                Locations
                              </li>
                              <li>
                                <i class="ti ti-clock"></i> 5 Days - 4 Nights
                              </li>
                            </ul>
                            <div class="line"></div>
                            <div class="text-end">
                              <h2 class="mb-0 trip-price">34551/-</h2>
                            </div>
                          </div>
                          <!-- Button -->
                          <a
                            href="/gangasagar-baidyanath"
                            class="btn btn-light w-100"
                            >Book Now</a
                          >
                        </div>
                      </div>
                    </div>

                    <!-- Trip Card -->
                    <div class="col-12 col-lg-4">
                      <div class="trip-card fadeInUp" data-delay="0.2">
                        <img src="${pageContext.request.contextPath}/static/shubham/baidyanath.jpg" alt="shubham" />
                        <!-- Trip Body -->
                        <div class="trip-body">
                          <h4 class="mb-4 trip-title">
                            Jagannath Puri, Gangasagar, Baba Baidyanath
                          </h4>
                          <!-- Trip Meta -->
                          <div
                            class="trip-meta d-flex align-items-center justify-content-between gap-3 gap-xxl-4"
                          >
                            <ul class="list-unstyled d-flex flex-column gap-3">
                              <li>
                                <i class="ti ti-map-pin-filled"></i> Devotional
                              </li>
                              <li>
                                <i class="ti ti-clock"></i> 8 Days - 7 Nights
                              </li>
                            </ul>
                            <div class="line"></div>
                            <div class="text-end">
                              <h2 class="mb-0 trip-price">61551/-</h2>
                            </div>
                          </div>
                          <!-- Button -->
                          <a
                            href="/jagannath-gangasagar-baidyanath"
                            class="btn btn-light w-100"
                            >Book Now</a
                          >
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="divider-sm"></div>
                </div>
              </div>
            </div>
          </div>

          <!-- Divider -->
          <div class="divider"></div>
        </section>

            <%@ include file="footer.jsp" %>
      </div>
    </div>

    <!-- ====== Scroll To Top ====== -->
    <button id="scrollTopButton" class="touria-scrolltop scrolltop-hide">
      <i class="icon-arrow-up"></i>
    </button>

    <!-- ====== Main JS ====== -->
    <%@ include file="emailjs.jsp" %>
  </body>
</html>