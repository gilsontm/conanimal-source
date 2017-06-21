<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/headers.jsp"/>

<h1>Faça seu login:</h1>

<form method="POST" action="<c:url value='/login'/>">

	<c:if test="${not empty errorMessage}">
		<div class="alert alert-danger">
			${errorMessage}
		</div>
	</c:if>
	<label for="email"> Email: </label>
	<input type="text" id="email" name="email">
	
	<label for="password"> Senha: </label>
	<input type="password" id="password" name="password">
	
	<button type="submit"> Logar </button>
	
</form>
	
<c:import url="/includes/footers.jsp"/>