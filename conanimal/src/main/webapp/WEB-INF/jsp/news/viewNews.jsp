<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/headers.jsp"/>

<div class="container w-75 my-5">
       <div class="jumbotron jumbotron-fluid py-4">
           <div class="container-fluid w-100">
	           	<c:if test="${not empty user and user.getAccess() >= adminAccessLevel}"> 
	           		<h1 class="display-4 px-4 mt-0"> Visualização de notícia </h1>
	              		<hr>
	           	</c:if>
            	<div class="row px-4">
                   <div class="col-6">
                       <div class="mt-5">
                       	<h3> ${not empty user and user.getAccess() >= adminAccessLevel ? "Informações sobre a notícia" : currentNews.getTitle()}</h3>
                       	<hr>
                       	<c:if test="${formNumber == 1}">
                        	<div class="alert alert-${status}">
                        		${message}
                        	</div>
                        </c:if>
                       	<c:if test="${not empty user and user.getAccess() >= adminAccessLevel}">
                            <form method="POST" action="<c:url value='/news/${currentNews.getId()}/view'/>" class="w-100 px-4 py-3">
                                <div class="form-group row">
                                    <label for="news_title_input" class="col-3 col-form-label"> Título* </label>
                                    <div class="col-9">
                                        <input type="text" id="news_title_input" name="title" class="form-control" value="${currentNews.getTitle()}" ${empty user ? "disabled" : ""}>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="news_description_input"> Descrição* </label>
                                    <textarea id="news_description_input" name="description" class="form-control" rows="5" maxlength="1000" aria-describedby="news_description_description" ${empty user ? "disabled" : ""}>${currentNews.getDescription()}</textarea>    
                                    <small id="news_description_description"> Limite de 1000 caracteres.</small>
                                </div>
                               
                                <div class="form-group row">
                                    <label for="news_user_input" class="col-3 col-form-label"> <a href="<c:url value='/user/${currentNews.getUser().getId()}/view'/> "> Usuário* </a> </label>
                                    <div class="col-9">
                                        <input type="text" id="news_user_input" class="form-control" value="${currentNews.getUser().getName()}" disabled>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="news_date_input" class="col-3 col-form-label"> Data* </label>
                                    <div class="col-9">
                                        <input type="text" id="news_date_input" class="form-control" value="${currentNews.getRegisterDate()}" disabled>
                                    </div>
                                </div>
                                <hr>
                                <div class="d-flex justify-content-left">
                                    <div class="form-check">
                                        <label class="form-check-label">
                                            <input type="checkbox" name="hidden" class="form-check-input" ${currentNews.getHidden() ? "checked" : ""}>
                                            Ocultado
                                        </label>
                                    </div>
                                </div>
                                <button type="submit" id="news_submit_input" class="btn btn-block btn-danger mt-4"> Atualizar informações </button>
                           	</form>
						</c:if>
                        <c:if test="${empty user or user.getAccess() < adminAccessLevel}">
                        	<p class="text-justify"> ${currentNews.getDescription()} </p>
                        </c:if>
                  	</div>
				</div>
                <div class="col-6 my-5">
                  	<h3> 
                  		Imagens 
                  		<c:if test="${not empty user and user.getAccess() >= adminAccessLevel}"> 
                  			<button type="button" class="btn btn-sm btn-danger float-right" data-toggle="modal" data-target="#update-images-modal"> Alterar </button>
                  		</c:if>
                  	</h3>
                  	<hr>
                   	<c:if test="${formNumber == 2}">
                        <div class="alert alert-${status}">
                        	${message}
                        </div>
                   	</c:if>
 					<c:if test="${numberImages == 0}">
                   		<p> Não há imagens disponíveis. </p>
                   	</c:if>
                   	<div class="row">
                   		<c:forEach var="i" begin="1" end="${numberImages}">
                   			<div class="col-4">
                           		<img src="<c:url value='/news/${currentNews.getId()}/imageNews/${i}'/>" class="img-thumbnail mx-1" alt="">
                       		</div>
                   		</c:forEach>
                   	</div>
           		</div>
            </div>
        </div>
    </div>
</div>

<c:if test="${not empty user and user.getAccess() >= adminAccessLevel}"> 
	<div id="update-images-modal" class="modal fade">
		<div class="modal-dialog modal-lg" role="document">
	    	<div class="modal-content">
	    		<div class="modal-header">
			        	<h5 class="modal-title"> Alterar imagens </h5>
			        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			         		<span aria-hidden="true">&times;</span>
			        	</button>
			      	</div>
			    <form method="POST" action="<c:url value='/news/${currentNews.getId()}/updateImages'/>"  enctype="multipart/form-data">
			    	<div class="modal-body">
			    		<div class="row"> 
			    			<div class="col-9 form-group row d-flex align-items-center">
			    				<label for="news_image1_input" class="col-4 col-form-label text-right"> Imagem 1 </label>
		                   		<div class="col-8">
									<label class="custom-file w-100">
									    <input type="file" id="news_image1_input" class="custom-file-input" name="image1">
										<span class="custom-file-control" data-content="Selecionar arquivo..."></span>
									</label>
								</div>
			    			</div>
			    			<div class=col-3>
			    				<c:if test="${numberImages >= 1}">
			    					<img src="<c:url value='/news/${currentNews.getId()}/imageNews/1'/>" class="img-thumbnail w-100" alt="">
			    				</c:if>
			    			</div>
			    		</div>
			    		<hr>
			    		<div class="row"> 
			    			<div class="col-9 form-group row d-flex align-items-center">
			    				<label for="news_image2_input" class="col-4 col-form-label text-right"> Imagem 2 </label>
		                   		<div class="col-8">
									<label class="custom-file w-100">
									    <input type="file" id="news_image2_input" class="custom-file-input" name="image2">
										<span class="custom-file-control" data-content="Selecionar arquivo..."></span>
									</label>
								</div>
			    			</div>
			    			<div class=col-3>
			    				<c:if test="${numberImages >= 2}">
			    					<img src="<c:url value='/news/${currentNews.getId()}/imageNews/2'/>" class="img-thumbnail w-100" alt="">
			    				</c:if>
			    			</div>
			    		</div>
			    		<hr>
			    		<div class="row"> 
			    			<div class="col-9 form-group row d-flex align-items-center">
			    				<label for="news_image1_input" class="col-4 col-form-label text-right"> Imagem 3 </label>
		                   		<div class="col-8">
									<label class="custom-file w-100">
									    <input type="file" id="news_image3_input" class="custom-file-input" name="image3">
										<span class="custom-file-control" data-content="Selecionar arquivo..."></span>
									</label>
								</div>
			    			</div>
			    			<div class=col-3>
			    				<c:if test="${numberImages >= 3}">
			    					<img src="<c:url value='/news/${currentNews.getId()}/imageNews/3'/>" class="img-thumbnail w-100" alt="">
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
</c:if>

<c:import url="/includes/footers.jsp"/>