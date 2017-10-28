<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/headers.jsp"/>

<div class="container w-75 my-5">
       <div class="jumbotron jumbotron-fluid py-4">
           <div class="container-fluid w-100">
	           	<c:if test="${not empty user and user.getAccess() >= adminAccessLevel}"> 
	           		<h1 class="display-4 px-4 mt-0"> Visualização de animal cadastrado </h1>
	              		<hr>
	           	</c:if>
            	<div class="row px-4">
                   <div class="col-6">
                       <div class="mt-5">
                       	<h3> ${not empty user and user.getAccess() >= adminAccessLevel ? "Informações sobre o animal" : currentAnimal.getTitle()}</h3>
                       	<hr>
                       	<c:if test="${formNumber == 1}">
                        	<div class="alert alert-${status}">
                        		${message}
                        	</div>
                        </c:if>
                       	<c:if test="${not empty user and user.getAccess() >= adminAccessLevel}">
                            <form method="POST" action="<c:url value='/animal/${currentAnimal.getId()}/view'/>" class="w-100 px-4 py-3">
                                <div class="form-group row">
                                    <label for="animals_title_input" class="col-3 col-form-label"> Título* </label>
                                    <div class="col-9">
                                        <input type="text" id="animals_title_input" name="title" class="form-control" value="${currentAnimal.getTitle()}" ${empty user ? "disabled" : ""}>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="animals_description_input"> Descrição* </label>
                                    <textarea id="animals_description_input" name="description" class="form-control" rows="5" maxlength="1000" aria-describedby="animals_description_description" ${empty user ? "disabled" : ""}>${currentAnimal.getDescription()}</textarea>    
                                    <small id="animals_description_description"> Limite de 1000 caracteres.</small>
                                </div>
                               
                                <div class="form-group row">
                                    <label for="animals_user_input" class="col-3 col-form-label"> <a href="<c:url value='/user/${currentAnimal.getUser().getId()}/view'/> "> Usuário* </a> </label>
                                    <div class="col-9">
                                        <input type="text" id="animals_user_input" class="form-control" value="${currentAnimal.getUser().getName()}" disabled>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="animals_date_input" class="col-3 col-form-label"> Data* </label>
                                    <div class="col-9">
                                        <input type="text" id="animals_date_input" class="form-control" value="${currentAnimal.getRegisterDate()}" disabled>
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
                                <button type="submit" id="animals_submit_input" class="btn btn-block btn-danger mt-4"> Atualizar informações </button>
                           	</form>
						</c:if>
                        <c:if test="${empty user or user.getAccess() < adminAccessLevel}">
                        	<p class="text-justify"> ${currentAnimal.getDescription()} </p>
                        </c:if>
                  	</div>
				</div>
                <div class="col-6">
                    <div class="${not empty user and user.getAccess() >= adminAccessLevel ? 'my-5' : 'mt-5'}">
                    	<c:if test="${not empty user and user.getAccess() >= adminAccessLevel}">
                    		<h3> Imagem principal <button type="button" class="btn btn-sm btn-danger float-right" data-toggle="modal" data-target="#update-main-image-modal">Alterar</button></h3>
                        	<hr>
                        	<c:if test="${formNumber == 2}">
	                        	<div class="alert alert-${status}">
	                        		${message}
	                        	</div>
                    		</c:if>
                    	</c:if>
						<img src="<c:url value='/animal/${currentAnimal.getId()}/image'/>" class="img-thumbnail w-50 mx-1" alt="">
                    </div>
                    <div class="${not empty user and user.getAccess() >= adminAccessLevel ? 'my-5' : 'mb-5'}">
                    	<c:if test="${not empty user and user.getAccess() >= adminAccessLevel}">
                    		<h3> Imagens secundárias <button type="button" class="btn btn-sm btn-danger float-right" data-toggle="modal" data-target="#update-secondary-images-modal">Alterar</button></h3>
                    		<hr>
	                    	<c:if test="${formNumber == 3}">
		                        <div class="alert alert-${status}">
		                        	${message}
		                        </div>
	                    	</c:if>
	                    	<c:if test="${numberSecondaryImages == 0}">
                   				<p> Não há outras imagens disponíveis. </p>
                   			</c:if>
                    	</c:if>
                    	<c:if test="${empty user or user.getAccess() < adminAccessLevel}">
                    		<hr>
                    	</c:if>
                    	
                        <div class="row">
                        	<c:forEach var="i" begin="1" end="${numberSecondaryImages}">
                        		<div class="col-4">
                                	<img src="<c:url value='/animal/${currentAnimal.getId()}/imageAnimal/${i}'/>" class="img-thumbnail mx-1" alt="">
                            	</div>
                        	</c:forEach>
                        </div>
                    </div>
                    <c:if test="${empty user or user.getAccess() < adminAccessLevel}">
                   		<p class="float-right mb-5"> Cadastrado em: ${currentAnimal.getRegisterDate()} </p>
                   	</c:if>
           		</div>
            </div>
        </div>
    </div>
</div>

<div id="update-main-image-modal" class="modal fade">
	<div class="modal-dialog" role="document">
    	<div class="modal-content">
    		<div class="modal-header">
		        	<h5 class="modal-title"> Alterar imagem principal </h5>
		        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		         		<span aria-hidden="true">&times;</span>
		        	</button>
		      	</div>
		    <form method="POST" action="<c:url value='/animal/${currentAnimal.getId()}/updateMainImage'/>"  enctype="multipart/form-data">
		    	<div class="modal-body">
        			<div class="form-group row">
                    	<label for="animals_primary_image_input" class="col-3 col-form-label"> Imagem* </label>
                   		<div class="col-9">
							<label class="custom-file w-100">
							    <input type="file" class="custom-file-input" name="image">
								<span class="custom-file-control" data-content="Selecionar arquivo..."></span>
							</label>
						</div>
                   </div>
	      		</div>
	      		<div class="modal-footer">
	      			<button type="button" class="btn btn-secondary float-right" data-dismiss="modal"> Cancelar </button>
	      			<button type="submit" class="btn btn-danger float-right"> Salvar </button>
	      		</div>
		    </form>
    	</div>
 	</div>
</div>

<div id="update-secondary-images-modal" class="modal fade">
	<div class="modal-dialog modal-lg" role="document">
    	<div class="modal-content">
    		<div class="modal-header">
		        	<h5 class="modal-title"> Alterar imagens secundárias </h5>
		        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		         		<span aria-hidden="true">&times;</span>
		        	</button>
		      	</div>
		    <form method="POST" action="<c:url value='/animal/${currentAnimal.getId()}/updateImages'/>"  enctype="multipart/form-data">
		    	<div class="modal-body">
		    		<div class="row"> 
		    			<div class="col-9 form-group row d-flex align-items-center">
		    				<label for="animals_image2_input" class="col-4 col-form-label text-right"> Imagem 2 </label>
	                   		<div class="col-8">
								<label class="custom-file w-100">
								    <input type="file" id="animals_image2_input"class="custom-file-input" name="image2">
									<span class="custom-file-control" data-content="Selecionar arquivo..."></span>
								</label>
							</div>
		    			</div>
		    			<div class=col-3>
		    				<c:if test="${numberSecondaryImages >= 1}">
		    					<img src="<c:url value='/animal/${currentAnimal.getId()}/imageAnimal/1'/>" class="img-thumbnail w-100" alt="">
		    				</c:if>
		    			</div>
		    		</div>
		    		<hr>
		    		<div class="row"> 
		    			<div class="col-9 form-group row d-flex align-items-center">
		    				<label for="animals_image3_input" class="col-4 col-form-label text-right"> Imagem 3 </label>
	                   		<div class="col-8">
								<label class="custom-file w-100">
								    <input type="file" id="animals_image3_input" class="custom-file-input" name="image3">
									<span class="custom-file-control" data-content="Selecionar arquivo..."></span>
								</label>
							</div>
		    			</div>
		    			<div class=col-3>
		    				<c:if test="${numberSecondaryImages >= 2}">
		    					<img src="<c:url value='/animal/${currentAnimal.getId()}/imageAnimal/2'/>" class="img-thumbnail w-100" alt="">
		    				</c:if>
		    			</div>
		    		</div>
		    		<hr>
		    		<div class="row"> 
		    			<div class="col-9 form-group row d-flex align-items-center">
		    				<label for="animals_image4_input" class="col-4 col-form-label text-right"> Imagem 4 </label>
	                   		<div class="col-8">
								<label class="custom-file w-100">
								    <input type="file" id="animals_image4_input" class="custom-file-input" name="image4">
									<span class="custom-file-control" data-content="Selecionar arquivo..."></span>
								</label>
							</div>
		    			</div>
		    			<div class=col-3>
		    				<c:if test="${numberSecondaryImages >= 3}">
		    					<img src="<c:url value='/animal/${currentAnimal.getId()}/imageAnimal/3'/>" class="img-thumbnail w-100" alt="">
		    				</c:if>
		    			</div>
		    		</div>
	      		</div>
	      		<div class="modal-footer">
	      			<button type="button" class="btn btn-secondary float-right" data-dismiss="modal"> Cancelar </button>
	      			<button type="submit" class="btn btn-danger float-right"> Salvar </button>
	      		</div>
		    </form>
    	</div>
 	</div>
</div>



<c:import url="/includes/footers.jsp"/>