<!DOCTYPE html>
<html lang="en" data-theme="three">
   <head>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <title>Ananda Holidays</title>
      <!-- CSS first -->
      <link rel="stylesheet" crossorigin href="${pageContext.request.contextPath}/static/assets/main-DDi0A8kK.css" />

      <!-- JavaScript modules -->
      <script type="module" crossorigin src="${pageContext.request.contextPath}/static/assets/main-C7XYgASq.js"></script>

      <!-- Axios for API calls -->
      <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

      <style>
         .destination-image {
            width: 100%;
            height: 450px;
            overflow: hidden;
            border-radius: 10px;
         }
         .destination-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
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
         .loading-spinner {
            text-align: center;
            padding: 50px;
            min-height: 200px;
            display: flex;
            align-items: center;
            justify-content: center;
         }
         .error-message {
            color: #dc3545;
            text-align: center;
            padding: 20px;
         }
         .success-message {
            color: #28a745;
            text-align: center;
            padding: 10px;
            margin-bottom: 10px;
            background: rgba(255,255,255,0.9);
            border-radius: 5px;
         }
         .form-clt select {
            width: 100%;
            padding: 12px 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background: white;
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
            <span class="close-btn" id="videoCloseButton"><i class="ti ti-x"></i></span>
            <div class="ratio ratio-16x9">
               <iframe id="videoFrame" allowfullscreen></iframe>
            </div>
         </div>
      </div>

      <jsp:include page="rightsideoffcanvas.jsp" />
      <jsp:include page="header.jsp" />

      <!-- ====== Smooth Wrapper ====== -->
      <div id="smooth-wrapper">
         <div id="smooth-content">
            <!-- ====== Hero Section ====== -->
            <section class="hero-section bg-img style-five jarallax"
               style="background-image: url('${pageContext.request.contextPath}/static/assets/227-CV0XzQD3.jpg')">
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
                           <a href="${pageContext.request.contextPath}/contact" class="btn btn-primary">
                              Contact Us <i class="icon-arrow-right"></i>
                           </a>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="hero-img">
                  <img src="${pageContext.request.contextPath}/static/assets/cloud-Ghgi75-N.png" alt="cloud" />
               </div>
               <div class="plane-img" data-speed="0.9">
                  <div class="container">
                     <img src="${pageContext.request.contextPath}/static/assets/plane4-DFMLV2Vc.png" alt="plane" />
                  </div>
               </div>
            </section>

            <!-- ====== Premier Destination Section ====== -->
            <section class="premier-destination-section">
               <div class="divider"></div>
               <div class="container">
                  <div class="row g-4 g-md-5 align-items-end">
                     <div class="col-12 col-sm-6">
                        <div class="section-heading">
                           <span class="sub-title text-primary">Popular Destination</span>
                           <h2 class="mb-0">Premier Destinations</h2>
                        </div>
                     </div>
                     <div class="col-12 col-sm-6">
                        <div class="premier-destination-navigation justify-content-sm-end">
                           <div class="premier-destination-button-prev">
                              <i class="icon-arrow-left"></i>
                           </div>
                           <div class="premier-destination-button-next">
                              <i class="icon-arrow-right"></i>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="divider-sm"></div>

                  <!-- Premier Destination Swiper - Dynamic -->
                  <div class="swiper premier-destination-swiper" id="premierDestinationSwiper">
                     <div class="swiper-wrapper" id="premierToursContainer">
                        <!-- Tours will be loaded dynamically via JavaScript -->
                        <div class="swiper-slide">
                           <div class="loading-spinner">
                              <div class="spinner-border text-primary" role="status">
                                 <span class="visually-hidden">Loading tours...</span>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="divider"></div>
            </section>

            <!-- ====== About Company Section ====== -->
            <section class="about-company-section style-two bg-secondary bg-img"
               style="background-image: url('${pageContext.request.contextPath}/static/assets/shape23-BO3punaR.png')">
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
                                 Holidays — your trusted partner for spiritual travel
                                 experiences that connect heart, soul, and tradition.
                              </p>
                           </div>
                           <!-- ... keep existing about content ... -->
                           <ul class="about-list-two list-unstyled mb-5">
                              <li>
                                 <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="none">
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M10 20C4.477 20 0 15.523 0 10C0 4.477 4.477 0 10 0C15.523 0 20 4.477 20 10C20 15.523 15.523 20 10 20ZM8.823 12.14L6.058 9.373L5 10.431L8.119 13.552C8.30653 13.7395 8.56084 13.8448 8.826 13.8448C9.09116 13.8448 9.34547 13.7395 9.533 13.552L15.485 7.602L14.423 6.54L8.823 12.14Z" fill="#02A5CE"></path>
                                 </svg>
                                 Adventure Awaits You
                              </li>
                              <!-- ... other list items ... -->
                           </ul>
                           <a href="${pageContext.request.contextPath}/about" class="btn btn-primary">
                              More About Us <i class="icon-arrow-right"></i>
                           </a>
                        </div>
                     </div>
                     <div class="col-12 col-lg-6">
                        <div class="about-thumbnail">
                           <img src="${pageContext.request.contextPath}/static/assets/276-CSWytjYe.png" alt="about" />
                        </div>
                     </div>
                  </div>
               </div>
               <div class="divider"></div>
            </section>

            <!-- ====== Destination Section ====== -->
            <section class="destination-section-four bg-gray">
               <div class="divider"></div>
               <div class="shape1">
                  <img src="${pageContext.request.contextPath}/static/assets/01-zhSTL4l3.png" alt="shape" />
               </div>
               <div class="shape2">
                  <img src="${pageContext.request.contextPath}/static/assets/02-BOeYn-Nv.png" alt="shape" />
               </div>
               <div class="destination-shape-1">
                  <img src="${pageContext.request.contextPath}/static/assets/destination-shape-1-CVO6IG48.png" alt="shape" />
               </div>
               <div class="destination-shape-2">
                  <img src="${pageContext.request.contextPath}/static/assets/destination-shape-2-BQNvanh3.png" alt="shape" />
               </div>

               <div class="container">
                  <div class="row justify-content-center">
                     <div class="col-12 col-lg-8">
                        <div class="section-heading text-center">
                           <span class="sub-title">Comfort. Class. Exploration.</span>
                           <h2>Travel in Style with Ananda</h2>
                        </div>
                     </div>
                  </div>
               </div>

               <!-- Destination Navigation with Filters -->
               <div class="container">
                  <ul class="nav fadeInUp" data-delay="0.2" role="tablist">
                     <li class="nav-item" role="presentation">
                        <a href="#all" data-bs-toggle="tab" class="nav-link active"
                           onclick="filterTours('ALL')" role="tab">All</a>
                     </li>
                     <li class="nav-item" role="presentation">
                        <a href="#india" data-bs-toggle="tab" class="nav-link"
                           onclick="filterTours('INDIA')" role="tab">India</a>
                     </li>
                     <li class="nav-item" role="presentation">
                        <a href="#foreign" data-bs-toggle="tab" class="nav-link"
                           onclick="filterTours('FOREIGN')" role="tab">Foreign</a>
                     </li>
                     <li class="nav-item" role="presentation">
                        <a href="#devotional" data-bs-toggle="tab" class="nav-link"
                           onclick="filterTours('RELIGIOUS')" role="tab">Devotional</a>
                     </li>
                  </ul>
               </div>

               <div class="divider-sm"></div>

               <!-- Tab Content - Dynamic -->
               <div class="tab-content">
                  <div id="all" class="tab-pane fade show active" role="tabpanel">
                     <div class="container-fluid">
                        <div class="swiper destination-swiper">
                           <div class="swiper-wrapper" id="destinationToursContainer">
                              <!-- Tours will be loaded dynamically -->
                              <div class="swiper-slide">
                                 <div class="loading-spinner">
                                    <div class="spinner-border text-primary" role="status">
                                       <span class="visually-hidden">Loading tours...</span>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div id="india" class="tab-pane fade" role="tabpanel">
                     <div class="container-fluid">
                        <div class="swiper destination-swiper">
                           <div class="swiper-wrapper" id="indiaToursContainer"></div>
                        </div>
                     </div>
                  </div>
                  <div id="foreign" class="tab-pane fade" role="tabpanel">
                     <div class="container-fluid">
                        <div class="swiper destination-swiper">
                           <div class="swiper-wrapper" id="foreignToursContainer"></div>
                        </div>
                     </div>
                  </div>
                  <div id="devotional" class="tab-pane fade" role="tabpanel">
                     <div class="container-fluid">
                        <div class="swiper destination-swiper">
                           <div class="swiper-wrapper" id="devotionalToursContainer"></div>
                        </div>
                     </div>
                  </div>
               </div>

               <div class="btn-button1 text-center pt-5 pb-5">
                  <a href="${pageContext.request.contextPath}/tours" class="btn btn-primary">
                     Check All Tours <i class="icon-arrow-right"></i>
                  </a>
               </div>
               <div class="divider"></div>
            </section>

            <!-- ====== Choose Us Section ====== -->
            <section class="choose-us-section-four">
               <div class="divider"></div>
               <div class="container">
                  <div class="hotair-ballon" data-speed="0.8" data-lag="0">
                     <img src="${pageContext.request.contextPath}/static/assets/hotair-ballon-BTZcyqQs.png" alt="balloon" />
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
                                 create meaningful, memorable travel experiences with every
                                 trip.
                              </p>
                           </div>
                        </div>
                        <div class="col-md-6 fadeInUp" data-delay="0.4">
                           <div class="choose-us-main-img">
                              <div class="choose-us-image">
                                 <img src="${pageContext.request.contextPath}/static/assets/163-GeSCqKuK.jpg" alt="choose" />
                              </div>
                              <div class="choose-us-one">
                                 <img src="${pageContext.request.contextPath}/static/assets/164-C2V8UI-m.jpg" alt="choose" />
                              </div>
                              <div class="choose-us-two">
                                 <img src="${pageContext.request.contextPath}/static/assets/165-BoBtrJ-J.jpg" alt="choose" />
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="divider"></div>
            </section>

            <!-- ====== Contact/Booking Form Section ====== -->
            <section class="contact-section-four bg-img jarallax"
               style="background-image: url('${pageContext.request.contextPath}/static/assets/168-CLAQXMIu.jpg');">
               <div class="divider"></div>
               <div class="top1">
                  <img src="${pageContext.request.contextPath}/static/assets/03-CPafVWBR.png" alt="top" />
               </div>
               <div class="top2">
                  <img src="${pageContext.request.contextPath}/static/assets/04-DoI1WOdK.png" alt="top" />
               </div>

               <div class="container pt-5 pb-5">
                  <div class="contact-items">
                     <div id="formMessage" class="success-message" style="display: none;"></div>

                     <form id="bookingForm" class="contact-form-box" onsubmit="handleBookingSubmit(event)">
                        <div class="section-heading text-center mb-5">
                           <span class="sub-title text-white fadeInUp">Get in Touch</span>
                           <h2 class="text-white fadeInUp" data-delay="0.2">
                              With Our Travel Experts
                           </h2>
                        </div>

                        <div class="row g-4 align-items-center justify-content-center">
                           <div class="col-lg-6 col-md-6">
                              <div class="form-clt">
                                 <input type="text" name="customerName" id="name"
                                        placeholder="Your Name" required />
                              </div>
                           </div>

                           <div class="col-lg-6 col-md-6">
                              <div class="form-clt">
                                 <input type="email" name="customerEmail" id="email"
                                        placeholder="Email Address" required />
                              </div>
                           </div>

                           <div class="col-lg-6 col-md-6">
                              <div class="form-clt">
                                 <input type="tel" name="customerPhone" id="phone"
                                        placeholder="Your Phone" required />
                              </div>
                           </div>

                           <div class="col-lg-6 col-md-6">
                              <div class="form-clt">
                                 <select name="tourId" id="tourSelect" required>
                                    <option value="">Select a Tour</option>
                                 </select>
                              </div>
                           </div>

                           <div class="col-lg-6 col-md-6">
                              <div class="form-clt">
                                 <input type="number" name="numberOfAdults" id="adults"
                                        placeholder="Number of Adults" min="1" required />
                              </div>
                           </div>

                           <div class="col-lg-6 col-md-6">
                              <div class="form-clt">
                                 <input type="number" name="numberOfChildren" id="children"
                                        placeholder="Number of Children" min="0" value="0" />
                              </div>
                           </div>

                           <div class="col-lg-12">
                              <div class="form-clt">
                                 <textarea name="specialRequests" id="message"
                                           placeholder="Special Requests (Optional)"></textarea>
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

            <!-- ====== Instagram Section ====== -->
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
                           <img src="${pageContext.request.contextPath}/static/assets/30-DT8xzuM4.jpg" alt="instagram" />
                           <a href="#" class="instagram-btn">
                              <i class="ti ti-brand-instagram"></i>
                           </a>
                        </div>
                     </div>
                     <div class="col-6 col-sm-4 col-md-3">
                        <div class="follow-instagram-card">
                           <img src="${pageContext.request.contextPath}/static/assets/31-D9J9EuaO.jpg" alt="instagram" />
                           <a href="#" class="instagram-btn">
                              <i class="ti ti-brand-instagram"></i>
                           </a>
                        </div>
                     </div>
                     <div class="col-6 col-sm-4 col-md-3">
                        <div class="follow-instagram-card">
                           <img src="${pageContext.request.contextPath}/static/assets/32-9UsYD5oL.jpg" alt="instagram" />
                           <a href="#" class="instagram-btn">
                              <i class="ti ti-brand-instagram"></i>
                           </a>
                        </div>
                     </div>
                     <div class="col-6 col-sm-4 col-md-3">
                        <div class="follow-instagram-card">
                           <img src="${pageContext.request.contextPath}/static/assets/33-UYB5R0QM.jpg" alt="instagram" />
                           <a href="#" class="instagram-btn">
                              <i class="ti ti-brand-instagram"></i>
                           </a>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="divider"></div>
            </div>

            <jsp:include page="footer.jsp" />
         </div>
      </div>

      <!-- ====== Scroll To Top ====== -->
      <button id="scrollTopButton" class="touria-scrolltop scrolltop-hide">
         <i class="icon-arrow-up"></i>
      </button>

      <!-- ====== API Integration Script ====== -->
      <script>
         // Wait for DOM to be fully loaded
         document.addEventListener('DOMContentLoaded', function() {
            console.log('DOM loaded, initializing...');

            // Hide preloader
            const preloader = document.getElementById('preloader');
            if (preloader) {
               preloader.style.display = 'none';
            }

            // Initialize API calls
            initAPI();
         });

         // API Configuration
         const API_BASE_URL = window.location.origin + '/api';
         axios.defaults.baseURL = API_BASE_URL;

         // Initialize all API calls
         function initAPI() {
            loadFeaturedTours();
            loadAllTours();
            loadToursForDropdown();
         }

         // ==================== TOUR LOADING FUNCTIONS ====================

         async function loadFeaturedTours() {
            const container = document.getElementById('premierToursContainer');
            if (!container) return;

            try {
               const response = await axios.get('/tours/upcoming');
               const tours = response.data;

               if (!tours || tours.length === 0) {
                  container.innerHTML = '<div class="swiper-slide"><p class="text-center">No upcoming tours available</p></div>';
                  return;
               }

               displayFeaturedTours(tours.slice(0, 8));

            } catch (error) {
               console.error('Error loading featured tours:', error);
               container.innerHTML = '<div class="swiper-slide error-message">Failed to load tours. Please refresh the page.</div>';
            }
         }

         function displayFeaturedTours(tours) {
            const container = document.getElementById('premierToursContainer');
            if (!container) return;

            container.innerHTML = tours.map(tour => {
               const imageUrl = tour.tourImages && tour.tourImages.length > 0
                  ? API_BASE_URL + '/images/' + tour.tourImages[0]
                  : '${pageContext.request.contextPath}/static/assets/default-tour.jpg';

               return `
                  <div class="swiper-slide premier-destination-card"
                       style="background-image: url('` + imageUrl + `')">
                     <div class="premier-destination-content">
                        <p class="mb-2 text-white">
                           <i class="ti ti-map-pin-filled"></i>
                           ` + formatDate(tour.tourStartingDate) + ` - ` + formatDate(tour.tourEndingDate) + `
                        </p>
                        <h3 class="text-white">` + escapeHtml(tour.tourName) + `</h3>
                        <p class="text-white">₹ ` + formatPrice(tour.tourPrice) + `</p>
                        <a href="${pageContext.request.contextPath}/tour-details?id=` + tour.id + `" class="btn btn-sm btn-primary">
                           Book Now <i class="icon-arrow-right"></i>
                        </a>
                     </div>
                  </div>
               `;
            }).join('');
         }

         async function loadAllTours() {
            const container = document.getElementById('destinationToursContainer');
            if (!container) return;

            try {
               const response = await axios.get('/tours');
               const tours = response.data;

               if (!tours || tours.length === 0) {
                  container.innerHTML = '<div class="swiper-slide"><p class="text-center">No tours available</p></div>';
                  return;
               }

               // Store tours in cache for filtering
               window.allToursCache = tours;

               displayToursInContainer(tours, container);

            } catch (error) {
               console.error('Error loading all tours:', error);
               container.innerHTML = '<div class="swiper-slide error-message">Failed to load tours</div>';
            }
         }

         function displayToursInContainer(tours, container) {
            if (!container) return;

            container.innerHTML = tours.map(tour => createTourCard(tour)).join('');
         }

         function filterTours(type) {
            if (!window.allToursCache) return;

            let filteredTours = [];
            const tours = window.allToursCache;

            if (type === 'ALL') {
               filteredTours = tours;
            } else {
               // Simple filtering logic - you can enhance this based on your needs
               filteredTours = tours.filter(tour => {
                  if (type === 'INDIA') {
                     return tour.tourDestination && tour.tourDestination.toLowerCase().includes('india');
                  } else if (type === 'FOREIGN') {
                     return tour.tourDestination && !tour.tourDestination.toLowerCase().includes('india');
                  } else if (type === 'RELIGIOUS') {
                     return tour.tourType === 'RELIGIOUS';
                  }
                  return true;
               });
            }

            displayToursInContainer(filteredTours, document.getElementById('destinationToursContainer'));
         }

         function createTourCard(tour) {
            const imageUrl = tour.tourImages && tour.tourImages.length > 0
               ? API_BASE_URL + '/images/' + tour.tourImages[0]
               : '${pageContext.request.contextPath}/static/assets/default-tour.jpg';

            return `
               <div class="swiper-slide">
                  <div class="destination-box-items">
                     <div class="destination-image">
                        <img src="` + imageUrl + `"
                             alt="` + escapeHtml(tour.tourName) + `"
                             onerror="this.src='${pageContext.request.contextPath}/static/assets/default-tour.jpg'">
                        <span class="top-items">` + escapeHtml(tour.tourType || 'Ananda') + `</span>
                     </div>
                     <div class="destination-content">
                        <h3>
                           <a href="${pageContext.request.contextPath}/tour-details?id=` + tour.id + `">` + escapeHtml(tour.tourName) + `</a>
                        </h3>
                        <ul>
                           <li>From <span>₹ ` + formatPrice(tour.tourPrice) + `</span></li>
                        </ul>
                        <div class="destination-rattiing">
                           <p>` + (tour.tourDays || 0) + `D / ` + (tour.tourNights || 0) + `N</p>
                           <p>` + formatDate(tour.tourStartingDate) + ` - ` + formatDate(tour.tourEndingDate) + `</p>
                        </div>
                     </div>
                  </div>
               </div>
            `;
         }

         // ==================== BOOKING FORM FUNCTIONS ====================

         async function loadToursForDropdown() {
            try {
               const response = await axios.get('/tours');
               const tours = response.data;

               const select = document.getElementById('tourSelect');
               if (!select) return;

               if (!tours || tours.length === 0) {
                  select.innerHTML = '<option value="">No tours available</option>';
                  return;
               }

               let options = '<option value="">Select a Tour</option>';
               for (let i = 0; i < tours.length; i++) {
                  const tour = tours[i];
                  options += '<option value="' + tour.id + '">' + escapeHtml(tour.tourName) + ' - ₹' + formatPrice(tour.tourPrice) + '</option>';
               }
               select.innerHTML = options;

            } catch (error) {
               console.error('Error loading tours for dropdown:', error);
            }
         }

         async function handleBookingSubmit(event) {
            event.preventDefault();

            const submitBtn = document.getElementById('submitBtn');
            const formMessage = document.getElementById('formMessage');

            if (!submitBtn || !formMessage) return;

            // Disable button and show loading state
            submitBtn.disabled = true;
            submitBtn.innerHTML = 'Sending... <i class="icon-arrow-right"></i>';
            formMessage.style.display = 'none';

            // Collect form data
            const formData = {
               customerName: document.getElementById('name')?.value?.trim() || '',
               customerEmail: document.getElementById('email')?.value?.trim() || '',
               customerPhone: document.getElementById('phone')?.value?.trim() || '',
               numberOfAdults: parseInt(document.getElementById('adults')?.value) || 0,
               numberOfChildren: parseInt(document.getElementById('children')?.value) || 0,
               tourId: parseInt(document.getElementById('tourSelect')?.value) || 0,
               specialRequests: document.getElementById('message')?.value?.trim() || ''
            };

            // Validate form data
            if (!formData.customerName || !formData.customerEmail || !formData.customerPhone ||
                !formData.numberOfAdults || !formData.tourId) {
               showFormMessage('Please fill in all required fields', 'error');
               resetSubmitButton(submitBtn);
               return;
            }

            // Validate email format
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(formData.customerEmail)) {
               showFormMessage('Please enter a valid email address', 'error');
               resetSubmitButton(submitBtn);
               return;
            }

            try {
               const response = await axios.post('/bookings', formData);

               showFormMessage('Booking successful! Check your email for confirmation.', 'success');

               // Reset form
               document.getElementById('bookingForm').reset();

            } catch (error) {
               console.error('Booking error:', error);

               const errorMsg = error.response?.data?.message ||
                               error.response?.data?.error ||
                               'Booking failed. Please try again.';
               showFormMessage(errorMsg, 'error');

            } finally {
               resetSubmitButton(submitBtn);
            }
         }

         function showFormMessage(message, type) {
            const formMessage = document.getElementById('formMessage');
            if (!formMessage) return;

            formMessage.textContent = message;
            formMessage.style.display = 'block';
            formMessage.className = type === 'success' ? 'success-message' : 'error-message';

            // Auto-hide after 5 seconds
            setTimeout(() => {
               formMessage.style.display = 'none';
            }, 5000);
         }

         function resetSubmitButton(button) {
            if (!button) return;
            button.disabled = false;
            button.innerHTML = 'Send Message <i class="icon-arrow-right"></i>';
         }

         // ==================== UTILITY FUNCTIONS ====================

         function formatPrice(price) {
            if (!price && price !== 0) return '0';
            return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
         }

         function formatDate(dateString) {
            if (!dateString) return 'TBD';
            try {
               const date = new Date(dateString);
               return date.toLocaleDateString('en-IN', {
                  day: '2-digit',
                  month: 'short',
                  year: 'numeric'
               });
            } catch (e) {
               return dateString;
            }
         }

         function escapeHtml(unsafe) {
            if (!unsafe) return '';
            return String(unsafe)
               .replace(/&/g, "&amp;")
               .replace(/</g, "&lt;")
               .replace(/>/g, "&gt;")
               .replace(/"/g, "&quot;")
               .replace(/'/g, "&#039;");
         }
      </script>
   </body>
</html>