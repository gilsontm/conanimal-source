<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container m-auto mb-5 row">
    <!-- Logo e slogan -->
    <div class="col-3 mx-0 text-center pt-5">
        <img src="<c:url value='images/logo.png'/>" class="w-75 mx-auto mb-auto mt-2" alt="">
        <hr>
        <h4 class="font-weight-bold"> Porque o seu melhor amigo merece muito carinho! </h4>
    </div>

    <!-- Carousel (imagens passando) -->
    <div class="col-9 mx-0">
        <div class="embed-responsive embed-responsive-21by9">
            <div id="carouselExampleIndicators" class="carousel slide w-100 embed-responsive-item" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="carousel-item active">
                    <img class="d-block img-fluid w-100 h-100" src="<c:url value='images/carousel-example-1.jpg'/>" alt="">
                </div>
                <div class="carousel-item">
                    <img class="d-block img-fluid w-100 h-100" src="<c:url value='images/carousel-example-2.jpg'/>" alt="">
                </div>
                <div class="carousel-item">
                    <img class="d-block img-fluid w-100 h-100" src="<c:url value='images/carousel-example-3.jpg' />" alt="">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        </div>
    </div>
</div>
 
 <hr class="w-100">