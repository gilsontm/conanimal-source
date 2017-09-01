<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/headers.jsp"/>

	<div class="container my-5">
        <div class="jumbotron jumbotron-fluid pt-4">
            <div class="container-fluid w-100">
                <h1 class="display-4 px-4 mt-0"> Visualização de animal cadastrado </h1>
                <hr>
                <div class="w-100 row">
                    <div class="col-6">
                        <div class="mt-5">
                        	<h5> Informações sobre o animal </h5>
                        	<hr>
                        	<c:if test="${not empty status and not empty message}">
	                        	<div class="alert alert-${status}">
	                        		${message}
	                        	</div>
	                        </c:if>
                            <form method="POST" action="<c:url value='/viewAnimal${currentAnimal.getId()}'/>" class="w-100 px-4 py-3">
                                <div class="form-group row">
                                    <label for="animals_title_input" class="col-3 col-form-label"> Título* </label>
                                    <div class="col-9">
                                        <input type="text" id="animals_title_input" name="title" class="form-control" value="${currentAnimal.getTitle()}" ${empty user ? "disabled" : ""}>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="animals_description_input"> Descrição* </label>
                                    <textarea id="animals_description_input" name="description" class="form-control" rows="5" maxlength="500" aria-describedby="animals_description_description" ${empty user ? "disabled" : ""}> ${currentAnimal.getDescription()}</textarea>    
                                    <small id="animals_description_description"> Limite de 500 caracteres.</small>
                                </div>
                                <div class="form-group row">
                                    <label for="animals_user_input" class="col-3 col-form-label"> <a href="<c:url value='/viewUser${currentAnimal.getUser_id()}'/> "> Usuário* </a> </label>
                                    <div class="col-9">
                                        <input type="text" id="animals_user_input" class="form-control" value="${currentAnimal_user.getName()}" disabled>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="animals_date_input" class="col-3 col-form-label"> Data* </label>
                                    <div class="col-9">
                                        <input type="text" id="animals_date_input" class="form-control" value="${currentAnimal.getRegister_date()}" disabled>
                                    </div>
                                </div>
                                <c:if test="${not empty user}">
	                                <div class="form-group row">
	                                    <label for="animals_primary_image_input" class="col-3 col-form-label"> Imagem 1* </label>
	                                    <div class="col-9">
	                                        <input type="file" id="animals_primary_image_input" class="form-control-file">
	                                    </div>
	                                </div>
	                                <div class="form-group row">
	                                    <label for="animals_image_2_input" class="col-3 col-form-label"> Imagem 2 </label>
	                                    <div class="col-9">
	                                        <input type="file" id="animals_image_2_input" class="form-control-file">
	                                    </div>
	                                </div>
	                                <div class="form-group row">
	                                    <label for="animals_image_3_input" class="col-3 col-form-label"> Imagem 3 </label>
	                                    <div class="col-9">
	                                        <input type="file" id="animals_image_3_input" class="form-control-file">
	                                    </div>
	                                </div>
	                                <div class="form-group row">
	                                    <label for="animals_image_4_input" class="col-3 col-form-label"> Imagem 4 </label>
	                                    <div class="col-9">
	                                        <input type="file" id="animals_image_4_input" class="form-control-file">
	                                    </div>
	                                </div>
	                                <hr>
	                                <div class="d-flex justify-content-left">
	                                    <div class="form-check mr-3">
	                                        <label class="form-check-label">
	                                            <input type="checkbox" name="adopted" class="form-check-input" ${currentAnimal.getAdopted() ? "checked" : ""}>
	                                            Adotado
	                                        </label>
	                                    </div>
	                                    <div class="form-check">
	                                        <label class="form-check-label">
	                                            <input type="checkbox" name="hidden" class="form-check-input" ${currentAnimal.getHidden() ? "checked" : ""}>
	                                            Ocultado
	                                        </label>
	                                    </div>
	                                </div>
	                                <button type="submit" id="accountability_submit_input" class="btn btn-block btn-danger mt-4"> Atualizar informações </button>
	                        	</c:if>
                            </form>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="my-5">
                            <h5> Imagem principal </h5>
                            <hr>
                            <img src="images/a.jpg" class="img-thumbnail mx-1 w-50">
                        </div>
                        <div class="my-5">
                            <h5> Imagens secundárias </h5>
                            <hr>
                            <div class="row">
                                <div class="col-4">
                                    <img src="images/a.jpg" class="img-thumbnail mx-1">
                                </div>
                                <div class="col-4">
                                    <img src="images/a.jpg" class="img-thumbnail mx-1">
                                </div>
                                <div class="col-4">
                                    <img src="images/a.jpg" class="img-thumbnail mx-1">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>



<c:import url="/includes/footers.jsp"/>