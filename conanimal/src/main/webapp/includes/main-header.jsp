<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container m-auto mb-5 row">
    <!-- Logo e slogan -->
    <div class="col-3 mx-0 text-center d-flex align-items-center h-100">
    	<div class="pt-2">
    		<img src="<c:url value='${not empty logoImage.getImagePath() ? "/imageMainPage/1/view" : "/images/logo.png"}'/>" class="w-75 mx-auto mb-auto mt-2" alt="">
	        <hr>
	        <h4 class="font-weight-bold"> ${sloganContact.getUrl()} </h4>
    	</div>
    </div>

    <!-- Carousel (imagens passando) -->
    <div class="col-9 mx-0">
       	<c:choose>
			<c:when test="${not empty imagesMainPage and imagesMainPage.size() > 0}">
				<div class="embed-responsive embed-responsive-21by9">
		            <div id="imagesMainPage" class="carousel slide w-100 embed-responsive-item" data-ride="carousel">
			            <ol class="carousel-indicators">
			            	<c:forEach var="i" begin="0" end="${imagesMainPage.size() - 1}">
			            		<li data-target="#imagesMainPage" data-slide-to="${i}" ${i == 0 ? 'class="active"' : ''}> </li>
			            	</c:forEach>
			            </ol>
			            <div class="carousel-inner" role="listbox">
			            	<c:forEach var="id" begin="0" end="${imagesMainPage.size() - 1}">
			            		<div class="carousel-item ${id == 0 ? 'active' : ''}">
			                    	<img class="d-block img-fluid w-100 h-100" src="<c:url value='/imageMainPage/${imagesMainPage.get(id).getId()}/view'/>" alt="">
			                	</div>
			            	</c:forEach>
			            </div>
			            <a class="carousel-control-prev" href="#imagesMainPage" role="button" data-slide="prev">
			                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			                <span class="sr-only">Previous</span>
			            </a>
			            <a class="carousel-control-next" href="#imagesMainPage" role="button" data-slide="next">
			                <span class="carousel-control-next-icon" aria-hidden="true"></span>
			                <span class="sr-only">Next</span>
			            </a>
		        	</div>
	        	</div>
        	</c:when>
        	<c:otherwise>
        		<h1 class="text-center my-5"> Nenhuma imagem cadastrada. </h1>
        	</c:otherwise>
        </c:choose>
    </div>
</div>

<hr>


