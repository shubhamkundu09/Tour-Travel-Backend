<!DOCTYPE html>
<html lang="en" data-theme="three">
   <head>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <title>Ananda Holidays</title>
      <script type="module" crossorigin src="assets/main-C7XYgASq.js"></script>
      <link rel="stylesheet" crossorigin href="assets/main-DDi0A8kK.css" />
      <style>
         .destination-image {
         width: 100%;
         height: 450px; /* 🔹 Set fixed height for all images */
         overflow: hidden;
         border-radius: 10px;
         }
         .destination-image img {
         width: 100%;
         height: 100%;
         object-fit: cover; /* 🔹 Keeps aspect ratio, crops excess */
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
            <!-- ====== Hero Section ====== -->
            <section
               class="hero-section bg-img style-five jarallax"
               style="background-image: url('assets/227-CV0XzQD3.jpg')"
               >
               <div class="container">
                  <div class="row g-xl-5 justify-content-center">
                     <div class="col-12 col-md-8">
                        <!-- Hero Content -->
                        <div class="hero-content home-one text-center">
                           <h2 class="text-white mb-4 heading-line" data-delay="0.6">
                              Wander Freely, Travel with Ananda
                           </h2>
                           <p class="text-white heading-line mb-5" data-delay="0.7">
                              Explore breathtaking destinations across India and beyond
                              with Ananda Holidays &#45; where every journey is designed to
                              inspire, refresh, and create lifelong memories.
                           </p>
                           <a href="/contact" class="btn btn-primary"
                              >Contact Us <i class="icon-arrow-right"> </i
                              ></a>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- Hero Image -->
               <div class="hero-img">
                  <img src="assets/cloud-Ghgi75-N.png" alt="shubham" />
               </div>
               <!-- Plane Image -->
               <div class="plane-img" data-speed="0.9">
                  <div class="container">
                     <img src="assets/plane4-DFMLV2Vc.png" alt="shubham" />
                  </div>
               </div>
            </section>
            <!-- ====== Premier Destination Section ====== -->
            <section class="premier-destination-section">
               <!-- Divider -->
               <div class="divider"></div>
               <div class="container">
                  <div class="row g-4 g-md-5 align-items-end">
                     <div class="col-12 col-sm-6">
                        <!-- Section Heading -->
                        <div class="section-heading">
                           <span class="sub-title text-primary"
                              >Popular Destination</span
                              >
                           <h2 class="mb-0">Premier Destinations</h2>
                        </div>
                     </div>
                     <div class="col-12 col-sm-6">
                        <div
                           class="premier-destination-navigation justify-content-sm-end"
                           >
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
                  <!-- Premier Destination Swiper -->
                  <div
                     class="swiper premier-destination-swiper"
                     id="premierDestinationSwiper"
                     >
                     <div class="swiper-wrapper">
                        <!-- Project Card -->
                        <div
                           class="swiper-slide premier-destination-card"
                           style="background-image: url('./shubham/gujrat.jpg')"
                           >
                           <!-- Project Content -->
                           <div class="premier-destination-content">
                              <p class="mb-2 text-white">
                                 <i class="ti ti-map-pin-filled"></i> 25 Oct &#45; 30 Oct 2025
                              </p>
                              <h3 class="text-white">Gujrat Group Tour</h3>
                              <p class="text-white"> &#8377 39,771</p>
                              <a href="/tour-gujrat" class="btn btn-sm btn-primary"
                                 >Book Now <i class="icon-arrow-right"></i
                                 ></a>
                           </div>
                        </div>
                        <!-- Project Card -->
                        <div
                           class="swiper-slide premier-destination-card"
                           style="background-image: url('./shubham/jagannath.jpg')"
                           >
                           <!-- Project Content -->
                           <div class="premier-destination-content">
                              <p class="mb-2 text-white">
                                 <i class="ti ti-map-pin-filled"></i> 04 Nov &#45; 07 Nov 2025
                              </p>
                              <h3 class="text-white">Jagannath Puri Darshan</h3>
                              <p class="text-white"> &#8377 29,999</p>
                              <a
                                 href="/tour-jagannath"
                                 class="btn btn-sm btn-primary"
                                 >Book Now <i class="icon-arrow-right"></i
                                 ></a>
                           </div>
                        </div>
                        <!-- Project Card -->
                        <div
                           class="swiper-slide premier-destination-card"
                           style="background-image: url('./shubham/jagannath2.webp')"
                           >
                           <!-- Project Content -->
                           <div class="premier-destination-content">
                              <p class="mb-2 text-white">
                                 <i class="ti ti-map-pin-filled"></i> 04 Nov &#45; 09 Nov 2025
                              </p>
                              <h3 class="text-white">Jagannath Puri Ganga Sagar Yatra</h3>
                              <p class="text-white"> &#8377 47,511</p>
                              <a
                                 href="/jagannath-gangasagar"
                                 class="btn btn-sm btn-primary"
                                 >Book Now <i class="icon-arrow-right"></i
                                 ></a>
                           </div>
                        </div>
                        <!-- Project Card -->
                        <div
                           class="swiper-slide premier-destination-card"
                           style="background-image: url('./shubham/baidyanath.jpg')"
                           >
                           <!-- Project Content -->
                           <div class="premier-destination-content">
                              <p class="mb-2 text-white">
                                 <i class="ti ti-map-pin-filled"></i> 04 Nov &#45; 11 Nov 2025
                              </p>
                              <h3 class="text-white">
                                 Jagannath Puri Ganga Sagar Yatra, Baba Baidyanath
                              </h3>
                              <p class="text-white"> &#8377 61,551</p>
                              <a
                                 href="/jagannath-gangasagar-baidyanath"
                                 class="btn btn-sm btn-primary"
                                 >Book Now <i class="icon-arrow-right"></i
                                 ></a>
                           </div>
                        </div>
                        <!-- Project Card -->
                        <div
                           class="swiper-slide premier-destination-card"
                           style="background-image: url('./shubham/baidyanath2.jpg')"
                           >
                           <!-- Project Content -->
                           <div class="premier-destination-content">
                              <p class="mb-2 text-white">
                                 <i class="ti ti-map-pin-filled"></i> 07 Nov &#45; 11 Nov 2025
                              </p>
                              <h3 class="text-white">
                                 Ganga Sagar, Baba Baidyanath Yatra
                              </h3>
                              <p class="text-white"> &#8377 34,551</p>
                              <a
                                 href="/gangasagar-baidyanath"
                                 class="btn btn-sm btn-primary"
                                 >Book Now <i class="icon-arrow-right"></i
                                 ></a>
                           </div>
                        </div>
                        <!-- Project Card -->
                        <div
                           class="swiper-slide premier-destination-card"
                           style="background-image: url('./shubham/southtemple.jpg')"
                           >
                           <!-- Project Content -->
                           <div class="premier-destination-content">
                              <p class="mb-2 text-white">
                                 <i class="ti ti-map-pin-filled"></i> 21 Nov &#45; 27 Nov 2025
                              </p>
                              <h3 class="text-white">South Indian Mandir Yatra</h3>
                              <p class="text-white"> &#8377 59,771</p>
                              <a href="/south-temple" class="btn btn-sm btn-primary"
                                 >Book Now <i class="icon-arrow-right"></i
                                 ></a>
                           </div>
                        </div>
                        <!-- Project Card -->
                        <div
                           class="swiper-slide premier-destination-card"
                           style="background-image: url('./shubham/andaman.webp')"
                           >
                           <!-- Project Content -->
                           <div class="premier-destination-content">
                              <p class="mb-2 text-white">
                                 <i class="ti ti-map-pin-filled"></i> 15 Dec &#45; 21 Dec 2025
                              </p>
                              <h3 class="text-white">Andaman Group Tour</h3>
                              <p class="text-white"> &#8377 36,771</p>
                              <a href="/andaman" class="btn btn-sm btn-primary"
                                 >Book Now <i class="icon-arrow-right"></i
                                 ></a>
                           </div>
                        </div>
                        <!-- Project Card -->
                        <div
                           class="swiper-slide premier-destination-card"
                           style="background-image: url('./shubham/dubai.jpg')"
                           >
                           <!-- Project Content -->
                           <div class="premier-destination-content">
                              <p class="mb-2 text-white">
                                 <i class="ti ti-map-pin-filled"></i> 05 Jan &#45; 10 Jan 2026
                              </p>
                              <h3 class="text-white">Dubai Group Tour</h3>
                              <p class="text-white"> &#8377 79,999</p>
                              <a href="/tour-dubai" class="btn btn-sm btn-primary"
                                 >Book Now <i class="icon-arrow-right"></i
                                 ></a>
                           </div>
                        </div>
                        <!-- Project Card -->
                        <div
                           class="swiper-slide premier-destination-card slide-expand"
                           style="background-image: url('./shubham/dubai.jpg')"
                           >
                           <!-- Project Content -->
                           <div class="premier-destination-content">
                              <p class="mb-2 text-white">
                                 <i class="ti ti-map-pin-filled"></i> 23 March &#45; 28 March 2026
                              </p>
                              <h3 class="text-white">Dubai Tour (6D/5N)</h3>
                              <p class="text-white"> &#8377 79,999</p>
                              <a href="/tour-dubai" class="btn btn-sm btn-primary"
                                 >Book Now <i class="icon-arrow-right"></i
                                 ></a>
                           </div>
                        </div>
                        <!-- Project Card -->
                        <div
                           class="swiper-slide premier-destination-card slide-expand"
                           style="background-image: url('./shubham/pashupatinath.png')"
                           >
                           <!-- Project Content -->
                           <div class="premier-destination-content">
                              <p class="mb-2 text-white">
                                 <i class="ti ti-map-pin-filled"></i> 21 April &#45; 24 April 2026
                              </p>
                              <h3 class="text-white">Pashupati Nath Nepal Darshan (4D/3N)</h3>
                              <p class="text-white"> &#8377 27,794</p>
                              <a href="/tour-pashupatinath" class="btn btn-sm btn-primary"
                                 >Book Now <i class="icon-arrow-right"></i
                                 ></a>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- Divider -->
               <div class="divider"></div>
            </section>
            <section
               class="about-company-section style-two bg-secondary bg-img"
               style="background-image: url('assets/shape23-BO3punaR.png')"
               >
               <!-- Divider -->
               <div class="divider"></div>
               <div class="container">
                  <div class="row g-5 align-items-center">
                     <!-- About Content -->
                     <div class="col-12 col-lg-6">
                        <div class="about-content pe-md-5">
                           <div class="section-heading">
                              <span class="sub-title">Wander. Discover. Live.</span>
                              <h2 class="mb-4">
                                 Creating Memories with Beautiful Journeys
                              </h2>
                              <p class="mb-5">
                                 Embark on sacred yatras and divine journeys with Ananda
                                 Holidays — your trusted partner for spiritual travel
                                 experiences that connect heart, soul, and tradition.
                              </p>
                           </div>
                           <div class="d-flex flex-wrap flex-xl-nowrap gap-4 mb-5">
                              <!-- Single Item -->
                              <div class="about-card-sm d-flex align-items-center gap-3">
                                 <div class="icon bg-white">
                                    <svg
                                       xmlns="http://www.w3.org/2000/svg"
                                       width="39"
                                       height="40"
                                       viewBox="0 0 39 40"
                                       fill="none"
                                       >
                                       <path
                                          d="M37.8232 21.6972C37.8202 21.6941 37.8171 21.6912 37.8139 21.6881C37.2653 21.154 36.5345 20.8598 35.756 20.8598C35.3398 20.8598 34.786 20.945 34.1812 21.2663V8.40094C34.1812 7.15977 33.1719 6.14984 31.9312 6.14984H27.284V4.34766C27.284 1.95031 25.3339 0 22.937 0H10.7929C8.39719 0 6.44813 1.95039 6.44813 4.34766V6.14977H2.25C1.0093 6.14977 0 7.15977 0 8.40086V29.8501C0 31.0914 1.0093 32.1012 2.25 32.1012H9.22898C9.66406 32.1012 10.0168 31.7484 10.0168 31.3134C10.0168 30.8783 9.66406 30.5255 9.22898 30.5255H2.25C1.88453 30.5255 1.5757 30.2162 1.5757 29.8501V28.0167H24.8441L26.7138 29.081L25.2102 30.8806L22.1605 29.9986C21.8781 29.9172 21.5741 29.9992 21.3713 30.2118L21.0723 30.5255H15.6395C15.2044 30.5255 14.8516 30.8783 14.8516 31.3134C14.8516 31.7484 15.2044 32.1012 15.6395 32.1012H19.6762C19.638 32.2178 19.6263 32.3432 19.6455 32.4675C19.6829 32.7092 19.8304 32.9198 20.0447 33.0375L22.3895 34.3261C21.9613 35.1327 21.8938 36.1235 22.5583 36.8519C22.5615 36.8553 22.5645 36.8587 22.5677 36.8621C22.6054 36.9019 22.645 36.9409 22.6879 36.9802C22.7314 37.0285 22.7791 37.0757 22.832 37.1228C23.1832 37.4369 23.6255 37.6029 24.1109 37.6029C24.5617 37.6029 24.9915 37.4614 25.3558 37.2634L26.6701 39.5984C26.7902 39.8117 27.0026 39.9572 27.2448 39.992C27.2821 39.9973 27.3195 39.9999 27.3567 39.9999C27.5607 39.9999 27.7587 39.9205 27.907 39.7759L29.4818 38.2395C29.6919 38.0346 29.7705 37.7298 29.6859 37.4487L28.7703 34.4055L30.553 32.882L33.3937 37.7602C33.5162 37.9705 33.7294 38.1127 33.9709 38.1447C34.2124 38.1766 34.4552 38.0952 34.6284 37.9241L36.6103 35.9648C36.821 35.7566 36.897 35.4479 36.8073 35.1657L34.8716 29.0774L37.5255 26.3642C39.1235 24.7117 38.8849 22.7656 37.8232 21.6972ZM32.6055 8.40094V15.0268C32.6055 15.3993 32.303 15.7022 31.9312 15.7022H28.3612V7.72555H31.9312C32.303 7.72555 32.6055 8.02859 32.6055 8.40094ZM7.39563 7.72555H9.87898V15.7023H7.39563V7.72555ZM26.7855 7.72555V15.7023H24.3022V7.72555H26.7855ZM23.0737 6.14984H10.6562V4.34766C10.6562 4.27313 10.7189 4.21008 10.7929 4.21008H22.937C23.0111 4.21008 23.0737 4.27313 23.0737 4.34766V6.14984ZM5.84508 17.2779H11.4297V18.9697H5.84508V17.2779ZM11.4547 15.7022V7.72555H22.7264V15.7023L11.4547 15.7022ZM22.7516 17.2779H28.3362V18.9697H22.7516V17.2779ZM10.7929 1.57578H22.937C24.4651 1.57578 25.7083 2.81922 25.7083 4.34766V6.14977H24.6495V4.34766C24.6495 3.40297 23.8812 2.63438 22.937 2.63438H10.7929C9.84867 2.63438 9.08047 3.40297 9.08047 4.34766V6.14977H8.02383V4.34766C8.02375 2.81922 9.26602 1.57578 10.7929 1.57578ZM1.5757 8.40094C1.5757 8.02852 1.8782 7.72547 2.25 7.72547H5.81992V15.7022H2.25C1.8782 15.7022 1.5757 15.3992 1.5757 15.0268V8.40094ZM1.5757 26.4412V17.1746C1.78867 17.2417 2.01516 17.2779 2.25 17.2779H4.2693V19.7575C4.2693 20.1926 4.62203 20.5454 5.05711 20.5454H12.2174C12.6525 20.5454 13.0053 20.1926 13.0053 19.7575V17.2779H21.1758V19.7575C21.1758 20.1926 21.5285 20.5454 21.9637 20.5454H29.124C29.5591 20.5454 29.9118 20.1926 29.9118 19.7575V17.2779H31.9312C32.1659 17.2779 32.3924 17.2417 32.6055 17.1746V22.5816L30.4701 24.7187L24.3669 22.8475C24.0835 22.761 23.7757 22.8402 23.5697 23.053L21.6318 25.0565C21.4624 25.2316 21.3837 25.4749 21.4182 25.7159C21.4527 25.957 21.5967 26.1684 21.8084 26.289L22.076 26.4412H1.5757V26.4412ZM36.3958 25.2656L33.414 28.3141C33.2103 28.5223 33.1381 28.8261 33.2263 29.1037L35.1595 35.1833L34.2437 36.0885L31.4395 31.2732C31.322 31.0713 31.1209 30.9321 30.8905 30.893C30.6602 30.8542 30.4243 30.919 30.2469 31.0708L27.3558 33.5413C27.1184 33.7442 27.0233 34.0681 27.1132 34.3672L28.0394 37.4452L27.5402 37.932L26.2912 35.713C26.1751 35.5067 25.9724 35.3636 25.7393 35.3232C25.6945 35.3154 25.6495 35.3116 25.6046 35.3116C25.4165 35.3116 25.2327 35.3791 25.0884 35.5043L24.9889 35.5905C24.9761 35.6017 24.9636 35.6133 24.9515 35.6252C24.7158 35.8581 24.3623 36.0272 24.1109 36.0272C23.9873 36.0272 23.9262 35.9873 23.8812 35.9472C23.8648 35.9327 23.8592 35.9261 23.8592 35.9261C23.8325 35.8937 23.8033 35.8635 23.7718 35.8358C23.7514 35.8179 23.7336 35.8009 23.7184 35.7854C23.5101 35.5466 23.7645 34.9952 24.0337 34.7175C24.0459 34.7048 24.0577 34.6919 24.0691 34.6784L24.1553 34.5764C24.3082 34.396 24.372 34.1565 24.329 33.9239C24.286 33.6913 24.1409 33.4905 23.9336 33.3766L21.7009 32.1498L22.182 31.6452L25.2662 32.5373C25.5663 32.6239 25.8895 32.5252 26.0898 32.2855L28.5275 29.3677C28.6771 29.1886 28.7397 28.9523 28.6982 28.7225C28.6567 28.4929 28.5155 28.2933 28.3126 28.1777L25.4451 26.5457C25.4376 26.5413 25.4302 26.5369 25.4224 26.5327L23.4705 25.4219L24.3666 24.4955L30.4614 26.3641C30.7405 26.4497 31.0436 26.374 31.2496 26.1677L34.2593 23.1559C34.7359 22.6846 35.2534 22.4354 35.756 22.4354C36.1193 22.4354 36.4578 22.5694 36.7101 22.8124C37.2276 23.3383 37.3297 24.3 36.3958 25.2656Z"
                                          fill="#161920"
                                          ></path>
                                    </svg>
                                 </div>
                                 <div>
                                    <h4>Explore More</h4>
                                    <p class="mb-0">Find Peace Through Every Journey</p>
                                 </div>
                              </div>
                              <!-- Single Item -->
                              <div class="about-card-sm d-flex align-items-center gap-3">
                                 <div class="icon bg-white">
                                    <svg
                                       xmlns="http://www.w3.org/2000/svg"
                                       width="40"
                                       height="40"
                                       viewBox="0 0 40 40"
                                       fill="none"
                                       >
                                       <g clip-path="url(#clip0_1_307)">
                                          <path
                                             d="M34.0141 24.7731C32.894 24.5939 29.3924 24.0335 28.2812 23.8557V22.4741C31.1065 21.2412 32.9688 18.4309 32.9688 15.3126V12.1095H36.875C37.3064 12.1095 37.6562 11.7596 37.6562 11.3282V10.4329C37.6562 8.55719 36.1303 7.03125 34.2547 7.03125H32.9298C32.5366 3.08883 29.2005 0 25.1562 0C21.112 0 17.7759 3.08883 17.3827 7.03125H16.0578C14.1822 7.03125 12.6562 8.55719 12.6562 10.4328V11.3281C12.6562 11.7595 13.006 12.1094 13.4375 12.1094H17.3438V15.3125C17.3438 18.431 19.2062 21.2414 22.0312 22.4741V23.8557C20.8352 24.0471 17.502 24.5805 16.2984 24.7731C12.8551 25.3244 10.3125 28.2977 10.3125 31.793V39.2188C10.3125 39.6502 10.6623 40 11.0938 40H39.2188C39.6502 40 40 39.6502 40 39.2188V31.793C40 28.3058 37.4655 25.3256 34.0141 24.7731ZM25.1562 1.5625C28.3378 1.5625 30.9698 3.95266 31.3557 7.03125H18.9568C19.3427 3.95266 21.9747 1.5625 25.1562 1.5625ZM18.9062 15.3125V12.1094H21.7188C22.1502 12.1094 22.5001 11.7595 22.5001 11.3281C22.5001 10.8967 22.1502 10.5469 21.7188 10.5469C20.9135 10.5469 15.1696 10.5469 14.2188 10.5469V10.4328C14.2188 9.41875 15.0437 8.59375 16.0578 8.59375H34.2547C35.2687 8.59375 36.0938 9.41875 36.0938 10.4328V10.5469C35.3402 10.5469 29.5725 10.5469 28.7501 10.5469C28.3187 10.5469 27.9688 10.8967 27.9688 11.3281C27.9688 11.7595 28.3187 12.1094 28.7501 12.1094H31.4062V15.3125C31.4062 18.7278 28.6416 21.5625 25.1562 21.5625C21.6711 21.5625 18.9062 18.728 18.9062 15.3125ZM22.9359 25.2933C23.315 25.2327 23.5938 24.9057 23.5938 24.5219V22.9675C24.105 23.0713 24.6273 23.125 25.1562 23.125C25.6852 23.125 26.2076 23.0713 26.7188 22.9675V24.5219C26.7188 24.9057 26.9975 25.2327 27.3766 25.2933L29.9695 25.7082L25.1562 32.126L20.343 25.7082L22.9359 25.2933ZM26.7969 38.4375H23.5938V34.8438H26.7969V38.4375ZM11.875 31.793C11.875 29.0526 13.8392 26.7491 16.5453 26.3159L18.5992 25.9873L24.0695 33.2812H22.8125C22.3811 33.2812 22.0312 33.6311 22.0312 34.0625V38.4375H16.5625V34.0625C16.5625 33.6311 16.2127 33.2812 15.7812 33.2812C15.3498 33.2812 15 33.6311 15 34.0625V38.4375H11.875V31.793ZM38.4375 38.4375H35.3125V34.0625C35.3125 33.6311 34.9627 33.2812 34.5312 33.2812C34.0998 33.2812 33.75 33.6311 33.75 34.0625V38.4375H28.3594V34.0625C28.3594 33.6311 28.0095 33.2812 27.5781 33.2812H26.243L31.7133 25.9873L33.7671 26.3159C36.4733 26.7492 38.4375 29.0526 38.4375 31.793V38.4375Z"
                                             fill="#161920"
                                             ></path>
                                          <path
                                             d="M27.8612 16.8753C28.0772 16.5018 27.9494 16.0239 27.5759 15.8079C27.2025 15.5919 26.7245 15.7197 26.5086 16.0932C26.2298 16.5754 25.7115 16.8749 25.156 16.8749C24.6004 16.8749 24.0822 16.5754 23.8034 16.0932C23.5876 15.7199 23.1098 15.5918 22.7361 15.8079C22.3626 16.0239 22.2347 16.5018 22.4508 16.8753C23.0078 17.8388 24.0444 18.4374 25.156 18.4374C26.2676 18.4374 27.3042 17.8388 27.8612 16.8753Z"
                                             fill="#161920"
                                             ></path>
                                          <path
                                             d="M0.78125 38.4375C0.349766 38.4375 0 38.7873 0 39.2188C0 39.6502 0.349766 40 0.78125 40H5.46875C5.90023 40 6.25 39.6502 6.25 39.2188C6.25 38.7873 5.90023 38.4375 5.46875 38.4375H3.90625V25.6852L15.1339 21.1941C15.4305 21.0755 15.625 20.7882 15.625 20.4688C15.625 20.1493 15.4305 19.862 15.1339 19.7434L3.90625 15.2523V11.0938C3.90625 10.6623 3.55648 10.3125 3.125 10.3125C2.69352 10.3125 2.34375 10.6623 2.34375 11.0938V38.4375H0.78125ZM12.7402 20.4688L3.90625 24.0023V16.9352L12.7402 20.4688Z"
                                             fill="#161920"
                                             ></path>
                                          <path
                                             d="M25.2344 12.1094C25.6658 12.1094 26.0156 11.7596 26.0156 11.3281C26.0156 10.8967 25.6658 10.5469 25.2344 10.5469C24.8029 10.5469 24.4531 10.8967 24.4531 11.3281C24.4531 11.7596 24.8029 12.1094 25.2344 12.1094Z"
                                             fill="#161920"
                                             ></path>
                                       </g>
                                       <defs>
                                          <clipPath id="clip0_1_307">
                                             <rect width="40" height="40" fill="white"></rect>
                                          </clipPath>
                                       </defs>
                                    </svg>
                                 </div>
                                 <div>
                                    <h4>Spiritual Escape</h4>
                                    <p class="mb-0">Spiritual Journeys Begin with Ananda</p>
                                 </div>
                              </div>
                           </div>
                           <ul class="about-list-two list-unstyled mb-5">
                              <li>
                                 <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="20"
                                    height="20"
                                    viewBox="0 0 20 20"
                                    fill="none"
                                    >
                                    <path
                                       fill-rule="evenodd"
                                       clip-rule="evenodd"
                                       d="M10 20C4.477 20 0 15.523 0 10C0 4.477 4.477 0 10 0C15.523 0 20 4.477 20 10C20 15.523 15.523 20 10 20ZM8.823 12.14L6.058 9.373L5 10.431L8.119 13.552C8.30653 13.7395 8.56084 13.8448 8.826 13.8448C9.09116 13.8448 9.34547 13.7395 9.533 13.552L15.485 7.602L14.423 6.54L8.823 12.14Z"
                                       fill="#02A5CE"
                                       ></path>
                                 </svg>
                                 Adventure Awaits You
                              </li>
                              <li>
                                 <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="20"
                                    height="20"
                                    viewBox="0 0 20 20"
                                    fill="none"
                                    >
                                    <path
                                       fill-rule="evenodd"
                                       clip-rule="evenodd"
                                       d="M10 20C4.477 20 0 15.523 0 10C0 4.477 4.477 0 10 0C15.523 0 20 4.477 20 10C20 15.523 15.523 20 10 20ZM8.823 12.14L6.058 9.373L5 10.431L8.119 13.552C8.30653 13.7395 8.56084 13.8448 8.826 13.8448C9.09116 13.8448 9.34547 13.7395 9.533 13.552L15.485 7.602L14.423 6.54L8.823 12.14Z"
                                       fill="#02A5CE"
                                       ></path>
                                 </svg>
                                 Travel Beyond Boundaries
                              </li>
                              <li>
                                 <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="20"
                                    height="20"
                                    viewBox="0 0 20 20"
                                    fill="none"
                                    >
                                    <path
                                       fill-rule="evenodd"
                                       clip-rule="evenodd"
                                       d="M10 20C4.477 20 0 15.523 0 10C0 4.477 4.477 0 10 0C15.523 0 20 4.477 20 10C20 15.523 15.523 20 10 20ZM8.823 12.14L6.058 9.373L5 10.431L8.119 13.552C8.30653 13.7395 8.56084 13.8448 8.826 13.8448C9.09116 13.8448 9.34547 13.7395 9.533 13.552L15.485 7.602L14.423 6.54L8.823 12.14Z"
                                       fill="#02A5CE"
                                       ></path>
                                 </svg>
                                 Divine Travel Experience
                              </li>
                              <li>
                                 <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="20"
                                    height="20"
                                    viewBox="0 0 20 20"
                                    fill="none"
                                    >
                                    <path
                                       fill-rule="evenodd"
                                       clip-rule="evenodd"
                                       d="M10 20C4.477 20 0 15.523 0 10C0 4.477 4.477 0 10 0C15.523 0 20 4.477 20 10C20 15.523 15.523 20 10 20ZM8.823 12.14L6.058 9.373L5 10.431L8.119 13.552C8.30653 13.7395 8.56084 13.8448 8.826 13.8448C9.09116 13.8448 9.34547 13.7395 9.533 13.552L15.485 7.602L14.423 6.54L8.823 12.14Z"
                                       fill="#02A5CE"
                                       ></path>
                                 </svg>
                                 Pilgrimage With Purpose
                              </li>
                           </ul>
                           <!-- Button -->
                           <a href="/about" class="btn btn-primary"
                              >More About Us <i class="icon-arrow-right"></i
                              ></a>
                        </div>
                     </div>
                     <!-- About Thumbnail -->
                     <div class="col-12 col-lg-6">
                        <div class="about-thumbnail">
                           <img src="assets/276-CSWytjYe.png" alt="shubham" />
                        </div>
                     </div>
                  </div>
               </div>
               <!-- Divider -->
               <div class="divider"></div>
            </section>
            <section class="destination-section-four bg-gray">
               <!-- Divider -->
               <div class="divider"></div>
               <div class="shape1">
                  <img src="assets/01-zhSTL4l3.png" alt="shubham" />
               </div>
               <div class="shape2">
                  <img src="assets/02-BOeYn-Nv.png" alt="shubham" />
               </div>
               <div class="destination-shape-1">
                  <img src="assets/destination-shape-1-CVO6IG48.png" alt="shubham" />
               </div>
               <div class="destination-shape-2">
                  <img src="assets/destination-shape-2-BQNvanh3.png" alt="shubham" />
               </div>
               <div class="container">
                  <div class="row justify-content-center">
                     <div class="col-12 col-lg-8">
                        <!-- Section Heading -->
                        <div class="section-heading text-center">
                           <span class="sub-title">Comfort. Class. Exploration.</span>
                           <h2>Travel in Style with Ananda</h2>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- Destination Navigation -->
               <div class="container">
                  <ul
                     class="nav fadeInUp"
                     data-delay="0.2"
                     role="tablist"
                     style="
                     translate: none;
                     rotate: none;
                     scale: none;
                     opacity: 1;
                     visibility: inherit;
                     transform: translate(0px, 0px);
                     "
                     >
                     <li class="nav-item" role="presentation">
                        <a
                           href="#all"
                           data-bs-toggle="tab"
                           class="nav-link active"
                           aria-selected="true"
                           role="tab"
                           >All</a
                           >
                     </li>
                     <li class="nav-item" role="presentation">
                        <a
                           href="#india"
                           data-bs-toggle="tab"
                           class="nav-link"
                           aria-selected="false"
                           tabindex="-1"
                           role="tab"
                           >India</a
                           >
                     </li>
                     <li class="nav-item" role="presentation">
                        <a
                           href="#foreign"
                           data-bs-toggle="tab"
                           class="nav-link"
                           aria-selected="false"
                           tabindex="-1"
                           role="tab"
                           >Foreign</a
                           >
                     </li>
                     <li class="nav-item" role="presentation">
                        <a
                           href="#devotional"
                           data-bs-toggle="tab"
                           class="nav-link"
                           aria-selected="false"
                           tabindex="-1"
                           role="tab"
                           >Devotional</a
                           >
                     </li>
                  </ul>
               </div>
               <!-- Divider -->
               <div class="divider-sm"></div>
               <div class="tab-content">
                  <div id="all" class="tab-pane fade show active" role="tabpanel">
                     <div class="container-fluid">
                        <div
                           class="swiper destination-swiper swiper-initialized swiper-horizontal swiper-backface-hidden"
                           >
                           <div
                              class="swiper-wrapper"
                              id="swiper-wrapper-1017e4d2d5432ff7c"
                              aria-live="off"
                              style="
                              transition-duration: 0ms;
                              transform: translate3d(-361.5px, 0px, 0px);
                              transition-delay: 0ms;
                              "
                              >




                              <div
                                 class="swiper-slide"
                                 style="width: 331.5px; margin-right: 30px"
                                 >
                                 <div class="destination-box-items">
                                    <div class="destination-image">
                                       <img src="./shubham/baidyanath2.jpg" alt="shubham" />
                                       <span class="top-items">Ananda</span>
                                    </div>
                                    <div class="destination-content">
                                       <h3>
                                          <a href="/gangasagar-baidyanath"
                                             >Gangasagar Baba Baidyanath</a
                                             >
                                       </h3>
                                       <ul>
                                          <li>From <span> &#8377 34,551</span></li>
                                       </ul>
                                       <div class="destination-rattiing">
                                          <p>07 Nov &#45; 11 Nov 2025</p>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div
                                 class="swiper-slide"
                                 style="width: 331.5px; margin-right: 30px"
                                 >
                                 <div class="destination-box-items">
                                    <div class="destination-image">
                                       <img src="./shubham/southtemple.jpg" alt="shubham" />
                                       <span class="top-items">Ananda</span>
                                    </div>
                                    <div class="destination-content">
                                       <h3>
                                          <a href="/south-temple"
                                             >South Indian Mandir Yatra</a
                                             >
                                       </h3>
                                       <ul>
                                          <li>From <span> &#8377 59,771</span></li>
                                       </ul>
                                       <div class="destination-rattiing">
                                          <p>21 Nov &#45; 27 Nov 2025</p>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div
                                 class="swiper-slide"
                                 style="width: 331.5px; margin-right: 30px"
                                 >
                                 <div class="destination-box-items">
                                    <div class="destination-image">
                                       <img src="./shubham/andaman.webp" alt="shubham" />
                                       <span class="top-items">Ananda</span>
                                    </div>
                                    <div class="destination-content">
                                       <h3>
                                          <a href="/andaman">Andaman Group Tour</a>
                                       </h3>
                                       <ul>
                                          <li>From <span> &#8377 36,771</span></li>
                                       </ul>
                                       <div class="destination-rattiing">
                                          <p>15 Dec &#45; 21 Dec 2025</p>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div
                                 class="swiper-slide"
                                 style="width: 331.5px; margin-right: 30px"
                                 >
                                 <div class="destination-box-items">
                                    <div class="destination-image">
                                       <img src="./shubham/dubai.jpg" alt="shubham" />
                                       <span class="top-items">Ananda</span>
                                    </div>
                                    <div class="destination-content">
                                       <h3>
                                          <a href="/tour-dubai">Dubai Group Tour</a>
                                       </h3>
                                       <ul>
                                          <li>From <span> &#8377 79,999</span></li>
                                       </ul>
                                       <div class="destination-rattiing">
                                          <p>05 Jan &#45; 10 Jan 2026</p>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div
                                 class="swiper-slide"
                                 style="width: 331.5px; margin-right: 30px"
                                 >
                                 <div class="destination-box-items">
                                    <div class="destination-image">
                                       <img src="./shubham/dubai.jpg" alt="shubham" />
                                       <span class="top-items">Ananda</span>
                                    </div>
                                    <div class="destination-content">
                                       <h3>
                                          <a href="/tour-dubai">Dubai Group Tour</a>
                                       </h3>
                                       <ul>
                                          <li>From <span> &#8377 79,999</span></li>
                                       </ul>
                                       <div class="destination-rattiing">
                                          <p>23 March &#45; 28 March 2026</p>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div
                                 class="swiper-slide"
                                 style="width: 331.5px; margin-right: 30px"
                                 >
                                 <div class="destination-box-items">
                                    <div class="destination-image">
                                       <img src="./shubham/pashupatinath.png" alt="shubham" />
                                       <span class="top-items">Ananda</span>
                                    </div>
                                    <div class="destination-content">
                                       <h3>
                                          <a href="/tour-pashupatinath">Pashupatinath Nepal Darshan Yatra</a>
                                       </h3>
                                       <ul>
                                          <li>From <span> &#8377 27,794</span></li>
                                       </ul>
                                       <div class="destination-rattiing">
                                          <p>21 April &#45; 24 April 2026</p>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <span
                              class="swiper-notification"
                              aria-live="assertive"
                              aria-atomic="true"
                              ></span>
                        </div>
                     </div>
                  </div>
                  <div id="india" class="tab-pane fade" role="tabpanel">
                     <div class="container-fluid">
                        <div
                           class="swiper destination-swiper swiper-initialized swiper-horizontal"
                           >
                           <div
                              class="swiper-wrapper"
                              id="swiper-wrapper-8c65a092a3576aad"
                              aria-live="off"
                              style="transition-duration: 300ms"
                              >
                              <!-- Slide Item -->
                           </div>
                           <span
                              class="swiper-notification"
                              aria-live="assertive"
                              aria-atomic="true"
                              ></span>
                        </div>
                     </div>
                  </div>
                  <div id="foreign" class="tab-pane fade" role="tabpanel">
                     <div class="container-fluid">
                        <div
                           class="swiper destination-swiper swiper-initialized swiper-horizontal"
                           >
                           <div
                              class="swiper-wrapper"
                              id="swiper-wrapper-f040fd7caece6f09"
                              aria-live="off"
                              style="transition-duration: 300ms"
                              >
                              <!-- Slide Item -->
                           </div>
                           <span
                              class="swiper-notification"
                              aria-live="assertive"
                              aria-atomic="true"
                              ></span>
                        </div>
                     </div>
                  </div>
                  <div id="devotional" class="tab-pane fade" role="tabpanel">
                     <div class="container-fluid">
                        <div
                           class="swiper destination-swiper swiper-initialized swiper-horizontal"
                           >
                           <div
                              class="swiper-wrapper"
                              id="swiper-wrapper-6071aa61c57761510"
                              aria-live="off"
                              style="transition-duration: 300ms"
                              >
                              <!-- Slide Item -->
                           </div>
                           <span
                              class="swiper-notification"
                              aria-live="assertive"
                              aria-atomic="true"
                              ></span>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="btn-button1 text-center pt-5 pb-5">
                  <a href="/tours" class="btn btn-primary"
                     >Check All Tours <i class="icon-arrow-right"></i
                     ></a>
               </div>
               <!-- Divider -->
               <div class="divider"></div>
            </section>
            <section class="choose-us-section-four">
               <!-- Divider -->
               <div class="divider"></div>
               <div class="container">
                  <!-- Shape -->
                  <div
                     class="hotair-ballon"
                     data-speed="0.8"
                     data-lag="0"
                     style="
                     translate: none;
                     rotate: none;
                     scale: none;
                     transform: translate(0px, -124.6px);
                     will-change: transform;
                     "
                     >
                     <img src="assets/hotair-ballon-BTZcyqQs.png" alt="shubham" />
                  </div>
                  <div class="choose-us-wrapper">
                     <div class="row g-4 align-items-center">
                        <div class="col-md-6">
                           <div class="choose-us-content">
                              <div class="section-heading">
                                 <span
                                    class="sub-title fadeInUp"
                                    style="
                                    translate: none;
                                    rotate: none;
                                    scale: none;
                                    opacity: 1;
                                    visibility: inherit;
                                    transform: translate(0px, 0px);
                                    "
                                    >Why Choose Us</span
                                    >
                                 <h2
                                    class="mb-0 fadeInUp"
                                    data-delay="0.2"
                                    style="
                                    translate: none;
                                    rotate: none;
                                    scale: none;
                                    opacity: 1;
                                    visibility: inherit;
                                    transform: translate(0px, 0px);
                                    "
                                    >
                                    Turning Every Journey Into Beautiful Memories
                                 </h2>
                              </div>
                              <p
                                 class="choose-text fadeInUp"
                                 data-delay="0.3"
                                 style="
                                 translate: none;
                                 rotate: none;
                                 scale: none;
                                 opacity: 1;
                                 visibility: inherit;
                                 transform: translate(0px, 0px);
                                 "
                                 >
                                 Embark on divine journeys and sacred pilgrimages with
                                 Ananda Holidays. Experience the spiritual beauty of
                                 India’s holy destinations, connect with tradition, and
                                 create meaningful, memorable travel experiences with every
                                 trip.
                              </p>
                              <div class="choose-icon">
                                 <div
                                    class="icon-items fadeInUp"
                                    data-delay="0.2"
                                    style="
                                    translate: none;
                                    rotate: none;
                                    scale: none;
                                    opacity: 1;
                                    visibility: inherit;
                                    transform: translate(0px, 0px);
                                    "
                                    >
                                    <div class="icon">
                                       <svg
                                          xmlns="http://www.w3.org/2000/svg"
                                          width="40"
                                          height="40"
                                          viewBox="0 0 40 40"
                                          fill="none"
                                          >
                                          <path
                                             d="M31.9662 7.49867H31.025C29.4231 7.49867 27.8506 7.9343 26.4781 8.75805L24.4575 9.97055L26.695 11.4624L25.0837 14.6843L28.125 13.9243V15.0562C28.125 15.3037 28.0525 15.543 27.915 15.7493L27.1412 16.9099C26.9669 17.1718 26.875 17.4755 26.875 17.7893C26.875 18.548 27.4112 19.1843 28.125 19.3387V20.2374C28.125 21.6968 29.2169 22.8937 30.625 23.0849V25.3437C29.6138 26.0612 28.7612 26.9824 28.125 28.0462V23.7487C28.125 22.7149 27.2838 21.8737 26.25 21.8737H21.6362L21.3206 21.243C21.1475 20.8955 20.8294 20.6524 20.4481 20.5762L18.1637 20.1193C17.55 19.9943 16.9312 20.3524 16.7331 20.9493L16.5425 21.5205L16.4738 21.4974C16.2694 21.4293 16.1169 21.2643 16.0644 21.0562L15.8463 20.1849C17.2588 19.5737 18.3631 18.3668 18.8288 16.8737H19.375C20.4088 16.8737 21.25 16.0324 21.25 14.9987C21.25 13.9649 20.4088 13.1237 19.375 13.1237H19.2425L19.3319 11.8737H19.375C20.0644 11.8737 20.625 11.313 20.625 10.6237V9.37367C20.625 8.97805 20.4369 8.62992 20.15 8.40055L20.4475 7.50742C20.565 7.15492 20.625 6.78742 20.625 6.4143C20.625 5.33242 20.1081 4.29867 19.2425 3.6493L16.375 1.49867C14.8713 0.369922 12.6281 0.370547 11.1256 1.49867L8.2575 3.6493C7.39187 4.29867 6.875 5.33242 6.875 6.4143C6.875 6.78742 6.935 7.15492 7.0525 7.50742L7.35 8.40055C7.06313 8.62992 6.875 8.97805 6.875 9.37367V10.6237C6.875 11.313 7.43563 11.8737 8.125 11.8737H8.16813L8.2575 13.1237H8.125C7.09125 13.1237 6.25 13.9649 6.25 14.9987C6.25 16.0324 7.09125 16.8737 8.125 16.8737H8.67125C9.13688 18.3668 10.2406 19.573 11.6531 20.1849L11.45 20.9949C11.3944 21.2193 11.22 21.393 10.9956 21.4493L10.9381 21.4637L10.7669 20.9499C10.5675 20.3518 9.9525 19.9943 9.33562 20.1193L7.05125 20.5762C6.90875 20.6049 6.77875 20.663 6.65812 20.7355L4.7525 17.8774C4.33438 17.2487 3.63313 16.8737 2.87812 16.8737C1.63563 16.8737 0.625 17.8843 0.625 19.1268V22.5962C0.625 27.9705 4.24125 32.728 9.41938 34.1662L11.875 34.8487V35.6237C11.875 37.6918 13.5569 39.3737 15.625 39.3737H21.25H29.1031C34.0775 39.3737 38.125 35.3262 38.125 30.3518C38.125 28.028 37.2525 25.8387 35.625 24.1199V22.8737C37.9481 21.5587 39.375 19.1243 39.375 16.4312V14.9074C39.375 10.8224 36.0513 7.49867 31.9662 7.49867ZM11.1837 22.6905L13.125 24.6324V26.2487C13.125 26.7305 13.3131 27.1662 13.6125 27.4987C13.3125 27.8312 13.125 28.2668 13.125 28.7487V30.4343L8.4225 23.3805L11.1837 22.6905ZM14.375 28.7487C14.375 28.4043 14.655 28.1237 15 28.1237H15.625H26.875V31.8737H14.375V28.7487ZM26.875 23.7487V26.8737H15.625H15C14.655 26.8737 14.375 26.593 14.375 26.2487V23.7487C14.375 23.4043 14.655 23.1237 15 23.1237H26.25C26.595 23.1237 26.875 23.4043 26.875 23.7487ZM20.2025 21.8018L20.2388 21.8737H17.7419L17.9181 21.3449L20.2025 21.8018ZM19.375 14.3737C19.72 14.3737 20 14.6543 20 14.9987C20 15.343 19.72 15.6237 19.375 15.6237H19.0638L19.1531 14.3737H19.375ZM8.125 9.37367H11.25V8.12367H8.575L8.2375 7.11117C8.16313 6.8868 8.125 6.65242 8.125 6.4143C8.125 5.72367 8.45438 5.06367 9.00688 4.6493L11.8756 2.49867C12.9487 1.69242 14.5506 1.6918 15.625 2.49867L18.4931 4.64867C19.0456 5.06367 19.375 5.72367 19.375 6.4143C19.375 6.65242 19.3369 6.8868 19.2619 7.1118L18.925 8.12367H12.5V9.37367H19.375V10.6237H8.125V9.37367ZM7.5 14.9987C7.5 14.6543 7.78 14.3737 8.125 14.3737H8.34687L8.43625 15.6237H8.125C7.78 15.6237 7.5 15.343 7.5 14.9987ZM9.68625 15.5899L9.42125 11.8737H18.0794L17.8144 15.5899C17.6619 17.7118 15.8769 19.3737 13.75 19.3737C11.6231 19.3737 9.83813 17.7118 9.68625 15.5899ZM13.75 20.6237C14.0562 20.6237 14.355 20.593 14.6481 20.5424L14.8525 21.3599C14.8988 21.5462 14.9794 21.7149 15.0756 21.8737H15C14.2262 21.8737 13.5612 22.3449 13.275 23.0149L12.2825 22.0224C12.455 21.8118 12.5944 21.5724 12.6631 21.298L12.8519 20.543C13.145 20.593 13.4438 20.6237 13.75 20.6237ZM9.58125 21.3443L9.72188 21.7674L7.68625 22.2762L7.36125 21.7887L9.58125 21.3443ZM3.71312 18.5705L12.6462 31.9699C12.3794 32.0812 12.1631 32.2849 12.0275 32.538L2.475 18.2093C2.59875 18.1549 2.735 18.1237 2.87812 18.1237C3.215 18.1237 3.52688 18.2905 3.71312 18.5705ZM1.875 22.5962V19.5624L11.0475 33.3212L9.75375 32.9618C5.115 31.6737 1.875 27.4112 1.875 22.5962ZM13.125 35.6237V33.1237H26.875V35.5218C26.5075 35.5855 26.1319 35.6237 25.7481 35.6237H25.5181C25.26 34.8962 24.565 34.3737 23.75 34.3737C22.935 34.3737 22.24 34.8962 21.9819 35.6237H21.25C20.2162 35.6237 19.375 36.4649 19.375 37.4987C19.375 37.7187 19.42 37.9274 19.49 38.1237H15.625C14.2463 38.1237 13.125 37.0024 13.125 35.6237ZM29.1031 38.1237H21.25C20.905 38.1237 20.625 37.843 20.625 37.4987C20.625 37.1543 20.905 36.8737 21.25 36.8737H23.125V36.2487C23.125 35.9043 23.405 35.6237 23.75 35.6237C24.095 35.6237 24.375 35.9043 24.375 36.2487V36.8737H25.7481C28.8987 36.8737 31.665 34.9849 32.93 32.2593L36.2644 33.3705C35.0837 36.1612 32.3187 38.1237 29.1031 38.1237ZM36.875 30.3518C36.875 30.983 36.7913 31.593 36.6488 32.1812L33.3694 31.088C33.5075 30.598 33.6006 30.0893 33.6406 29.5655C33.69 28.9237 34.0781 28.3462 34.6544 28.058L34.095 26.9399C33.1287 27.423 32.4769 28.3924 32.3938 29.4693C32.1925 32.0893 30.4606 34.2743 28.1244 35.1774V32.5462V32.5249C28.1244 28.7255 31.0175 25.4968 34.7606 25.0355C36.1219 26.4812 36.875 28.3568 36.875 30.3518ZM35 18.1237H34.375V23.8268C33.4919 23.9599 32.6512 24.2218 31.875 24.5987V23.018C32.6512 22.8043 33.3106 22.2743 33.6844 21.528L32.5662 20.9687C32.2869 21.5268 31.7262 21.8737 31.1025 21.8737H31.0112C30.2431 21.8737 29.6006 21.3393 29.4263 20.6237H29.7412C30.4781 20.6237 31.1706 20.3368 31.6919 19.8162L30.8081 18.9318C30.5231 19.2168 30.1437 19.3737 29.7412 19.3737H29.375V18.1237H28.4594C28.275 18.1237 28.125 17.9737 28.125 17.7893C28.125 17.723 28.1444 17.6593 28.1812 17.6037L28.955 16.4424C29.23 16.0299 29.375 15.5505 29.375 15.0562V13.6118L30.7862 13.2593C31.0787 13.9149 31.7362 14.3737 32.5 14.3737H34.375V16.8737H35C35.345 16.8737 35.625 17.1543 35.625 17.4987C35.625 17.843 35.345 18.1237 35 18.1237ZM38.125 16.4312C38.125 18.4205 37.1881 20.2393 35.625 21.3874V19.2662C36.3525 19.008 36.875 18.313 36.875 17.498C36.875 16.683 36.3525 15.988 35.625 15.7299V13.1237H32.5C32.155 13.1237 31.875 12.843 31.875 12.4987V11.698L27.4169 12.8124L28.3056 11.0343L26.7931 10.0262L27.1206 9.82992C28.2994 9.12242 29.6494 8.74867 31.025 8.74867H31.9662C35.3619 8.74867 38.125 11.5112 38.125 14.9074V16.4312ZM31.875 16.2487C31.875 16.5937 31.595 16.8737 31.25 16.8737C30.905 16.8737 30.625 16.5937 30.625 16.2487C30.625 15.9037 30.905 15.6237 31.25 15.6237C31.595 15.6237 31.875 15.9037 31.875 16.2487ZM25.625 29.3737V30.6237H15.625V29.3737H25.625ZM25.625 25.6237H15.625V24.3737H25.625V25.6237ZM12.5 13.7487C12.5 14.0937 12.22 14.3737 11.875 14.3737C11.53 14.3737 11.25 14.0937 11.25 13.7487C11.25 13.4037 11.53 13.1237 11.875 13.1237C12.22 13.1237 12.5 13.4037 12.5 13.7487ZM15 13.7487C15 13.4037 15.28 13.1237 15.625 13.1237C15.97 13.1237 16.25 13.4037 16.25 13.7487C16.25 14.0937 15.97 14.3737 15.625 14.3737C15.28 14.3737 15 14.0937 15 13.7487ZM13.6025 18.1237H12.5V16.8737H13.6025C14.2262 16.8737 14.7875 16.5268 15.0663 15.9693L16.1844 16.5287C15.6912 17.5124 14.7019 18.1237 13.6025 18.1237ZM15.625 4.99867C15.625 3.96492 14.7837 3.12367 13.75 3.12367C12.7163 3.12367 11.875 3.96492 11.875 4.99867C11.875 6.03242 12.7163 6.87367 13.75 6.87367C14.7837 6.87367 15.625 6.03242 15.625 4.99867ZM13.125 4.99867C13.125 4.6543 13.405 4.37367 13.75 4.37367C14.095 4.37367 14.375 4.6543 14.375 4.99867C14.375 5.34305 14.095 5.62367 13.75 5.62367C13.405 5.62367 13.125 5.34305 13.125 4.99867Z"
                                             fill="#3CB371"
                                             ></path>
                                       </svg>
                                    </div>
                                    <div class="content">
                                       <h4>Explore With Ananda</h4>
                                       <p>Travel beyond limits, create lasting memories.</p>
                                    </div>
                                 </div>
                                 <div
                                    class="icon-items fadeInUp"
                                    data-delay="0.4"
                                    style="
                                    translate: none;
                                    rotate: none;
                                    scale: none;
                                    opacity: 1;
                                    visibility: inherit;
                                    transform: translate(0px, 0px);
                                    "
                                    >
                                    <div class="icon">
                                       <svg
                                          xmlns="http://www.w3.org/2000/svg"
                                          width="40"
                                          height="40"
                                          viewBox="0 0 40 40"
                                          fill="none"
                                          >
                                          <g clip-path="url(#clip0_27_21868)">
                                             <path
                                                d="M9.43937 15.9187L9.4075 15.8231L10.5931 15.4275L10.625 15.5231C10.8944 16.3319 11.6481 16.875 12.5 16.875C13.3519 16.875 14.1056 16.3319 14.375 15.5237L14.4069 15.4275L15.5925 15.8231L15.5606 15.9194C15.1212 17.2388 13.8912 18.125 12.5 18.125C11.1088 18.125 9.87875 17.2388 9.43937 15.9187ZM20 32.5C21.3913 32.5 22.6213 31.6138 23.0606 30.2938L23.0925 30.1975L21.9069 29.8019L21.875 29.8988C21.6056 30.7069 20.8519 31.25 20 31.25C19.1481 31.25 18.3944 30.7069 18.125 29.8981L18.0931 29.8019L16.9075 30.1975L16.9394 30.2931C17.3787 31.6138 18.6087 32.5 20 32.5ZM30.6569 14.8025L30.625 14.8987C30.3556 15.7069 29.6019 16.25 28.75 16.25C27.8981 16.25 27.1444 15.7069 26.875 14.8981L26.8431 14.8019L25.6575 15.1975L25.6894 15.2931C26.1287 16.6137 27.3587 17.5 28.75 17.5C30.1413 17.5 31.3713 16.6137 31.8106 15.2937L31.8425 15.1975L30.6569 14.8025ZM39.375 39.375H0.625V29.47C0.625 27.63 1.34125 25.8994 2.64313 24.5981C3.57125 23.67 4.73938 23.0287 6.02063 22.7444L9.375 21.9988V19.6737C8.0325 18.7731 7.09938 17.31 6.91187 15.625H6.875C5.54625 15.625 4.46688 14.58 4.39 13.2706L3.38625 10.2606C3.21313 9.73938 3.125 9.1975 3.125 8.65C3.125 6.555 4.38187 4.69938 6.32625 3.92125L6.4525 3.87063C7.74313 1.86312 10 0.625 12.3944 0.625H15.6562C17.6256 0.625 19.2381 2.165 19.3625 4.10437L20.0025 4.74438C20.6644 5.40625 21.1562 6.19062 21.4725 7.0425C22.4237 5.51187 24.085 4.46688 25.995 4.38125C26.8944 3.56875 28.0469 3.125 29.2681 3.125C33.4625 3.125 36.875 6.5375 36.875 10.7319V22.8975C37.4125 23.3206 37.8869 23.8275 38.2744 24.4094C38.9944 25.49 39.375 26.7469 39.375 28.0444V39.375ZM37.2344 25.1038C36.3794 23.8206 35.0112 22.975 33.4806 22.7837L31.4756 22.5331L31.3256 22.6831C30.6381 23.3713 29.7231 23.75 28.75 23.75C28.4312 23.75 28.1206 23.7056 27.82 23.6269C28.015 24.2988 28.125 25.0069 28.125 25.7406C28.125 26.5606 27.9937 27.3706 27.7344 28.1487L27.6787 28.3162C28.78 28.6812 29.6737 29.5444 30.0556 30.6894L30.8669 33.125H27.9106C27.0763 33.125 26.2913 32.8 25.7013 32.21L25.6081 32.1169C25.1656 33.0181 24.5144 33.7956 23.7156 34.3894C26.2444 34.5256 28.4975 35.9212 29.7463 38.125H34.375V28.75H35.625V31.25H38.125V28.0444C38.125 26.9944 37.8169 25.9775 37.2344 25.1038ZM9.80062 23.1844L8.98563 23.3656L9.8075 26.6537L11.8781 25.8256C11.8781 25.7975 11.875 25.7694 11.875 25.7406C11.875 25.5856 11.8894 25.4344 11.8981 25.2819L9.80062 23.1844ZM11.1306 31.0844L10.8669 31.875H12.0894C12.5831 31.875 13.0663 31.675 13.415 31.3263L13.9244 30.8169C13.8144 30.3531 13.75 29.8719 13.75 29.375H13.5025C12.4244 29.375 11.4712 30.0619 11.1306 31.0844ZM16.47 23.7512L17.5088 23.4544C17.5031 23.3862 17.5 23.3175 17.5 23.2475C17.5 22.1569 18.195 21.1925 19.23 20.8481L19.8025 20.6569L20.1981 21.8425L19.625 22.0338C19.1019 22.2081 18.75 22.6956 18.75 23.2475C18.75 23.9075 19.2656 24.4675 19.9231 24.5225L23.3844 24.8106C24.9913 24.945 26.25 26.3131 26.25 27.9256V28.125H26.4244L26.5481 27.7531C26.765 27.1031 26.8744 26.4256 26.8744 25.7406C26.875 22.2306 24.0194 19.375 20.5094 19.375H19.4906C15.9806 19.375 13.125 22.2306 13.125 25.7406C13.125 26.4263 13.235 27.1031 13.4513 27.7537L13.5756 28.125H13.75V27.3569C13.75 25.6919 14.8687 24.2087 16.47 23.7512ZM18.125 14.375C18.8144 14.375 19.375 13.8144 19.375 13.125C19.375 12.4356 18.8144 11.875 18.125 11.875V14.375ZM16.7913 18.6281C17.6319 18.3081 18.5394 18.125 19.4906 18.125H20.5094C20.5481 18.125 20.5863 18.13 20.625 18.1306V13.2725L20.6063 13.31C20.5094 14.6012 19.44 15.625 18.125 15.625H18.0881C17.9619 16.7625 17.4944 17.7981 16.7913 18.6281ZM33.125 14.375V12.5C33.125 11.8106 32.5644 11.25 31.875 11.25H30C29.0594 11.25 28.1269 10.9394 27.375 10.375C26.91 10.0262 26.525 9.59062 26.235 9.09875C25.0863 9.7675 24.375 10.985 24.375 12.3369V14.375C24.375 16.7875 26.3375 18.75 28.75 18.75C31.1625 18.75 33.125 16.7875 33.125 14.375ZM27.3019 19.8038L26.93 21.6619C26.935 21.6694 26.9394 21.6775 26.9438 21.685L27.0581 21.7994C27.9619 22.7031 29.5381 22.7031 30.4419 21.7994L30.5713 21.67L30.1981 19.8044C29.7356 19.9275 29.2512 20 28.75 20C28.2488 20 27.7644 19.9275 27.3019 19.8038ZM26.0756 30.8169L26.585 31.3263C26.9338 31.675 27.4169 31.875 27.9106 31.875H29.1331L28.8694 31.0844C28.5288 30.0619 27.5756 29.375 26.4975 29.375H26.25C26.25 29.8719 26.1856 30.3531 26.0756 30.8169ZM15 29.375C15 32.1319 17.2431 34.375 20 34.375C22.7569 34.375 25 32.1319 25 29.375V27.9256C25 26.9581 24.245 26.1375 23.2806 26.0569L19.8194 25.7687C19.0256 25.7025 18.3375 25.265 17.9212 24.6369L16.8138 24.9531C15.7456 25.2587 15 26.2469 15 27.3569V29.375ZM16.6925 35.625C14.7063 35.625 12.8975 36.5662 11.7494 38.125H28.2506C27.1025 36.5662 25.2938 35.625 23.3075 35.625H16.6925ZM21.875 10V18.2544C23.4375 18.5387 24.8363 19.2963 25.9119 20.38L26.1194 19.3431C24.34 18.3975 23.125 16.5262 23.125 14.375V12.3369C23.125 10.4706 24.1412 8.79688 25.7562 7.9325C25.67 7.59 25.625 7.23438 25.625 6.875H26.875C26.875 7.85313 27.3425 8.78813 28.125 9.375C28.6619 9.77875 29.3281 10 30 10H31.875C33.2537 10 34.375 11.1213 34.375 12.5V14.375C34.375 16.5262 33.16 18.3975 31.3806 19.3431L31.7744 21.3106L33.6356 21.5438C34.3338 21.6306 35.0031 21.83 35.625 22.1237V10.7319C35.625 7.22687 32.7731 4.375 29.2681 4.375C28.295 4.375 27.38 4.75375 26.6919 5.44187L26.5088 5.625H26.25C23.8375 5.625 21.875 7.5875 21.875 10ZM18.0919 7.16687C18.2688 7.38812 18.4137 7.63875 18.5069 7.91875L18.7181 8.55187L17.5325 8.9475L17.3213 8.31438C17.1588 7.82688 16.7044 7.5 16.1912 7.5C15.5344 7.5 15 8.03438 15 8.69125C15 9.22937 15.3231 9.70625 15.8225 9.90563L17.6206 10.625H18.125C18.9169 10.625 19.6156 11.0025 20.0744 11.5787L20.0825 11.5631C20.4375 10.8531 20.625 10.0575 20.625 9.26375C20.625 7.89937 20.0956 6.61688 19.1369 5.6475C18.9531 6.13875 18.6681 6.59125 18.2856 6.97312L18.0919 7.16687ZM4.375 8.65C4.375 9.06375 4.44125 9.4725 4.57188 9.86563L5.08062 11.3912C5.53562 10.9206 6.17063 10.625 6.875 10.625V10.51C6.14937 10.2513 5.625 9.56375 5.625 8.75C5.625 7.71625 6.46625 6.875 7.5 6.875H8.125V8.125H7.5C7.15562 8.125 6.875 8.40562 6.875 8.75C6.875 9.09437 7.15562 9.375 7.5 9.375C9.10125 9.375 10.6931 9.15188 12.2319 8.71187L13.7925 8.26625C13.995 7.12313 14.9906 6.25 16.1912 6.25C16.5 6.25 16.795 6.31375 17.0706 6.42062L17.4019 6.08938C17.8681 5.62313 18.125 5.00312 18.125 4.34375C18.125 2.9825 17.0175 1.875 15.6562 1.875H12.3944C10.3644 1.875 8.455 2.95625 7.41063 4.69688L7.3025 4.8775L6.79062 5.0825C5.32312 5.66875 4.375 7.06938 4.375 8.65ZM6.875 14.375V11.875C6.18563 11.875 5.625 12.4356 5.625 13.125C5.625 13.8144 6.18563 14.375 6.875 14.375ZM12.5 19.375C14.9125 19.375 16.875 17.4125 16.875 15V11.6731L15.3581 11.0662C14.655 10.785 14.1356 10.2213 13.8975 9.53625L12.5756 9.91375C11.1256 10.3281 9.63125 10.5519 8.125 10.6031V15C8.125 17.4125 10.0875 19.375 12.5 19.375ZM10.625 20.2969V22.2412L12.145 23.7613C12.4925 22.4744 13.1625 21.3194 14.0725 20.3969C13.5731 20.5431 13.0463 20.625 12.5 20.625C11.8419 20.625 11.2125 20.5056 10.625 20.2969ZM1.875 29.47V31.875H4.375V29.375H5.625V38.125H10.2537C11.5025 35.9212 13.7563 34.5256 16.2844 34.3894C15.485 33.7956 14.8344 33.0181 14.3919 32.1169L14.2987 32.21C13.7087 32.8 12.9244 33.125 12.0894 33.125H9.13313L9.945 30.6894C10.3269 29.5444 11.2206 28.6812 12.3219 28.3162L12.2662 28.1487C12.1537 27.8119 12.0706 27.4681 12.0062 27.1206L8.9425 28.3463L7.765 23.6369L6.29188 23.9644C5.24313 24.1975 4.28688 24.7219 3.5275 25.4819C2.46125 26.5475 1.875 27.9638 1.875 29.47ZM1.875 38.125H4.375V33.125H1.875V38.125ZM38.125 38.125V32.5H35.625V38.125H38.125Z"
                                                fill="#3CB371"
                                                ></path>
                                          </g>
                                          <defs>
                                             <clipPath id="clip0_27_21868">
                                                <rect
                                                   width="40"
                                                   height="40"
                                                   fill="white"
                                                   ></rect>
                                             </clipPath>
                                          </defs>
                                       </svg>
                                    </div>
                                    <div class="content">
                                       <h4>Divine Journey Awaits</h4>
                                       <p>
                                          Experience sacred destinations, feel spiritual
                                          bliss.
                                       </p>
                                    </div>
                                 </div>
                              </div>
                              <div class="choose-icon">
                                 <div
                                    class="icon-items fadeInUp"
                                    data-delay="0.6"
                                    style="
                                    translate: none;
                                    rotate: none;
                                    scale: none;
                                    opacity: 1;
                                    visibility: inherit;
                                    transform: translate(0px, 0px);
                                    "
                                    >
                                    <div class="icon">
                                       <svg
                                          xmlns="http://www.w3.org/2000/svg"
                                          width="40"
                                          height="40"
                                          viewBox="0 0 40 40"
                                          fill="none"
                                          >
                                          <g clip-path="url(#clip0_27_21861)">
                                             <path
                                                d="M20 6.45161C21.067 6.45161 21.9355 5.5831 21.9355 4.51613C21.9355 3.44916 21.067 2.58065 20 2.58065C18.933 2.58065 18.0645 3.44916 18.0645 4.51613C18.0645 5.5831 18.933 6.45161 20 6.45161ZM20 3.87097C20.3553 3.87097 20.6452 4.16016 20.6452 4.51613C20.6452 4.8721 20.3553 5.16129 20 5.16129C19.6447 5.16129 19.3548 4.8721 19.3548 4.51613C19.3548 4.16016 19.6447 3.87097 20 3.87097ZM23.2258 15.4839H21.9355V7.74194H16.7742V11.6129H18.0645V15.4839H16.7742V19.3548H23.2258V15.4839ZM21.9355 18.0645H18.0645V16.7742H19.3548V10.3226H18.0645V9.03226H20.6452V16.7742H21.9355V18.0645ZM37.4194 7.74194H30.482C29.1012 3.26392 24.925 0 20 0C15.075 0 10.8988 3.26392 9.51802 7.74194H2.58065V9.03226H0V37.4194H16.8394C17.1387 38.8896 18.4425 40 20 40C21.5575 40 22.8613 38.8896 23.1606 37.4194H40V9.03226H37.4194V7.74194ZM20 1.29032C25.3361 1.29032 29.6774 5.63162 29.6774 10.9677C29.6774 15.5639 26.411 19.5536 21.9103 20.4549L21.6012 20.5166L20 23.7188L18.3994 20.5166L18.0903 20.4549C13.589 19.5536 10.3226 15.5639 10.3226 10.9677C10.3226 5.63162 14.6639 1.29032 20 1.29032ZM23.2258 21.4453C23.9 21.238 24.5457 20.9709 25.154 20.6452H33.5484V28.3871H23.2258V21.4453ZM3.87097 9.03226H9.2134C9.10125 9.66198 9.03226 10.3065 9.03226 10.9677C9.03226 16.0698 12.5844 20.5129 17.5246 21.6529L20 26.6038L21.9355 22.7322V29.6774H34.8387V19.3548H27.0457C29.4575 17.3214 30.9677 14.2877 30.9677 10.9677C30.9677 10.3065 30.8988 9.66198 30.7866 9.03226H36.129V33.5484H20.6452V27.7419H19.3548V33.5484H3.87097V9.03226ZM38.7097 10.3226V36.129H21.9355V36.7742C21.9355 37.8412 21.067 38.7097 20 38.7097C18.933 38.7097 18.0645 37.8412 18.0645 36.7742V36.129H1.29032V10.3226H2.58065V34.8387H37.4194V10.3226H38.7097ZM5.16129 30.9677H18.0645V32.2581H5.16129V30.9677ZM5.16129 28.3871H18.0645V29.6774H5.16129V28.3871ZM18.0645 25.8065V27.0968H5.16129V25.8065H18.0645ZM16.7742 24.5161H5.16129V23.2258H16.7742V24.5161ZM34.8387 32.2581H21.9355V30.9677H34.8387V32.2581Z"
                                                fill="#3CB371"
                                                ></path>
                                          </g>
                                          <defs>
                                             <clipPath id="clip0_27_21861">
                                                <rect
                                                   width="40"
                                                   height="40"
                                                   fill="white"
                                                   ></rect>
                                             </clipPath>
                                          </defs>
                                       </svg>
                                    </div>
                                    <div class="content">
                                       <h4>Adventure Begins Here</h4>
                                       <p>
                                          Discover thrilling experiences across the world.
                                       </p>
                                    </div>
                                 </div>
                                 <div
                                    class="icon-items fadeInUp"
                                    data-delay="0.8"
                                    style="
                                    translate: none;
                                    rotate: none;
                                    scale: none;
                                    opacity: 1;
                                    visibility: inherit;
                                    transform: translate(0px, 0px);
                                    "
                                    >
                                    <div class="icon">
                                       <svg
                                          xmlns="http://www.w3.org/2000/svg"
                                          width="40"
                                          height="40"
                                          viewBox="0 0 40 40"
                                          fill="none"
                                          >
                                          <g clip-path="url(#clip0_27_21875)">
                                             <path
                                                d="M9.03226 20C9.03226 19.6445 8.74323 19.3548 8.3871 19.3548C8.03097 19.3548 7.74194 19.6445 7.74194 20V20.6452H6.45161V20C6.45161 18.9329 7.32 18.0645 8.3871 18.0645C9.45419 18.0645 10.3226 18.9329 10.3226 20V20.6452H9.03226V20ZM16.129 18.0645C15.0619 18.0645 14.1935 18.9329 14.1935 20V20.6452H15.4839V20C15.4839 19.6445 15.7729 19.3548 16.129 19.3548C16.4852 19.3548 16.7742 19.6445 16.7742 20V20.6452H18.0645V20C18.0645 18.9329 17.1961 18.0645 16.129 18.0645ZM8.85097 23.2258H15.6658L15.289 24.7303C14.9406 26.1239 13.6942 27.0968 12.2581 27.0968C10.8219 27.0968 9.57548 26.1239 9.22774 24.7303L8.85097 23.2258ZM10.5065 24.5161C10.7432 25.2813 11.4497 25.8064 12.2581 25.8064C13.0665 25.8064 13.7729 25.2813 14.0097 24.5161H10.5065ZM29.6774 14.1935H30.9677V11.6129H32.2581V10.3226H30.9677V9.03226H29.6774V10.3226H28.3871V7.74194H27.0968V11.6129H29.6774V14.1935ZM27.0968 18.0645V19.3548H28.3871V15.4839H27.0968V16.7742H25.8064V15.4839H24.5161V16.7742V18.0645V19.3548H25.8064V18.0645H27.0968ZM29.6774 19.3548H30.9677V18.0645H29.6774V19.3548ZM39.3548 9.67742H40V16.129H39.3548C38.7174 16.129 38.1426 16.5084 37.9245 17.0729C37.8555 17.2529 37.7819 17.431 37.7039 17.6065C37.4568 18.1619 37.5942 18.8387 38.0445 19.2897L38.5006 19.7458L33.9394 24.309L33.4832 23.8523C33.0323 23.4013 32.3535 23.2652 31.7994 23.511C31.6239 23.589 31.4465 23.6619 31.2671 23.7316C30.7019 23.949 30.3226 24.5239 30.3226 25.1613V25.8064H23.871V25.1613C23.871 24.5342 23.5013 23.9716 22.9523 23.7465C22.3071 24.2277 21.5103 24.5161 20.6452 24.5161H19.9981C19.089 26.689 17.2877 28.3929 15.0581 29.1864L15.3884 30.5077C18.229 31.849 20.171 34.5865 20.4852 37.7277L20.5839 38.7097H27.8406L28.0555 37.4194H24.5161C23.8045 37.4194 23.2258 36.8406 23.2258 36.129V28.3871C23.2258 27.6755 23.8045 27.0968 24.5161 27.0968H37.4194C38.131 27.0968 38.7097 27.6755 38.7097 28.3871V36.129C38.7097 36.8406 38.131 37.4194 37.4194 37.4194H33.8794L34.0942 38.7097H40V40H3.15806L3.38581 37.7284C3.61226 35.4671 4.67097 33.4335 6.32968 31.9516C3.41677 31.0671 1.29032 28.3587 1.29032 25.1613V23.5226C0.500645 22.8129 0 21.7877 0 20.6452C0 19.5026 0.500645 18.4774 1.29032 17.7677V16.7742C1.29032 11.7935 5.34194 7.74194 10.3226 7.74194H14.1935C15.0013 7.74194 15.7813 7.85871 16.5265 8.05871C16.6961 7.53226 16.5626 6.93161 16.1484 6.51742L15.6923 6.06129L20.2535 1.49806L20.7097 1.95484C21.1613 2.40645 21.84 2.54387 22.3935 2.29613C22.5684 2.21871 22.7465 2.14516 22.9258 2.07548C23.4916 1.85677 23.871 1.28258 23.871 0.645161V0H30.3226V0.645161C30.3226 1.28258 30.7019 1.85677 31.2665 2.07484C31.4465 2.14452 31.6252 2.21806 31.7994 2.29613C32.3561 2.54323 33.0323 2.40516 33.4826 1.95548L33.9387 1.49935L38.5013 6.06065L38.0452 6.51742C37.5942 6.96839 37.4568 7.64516 37.7039 8.20129C37.7819 8.37613 37.8548 8.55419 37.9245 8.73419C38.1426 9.29806 38.7174 9.67742 39.3548 9.67742ZM2.58065 17C2.98516 16.8568 3.41806 16.7742 3.87097 16.7742H3.9C4.2271 13.1619 7.27161 10.3226 10.9677 10.3226H13.5484C17.2445 10.3226 20.289 13.1619 20.6161 16.7742H20.6452C21.0981 16.7742 21.531 16.8568 21.9355 17V16.7742C21.9355 12.5052 18.4626 9.03226 14.1935 9.03226H10.3226C6.05355 9.03226 2.58065 12.5052 2.58065 16.7742V17ZM27.0968 20.6452C31.3658 20.6452 34.8387 17.1723 34.8387 12.9032C34.8387 8.63419 31.3658 5.16129 27.0968 5.16129C23.9974 5.16129 21.1961 7.02968 19.9845 9.85161C20.7574 10.4994 21.4142 11.2774 21.9355 12.1465V10.3226H24.5161V9.03226H21.9355V7.74194H25.8064V11.6129H23.2258V12.9032H25.8064V14.1935H22.8452C23.0903 15.0123 23.2258 15.8774 23.2258 16.7742V17.7677C23.9077 18.38 24.3716 19.2277 24.4858 20.1839C25.3213 20.4839 26.1961 20.6452 27.0968 20.6452ZM12.971 13.26L13.0813 13.0394C13.4071 12.3877 13.9774 11.9206 14.651 11.7213C14.2935 11.6516 13.9258 11.6129 13.5484 11.6129H10.9677C8.83871 11.6129 6.97871 12.7684 5.96774 14.4813C6.39097 14.2981 6.85613 14.1935 7.34581 14.1935C7.66968 14.1935 7.99097 14.2387 8.30064 14.3277L11.7942 15.0871C13.0039 15.3503 14.2458 15.4839 15.4839 15.4839C16.1955 15.4839 16.7742 14.9052 16.7742 14.1935C16.7742 13.4819 16.1955 12.9032 15.4839 12.9032H15.3897C14.8974 12.9032 14.4555 13.1761 14.2355 13.6161L14.1252 13.8368L12.971 13.26ZM18.0645 14.1935C18.0645 14.4077 18.0381 14.6161 17.989 14.8148L18.9916 15.4161C18.7613 14.7929 18.4335 14.2174 18.0168 13.7155C18.0452 13.871 18.0645 14.0297 18.0645 14.1935ZM1.29032 20.6452C1.29032 22.0684 2.44774 23.2258 3.87097 23.2258H4.10516C3.95742 22.6032 3.87097 21.9574 3.87097 21.2903V18.0645C2.44774 18.0645 1.29032 19.2219 1.29032 20.6452ZM7.88903 30.9464L7.93742 30.7535C8.1129 30.0516 8.51677 29.4574 9.05742 29.0394C7.01226 28.191 5.3729 26.5581 4.51806 24.5161H3.87097C3.41806 24.5161 2.98516 24.4335 2.58065 24.2903V25.1613C2.58065 28.1955 4.91935 30.6929 7.88903 30.9464ZM11.471 34.8387L10.5032 38.7097H13.3671L12.3994 34.8387H11.471ZM10.9677 30.9677C11.3239 30.9677 11.6129 30.6781 11.6129 30.3226C11.6129 29.9671 11.3239 29.6774 10.9677 29.6774C10.1594 29.6774 9.4529 30.2026 9.21613 30.9677H10.9677ZM4.58387 38.7097H6.45161V36.3961C6.45161 35.98 6.28968 35.589 5.99548 35.2948L6.90774 34.3819C7.44581 34.92 7.74194 35.6348 7.74194 36.3961V38.7097H9.17419L10.2845 34.269L9.27871 32.2581H8.3871C8.2729 32.2581 8.16129 32.2464 8.04839 32.2406C6.13161 33.5206 4.89935 35.5529 4.66903 37.8561L4.58387 38.7097ZM28.2703 36.129L28.951 32.0458C29.0561 31.4206 29.591 30.9677 30.2239 30.9677H31.7116C32.3439 30.9677 32.88 31.4213 32.9852 32.0452L33.6645 36.129H37.4194V28.3871H24.5161V36.129H28.2703ZM29.1484 38.7097H32.7858L31.711 32.2581H30.2226L29.1484 38.7097ZM15.0826 31.8148L13.5935 34.2968L14.6968 38.7097H15.4839V36.3961C15.4839 35.6348 15.78 34.92 16.3181 34.3819L17.2303 35.2948C16.9361 35.589 16.7742 35.98 16.7742 36.3961V38.7097H19.2871L19.2019 37.8568C18.9419 35.2619 17.3755 33.0032 15.0826 31.8148ZM13.8135 29.5271C13.4748 29.591 13.1277 29.6297 12.7761 29.651C12.8542 29.8613 12.9032 30.0858 12.9032 30.3226C12.9032 31.3897 12.0348 32.2581 10.9677 32.2581H10.7213L11.3665 33.5484H12.5374L14.1477 30.8645L13.8135 29.5271ZM19.3548 18.0645V17.8703C19.3548 17.4194 19.1148 16.9955 18.7284 16.7639L17.3723 15.9503C16.9013 16.4568 16.229 16.7742 15.4839 16.7742C14.1529 16.7742 12.82 16.6303 11.5194 16.3477L7.98516 15.5781C7.75097 15.5123 7.54903 15.4839 7.34581 15.4839C6.14129 15.4839 5.16129 16.4639 5.16129 17.6684V18.0645V21.2903C5.16129 25.2032 8.34516 28.3871 12.2581 28.3871C16.171 28.3871 19.3548 25.2032 19.3548 21.2903V18.0645ZM23.2258 20.6452C23.2258 19.2219 22.0684 18.0645 20.6452 18.0645V21.2903C20.6452 21.9574 20.5587 22.6032 20.411 23.2258H20.6452C22.0684 23.2258 23.2258 22.0684 23.2258 20.6452ZM38.7097 10.8942C37.8116 10.6871 37.0523 10.0568 36.7213 9.19806C36.6594 9.03806 36.5942 8.88064 36.5245 8.72452C36.1497 7.87935 36.24 6.89548 36.7284 6.1129L33.8871 3.27097C33.1045 3.76 32.12 3.84968 31.2748 3.47484C31.1194 3.40581 30.9613 3.34 30.8019 3.27806C29.9432 2.94774 29.3135 2.18839 29.1058 1.29032H25.0871C24.88 2.18839 24.2497 2.94774 23.3903 3.27871C23.2316 3.34 23.0735 3.40581 22.9181 3.47484C22.0735 3.84968 21.0877 3.76 20.3065 3.27161L17.4645 6.11226C17.9065 6.82 18.0187 7.6929 17.7594 8.47871C18.1606 8.65226 18.5432 8.86 18.9123 9.0871C20.3826 5.93806 23.5748 3.87097 27.0968 3.87097C32.0774 3.87097 36.129 7.92258 36.129 12.9032C36.129 17.8839 32.0774 21.9355 27.0968 21.9355C26.1755 21.9355 25.2761 21.7968 24.411 21.5271C24.3052 21.9794 24.1219 22.4019 23.8723 22.7781C24.4813 23.1703 24.9219 23.7961 25.0877 24.5161H29.1065C29.3129 23.6174 29.9439 22.8587 30.8032 22.5277C30.9619 22.4664 31.12 22.4006 31.2761 22.331C32.1213 21.9555 33.1065 22.0465 33.8871 22.5348L36.729 19.6935C36.2406 18.911 36.1503 17.9265 36.5252 17.0819C36.5942 16.9258 36.66 16.7677 36.7219 16.6084C37.0529 15.749 37.8123 15.1194 38.7103 14.9123L38.7097 10.8942Z"
                                                fill="#3CB371"
                                                ></path>
                                          </g>
                                          <defs>
                                             <clipPath id="clip0_27_21875">
                                                <rect
                                                   width="40"
                                                   height="40"
                                                   fill="white"
                                                   ></rect>
                                             </clipPath>
                                          </defs>
                                       </svg>
                                    </div>
                                    <div class="content">
                                       <h4>Luxury Travel Redefined</h4>
                                       <p>
                                          Enjoy comfort, style, and personalized journeys.
                                       </p>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div
                           class="col-md-6 fadeInUp"
                           data-delay="0.4"
                           style="
                           translate: none;
                           rotate: none;
                           scale: none;
                           opacity: 1;
                           visibility: inherit;
                           transform: translate(0px, 0px);
                           "
                           >
                           <div class="choose-us-main-img">
                              <div class="choose-us-image">
                                 <img src="assets/163-GeSCqKuK.jpg" alt="shubham" />
                              </div>
                              <div class="choose-us-one">
                                 <img src="assets/164-C2V8UI-m.jpg" alt="shubham" />
                              </div>
                              <div class="choose-us-two">
                                 <img src="assets/165-BoBtrJ-J.jpg" alt="shubham" />
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- Divider -->
               <div class="divider"></div>
            </section>
            <!-- form start from here -->
            <section
               class="contact-section-four bg-img jarallax"
               style="background-image: none"
               data-jarallax-original-styles="background-image: url('assets/168-CLAQXMIu.jpg');"
               >
               <!-- Divider -->
               <div class="divider"></div>
               <div class="top1">
                  <img src="assets/03-CPafVWBR.png" alt="shubham" />
               </div>
               <div class="top2">
                  <img src="assets/04-DoI1WOdK.png" alt="shubham" />
               </div>
               <div class="container pt-5 pb-5">
                  <div class="contact-items">
                     <form action="#0" id="bookingForm" class="contact-form-box">
                        <div class="section-heading text-center mb-5">
                           <span
                              class="sub-title text-white fadeInUp"
                              style="
                              translate: none;
                              rotate: none;
                              scale: none;
                              opacity: 1;
                              visibility: inherit;
                              transform: translate(0px, 0px);
                              "
                              >Get in Touch</span
                              >
                           <h2
                              class="text-white fadeInUp"
                              data-delay="0.2"
                              style="
                              translate: none;
                              rotate: none;
                              scale: none;
                              opacity: 1;
                              visibility: inherit;
                              transform: translate(0px, 0px);
                              "
                              >
                              With Our Travel Experts
                           </h2>
                        </div>
                        <div class="row g-4 align-items-center justify-content-center">
                           <div class="col-lg-6 col-md-6">
                              <div class="form-clt">
                                 <input
                                    type="text"
                                    name="user_name"
                                    id="name"
                                    placeholder="Your Name"
                                    />
                              </div>
                           </div>
                           <div class="col-lg-6 col-md-6">
                              <div class="form-clt">
                                 <input
                                    type="text"
                                    name="user_phone"
                                    id="email2"
                                    placeholder="Email Address"
                                    />
                              </div>
                           </div>
                           <div class="col-lg-6 col-md-6">
                              <div class="form-clt">
                                 <input
                                    type="text"
                                    name="user_phone"
                                    id="phone"
                                    placeholder="Your Phone"
                                    />
                              </div>
                           </div>
                           <div class="col-lg-6 col-md-6">
                              <div class="form-clt">
                                 <input
                                    type="text"
                                    name="tickets"
                                    id="subject"
                                    placeholder="Number of Travellers"
                                    />
                              </div>
                           </div>
                           <div class="col-lg-12">
                              <div class="form-clt">
                                 <textarea
                                    name="message"
                                    id="message"
                                    placeholder="Enter Your Messagae "
                                    ></textarea>
                              </div>
                           </div>
                           <div class="col-lg-12">
                              <div class="btn-button text-center">
                                 <button type="submit" class="btn btn-primary">
                                 Send Message <i class="icon-arrow-right"></i>
                                 </button>
                              </div>
                           </div>
                        </div>
                     </form>
                  </div>
               </div>
               <!-- Divider -->
               <div class="divider"></div>
               <div
                  id="jarallax-container-1"
                  class="jarallax-container"
                  style="
                  position: absolute;
                  top: 0px;
                  left: 0px;
                  width: 100%;
                  height: 100%;
                  overflow: hidden;
                  z-index: -100;
                  clip-path: polygon(0px 0px, 100% 0px, 100% 100%, 0px 100%);
                  "
                  >
                  <div
                     style="
                     background-position: 50% 50%;
                     background-size: cover;
                     background-repeat: no-repeat;
                     background-image: url('assets/168-CLAQXMIu.jpg');
                     position: absolute;
                     top: 0px;
                     left: 0px;
                     width: 1900px;
                     height: 1047.12px;
                     overflow: hidden;
                     pointer-events: none;
                     transform-style: preserve-3d;
                     backface-visibility: hidden;
                     margin-top: 22.44px;
                     transform: translate3d(0px, -55.4467px, 0px);
                     "
                     ></div>
               </div>
            </section>
            <div class="follow-instagram-section">
               <!-- Divider -->
               <div class="divider"></div>
               <div class="container">
                  <div class="section-title"><span>Follow Instagram</span></div>
               </div>
               <!-- Divider -->
               <div class="divider-sm"></div>
               <div class="container">
                  <div class="row g-4">
                     <!-- Follow Instagram Card -->
                     <div class="col-6 col-sm-4 col-md-3">
                        <div class="follow-instagram-card">
                           <img src="assets/30-DT8xzuM4.jpg" alt="shubham" />
                           <!-- Instagram Button -->
                           <a href="#" class="instagram-btn">
                           <i class="ti ti-brand-instagram"></i>
                           </a>
                        </div>
                     </div>
                     <!-- Follow Instagram Card -->
                     <div class="col-6 col-sm-4 col-md-3">
                        <div class="follow-instagram-card">
                           <img src="assets/31-D9J9EuaO.jpg" alt="shubham" />
                           <!-- Instagram Button -->
                           <a href="#" class="instagram-btn">
                           <i class="ti ti-brand-instagram"></i>
                           </a>
                        </div>
                     </div>
                     <!-- Follow Instagram Card -->
                     <div class="col-6 col-sm-4 col-md-3">
                        <div class="follow-instagram-card">
                           <img src="assets/32-9UsYD5oL.jpg" alt="shubham" />
                           <!-- Instagram Button -->
                           <a href="#" class="instagram-btn">
                           <i class="ti ti-brand-instagram"></i>
                           </a>
                        </div>
                     </div>
                     <!-- Follow Instagram Card -->
                     <div class="col-6 col-sm-4 col-md-3">
                        <div class="follow-instagram-card">
                           <img src="assets/33-UYB5R0QM.jpg" alt="shubham" />
                           <!-- Instagram Button -->
                           <a href="#" class="instagram-btn">
                           <i class="ti ti-brand-instagram"></i>
                           </a>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- Divider -->
               <div class="divider"></div>
            </div>
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