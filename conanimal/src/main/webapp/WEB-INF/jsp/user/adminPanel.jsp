<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/headers.jsp"/>

    <div class="container w-75 my-5">
        <div class="jumbotron jumbotron-fluid pt-4">
            <div class="container-fluid w-100">
                <h1 class="display-4 px-4 mt-0"> Painel de Administrador </h1>
                <hr>
                <!-- Instruções de uso -->
                <div class="px-4 mt-5">
                    <h3> Instruções de uso </h3>
                    <hr>
                    <ul>
                        <li> Cada título representa uma seção independente, que pode ser alterada sem que haja alterações nas outras seções. </li>
                        <li> Campos marcados com * são de preenchimento obrigatório.</li>
                        <li> As alterações realizadas por cada administrador poderão ser visualizadas pelos outros administradores. </li>
                    </ul>
                </div>

                <div class="row px-4">
                    <div class="col-6">
                        <!-- Cadastrar novo animal para adoção -->
                        <div class="my-5">
                            <h3> Cadastrar novo animal para adoção </h3>
                            <hr>
                            <c:if test="${formNumber == 1}">
                            	<div class="alert alert-${status}">
                            		${message}
                            	</div>
                            </c:if>
                            <form method="POST" action="<c:url value='/animal/register'/>" enctype="multipart/form-data">
                                <div class="form-group row">
                                    <label for="animals_title_input" class="col-3 col-form-label"> Título* </label>
                                    <div class="col-9">
                                        <input type="text" id="animals_title_input" name="title" class="form-control" maxlength="50" placeholder="Título do animal para adoção">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="animals_description_input"> Descrição* </label>
                                    <textarea id="animals_description_input" name="description" class="form-control" rows="5" maxlength="255" aria-describedby="animals_description_description"> </textarea>
                                    <small id="animals_description_description"> Limite de 255 caracteres.</small>
                                </div>
                                <div class="form-group row">
                                    <label for="animals_primary_image_input" class="col-3 col-form-label"> Imagem 1* </label>
                                    <div class="col-9">
								       	<label class="custom-file">
										    <input type="file" class="custom-file-input" name="image1">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="animals_image_2_input" class="col-3 col-form-label"> Imagem 2 </label>
                                    <div class="col-9">
								       	<label class="custom-file">
										    <input type="file" class="custom-file-input" name="image2">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="animals_image_3_input" class="col-3 col-form-label"> Imagem 3 </label>
                                    <div class="col-9">
								       	<label class="custom-file">
										    <input type="file" class="custom-file-input" name="image3">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="animals_image_4_input" class="col-3 col-form-label"> Imagem 4 </label>
                                    <div class="col-9">
								       	<label class="custom-file">
										    <input type="file" class="custom-file-input" name="image4">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <button type="submit" id="animals_submit_button" class="btn btn-block btn-danger mt-4"> Cadastrar animal para adoção </button>
                            </form>
                        </div>
                        <!-- Cadastrar nova notícia -->
                        <div class="my-5">
                            <h3> Cadastrar nova notícia</h3>
                            <hr>
                            <c:if test="${formNumber == 2}">
                            	<div class="alert alert-${status}">
                            		${message}
                            	</div>
                            </c:if>
                            <form method="POST" action="<c:url value='/news/register'/>" enctype="multipart/form-data">
                                <div class="form-group row">
                                    <label for="news_title_input" class="col-3 col-form-label"> Título* </label>
                                    <div class="col-9">
                                        <input type="text" id="news_title_input" name="title" class="form-control" maxlength="50" placeholder="Título da notícia">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="news_description_input"> Descrição* </label>
                                    <textarea id="news_description_input" name="description" class="form-control" rows="5" maxlength="255" aria-describedby="news_description_description"> </textarea>
                                    <small id="news_description_description"> Limite de 255 caracteres.</small>
                                </div>
                                <div class="form-group row">
                                    <label for="news_image_1_input" class="col-3 col-form-label"> Imagem 1 </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" class="custom-file-input" name="image1">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="news_image_2_input" class="col-3 col-form-label"> Imagem 2 </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" class="custom-file-input" name="image2">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="news_image_3_input" class="col-3 col-form-label"> Imagem 3 </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" class="custom-file-input" name="image3">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <button type="submit" id="news_submit_button" class="btn btn-block btn-danger mt-4"> Cadastrar notícia </button>
                            </form>
                        </div>
                        <!-- Cadastrar nova prestação de contas -->
                        <div class="my-5">
                            <h3> Cadastrar prestação de contas</h3>
                            <hr>
                            <c:if test="${formNumber == 3}">
                            	<div class="alert alert-${status}">
                            		${message}
                            	</div>
                            </c:if>
                            <form method="POST" action="<c:url value='/report/register'/>" enctype="multipart/form-data">
                                <div class="form-group row">
                                    <label for="accountability_title_input" class="col-3 col-form-label"> Título* </label>
                                    <div class="col-9">
                                        <input type="text" id="accountability_title_input" name="title" class="form-control" maxlength="100" placeholder="Título da prestação de contas">
                                    </div>
                                </div>
                                <h5 class="align-items-center"> Arquivos  <button class="btn btn-sm btn-danger float-right" id="add_file_button"> Adicionar arquivo </button> </h5>
		                        <hr>
		                        <div id="report_file_container">
	                                <div class="form-group row">
	                                    <label class="col-3 col-form-label"> Arquivo 1* </label>
	                                    <div class="col-9">
	                                        <label class="custom-file">
											    <input type="file" class="custom-file-input" name="file1">
											    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
											</label>
	                                    </div>
	                                </div>
                               	</div>
                                <button type="submit" id="accountability_submit_button" class="btn btn-block btn-danger mt-4"> Cadastrar prestação de contas </button>
                            </form>
                        </div>
                        <!-- Formulário para alterar seção de parceiros da ONG -->
                        <div class="my-5">
                            <h3> Alterar seção de parceiros da ONG </h3>
                            <hr>
							<c:if test="${formNumber == 4}">
                            	<div class="alert alert-${status}">
                            		${message}
                            	</div>
                            </c:if>
                            <!-- Lista de parceiros cadastrados -->
                            <ul class="list-group mt-0 mb-4">
                                <li class="list-group-item standard-color-blue text-white"> Parceiros cadastrados</li>
                                <c:forEach items="${partners}" var="eachPartner">
                               		<li class="list-group-item d-flex justify-content-between">
	                                    ${eachPartner.getName()}
	                                    <form method="POST" action="<c:url value='/partner/${eachPartner.getId()}/hide'/>">
	                                    	<button type="submit" class="btn btn-sm btn-danger">
	                                        	Remover
	                                    	</button>
	                                    </form>
	                                </li>
                                </c:forEach>
                                <c:if test="${partners.size() == 0}"> 
                                	<li class="list-group-item d-flex justify-content-between">
                                		Nenhum parceiro cadastrado.
                                	</li>
                                </c:if>
                            </ul>

                            <!-- Formulário para cadastrar novo parceiro -->
                            <h5> Cadastrar novo parceiro </h5>
                            <hr>
                            <form method="POST" action="<c:url value='/partner/register'/>" enctype="multipart/form-data">
                                <div class="form-group row">
                                    <label for="partner_name_input" class="col-3 col-form-label"> Nome* </label>
                                    <div class="col-9">
                                        <input type="text" id="partner_name_input" name="name" class="form-control" placeholder="Digite o nome do parceiro">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="partner_url_input" class="col-3 col-form-label"> URL* </label>
                                    <div class="col-9">
                                        <input type="text" id="partner_url_input" name="url" class="form-control" placeholder="Digite o endereço do site">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="partner_image_input" class="col-form-label col-3"> Logomarca* </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" class="custom-file-input" name="image">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <button type="submit" id="partner_submit_button" class="btn btn-block btn-danger mt-4"> Cadastrar parceiro </button>
                            </form>
                        </div>
                        <!-- Formulário para alterar informações de contatos úteis -->
                        <div class="my-5">
                            <h3> Alterar informações de contatos úteis </h3>
                            <hr>
                            <c:if test="${formNumber == 5}">
                            	<div class="alert alert-${status}">
                            		${message}
                            	</div>
                            </c:if>
                            <form method="POST" action="<c:url value='/contact/update'/>">
                                <div class="form-group row">
                                    <label for="contact_email_input" class="col-3 col-form-label"> Email* </label>
                                    <div class="col-9">
                                        <input type="email" id="contact_email_input" name="email" class="form-control" value="${emailContact.getUrl()}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="contact_facebook_input" class="col-3 col-form-label"> Facebook* </label>
                                    <div class="col-9">
                                        <input type="text" id="contact_facebook_input" name="facebook" class="form-control" value="${facebookContact.getUrl()}">
                                    </div>
                                </div>
                                <c:forEach var="id" begin="1" end="5">
	                                <div class="form-group row">
	                                    <label for="contact_link${id}_input" class="col-3 col-form-label"> Link útil ${id} </label>
	                                    <div class="col-9">
	                                        <input type="text" id="contact_link${id}_input" name="link${id}" class="form-control" place="Digite o url do site" value="${contacts.size() > id - 1 ? contacts.get(id - 1).getUrl() : ''}">                                
	                                    </div>
	                                </div>
                                </c:forEach>
                                
                                <button type="submit" id="contact_submit_button" class="btn btn-block btn-danger mt-4"> Atualizar informações </button>
                            </form>
                        </div>
                        <!-- Alterar imagens da página inicial -->
                        <div class="my-5">
                            <h3> Alterar imagens da página inicial </h3>
                            <hr>
                            <c:if test="${formNumber == 6}">
                            	<div class="alert alert-${status}">
                            		${message}
                            	</div>
                            </c:if>
                            <!-- Lista das imagens atuais -->
                            <ul class="list-group mt-0 mb-4">
                                <li class="list-group-item standard-color-blue text-white"> Imagens cadastradas</li>
                                <c:forEach items="${imagesMainPage}" var="eachImage">
                               		<li class="list-group-item d-flex justify-content-between">
	                                    ${eachImage.getImageName()}
	                                    <form method="POST" action="<c:url value='/imageMainPage/${eachImage.getId()}/hide'/>">
	                                    	<button type="submit" class="btn btn-sm btn-danger">
	                                        	Remover
	                                    	</button>
	                                    </form>
	                                </li>
                                </c:forEach>
                                <c:if test="${imagesMainPage.size() == 0}"> 
                                	<li class="list-group-item d-flex justify-content-between">
                                		Nenhuma imagem cadastrada.
                                	</li>
                                </c:if>
                            </ul>
                            
							<!-- Cadastrar nova imagem para a página inicial -->
                            <h5> Cadastrar nova imagem </h5>
                            <hr>
                            <form method="POST" action="<c:url value='/imageMainPage/registerImage'/>" enctype="multipart/form-data">
                                <div class="form-group row">
                                    <label for="main_image_name_input" class="col-3 col-form-label"> Nome* </label>
                                    <div class="col-9">
                                        <input type="text" id="main_image_name_input" name="name" class="form-control" placeholder="Digite um nome para a imagem">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="main_image_input" class="col-form-label col-3"> Imagem* </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" class="custom-file-input" name="image">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <button type="submit" id="main_image_submit_button" class="btn btn-block btn-danger mt-4"> Cadastrar imagem e atualizar informações </button>
                            </form>
                        </div>
                        <!-- Alterar arquivos PDF do estatuto -->
                        <div class="my-5">
                            <h3> Alterar arquivos PDF do estatuto </h3>
                            <hr>
                            <c:if test="${formNumber == 7}">
                            	<div class="alert alert-${status}">
                            		${message}
                            	</div>
                            </c:if>
                            <!-- Lista de arquivos atuais -->
                            <ul class="list-group mt-0 mb-4">
                                <li class="list-group-item standard-color-blue text-white"> Arquivos cadastrados </li>
                                <c:forEach items="${statuteFiles}" var="eachFile">
                               		<li class="list-group-item d-flex justify-content-between">
	                                    ${eachFile.getFileName()}
	                                    <form method="POST" action="<c:url value='/statute/${eachFile.getId()}/hide'/>">
	                                    	<button type="submit" class="btn btn-sm btn-danger">
	                                        	Remover
	                                    	</button>
	                                    </form>
	                                </li>
                                </c:forEach>
                                <c:if test="${statuteFiles.size() == 0}"> 
                                	<li class="list-group-item d-flex justify-content-between">
                                		Nenhum arquivo cadastrado.
                                	</li>
                                </c:if>
                            </ul>
                            
                            <h5> Cadastrar novo arquivo PDF </h5>
                            <hr>
                            <!-- Cadastrar novo arquivo -->
                            <form method="POST" action="<c:url value='/statute/registerFile'/>" enctype="multipart/form-data">
                                <div class="form-group row">
                                    <label for="statute_file_name_input" class="col-3 col-form-label"> Nome* </label>
                                    <div class="col-9">
                                        <input type="text" id="statute_file_name_input" name="name" class="form-control" maxlength="50" placeholder="Digite um nome para o arquivo">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="statute_file_input" class="col-form-label col-3"> Arquivo PDF* </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" class="custom-file-input" name="file">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <button type="submit" id="statute_file_submit_button" class="btn btn-block btn-danger mt-4"> Adicionar arquivo </button>
                            </form>
                        </div>
                        <!-- Alterar arquivos PDF da legislação -->
                        <div class="my-5">
                            <h3> Alterar arquivos PDF da legislação </h3>
                            <hr>
                            <c:if test="${formNumber == 8}">
                            	<div class="alert alert-${status}">
                            		${message}
                            	</div>
                            </c:if>
                            <!-- Lista de arquivos atuais -->
                            <ul class="list-group mt-0 mb-4">
                                <li class="list-group-item standard-color-blue text-white"> Arquivos cadastrados</li>
                                <c:forEach items="${legislationFiles}" var="eachFile">
                               		<li class="list-group-item d-flex justify-content-between">
	                                    ${eachFile.getFileName()}
	                                    <form method="POST" action="<c:url value='/legislation/${eachFile.getId()}/hide'/>">
	                                    	<button type="submit" class="btn btn-sm btn-danger">
	                                        	Remover
	                                    	</button>
	                                    </form>
	                                </li>
                                </c:forEach>
                                <c:if test="${legislationFiles.size() == 0}"> 
                                	<li class="list-group-item d-flex justify-content-between">
                                		Nenhum arquivo cadastrado.
                                	</li>
                                </c:if>
                            </ul>

                            <h5> Cadastrar novo arquivo PDF </h5>
                            <hr>
                            <!-- Cadastrar novo arquivo -->
                            <form method="POST" action="<c:url value='/legislation/registerFile'/>" enctype="multipart/form-data">
                                <div class="form-group row">
                                    <label for="legislation_file_name_input" class="col-3 col-form-label"> Nome* </label>
                                    <div class="col-9">
                                        <input type="text" id="legislation_file_name_input" name="name" class="form-control" maxlength="50" placeholder="Digite um nome para o arquivo">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="legislation_file_input" class="col-form-label col-3"> Arquivo PDF* </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" id="legislation_file_input" class="custom-file-input" name="file">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>
                                <button type="submit" id="legislation_file_submit_button" class="btn btn-block btn-danger mt-4"> Adicionar arquivo </button>
                            </form>
                        </div>
                        <!-- Alterar slogan -->
                        <div class="mt-5">
                            <h3> Alterar slogan da página principal </h3>
                            <hr>
                            <c:if test="${formNumber == 9}">
                            	<div class="alert alert-${status}">
                            		${message}
                            	</div>
                            </c:if>
                            <form method="POST" action="<c:url value='/contact/slogan/update'/>">
                                <div class="form-group row">
                                    <label for="slogan_text_input" class="col-form-label col-3"> Slogan* </label>
                                    <div class="col-9">
                                        <input type="text" id="slogan_text_input" name="slogan" class="form-control" maxlength="55" value="${sloganContact.getUrl()}">
                                    </div>
                                </div>

                                <button type="submit" id="slogan_submit_input" class="btn btn-block btn-danger mt-4"> Alterar slogan </button>
                            </form>
                        </div>
                        
                        <div class="mt-5">
                            <h3> Atualizar logomarca da página </h3>
                            <hr>
                            <c:if test="${formNumber == 10}">
                            	<div class="alert alert-${status}">
                            		${message}
                            	</div>
                            </c:if>
                            <form method="POST" action="<c:url value='/imageMainPage/updateLogo'/>" enctype="multipart/form-data">
                                <div class="form-group row">
                                    <label for="logo_file_input" class="col-form-label col-3"> Logomarca* </label>
                                    <div class="col-9">
                                        <label class="custom-file">
										    <input type="file" id="logo_file_input" name="image" class="custom-file-input" name="file">
										    <span class="custom-file-control" data-content="Selecionar arquivo..."></span>
										</label>
                                    </div>
                                </div>

                                <button type="submit" id="slogan_submit_input" class="btn btn-block btn-danger mt-4"> Alterar logomarca </button>
                            </form>
                        </div>
                    </div>
                    <div class="col-6">
                        <!-- Lista de usuários -->
                        <div class="my-5">
                            <h3> Lista de usuários </h3>
                            <hr>
                            <a class="btn btn-block standard-color-blue text-white my-1" href="#admin_collapse" data-toggle="collapse" aria-expanded="false" aria-controls="admin_collapse">
                                Administradores
                            </a>
                            <div class="collapse" id="admin_collapse">
                                <ul class="list-group">
                                	<c:forEach items="${users}" var="eachUser">
                                		<c:if test="${eachUser.getAccess() >= adminAccessLevel}"> 
                                			<a href="<c:url value='/user/${eachUser.getId()}/view'/>" class="list-group-item list-group-item-action d-flex justify-content-between">
                                				${eachUser.getName()}
                                				<span class="badge badge-danger">${eachUser.getIsLegalPerson() ? "Pessoa Jurídica" : "Pessoa Física"}</span>
                                			</a>
                                		</c:if>
                                	</c:forEach>
                                </ul>
                            </div>
                            <a class="btn btn-block standard-color-blue text-white my-1" href="#user_collapse" data-toggle="collapse" aria-expanded="false" aria-controls="user_collapse">
                                Usuários ativos 
                                
                            </a>
                            <div class="collapse" id="user_collapse">
                                <ul class="list-group">
                                	<c:forEach items="${users}" var="eachUser">
                                		<c:if test="${eachUser.getActive()}"> 
                                			<a href="<c:url value='/user/${eachUser.getId()}/view'/>" class="list-group-item list-group-item-action d-flex justify-content-between">
                                				${eachUser.getName()}
                                				<span class="badge badge-danger">${eachUser.getIsLegalPerson() ? "Pessoa Jurídica" : "Pessoa Física"}</span>
                                			</a>
                                		</c:if>
                                	</c:forEach>
                                </ul>
                            </div>
                            <a class="btn btn-block standard-color-blue text-white my-1" href="#disabled_user_collapse" data-toggle="collapse" aria-expanded="false" aria-controls="disabled_user_collapse">
                                Usuários desativados
                            </a>
                            <div class="collapse" id="disabled_user_collapse">
                                <ul class="list-group">
                                    <c:forEach items="${users}" var="eachUser">
                                		<c:if test="${not eachUser.getActive()}"> 
                                			<a href="<c:url value='/user/${eachUser.getId()}/view'/>" class="list-group-item list-group-item-action d-flex justify-content-between">
                                				${eachUser.getName()}
                                				<span class="badge badge-danger">${eachUser.getIsLegalPerson() ? "Pessoa Jurídica" : "Pessoa Física"}</span>
                                			</a>
                                		</c:if>
                                	</c:forEach>
                                </ul>
                            </div>
                        </div>
                        <!-- Lista de animais para adoção -->
                        <div class="my-5">
                            <h3> Lista de animais cadastrados </h3>
                            <hr>
                            <a class="btn btn-block standard-color-blue text-white my-1" href="#animals_to_be_adopted_collapse" data-toggle="collapse" aria-expanded="false" aria-controls="animals_to_be_adopted_collapse">
                                Animais para adoção
                            </a>
                            <div class="collapse" id="animals_to_be_adopted_collapse">
                                <ul class="list-group">
                                	<c:forEach items="${animals}" var="eachAnimal">
                                		<c:if test="${not eachAnimal.getAdopted() and not eachAnimal.getHidden()}">
                                			<a href="<c:url value='/animal/${eachAnimal.getId()}/view'/>" class="list-group-item list-group-item-action d-flex justify-content-between">
                               					${eachAnimal.getTitle()}                       			
                               				</a>
                                		</c:if>
                                	</c:forEach>
                                </ul>
                            </div>
                            <a class="btn btn-block standard-color-blue text-white my-1" href="#adopted_animals_collapse" data-toggle="collapse" aria-expanded="false" aria-controls="adopted_animals_collapse">
                                Animais adotados
                            </a>
                            <div class="collapse" id="adopted_animals_collapse">
                                <ul class="list-group">
                                    <c:forEach items="${animals}" var="eachAnimal">
                               			<c:if test="${eachAnimal.getAdopted()}">
                                			<a href="<c:url value='/animal/${eachAnimal.getId()}/view'/>" class="list-group-item list-group-item-action d-flex justify-content-between">
                               					${eachAnimal.getTitle()}                       			
                               				</a>
                                		</c:if>
                                	</c:forEach>
                                </ul>
                            </div>
                            <a class="btn btn-block standard-color-blue text-white my-1" href="#hidden_animals_collapse" data-toggle="collapse" aria-expanded="false" aria-controls="hidden_animals_collapse">
                                Animais ocultados
                            </a>
                            <div class="collapse" id="hidden_animals_collapse">
                                <ul class="list-group">
                                	<c:forEach items="${animals}" var="eachAnimal">
                               			<c:if test="${eachAnimal.getHidden()}">
                                			<a href="<c:url value='/animal/${eachAnimal.getId()}/view'/>" class="list-group-item list-group-item-action d-flex justify-content-between">
                               					${eachAnimal.getTitle()}                       			
                               				</a>
                                		</c:if>
                                	</c:forEach>
                                </ul>
                            </div>
                        </div>
                        <!-- Lista de notícias cadastradas -->
                        <div class="my-5">
                            <h3> Lista de notícias cadastradas </h3>
                            <hr>
                            <a class="btn btn-block standard-color-blue text-white my-1" href="#news_collapse" data-toggle="collapse" aria-expanded="false" aria-controls="news_collapse">
                                Notícias visíveis
                            </a>
                            <div class="collapse" id="news_collapse">
                                <ul class="list-group">
                                	<c:forEach items="${news}" var="eachNews">
                               			<c:if test="${!eachNews.getHidden()}">
                                			<a href="<c:url value='/news/${eachNews.getId()}/view'/>" class="list-group-item list-group-item-action d-flex justify-content-between">
                               					${eachNews.getTitle()}  <small> ${eachNews.getRegisterDate()} </small>                    			
                               				</a>
                                		</c:if>
                                	</c:forEach>
                                </ul>
                            </div>
                            <a class="btn btn-block standard-color-blue text-white my-1" href="#hidden_news_collapse" data-toggle="collapse" aria-expanded="false" aria-controls="hidden_news_collapse">
                                Notícias ocultadas
                            </a>
                            <div class="collapse" id="hidden_news_collapse">
                                <ul class="list-group">
                                	<c:forEach items="${news}" var="eachNews">
                               			<c:if test="${eachNews.getHidden()}">
                                			<a href="<c:url value='/news/${eachNews.getId()}/view'/>" class="list-group-item list-group-item-action d-flex justify-content-between">
                               					${eachNews.getTitle()}  <small> ${eachNews.getRegisterDate()} </small>                    			
                               				</a>
                                		</c:if>
                                	</c:forEach>
                                </ul>
                            </div>
                        </div>
                        <!-- Lista de prestações de contas -->
                        <div class="mt-5">
                            <h3> Lista de prestações de contas </h3>
                            <hr>
                            <a class="btn btn-block standard-color-blue text-white my-1" href="#accountability_collapse" data-toggle="collapse" aria-expanded="false" aria-controls="accountability_collapse">
                                Prestações de contas visíveis
                            </a>
                            <div class="collapse" id="accountability_collapse">
                                <ul class="list-group">
                                	<c:forEach items="${reports}" var="eachReport">
                               			<c:if test="${not eachReport.getHidden()}">
                                			<a href="<c:url value='/report/${eachReport.getId()}/view'/>" class="list-group-item list-group-item-action d-flex justify-content-between">
                               					${eachReport.getTitle()}  <small> ${eachReport.getRegisterDate()} </small>                    			
                               				</a>
                                		</c:if>
                                	</c:forEach>
                                </ul>
                            </div>
                            <a class="btn btn-block standard-color-blue text-white my-1" href="#hidden_accountability_collapse" data-toggle="collapse" aria-expanded="false" aria-controls="hidden_accountability_collapse">
                                Prestações de contas ocultas
                            </a>
                            <div class="collapse" id="hidden_accountability_collapse">
                                <ul class="list-group">
                                    <c:forEach items="${reports}" var="eachReport">
                               			<c:if test="${eachReport.getHidden()}">
                                			<a href="<c:url value='/report/${eachReport.getId()}/view'/>" class="list-group-item list-group-item-action d-flex justify-content-between">
                               					${eachReport.getTitle()}  <small> ${eachReport.getRegisterDate()} </small>                    			
                               				</a>
                                		</c:if>
                                	</c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
<c:import url="/includes/footers.jsp"/>