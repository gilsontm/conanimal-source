<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/headers.jsp"/>

<div class="container-fluid my-5">
	    <!-- Menu pessoa física/jurídica -->
    <c:if test="${not empty errorMessage}">
		<div class="row">
	     	<div class="col-6 offset-3">
	     		<div class="alert alert-danger w-100 text-center">
					${errorMessage}
				</div>
	     	</div>
	    </div>
	</c:if>
    <div class="row">
        <ul class="nav nav-tabs col-4 offset-4" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#person_tab" role="tab">Pessoa Física</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#company_tab" role="tab">Pessoa Jurídica</a>
            </li>
        </ul>
    </div>

    <!-- Formulários -->
    <div class="row">
        <div class="card standard-color-blue mt-0 mb-5 py-2 rounded col-4 offset-4">
            <div class="tab-content">
            
                <!-- Formulário de pessoa física -->
                <div class="tab-pane fade show active" id="person_tab">
                
                    <form name="p_register_form" method="POST" action="<c:url value='/register'/>" class="w-100 px-5 py-3">
                    	<input type="hidden" name="form_type" value="private_person">
                    	<input type="hidden" name="company_name" value="">
                    	<input type="hidden" name="cnpj" value="">
                    	<input type="hidden" name="representative_name" value="">
                        <div class="form-group">
                            <label for="p_name_input" class="form-control-label text-white"> Nome </label>
                            <input type="text" id="p_name_input" name="user_name" class="form-control" placeholder="Nome completo">
                            <div class="form-control-feedback"></div>
                        </div>
                        <div class="form-group">
                            <label for="p_email_input" class="form-control-label text-white"> Email </label>
                            <input type="email" id="p_email_input" name="email" class="form-control" placeholder="Endereço de email">
                            <div class="form-control-feedback"></div>
                        </div>
                        <div class="form-group">
                            <label for="p_password_input" class="form-control-label text-white"> Senha </label>
                            <input type="password" id="p_password_input" name="password" class="form-control" placeholder="Senha" aria-describedby="p_password_description">
                            <div class="form-control-feedback"></div>
                            <small id="p_password_description" class="form-text text-white"> Digite apenas números e letras (mínimo: 8 caracteres) </small>
                        </div>
                        <div class="form-group">
                            <label for="p_confirm_password_input" class="form-control-label text-white"> Confirmação de senha </label>
                            <input type="password" id="p_confirm_password_input" name="confirm_password" class="form-control" placeholder="Digite a senha novamente">
                        	<div class="form-control-feedback"></div>
                        </div>
                        <div class="form-group">
                            <label for="p_profession_input" class="form-control-label text-white"> Profissão </label>
                            <input type="text" id="p_profession_input" name="profession" class="form-control" placeholder="Profissão atual">
                        </div>
                        <div class="form-group">
                            <label for="p_rg_input" class="form-control-label text-white"> RG </label>
                            <input type="tel" id="p_rg_input" name="rg" class="form-control" placeholder="Registro geral" aria-describedby="p_rg_description">
                            <div class="form-control-feedback"></div>
                            <small id="p_rg_description" class="form-text text-white"> Digite apenas números</small>
                        </div>
                        <div class="form-group">
                            <label for="p_cpf_input" class="form-control-label text-white"> CPF </label>
                            <input type="tel" id="p_cpf_input" name="cpf" class="form-control" placeholder="Cadastro de pessoa física" aria-describedby="p_cpf_description">
                            <div class="form-control-feedback"></div>
                            <small id="p_cpf_description" class="form-text text-white"> Digite apenas números</small>
                        </div>
                        <div class="form-group">
                            <label for="p_phone_input" class="form-control-label text-white"> Telefone </label>
                            <input type="tel" id="p_phone_input" name="phone" class="form-control" placeholder="DDD e Telefone" aria-describedby="p_phone_description">
                            <div class="form-control-feedback"></div>
                            <small id="p_phone_description" class="form-text text-white">Digite apenas números e acrescente o DDD</small>
                        </div>
                        <div class="form-group">
                            <label for="p_cell_phone_input" class="form-control-label text-white"> Telefone celular </label>
                            <input type="tel" id="p_cell_phone_input" name="cell_phone" class="form-control" placeholder="DDD e Celular" aria-describedby="p_cell_phone_description">
                            <div class="form-control-feedback"></div>
                            <small id="p_cell_phone_description" class="form-text text-white">Digite apenas números e acrescente o DDD</small>
                        </div>
                        <div class="form-group">
                            <label for="p_city_input" class="form-control-label text-white"> Município </label>
                            <input type="text" id="p_city_input" name="city" class="form-control" placeholder="Município">
                        	<div class="form-control-feedback"></div>
                        </div>
                        <div class="form-group">
                            <label for="p_uf_input" class="form-control-label text-white"> UF </label>
                            <input type="text" id="p_uf_input" name="uf" class="form-control" placeholder="UF" maxlength="2">
                        	<div class="form-control-feedback"></div>
                        </div>
                        <div class="form-group">
                            <label for="p_neighborhood_input" class="form-control-label text-white"> Bairro </label>
                            <input type="text" id="p_neighborhood_input" name="neighborhood" class="form-control" placeholder="Nome do bairro">
                        	<div class="form-control-feedback"></div>
                        </div>
                        <div class="form-group">
                            <label for="p_street_input" class="form-control-label text-white"> Rua </label>
                            <input type="text" id="p_street_input" name="street" class="form-control" placeholder="Nome da rua">
                        	<div class="form-control-feedback"></div>
                        </div>
                        <div class="form-group">
                            <label for="p_complement_input" class="form-control-label text-white"> Complemento </label>
                            <input type="text" id="p_complement_input" name="complement" class="form-control" placeholder="Nº da residência, etc.">
                        	<div class="form-control-feedback"></div>
                        </div>
                        <div class="form-group">
                            <label for="p_payment_input" class="form-control-label text-white"> Quanto contribuirá mensalmente? </label>
                            <div class="input-group">
                                <span class="input-group-addon">R$</span>
                                <input type="number" id="p_payment_input" name="payment" class="form-control" placeholder="Contribuição mensal">
                                <span class="input-group-addon">,00</span>
                            </div>
                        	<div class="form-control-feedback"></div>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label text-white">
                                <input type="checkbox" id="p_name_publishing_checkbox" name="name_publishing" class="form-check-input"  checked="true">
                                Autorizo a divulgação do meu nome no quadro associativo.
							</label>
							<div class="form-control-feedback"></div>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label text-white">
                                <input type="checkbox" id="p_agree_with_terms_checkbox" name="agree_with_terms" class="form-check-input" checked="true">
                                Conheço e concordo com o <a href="#" class="text-white">estatuto</a>
                                e com as <a href="#" class="text-white">legislações</a> da Con Animal.
                            </label>
                            <div class="form-control-feedback"></div>
                        </div>
			
						<div id="p_alert_box"></div>
			
                        <button type="submit" id="p_submit_button" class="btn btn-block btn-danger mt-4"> Cadastrar </button>
                    </form>
                </div>
                
                <!-- Formulário de pessoa jurídica -->
                <div class="tab-pane fade" id="company_tab">
                    <form name="c_register_form" method="POST" action="<c:url value='/register'/>" class="w-100 px-5 py-3">
                    	<input type="hidden" name="form_type" value="legal_person">
                    	<input type="hidden" name="profession" value="">
                        <div class="form-group">
                            <label for="c_name_input" class="form-control-label text-white"> Nome da empresa/organização</label>
                            <input type="text" id="c_name_input" name="user_name" class="form-control" placeholder="Nome fantasia">
                        </div>
                        <div class="form-group">
                            <label for="c_name_input" class="form-control-label text-white"> Razão social </label>
                            <input type="text" id="c_company_name_input" name="company_name" class="form-control" placeholder="Razão social">
                        </div>
                        <div class="form-group">
                            <label for="c_cnpj_input" class="form-control-label text-white"> CNPJ </label>
                            <input type="tel" id="c_cnpj_input" name="cnpj" class="form-control" placeholder="Cadastro nacional de pessoa jurídica" aria-describedby="c_cnpj_description">
                            <small id="c_cnpj_description" class="form-text text-white"> Digite apenas números </small>
                        </div>
                        <div class="form-group">
                            <label for="c_email_input" class="form-control-label text-white"> Email </label>
                            <input type="email" id="c_email_input" name="email" class="form-control" placeholder="Endereço de email">
                        </div>
                        <div class="form-group">
                            <label for="c_password_input" class="form-control-label text-white"> Senha </label>
                            <input type="password" id="c_password_input" name="password" class="form-control" placeholder="Senha" aria-describedby="c_password_description">
                            <small id="c_password_description" class="form-text text-white"> Digite apenas números e letras (mínimo: 8 caracteres) </small>
                        </div>
                        <div class="form-group">
                            <label for="c_confirm_password_input" class="form-control-label text-white"> Confirmação de senha </label>
                            <input type="password" id="c_confirm_password_input" name="confirm_password" class="form-control" placeholder="Digite a senha novamente">
                        </div>
                        <div class="form-group">
                            <label for="c_representative_name_input" class="form-control-label text-white"> Representante legal </label>
                            <input type="text" id="c_representative_name_input" name="representative_name" class="form-control" placeholder="Nome do representante legal">
                        </div>
                        <div class="form-group">
                            <label for="c_rg_input" class="form-control-label text-white"> RG do representante legal</label>
                            <input type="tel" id="c_rg_input" name="rg" class="form-control" placeholder="Registro geral" aria-describedby="c_rg_description">
                            <small id="c_rg_description" class="form-text text-white"> Digite apenas números </small>
                        </div>
                        <div class="form-group">
                            <label for="c_cpf_input" class="form-control-label text-white"> CPF do representante legal </label>
                            <input type="tel" id="c_cpf_input" name="cpf" class="form-control" placeholder="Cadastro de pessoa física" aria-describedby="c_cpf_description">
                            <small id="c_cpf_description" class="form-text text-white"> Digite apenas números </small>
                        </div>
                        <div class="form-group">
                            <label for="c_phone_input" class="form-control-label text-white"> Telefone </label>
                            <input type="tel" id="c_phone_input" name="phone" class="form-control" placeholder="DDD e Telefone" aria-describedby="c_phone_description">
                            <small id="c_phone_description" class="form-text text-white"> Digite apenas números e acrescente o DDD </small>
                        </div>
                        <div class="form-group">
                            <label for="c_cell_phone_input" class="form-control-label text-white"> Telefone celular </label>
                            <input type="tel" id="c_cell_phone_input" name="cell_phone" class="form-control" placeholder="DDD e Celular" aria-describedby="c_cell_phone_description">
                            <small id="c_cell_phone_description" class="form-text text-white"> Digite apenas números e acrescente o DDD </small>
                        </div>
                        <div class="form-group">
                            <label for="c_city_input" class="form-control-label text-white"> Município </label>
                            <input type="text" id="c_city_input" name="city" class="form-control" placeholder="Município">
                        </div>
                        <div class="form-group">
                            <label for="c_uf_input" class="form-control-label text-white"> UF </label>
                            <input type="text" id="c_uf_input" name="uf" class="form-control" placeholder="UF" maxlength="2">
                        </div>
                        <div class="form-group">
                            <label for="c_neighborhood_input" class="form-control-label text-white"> Bairro </label>
                            <input type="text" id="c_neighborhood_input" name="neighborhood" class="form-control" placeholder="Nome do bairro">
                        </div>
                        <div class="form-group">
                            <label for="c_street_input" class="form-control-label text-white"> Rua </label>
                            <input type="text" id="c_street_input" name="street" class="form-control" placeholder="Nome da rua">
                        </div>
                        <div class="form-group">
                            <label for="c_complement_input" class="form-control-label text-white"> Complemento </label>
                            <input type="text" id="c_complement_input" name="complement" class="form-control" placeholder="Nº da residência, etc.">
                        </div>
                        <div class="form-group">
                            <label for="c_payment_input" class="form-control-label text-white"> Quanto contribuirá mensalmente? </label>
                            <div class="input-group">
                                <span class="input-group-addon">R$</span>
                                <input type="number" id="c_payment_input" name="payment" class="form-control" placeholder="Contribuição mensal">
                                <span class="input-group-addon">,00</span>
                            </div>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label text-white">
                                <input type="checkbox" id="c_name_publishing_checkbox" name="name_publishing" class="form-check-input"  checked="true">
                                Autorizo a divulgação do meu nome no quadro associativo.
                            </label>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label text-white">
                                <input type="checkbox"  id="c_agree_with_terms_checkbox" name="agree_with_terms" class="form-check-input" checked="true">
                                Conheço e concordo com o <a href="#" class="text-white">estatuto</a>
                                e com as <a href="#" class="text-white">legislações</a> da Con Animal.
                            </label>
                        </div>
			
						<div id="c_alert_box"></div>
						
                        <button type="submit" id="c_submit_button" class="btn btn-block btn-danger mt-4"> Cadastrar </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
    
    
<c:import url="/includes/footers.jsp"/>