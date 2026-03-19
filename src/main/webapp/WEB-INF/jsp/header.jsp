<!-- ====== Header Area ====== -->
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<header class="header-area style-five">
  <!-- Navbar -->
  <nav class="navbar navbar-expand-xl px-3 px-lg-4 px-xxl-5">
    <!-- Navbar Brand -->
    <a class="navbar-brand" href="/index">
      <img
        style="
          height: 78px;
          width: 150px;
          border-radius: 35px;
          border: 10px solid black;
          filter:invert(1);
        "
        src="${ctx}/static/shubham/logo-old.jpeg"
        alt="logo"
      />
    </a>

    <!-- Navbar Toggler -->
    <button
      class="navbar-toggler"
      type="button"
      data-bs-toggle="collapse"
      data-bs-target="#touriaNav"
      aria-controls="touriaNav"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <i class="ti ti-menu-deep"></i>
    </button>

    <!-- Navbar Nav -->
    <div
      class="collapse navbar-collapse justify-content-end"
      id="touriaNav"
    >
      <ul class="navbar-nav align-items-xl-center navbar-nav-scroll">
        <li>
          <a href="/index">Home </a>
        </li>
        <li>
          <a href="/tours">Tours</a>
        </li>
        <li>
          <a href="/destinations">Destinations </a>
        </li>
        <li>
          <a href="#0">About Us </a>
        </li>
        <li>
          <a href="#0">Gallery</a>
        </li>
        <li>
          <a href="/contact">Contact</a>
        </li>
      </ul>

      <!-- Header Navigation -->
      <div
        class="header-navigation d-flex flex-wrap align-items-center gap-3 mt-4 mt-xl-0"
      >
        <!-- Search Button -->

        <!-- Offcanvas Icon -->
        <div
          class="offcanvas-icon"
          data-bs-toggle="offcanvas"
          data-bs-target="#sideMenuOffcanvas"
          aria-controls="sideMenuOffcanvas"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="26"
            height="18"
            viewBox="0 0 26 18"
            fill="none"
          >
            <path
              d="M19.5 1.28571C19.5 0.575658 18.9179 0 18.2 0H1.3C0.582056 0 0 0.575658 0 1.28571C0 1.99577 0.582056 2.57143 1.3 2.57143H18.2C18.9179 2.57143 19.5 1.99572 19.5 1.28571ZM1.3 7.71428H24.7C25.4179 7.71428 26 8.28999 26 9C26 9.71006 25.4179 10.2857 24.7 10.2857H1.3C0.582056 10.2857 0 9.71006 0 9C0 8.28999 0.582056 7.71428 1.3 7.71428ZM1.3 15.4286H13C13.7179 15.4286 14.3 16.0042 14.3 16.7143C14.3 17.4243 13.7179 18 13 18H1.3C0.582056 18 0 17.4243 0 16.7143C0 16.0042 0.582056 15.4286 1.3 15.4286Z"
              fill="#161920"
            />
          </svg>
        </div>

        <!-- Get A Quote -->
        <a class="btn btn-primary" href="/contact"
          >Get a Quote <i class="icon-arrow-right"></i
        ></a>
      </div>
    </div>
  </nav>
</header>