<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="pt">
<head>
	<meta charset="UTF-8" />
	<title>Con Animal</title>
	
	<link rel="stylesheet" type="text/css" href="<c:url value='css/tether.min.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='bootstrap/css/bootstrap.min.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='css/index.css'/>"/>
	
	<link rel="icon" href="<c:url value='images/icon.png'/>"/> 
</head> 
<body>
	<div class="container-fluid standard-color-blue mb-4 py-1 row mx-0">
        <!-- Menu superior -->
        <div class="col-6 offset-2">
            <nav class="nav">
                <a href="<c:url value='/'/>" class="text-white nav-link"> Home </a>
                <a href="<c:url value='/statute'/>" class="text-white nav-link border-top-0 border-bottom-0 border-right-0 table-bordered"> Estatuto </a>
                <a href="<c:url value='/legislation'/>" class="text-white nav-link border-top-0 border-bottom-0 border-right-0 table-bordered"> Legislação </a>
                <a href="<c:url value='/'/>" class="text-white nav-link border-top-0 border-bottom-0 border-right-0 table-bordered"> Animais para adoção </a>
            </nav>
        </div>
		
		<c:choose>
			<c:when test="${not empty user and not empty adminAccessLevel}">
				<!-- Perfil de usuário -->
				<div class="col-4">
		            <div class="btn-group float-right mr-5">
		                <button type="button" class="btn btn-danger dropdown-toggle px-3 m-1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		                    Olá, ${user.getName()}
		                </button>
		                <div class="dropdown-menu dropdown-menu-right">
		                    <a class="dropdown-item" href="<c:url value='/profile'/>">Perfil</a>
		                    <c:if test="${user.getAccess() >= adminAccessLevel}">
		                    	<a class="dropdown-item" href="<c:url value='/adminPanel'/>">Painel de administrador</a>
		                    </c:if>
		                    <div class="dropdown-divider"></div>
		                    <a class="dropdown-item" href="<c:url value='/logout'/>">Sair</a>
		                </div>
		            </div>
	        	</div>
			</c:when>
			<c:otherwise>
				<!-- Entre/cadastre-se-->
				<div class="col-4 ">
		            <nav class="nav float-right mr-5">
		                <a href="<c:url value='/register'/>" class="text-white nav-link btn btn-danger m-1">Torne-se um sócio</a>
		                <a href="<c:url value='/login'/>" class="text-white nav-link btn btn-danger m-1">Entre</a>
		            </nav>
        		</div>
			</c:otherwise>
		</c:choose>
    </div>
