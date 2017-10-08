<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid w-100 standard-color-blue mx-0 mb-0 mt-5 py-4 row">
	 <!-- Logo e facebook -->
	 <div class="col-2 offset-2 py-2">
	     <img src="<c:url value='images/logo.png'/>" class="w-50 standard-color-blue mx-5" alt="">
	     <hr>
	     <h5 class="text-white m-auto text-center"> Siga-nos: <a href="https://www.facebook.com/ongconanimal"> <img src="<c:url value='images/facebook.png'/>" class="w-25 m-auto img-thumbnail standard-color-blue border-0" alt=""></a></h5>
	 </div>
	
	 <!-- Nossos parceiros -->
	 <div class="offset-1 col-5">
	     <h5 class="text-center text-white"> Nosso parceiros: </h5>
	     <hr>
	     <c:set var="size" value="${partners.size() % 4 > 0 ? partners.size() / 4 + 1 : partners.size() / 4}"/>
	     
	     <c:choose>
	     	<c:when test="${size > 0}">
	     		<c:forEach var="iterationTurn" begin="0" end="${size - 1}">
			     	<div class="row">
				     	<c:forEach var="i" begin="0" end="3">
				     		<c:if test="${(i + (iterationTurn * 4)) < partners.size()}"> 
					     		<div class="col-3">
				             		<img src="<c:url value='/partner/${partners.get(i + (iterationTurn * 4)).getId()}/image'/>" class="w-100 standard-color-blue" alt="">
				         		</div>
				         	</c:if>
				     	</c:forEach>
			     	</div>
			     	<hr>
			     </c:forEach>
			</c:when>
	     	<c:otherwise>
	     		<h5 class="text-center text-white"> Nenhum parceiro cadastrado. </h5>
	     	</c:otherwise>
	     </c:choose>
	</div>