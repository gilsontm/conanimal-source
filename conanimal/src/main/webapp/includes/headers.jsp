<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>Con Animal</title>
	
	<link rel="stylesheet" type="text/css" href="<c:url value='css/tether.min.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='bootstrap/css/bootstrap.min.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='css/index.css'/>"/>
	
	<link rel="icon" href="<c:url value='images/icon.png'/>"/> 
</head> 
<body>
	<div class="container-fluid standard-color-blue mb-4 py-1 row">
        <!-- Menu superior -->
        <div class="col-6 offset-2">
            <nav class="nav">
                <a href="<c:url value='/'/>" class="text-white nav-link"> Home </a>
                <a href="" class="text-white nav-link border-top-0 border-bottom-0 border-right-0 table-bordered"> Estatuto </a>
                <a href="" class="text-white nav-link border-top-0 border-bottom-0 border-right-0 table-bordered"> Legislação </a>
                <a href="<c:url value='/'/>" class="text-white nav-link border-top-0 border-bottom-0 border-right-0 table-bordered"> Animais para adoção </a>
            </nav>
        </div>

        <!-- Entre/cadastre-se-->
        <div class="col-4 ">
            <nav class="nav float-right mr-5">
                <a href="" class="text-white nav-link btn btn-danger m-1">Torne-se um sócio</a>
                <a href="<c:url value='/login'/>" class="text-white nav-link btn btn-danger m-1">Entre</a>
            </nav>
        </div>

        <!-- Perfil de usuário -->
        <div class="col-4 d-none">
            <div class="btn-group float-right mr-5">
                <button type="button" class="btn btn-danger dropdown-toggle px-3 m-1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Olá, Gilson
                </button>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="perfil-usuario.html">Perfil</a>
                    <a class="dropdown-item" href="painel-admin.html">Painel de administrador</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Sair</a>
                </div>
            </div>
        </div>
    </div>

<!-- 
<nav class="navbar navbar-toggleable-md navbar-light bg-faded">
  <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <a class="navbar-brand" href="<c:url value='/'/>">LOGO</a>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="<c:url value='/'/>">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<c:url value='/login'/>">Login</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="text" placeholder="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>  -->

