<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/headers.jsp"/>
<c:import url="/includes/main-header.jsp"/>
	
<div class="row w-100 mt-5 mx-0 mb-0 p-0">
	<!-- Menu lateral -->
	<div class="col-2 offset-1 px-0">
	    <div class="card px-0 border-top-0 border-bottom-0 border-right-0">
	        <nav class="nav flex-column text-white my-3">
	            <h6><a class="nav-link my-0 py-1" href="<c:url value='/'/>"> Home</a></h6>
	            <h6><a class="nav-link my-0 py-1" href="<c:url value='/'/>"> Animais para adoção</a></h6>
	            <h6><a class="nav-link my-0 py-1" href="<c:url value='/'/>"> Notícias </a></h6>
	            <h6><a class="nav-link my-0 py-1" href="<c:url value='/'/>"> Estatuto </a></h6>
	            <h6><a class="nav-link my-0 py-1" href="<c:url value='/'/>"> Legislação </a></h6>
	            <h6><a class="nav-link my-0 py-1" href="<c:url value='/'/>"> Prestação de contas </a></h6>
	            <h6><a class="nav-link my-0 py-1" href="<c:url value='/'/>"> Quero ajudar </a></h6>
	        </nav>
	    </div>
	</div>
	
	<!-- Animais para adoção -->
    <div class="col-6 px-0">
        <div class="px-3 pb-4 pt-0 mx-4 mb-5">
            <div class="card">
                <div class="card-header standard-color-blue">
                    <h4 class="text-white my-0"> Animais para adoção </h4>
                </div>
            </div>
 		</div>
 	</div>
 	
 	<div class="col-2 px-0">
	    <!-- Notícias recentes -->
	    <div class="card">
	        <div class="card-header standard-color-blue">
	            <h4 class="card-title my-0 text-white"> Notícias recentes </h4>
	        </div>
	        <div class="card-block mx-1 my-2">
	            <span class="badge badge-danger">03/03/17</span> <br>
	            <a href="#">Macarronada e galeto </a>
	            <hr class="my-2">
	            <span class="badge badge-danger">18/02/17</span> <br>
	            <a href="#">Feira de adoção </a>
	            <hr class="my-2">
	            <span class="badge badge-danger">05/02/17</span> <br>
	            <a href="#">Arrecadação de ração </a>
	            <hr class="my-2">
	            <span class="badge badge-danger">22/01/17</span> <br>
	            <a href="#">Bingo e mateada </a>
	            <hr class="my-2">
	            <span class="badge badge-danger">22/01/17</span> <br>
	            <a href="#">Sorteio da rifa </a>
	      	</div>
    	</div>
	
	
		<!-- Informações para contato -->
	  	<div class="px-0 my-5 card">
	    	<div class="card-header standard-color-blue">
	           	<h4 class="card-title my-0 text-white"> Contatos úteis </h4>
	       	</div>
	       	<div class="card-block mx-1 my-2">
	         	<p><span class="badge badge-warning">Email</span> <br> conanimal@gmail.com </p>
	         	<hr class="my-0">
	         	<p><span class="badge badge-warning">Link</span> <br> www.uipa.org.br </p>
	         	<hr class="my-0">
	         	<p><span class="badge badge-warning">Link</span> <br> www.amparaanimal.org.br </p>
	       	</div>
	   	</div>
   	</div>
</div>

<c:import url="/includes/main-footer.jsp"/>
<c:import url="/includes/footers.jsp"/>


