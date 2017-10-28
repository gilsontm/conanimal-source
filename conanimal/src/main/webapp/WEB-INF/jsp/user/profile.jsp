<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/headers.jsp"/>

<div class="container w-75 my-5">
	<div class="jumbotron jumbotron-fluid pt-4">
        <div class="container-fluid w-100">
            <h1 class="display-4 px-4 mt-0"> Painel de Usuário </h1>
            <hr>
            <div class="row px-4">
                <!-- Formulário para atualização de informações -->
                <div class="col-6">
                    <div class="mt-5">
                        <h3> Alterar informações gerais </h3>
                        <hr>
                        <c:if test="${formNumber == 1}">
                        	<div class="alert alert-${status}">
                        		${message}
                        	</div>
                        </c:if>
                        <form method="POST" action="<c:url value='/user/profile'/>" class="w-100 px-4 py-3">
                            <div class="form-group row">
                                <label for="name_input" class="col-3 col-form-label">${user.getIsLegalPerson() ? "Nome da empresa" : "Nome"}</label>
                                <div class="col-9">
                                    <input type="text" id="name_input" name="user_name" class="form-control" value="${user.getName()}">
                                </div>
                            </div>
                            <c:if test="${user.getIsLegalPerson()}"> 
                             <div class="form-group row">
                                 <label for="company_name_input" class="col-3 col-form-label"> Razão social </label>
                                 <div class="col-9">
                                     <input type="text" id="company_name_input" name="company_name" class="form-control" value="${user.getCompanyName()}">
                                 </div>
                             </div>
                            </c:if>
                            <div class="form-group row">
                                <label for="email_input" class="col-3 col-form-label"> Email </label>
                                <div class="col-9">
                                    <input type="email" id="email_input" name="email" class="form-control" value="${user.getEmail()}" disabled>
                                </div>
                            </div>
                            <c:if test="${not user.getIsLegalPerson()}"> 
                             <div class="form-group row">
                                 <label for="profession_input" class="col-3 col-form-label"> Profissão </label>
                                 <div class="col-9">
                                     <input type="text" id="profession_input" name="profession" class="form-control" value="${user.getProfession()}">
                                 </div>
                             </div>
                            </c:if>
                            <c:if test="${user.getIsLegalPerson()}"> 
                             <div class="form-group row">
                                 <label for="representative_name_input" class="col-3 col-form-label"> Nome do representante </label>
                                 <div class="col-9">
                                     <input type="text" id="representative_name_input" name="representative_name" class="form-control" value="${user.getRepresentativeName()}">
                                 </div>
                             </div>
                            </c:if>
                            <div class="form-group row">
                                <label for="rg_input" class="col-3 col-form-label"> ${user.getIsLegalPerson() ? "RG do representante" : "RG"} </label>
                                <div class="col-9">
                                    <input type="tel" id="rg_input" name="rg" class="form-control" value="${user.getRg()}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="cpf_input" class="col-3 col-form-label"> ${user.getIsLegalPerson() ? "CPF do representante" : "CPF"} </label>
                                <div class="col-9">
                                    <input type="tel" id="cpf_input" name="cpf" class="form-control" value="${user.getCpf()}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="phone_input" class="col-3 col-form-label"> Telefone </label>
                                <div class="col-9">
                                    <input type="tel" id="phone_input" name="phone" class="form-control" value="${user.getPhone()}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="cell_phone_input" class="col-3 col-form-label"> Celular </label>
                                <div class="col-9">
                                    <input type="tel" id="cell_phone_input" name="cell_phone" class="form-control" value="${user.getCellPhone()}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="city_input" class="col-3 col-form-label"> Município </label>
                                <div class="col-9">
                                    <input type="text" id="city_input" name="city" class="form-control" value="${user.getCity()}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="uf_input" class="col-3 col-form-label"> UF </label>
                                <div class="col-9">
                                    <input type="text" id="uf_input" name="uf" class="form-control" value="${user.getUf()}" maxlength="2">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="neighborhood_input" class="col-3 col-form-label"> Bairro </label>
                                <div class="col-9">
                                    <input type="text" id="neighborhood_input" name="neighborhood" class="form-control" value="${user.getNeighborhood()}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="street_input" class="col-3 col-form-label"> Rua </label>
                                <div class="col-9">
                                    <input type="text" id="street_input" name="street" class="form-control" value="${user.getStreet()}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="complement_input" class="col-3 col-form-label"> Complemento </label>
                                <div class="col-9">
                                    <input type="text" id="complement_input" name="complement" class="form-control" value="${user.getComplement()}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="payment_input" class="col-7 col-form-label"> Quanto contribuirá mensalmente? </label>
                                <div class="input-group col-5">
                                    <span class="input-group-addon">R$</span>
                                    <input type="number" min="0" id="payment_input" name="payment" class="form-control" value="${user.getPayment()}">
                                    <span class="input-group-addon">,00</span>
                                </div>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input type="checkbox" id="name_publishing_checkbox" name="name_publishing" class="form-check-input" ${user.getNamePublishing() ? 'checked' : ''}>
                                    Autorizo a divulgação do meu nome no quadro associativo.
                                </label>
                            </div>
				
							<hr>
							
							<div class="form-group row">
                                   <label for="password_input" class="col-3 col-form-label"> Senha </label>
                                   <div class="col-9">
                                       <input type="password" id="password_input" name="password" class="form-control" placeholder="Digite sua senha.">
                                   </div>
                               </div>
							
                               <button type="submit" id="submit_button" class="btn btn-block btn-danger mt-4"> Atualizar informações </button>
                           </form>
                       </div>
                   </div>
                   <!-- Formulário para alteração de senha -->
                   <div class="col-6">
                       <div class="my-5">
                           <h3> Alterar senha </h3>
                           <hr>
                           <c:if test="${formNumber == 2}">
                           	<div class="alert alert-${status}">
                           		${message}
                           	</div>
                           </c:if>
                           <form method="POST" action="<c:url value='/user/changePassword'/>" class="w-100 px-4 py-3">
                               <div class="form-group row">
                                   <label for="old_password_input" class="col-form-label col-3"> Senha atual </label>
                                   <div class="col-9">
                                       <input type="password" id="old_password_input" name="password" class="form-control" placeholder="Digite a senha atual">
                                   </div>
                               </div>
                               <div class="form-group row">
                                   <label for="new_password_input" class="col-form-label col-3"> Nova senha </label>
                                   <div class="col-9">
                                       <input type="password" id="new_password_input" name="new_password" class="form-control" placeholder="Digite a nova senha">
                                   </div>
                               </div>
                               <div class="form-group row">
                                   <label for="confirm_new_password_input" class="col-form-label col-3"> Confirmação </label>
                                   <div class="col-9">
                                       <input type="password" id="confirm_new_password_input" name="confirm_new_password" class="form-control" placeholder="Digite a senha novamente">
                                   </div>
                               </div>

                               <button type="submit" id="password_submit_button" class="btn btn-block btn-danger mt-4 w-100"> Alterar senha </button>
                           </form>
                       </div>

                       <div class="mt-5">
                           <h3> Desativar minha conta </h3>
                           <hr>
						<c:if test="${formNumber == 3}">
							<div class="alert alert-${status}">
								${message}
							</div>
						</c:if>
						<div class="px-4 px-3 w-100">
							<button type="button" id="deactivation_modal_button" data-toggle="modal" data-target="#deactivation_modal" 
							class="btn btn-block btn-danger w-100" ${user.getAccess() == systemAdminAccessLevel ? 'disabled' : ''}>
								Desativar conta 
							</button>
						</div>
					</div>					
                </div>
            </div>
        </div>
    </div>
</div>
   
<c:if test="${user.getAccess() != systemAdminAccessLevel}">
    <div id="deactivation_modal" class="modal fade">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
		      	<div class="modal-header">
		        	<h5 class="modal-title">Desativar minha conta </h5>
		        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		         		<span aria-hidden="true">&times;</span>
		        	</button>
		      	</div>
		      	<form method="POST" action="<c:url value='/user/deactivateAccount'/>">
			      	<div class="modal-body">
			        	<p class="px-2"><strong>Atenção:</strong> ao desativar sua conta, você não poderá mais acessá-la.</p>
			        	<hr>
                              <div class="form-group px-2">
                              	<input type="password" id="deactivation_password_input" name="password" class="form-control" placeholder="Digite sua senha">
                              </div>
			      	</div>
			      	<div class="modal-footer">
			        	<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
			        	<button type="submit" id="deactivation_submit_button" class="btn btn-danger"> Desativar conta </button>
			    	</div>
		    	</form>
		    </div>
		</div>
	</div>
</c:if>

<c:import url="/includes/footers.jsp"/>