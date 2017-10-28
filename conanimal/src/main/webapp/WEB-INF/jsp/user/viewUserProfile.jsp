<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/headers.jsp"/>

	<div class="container my-5">
	    <div class="jumbotron jumbotron-fluid pt-4">
	        <div class="container-fluid w-100">
	            <h1 class="display-4 px-4 mt-0"> Visualizar informações de um usuário </h1>
	            <hr>
				<div class="row px-4">
                	<div class="col-6">
						<form class="w-100 px-4 py-3">
                            <div class="form-group">
                                <label for="name_input" class="form-control-label">${currentUser.getIsLegalPerson() ? "Nome da empresa" : "Nome"}</label>
                                <input type="text" id="name_input" name="name" class="form-control" value="${currentUser.getName()}" disabled>
                            </div>
                            <c:if test="${currentUser.getIsLegalPerson()}"> 
                            <div class="form-group">
                                <label for="company_name_input" class="form-control-label"> Razão social </label>
								<input type="text" id="company_name_input" name="company_name" class="form-control" value="${currentUser.getCompanyName()}" disabled>
                            </div>
                            </c:if>
                            <div class="form-group">
                                <label for="email_input" class="form-control-label"> Email </label>
                                <input type="email" id="email_input" name="email" class="form-control" value="${currentUser.getEmail()}" disabled>
                            </div>
                            <c:if test="${not currentUser.getIsLegalPerson()}"> 
                             <div class="form-group">
                                 <label for="profession_input" class="form-control-label"> Profissão </label>
                                 <input type="text" id="profession_input" name="profession" class="form-control" value="${currentUser.getProfession()}" disabled>
                             </div>
                            </c:if>
                            <c:if test="${currentUser.getIsLegalPerson()}"> 
                             <div class="form-group">
                                 <label for="representative_name_input" class="form-control-label"> Nome do representante </label>
                                 <input type="text" id="representative_name_input" name="representative_name" class="form-control" value="${currentUser.getRepresentativeName()}" disabled>
                             </div>
                            </c:if>
                            <c:if test="${currentUser.getIsLegalPerson()}"> 
	                            <div class="form-group">
	                                <label for="cnpj_input" class="form-control-label"> CNPJ </label>
	                                <input type="text" id="cnpj_input" name="cnpj" class="form-control" value="${currentUser.getCnpj()}">
	                                <div class="form-control-feedback"></div>
	                            </div>
                            </c:if>
                            <div class="form-group">
                                <label for="rg_input" class="form-control-label"> ${currentUser.getIsLegalPerson() ? "RG do representante" : "RG"} </label>
                                <input type="text" id="rg_input" name="rg" class="form-control" value="${currentUser.getRg()}" disabled>
                            </div>
                            <div class="form-group">
                                <label for="cpf_input" class="form-control-label"> ${currentUser.getIsLegalPerson() ? "CPF do representante" : "CPF"} </label>
                                <input type="text" id="cpf_input" name="cpf" class="form-control" value="${currentUser.getCpf()}" disabled>
                            </div>
                            <div class="form-group">
                                <label for="phone_input" class="form-control-label"> Data de cadastro </label>
                                <input type="text" id="register_date_input" name="register_date" class="form-control" value="${currentUser.getRegisterDate()}" disabled>
                            </div>
                            <div class="form-group">
                                <label for="phone_input" class="form-control-label"> Telefone </label>
                                <input type="tel" id="phone_input" name="phone" class="form-control" value="${currentUser.getPhone()}" disabled>
                            </div>
                            <div class="form-group">
                                <label for="cell_phone_input" class="form-control-label"> Celular </label>
                                <input type="tel" id="cell_phone_input" name="cell_phone" class="form-control" value="${currentUser.getCellPhone()}" disabled>
                            </div>
                            <div class="form-group">
                                <label for="city_input" class="form-control-label"> Município </label>
                                <input type="text" id="city_input" name="city" class="form-control" value="${currentUser.getCity()}" disabled>
                            </div>
                            <div class="form-group">
                                <label for="uf_input" class="form-control-label"> UF </label>
                                <input type="text" id="uf_input" name="uf" class="form-control" value="${currentUser.getUf()}" maxlength="2" disabled>
                            </div>
                            <div class="form-group">
                                <label for="neighborhood_input" class="form-control-label"> Bairro </label>
                                <input type="text" id="neighborhood_input" name="neighborhood" class="form-control" value="${currentUser.getNeighborhood()}" disabled>
                            </div>
                            <div class="form-group">
                                <label for="street_input" class="form-control-label"> Rua </label>
                                <input type="text" id="street_input" name="street" class="form-control" value="${currentUser.getStreet()}" disabled>
                            </div>
                            <div class="form-group">
                                <label for="complement_input" class="form-control-label"> Complemento </label>
                                <input type="text" id="complement_input" name="complement" class="form-control" value="${currentUser.getComplement()}" disabled>
                            </div>
                            <div class="form-group">
	                            <label for="payment_input" class="form-control-label"> Quanto contribuirá mensalmente? </label>
	                            <div class="input-group">
	                                <span class="input-group-addon">R$</span>
	                                <input type="number" min="0" id="payment_input" name="payment" class="form-control" value="${currentUser.getPayment()}">
	                                <span class="input-group-addon">,00</span>
	                            </div>
	                        </div>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input type="checkbox" id="name_publishing_checkbox" name="name_publishing" class="form-check-input" ${currentUser.getNamePublishing() ? 'checked' : ''}  disabled>
                                    Autorizo a divulgação do meu nome no quadro associativo.
                                </label>
                            </div>
				
							<div class="form-check">
                                <label class="form-check-label">
                                    <input type="checkbox" id="is_admin_checkbox" name="is_admin" class="form-check-input" ${currentUser.getAccess() >= adminAccessLevel ? 'checked' : ''} disabled>
                                    É administrador?
                                </label>
                            </div>
						</form>
                    </div>
					<div class="col-6">
						<c:if test="${status != null && message != null}">
							<div class="alert alert-${status}">
								${message}
							</div>
						</c:if>
	                    <form class="w-100 px-4 py-3">
	                        <button type="button" id="access_level_modal_button" data-toggle="modal" data-target="#access_level_modal" class="btn btn-block btn-danger" ${currentUser.getAccess() == systemAdminAccessLevel ? 'disabled' : ''}>
			        			${currentUser.getAccess() >= adminAccessLevel ? 'Rebaixar nível de acesso' : 'Promover usuário a administrador'}  
			        		</button>
	                        <button type="button" id="status_modal_button" data-toggle="modal" data-target="#status_modal" class="btn btn-block btn-danger" ${currentUser.getAccess() == systemAdminAccessLevel ? 'disabled' : ''}>
			        			${currentUser.getActive() ? 'Desativar' : 'Ativar'} conta 
			        		</button>
	                    </form>
	                </div>
				</div>
			</div>
		</div>
	</div>
	
	<c:if test="${currentUser.getAccess() != systemAdminAccessLevel}">
		<div id="access_level_modal" class="modal fade">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
			      	<div class="modal-header">
			        	<h5 class="modal-title">${currentUser.getAccess() >= adminAccessLevel ? 'Rebaixar nível de acesso' : 'Promover usuário a administrador'} </h5>
			        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			         		<span aria-hidden="true">&times;</span>
			        	</button>
			      	</div>
			      	<form method="POST" action="<c:url value='/user/${currentUser.getId()}/toggleAccess'/>">
				      	<div class="modal-body">
				        	<p class="px-2">Tem certeza que deseja modificar o nível de acesso do usuário <strong>'${currentUser.getName()}'</strong>?</p>
				        	<hr>
	                              <div class="form-group px-2">
	                              	<input type="password" id="promotion_password_input" name="password" class="form-control" placeholder="Digite sua senha">
	                              </div>
				      	</div>
				      	<div class="modal-footer">
				        	<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
				        	<button type="submit" id="deactivation_submit_button" class="btn btn-danger"> ${currentUser.getAccess() >= adminAccessLevel ? 'Rebaixar usuário' : 'Promover usuário'} </button>
				    	</div>
			    	</form>
			    </div>
			</div>
		</div>
		
		<div id="status_modal" class="modal fade">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
			      	<div class="modal-header">
			        	<h5 class="modal-title">${currentUser.getActive() ? 'Desativar' : 'Ativar'} esta conta</h5>
			        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			         		<span aria-hidden="true">&times;</span>
			        	</button>
			      	</div>
			      	<form method="POST" action="<c:url value='/user/${currentUser.getId()}/toggleStatus'/>">
				      	<div class="modal-body">
				        	<p class="px-2">Tem certeza que deseja ${currentUser.getActive() ? 'desativar' : 'ativar'} a conta do usuário <strong>'${currentUser.getName()}'</strong>?</p>
				        	<hr>
	                              <div class="form-group px-2">
	                              	<input type="password" id="deactivation_password_input" name="password" class="form-control" placeholder="Digite sua senha">
	                              </div>
				      	</div>
				      	<div class="modal-footer">
				        	<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
				        	<button type="submit" id="deactivation_submit_button" class="btn btn-danger"> ${currentUser.getActive() ? 'Desativar' : 'Ativar'} conta </button>
				    	</div>
			    	</form>
			    </div>
			</div>
		</div>
	</c:if>
		
<c:import url="/includes/footers.jsp"/>