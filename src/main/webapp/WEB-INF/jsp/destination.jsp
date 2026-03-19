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
             style="background-image: url('assets/97-4pYTyMSj.jpg')"
           >
             <div class="container">
               <!-- Breadcrumb Content -->
               <div class="breadcrumb-content">
                 <div class="divider"></div>
                 <h2>Destination</h2>
                 <ul class="list-unstyled">
                   <li><a href="index-1.html">Home</a></li>
                   <li>Destination</li>
                 </ul>
               </div>
             </div>

             <!-- Divider -->
             <div class="divider"></div>
           </div>

           <!-- ====== Featured Destination ====== -->
           <section class="featured-destination bg-secondary">
             <div class="shape">
               <img src="assets/shape2-D52FcS43.png" alt="" />
             </div>

             <!-- Divider -->
             <div class="divider"></div>

             <div class="container">
               <div class="row g-4">
                 <!-- Featured Destination Card -->
                 <div class="col-12 col-sm-6 col-lg-4">
                   <div
                     class="featured-destination-card fadeInUp"
                     data-delay="0.2"
                   >
                     <img src="./shubham/haryana.jpg" alt="" />

                     <!-- Overlay Content -->
                     <div
                       class="overlay-content d-flex flex-wrap gap-4 align-items-end justify-content-between"
                     >
                       <div>
                         <p class="mb-1 text-white">Travel To</p>
                         <h4 class="mb-0 text-white">Haryana</h4>
                       </div>
                       <!-- Badge -->
                       <span class="badge bg-primary">3 Tours</span>
                     </div>
                   </div>
                 </div>

                 <!-- Featured Destination Card -->
                 <div class="col-12 col-sm-6 col-lg-4">
                   <div
                     class="featured-destination-card fadeInUp"
                     data-delay="0.4"
                   >
                     <img src="./shubham/delhi.jpeg" alt="" />

                     <!-- Overlay Content -->
                     <div
                       class="overlay-content d-flex flex-wrap gap-4 align-items-end justify-content-between"
                     >
                       <div>
                         <p class="mb-1 text-white">Travel To</p>
                         <h4 class="mb-0 text-white">Delhi</h4>
                       </div>
                       <!-- Badge -->
                       <span class="badge bg-primary">4 Tours</span>
                     </div>
                   </div>
                 </div>
                 <!-- Featured Destination Card -->
                 <div class="col-12 col-sm-6 col-lg-4">
                   <div
                     class="featured-destination-card fadeInUp"
                     data-delay="0.4"
                   >
                     <img src="./shubham/bihar.webp" alt="" />

                     <!-- Overlay Content -->
                     <div
                       class="overlay-content d-flex flex-wrap gap-4 align-items-end justify-content-between"
                     >
                       <div>
                         <p class="mb-1 text-white">Travel To</p>
                         <h4 class="mb-0 text-white">Bihar</h4>
                       </div>
                       <!-- Badge -->
                       <span class="badge bg-primary">4 Tours</span>
                     </div>
                   </div>
                 </div>
                 <!-- Featured Destination Card -->
                 <div class="col-12 col-sm-6 col-lg-4">
                   <div
                     class="featured-destination-card fadeInUp"
                     data-delay="0.4"
                   >
                     <img src="./shubham/jharkhand.jpeg" alt="" />

                     <!-- Overlay Content -->
                     <div
                       class="overlay-content d-flex flex-wrap gap-4 align-items-end justify-content-between"
                     >
                       <div>
                         <p class="mb-1 text-white">Travel To</p>
                         <h4 class="mb-0 text-white">Jharkhand</h4>
                       </div>
                       <!-- Badge -->
                       <span class="badge bg-primary">4 Tours</span>
                     </div>
                   </div>
                 </div>
                 <!-- Featured Destination Card -->
                 <div class="col-12 col-sm-6 col-lg-4">
                   <div
                     class="featured-destination-card fadeInUp"
                     data-delay="0.4"
                   >
                     <img src="./shubham/gujrat.jpg" alt="" />

                     <!-- Overlay Content -->
                     <div
                       class="overlay-content d-flex flex-wrap gap-4 align-items-end justify-content-between"
                     >
                       <div>
                         <p class="mb-1 text-white">Travel To</p>
                         <h4 class="mb-0 text-white">Gujrat</h4>
                       </div>
                       <!-- Badge -->
                       <span class="badge bg-primary">4 Tours</span>
                     </div>
                   </div>
                 </div>
                 <!-- Featured Destination Card -->
                 <div class="col-12 col-sm-6 col-lg-4">
                   <div
                     class="featured-destination-card fadeInUp"
                     data-delay="0.4"
                   >
                     <img src="./shubham/uttrakhand.jpg" alt="" />

                     <!-- Overlay Content -->
                     <div
                       class="overlay-content d-flex flex-wrap gap-4 align-items-end justify-content-between"
                     >
                       <div>
                         <p class="mb-1 text-white">Travel To</p>
                         <h4 class="mb-0 text-white">Uttrakhand</h4>
                       </div>
                       <!-- Badge -->
                       <span class="badge bg-primary">4 Tours</span>
                     </div>
                   </div>
                 </div>
                 <!-- Featured Destination Card -->
                 <div class="col-12 col-sm-6 col-lg-4">
                   <div
                     class="featured-destination-card fadeInUp"
                     data-delay="0.4"
                   >
                     <img src="./shubham/madhyapradesh.jpg" alt="" />

                     <!-- Overlay Content -->
                     <div
                       class="overlay-content d-flex flex-wrap gap-4 align-items-end justify-content-between"
                     >
                       <div>
                         <p class="mb-1 text-white">Travel To</p>
                         <h4 class="mb-0 text-white">Madhya Pradesh</h4>
                       </div>
                       <!-- Badge -->
                       <span class="badge bg-primary">4 Tours</span>
                     </div>
                   </div>
                 </div>

                 <!-- Featured Destination Card -->
                 <div class="col-12 col-sm-6 col-lg-4">
                   <div
                     class="featured-destination-card fadeInUp"
                     data-delay="0.4"
                   >
                     <img src="./shubham/kerala.jpg" alt="" />

                     <!-- Overlay Content -->
                     <div
                       class="overlay-content d-flex flex-wrap gap-4 align-items-end justify-content-between"
                     >
                       <div>
                         <p class="mb-1 text-white">Travel To</p>
                         <h4 class="mb-0 text-white">Kerala</h4>
                       </div>
                       <!-- Badge -->
                       <span class="badge bg-primary">4 Tours</span>
                     </div>
                   </div>
                 </div>

                 <!-- Featured Destination Card -->
                 <div class="col-12 col-sm-6 col-lg-4">
                   <div
                     class="featured-destination-card fadeInUp"
                     data-delay="0.4"
                   >
                     <img src="./shubham/maharastra.jpeg" alt="" />

                     <!-- Overlay Content -->
                     <div
                       class="overlay-content d-flex flex-wrap gap-4 align-items-end justify-content-between"
                     >
                       <div>
                         <p class="mb-1 text-white">Travel To</p>
                         <h4 class="mb-0 text-white">Maharastra</h4>
                       </div>
                       <!-- Badge -->
                       <span class="badge bg-primary">4 Tours</span>
                     </div>
                   </div>
                 </div>

                 <!-- Featured Destination Card -->
                 <div class="col-12 col-sm-6 col-lg-4">
                   <div
                     class="featured-destination-card fadeInUp"
                     data-delay="0.4"
                   >
                     <img src="./shubham/goa.webp" alt="" />

                     <!-- Overlay Content -->
                     <div
                       class="overlay-content d-flex flex-wrap gap-4 align-items-end justify-content-between"
                     >
                       <div>
                         <p class="mb-1 text-white">Travel To</p>
                         <h4 class="mb-0 text-white">Goa</h4>
                       </div>
                       <!-- Badge -->
                       <span class="badge bg-primary">4 Tours</span>
                     </div>
                   </div>
                 </div>

                 <!-- Featured Destination Card -->
                 <div class="col-12 col-sm-6 col-lg-4">
                   <div
                     class="featured-destination-card fadeInUp"
                     data-delay="0.4"
                   >
                     <img src="./shubham/andhrapradesh.webp" alt="" />

                     <!-- Overlay Content -->
                     <div
                       class="overlay-content d-flex flex-wrap gap-4 align-items-end justify-content-between"
                     >
                       <div>
                         <p class="mb-1 text-white">Travel To</p>
                         <h4 class="mb-0 text-white">Andhra Pradesh</h4>
                       </div>
                       <!-- Badge -->
                       <span class="badge bg-primary">4 Tours</span>
                     </div>
                   </div>
                 </div>

                 <!-- Featured Destination Card -->
                 <div class="col-12 col-sm-6 col-lg-4">
                   <div
                     class="featured-destination-card fadeInUp"
                     data-delay="0.4"
                   >
                     <img src="./shubham/assam.jpg" alt="" />

                     <!-- Overlay Content -->
                     <div
                       class="overlay-content d-flex flex-wrap gap-4 align-items-end justify-content-between"
                     >
                       <div>
                         <p class="mb-1 text-white">Travel To</p>
                         <h4 class="mb-0 text-white">Assam</h4>
                       </div>
                       <!-- Badge -->
                       <span class="badge bg-primary">4 Tours</span>
                     </div>
                   </div>
                 </div>

                 <!-- Featured Destination Card -->
                 <div class="col-12 col-sm-6 col-lg-4">
                   <div
                     class="featured-destination-card fadeInUp"
                     data-delay="0.4"
                   >
                     <img src="./shubham/arunachal pradesh.avif" alt="" />

                     <!-- Overlay Content -->
                     <div
                       class="overlay-content d-flex flex-wrap gap-4 align-items-end justify-content-between"
                     >
                       <div>
                         <p class="mb-1 text-white">Travel To</p>
                         <h4 class="mb-0 text-white">Arunachal Pradesh</h4>
                       </div>
                       <!-- Badge -->
                       <span class="badge bg-primary">4 Tours</span>
                     </div>
                   </div>
                 </div>

                 <!-- Featured Destination Card -->
                 <div class="col-12 col-sm-6 col-lg-4">
                   <div
                     class="featured-destination-card fadeInUp"
                     data-delay="0.4"
                   >
                     <img src="./shubham/chhattisgarh.webp" alt="" />

                     <!-- Overlay Content -->
                     <div
                       class="overlay-content d-flex flex-wrap gap-4 align-items-end justify-content-between"
                     >
                       <div>
                         <p class="mb-1 text-white">Travel To</p>
                         <h4 class="mb-0 text-white">Chhattisgarh</h4>
                       </div>
                       <!-- Badge -->
                       <span class="badge bg-primary">4 Tours</span>
                     </div>
                   </div>
                 </div>

                 <!-- Featured Destination Card -->
                 <div class="col-12 col-sm-6 col-lg-4">
                   <div
                     class="featured-destination-card fadeInUp"
                     data-delay="0.4"
                   >
                     <img src="./shubham/himachalpradesh.webp" alt="" />

                     <!-- Overlay Content -->
                     <div
                       class="overlay-content d-flex flex-wrap gap-4 align-items-end justify-content-between"
                     >
                       <div>
                         <p class="mb-1 text-white">Travel To</p>
                         <h4 class="mb-0 text-white">Himachal Pradesh</h4>
                       </div>
                       <!-- Badge -->
                       <span class="badge bg-primary">4 Tours</span>
                     </div>
                   </div>
                 </div>

                 <!-- Featured Destination Card -->
                 <div class="col-12 col-sm-6 col-lg-4">
                   <div
                     class="featured-destination-card fadeInUp"
                     data-delay="0.4"
                   >
                     <img src="./shubham/manipur.avif" alt="" />

                     <!-- Overlay Content -->
                     <div
                       class="overlay-content d-flex flex-wrap gap-4 align-items-end justify-content-between"
                     >
                       <div>
                         <p class="mb-1 text-white">Travel To</p>
                         <h4 class="mb-0 text-white">Manipur</h4>
                       </div>
                       <!-- Badge -->
                       <span class="badge bg-primary">4 Tours</span>
                     </div>
                   </div>
                 </div>

                 <!-- Featured Destination Card -->
                 <div class="col-12 col-sm-6 col-lg-4">
                   <div
                     class="featured-destination-card fadeInUp"
                     data-delay="0.4"
                   >
                     <img src="./shubham/karnataka.webp" alt="" />

                     <!-- Overlay Content -->
                     <div
                       class="overlay-content d-flex flex-wrap gap-4 align-items-end justify-content-between"
                     >
                       <div>
                         <p class="mb-1 text-white">Travel To</p>
                         <h4 class="mb-0 text-white">Karnataka</h4>
                       </div>
                       <!-- Badge -->
                       <span class="badge bg-primary">4 Tours</span>
                     </div>
                   </div>
                 </div>

                 <!-- Featured Destination Card -->
                 <div class="col-12 col-sm-6 col-lg-4">
                   <div
                     class="featured-destination-card fadeInUp"
                     data-delay="0.4"
                   >
                     <img src="./shubham/meghalaya.jpg" alt="" />

                     <!-- Overlay Content -->
                     <div
                       class="overlay-content d-flex flex-wrap gap-4 align-items-end justify-content-between"
                     >
                       <div>
                         <p class="mb-1 text-white">Travel To</p>
                         <h4 class="mb-0 text-white">Meghalaya</h4>
                       </div>
                       <!-- Badge -->
                       <span class="badge bg-primary">4 Tours</span>
                     </div>
                   </div>
                 </div>

                 <!-- Featured Destination Card -->
                 <div class="col-12 col-sm-6 col-lg-4">
                   <div
                     class="featured-destination-card fadeInUp"
                     data-delay="0.4"
                   >
                     <img src="./shubham/mizoram.jpg" alt="" />

                     <!-- Overlay Content -->
                     <div
                       class="overlay-content d-flex flex-wrap gap-4 align-items-end justify-content-between"
                     >
                       <div>
                         <p class="mb-1 text-white">Travel To</p>
                         <h4 class="mb-0 text-white">Mizoram</h4>
                       </div>
                       <!-- Badge -->
                       <span class="badge bg-primary">4 Tours</span>
                     </div>
                   </div>
                 </div>

                 <!-- Featured Destination Card -->
                 <div class="col-12 col-sm-6 col-lg-4">
                   <div
                     class="featured-destination-card fadeInUp"
                     data-delay="0.4"
                   >
                     <img src="./shubham/nagaland.webp" alt="" />

                     <!-- Overlay Content -->
                     <div
                       class="overlay-content d-flex flex-wrap gap-4 align-items-end justify-content-between"
                     >
                       <div>
                         <p class="mb-1 text-white">Travel To</p>
                         <h4 class="mb-0 text-white">Nagaland</h4>
                       </div>
                       <!-- Badge -->
                       <span class="badge bg-primary">4 Tours</span>
                     </div>
                   </div>
                 </div>
                 <!-- Featured Destination Card -->
                 <div class="col-12 col-sm-6 col-lg-4">
                   <div
                     class="featured-destination-card fadeInUp"
                     data-delay="0.4"
                   >
                     <img src="./shubham/odisha.jpeg" alt="" />

                     <!-- Overlay Content -->
                     <div
                       class="overlay-content d-flex flex-wrap gap-4 align-items-end justify-content-between"
                     >
                       <div>
                         <p class="mb-1 text-white">Travel To</p>
                         <h4 class="mb-0 text-white">Odisha</h4>
                       </div>
                       <!-- Badge -->
                       <span class="badge bg-primary">4 Tours</span>
                     </div>
                   </div>
                 </div>
                 <!-- Featured Destination Card -->
                 <div class="col-12 col-sm-6 col-lg-4">
                   <div
                     class="featured-destination-card fadeInUp"
                     data-delay="0.4"
                   >
                     <img src="./shubham/punjab.webp" alt="" />

                     <!-- Overlay Content -->
                     <div
                       class="overlay-content d-flex flex-wrap gap-4 align-items-end justify-content-between"
                     >
                       <div>
                         <p class="mb-1 text-white">Travel To</p>
                         <h4 class="mb-0 text-white">Punjab</h4>
                       </div>
                       <!-- Badge -->
                       <span class="badge bg-primary">4 Tours</span>
                     </div>
                   </div>
                 </div>

                 <!-- Featured Destination Card -->
                 <div class="col-12 col-sm-6 col-lg-4">
                   <div
                     class="featured-destination-card fadeInUp"
                     data-delay="0.4"
                   >
                     <img src="./shubham/rajasthan.jpeg" alt="" />

                     <!-- Overlay Content -->
                     <div
                       class="overlay-content d-flex flex-wrap gap-4 align-items-end justify-content-between"
                     >
                       <div>
                         <p class="mb-1 text-white">Travel To</p>
                         <h4 class="mb-0 text-white">Rajasthan</h4>
                       </div>
                       <!-- Badge -->
                       <span class="badge bg-primary">4 Tours</span>
                     </div>
                   </div>
                 </div>
                 <!-- Featured Destination Card -->
                 <div class="col-12 col-sm-6 col-lg-4">
                   <div
                     class="featured-destination-card fadeInUp"
                     data-delay="0.4"
                   >
                     <img src="./shubham/sikkim.jpg" alt="" />

                     <!-- Overlay Content -->
                     <div
                       class="overlay-content d-flex flex-wrap gap-4 align-items-end justify-content-between"
                     >
                       <div>
                         <p class="mb-1 text-white">Travel To</p>
                         <h4 class="mb-0 text-white">Sikkim</h4>
                       </div>
                       <!-- Badge -->
                       <span class="badge bg-primary">4 Tours</span>
                     </div>
                   </div>
                 </div>

                 <!-- Featured Destination Card -->
                 <div class="col-12 col-sm-6 col-lg-4">
                   <div
                     class="featured-destination-card fadeInUp"
                     data-delay="0.4"
                   >
                     <img src="./shubham/tamilnadu.jpg" alt="" />

                     <!-- Overlay Content -->
                     <div
                       class="overlay-content d-flex flex-wrap gap-4 align-items-end justify-content-between"
                     >
                       <div>
                         <p class="mb-1 text-white">Travel To</p>
                         <h4 class="mb-0 text-white">Tamil Nadu</h4>
                       </div>
                       <!-- Badge -->
                       <span class="badge bg-primary">4 Tours</span>
                     </div>
                   </div>
                 </div>

                 <!-- Featured Destination Card -->
                 <div class="col-12 col-sm-6 col-lg-4">
                   <div
                     class="featured-destination-card fadeInUp"
                     data-delay="0.4"
                   >
                     <img src="./shubham/telangana.jpg" alt="" />

                     <!-- Overlay Content -->
                     <div
                       class="overlay-content d-flex flex-wrap gap-4 align-items-end justify-content-between"
                     >
                       <div>
                         <p class="mb-1 text-white">Travel To</p>
                         <h4 class="mb-0 text-white">Telengana</h4>
                       </div>
                       <!-- Badge -->
                       <span class="badge bg-primary">4 Tours</span>
                     </div>
                   </div>
                 </div>

                 <!-- Featured Destination Card -->
                 <div class="col-12 col-sm-6 col-lg-4">
                   <div
                     class="featured-destination-card fadeInUp"
                     data-delay="0.4"
                   >
                     <img src="./shubham/tripura.jpg" alt="" />

                     <!-- Overlay Content -->
                     <div
                       class="overlay-content d-flex flex-wrap gap-4 align-items-end justify-content-between"
                     >
                       <div>
                         <p class="mb-1 text-white">Travel To</p>
                         <h4 class="mb-0 text-white">Tripura</h4>
                       </div>
                       <!-- Badge -->
                       <span class="badge bg-primary">4 Tours</span>
                     </div>
                   </div>
                 </div>

                 <!-- Featured Destination Card -->
                 <div class="col-12 col-sm-6 col-lg-4">
                   <div
                     class="featured-destination-card fadeInUp"
                     data-delay="0.4"
                   >
                     <img src="./shubham/uttarpradesh.jpg" alt="" />

                     <!-- Overlay Content -->
                     <div
                       class="overlay-content d-flex flex-wrap gap-4 align-items-end justify-content-between"
                     >
                       <div>
                         <p class="mb-1 text-white">Travel To</p>
                         <h4 class="mb-0 text-white">Uttar Pradesh</h4>
                       </div>
                       <!-- Badge -->
                       <span class="badge bg-primary">4 Tours</span>
                     </div>
                   </div>
                 </div>

                 <!-- Featured Destination Card -->
                 <div class="col-12 col-sm-6 col-lg-4">
                   <div
                     class="featured-destination-card fadeInUp"
                     data-delay="0.4"
                   >
                     <img src="./shubham/westbengal.jpg" alt="" />

                     <!-- Overlay Content -->
                     <div
                       class="overlay-content d-flex flex-wrap gap-4 align-items-end justify-content-between"
                     >
                       <div>
                         <p class="mb-1 text-white">Travel To</p>
                         <h4 class="mb-0 text-white">West Bengal</h4>
                       </div>
                       <!-- Badge -->
                       <span class="badge bg-primary">4 Tours</span>
                     </div>
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
  </body>
</html>
