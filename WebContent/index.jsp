<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Website quyên góp từ thiện</title>

    <!-- Bootstrap Core CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
      crossorigin="anonymous"
    />

    <!-- Custom styles -->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css" />
  </head>
  <body>
    <!-- Header, navbar -->
    <header>
      <nav class="navbar navbar-expand-md navbar-dark bg-dark bg-gradient">
        <div class="container-fluid">
          <a href="#" class="navbar-brand">WEBSITE QUYÊN GÓP TỪ THIỆN</a>
          <a href="${pageContext.request.contextPath}/login/loginForm" class="btn btn-primary">Đăng nhập</a>
        </div>
      </nav>
    </header>

    <main>
      <!-- Carousel -->
      <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
          <button
            type="button"
            data-bs-target="#myCarousel"
            data-bs-slide-to="0"
            class="active"
            aria-current="true"
            aria-label="Slide 1"
          ></button>
          <button
            type="button"
            data-bs-target="#myCarousel"
            data-bs-slide-to="1"
            aria-label="Slide 2"
            class=""
          ></button>
        </div>
        <!-- Carousel Item-->
        <div class="carousel-inner">
          <div class="carousel-item active bg-img1">
            <div class="container"></div>
          </div>
          <div class="carousel-item bg-img2">
            <div class="container"></div>
          </div>
        </div>
        <!-- Next & Prev Button -->
        <button
          class="carousel-control-prev"
          type="button"
          data-bs-target="#myCarousel"
          data-bs-slide="prev"
        >
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button
          class="carousel-control-next"
          type="button"
          data-bs-target="#myCarousel"
          data-bs-slide="next"
        >
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>

      <!-- FOOTER -->
      <footer>
        <div class="container">
          <p>
            &copy; 2023 Quang Phuong Donation |
            <i>phuongnq1809@gmail.com | 097.9189.790</i>
          </p>
        </div>
      </footer>
    </main>

    <!-- Javascript Bundle with Popper -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
