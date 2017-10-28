$(document).ready(function(){
	var feedback_messages = {
			1 : "Este campo é de preenchimento obrigatório",
			2 : "Valor inválido",
			3 : "Confirmação de senha deve ser igual à senha digitada",
			4 : "Você precisa concordar com o estatuto e legislações da ONG para prosseguir",
			5 : "Senha muito curta",
			6 : "Endereço de email inválido",
			7 : "Número de telefone inválido",
			8 : "A contribuição não pode ser negativa"
	}
	
	function dangerFieldById(id, message_id){
		$(id).addClass("form-control-danger");
		var parent = $(id).closest(".form-group");
		parent.addClass("has-danger");
		parent.children("label").removeClass("text-white");
		parent.children(".form-control-feedback").html(feedback_messages[message_id]);
	}
		
	function successFieldById(id){
		$(id).removeClass("form-control-danger");
		var parent = $(id).closest(".form-group");
		parent.removeClass("has-danger");
		parent.children("label").addClass("text-white");
		parent.children(".form-control-feedback").html("");
	}
	
	function dangerCheckboxById(id, message_id){
		var parent = $(id).closest(".form-check");
		parent.addClass("has-danger");
		parent.children(".form-control-feedback").html(feedback_messages[message_id]);
	}
	
	function successCheckboxById(id){
		var parent = $(id).closest(".form-check");
		parent.removeClass("has-danger");
		parent.children(".form-control-feedback").html("");
	}
	
	var person_ids = ["name", "email", "password", "confirm_password", "profession", "rg", "cpf", 
		"phone", "cell_phone", "uf", "city", "neighborhood", "street", "complement", "payment"];
	
	var company_ids = ["name", "company_name", "cnpj", "email", "password", "confirm_password", "cpf", "rg", "uf",
		"representative_name", "phone", "cell_phone", "city", "neighborhood", "street","complement", "payment"];
	
	var email_regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	var password_regex = /^[a-z0-9]{8,}$/i;
	var cpf_regex = /^[0-9]{11}$/;
	var cnpj_regex = /^[0-9]{14}$/;
	var rg_regex = /^[0-9]+$/;
	var phone_regex = /^[0-9]{10,}$/;
	
	function onPersonFormSubmit(){
		
		var can_submit = true;
		
		if ($("#p_password_input").val() != $("#p_confirm_password_input").val()){
			dangerFieldById("#p_confirm_password_input", 3);
			can_submit = false;
		}
		
		for(id of person_ids){
			var selector = "#p_" + id + "_input";
			successFieldById(selector);
			if ($(selector).val() == ""){
				dangerFieldById(selector, 1);
				can_submit = false;
			} else if (id == "email") {
				if (!email_regex.test($(selector).val())) {
					dangerFieldById(selector, 6);
					can_submit = false;
				}
			} else if (id == "password" || id == "confirm_password"){
				if (!password_regex.test($(selector).val())){
					dangerFieldById(selector, 2);
					can_submit = false;
				}
			} else if (id == "cpf") {
				if (!cpf_regex.test($(selector).val())){
					dangerFieldById(selector, 2);
					can_submit = false;
				}
			} else if (id == "rg") {
				if (!rg_regex.test($(selector).val())){
					dangerFieldById(selector, 2);
					can_submit = false;
				}
			} else if (id == "phone" || id == "cell_phone"){
				if (!phone_regex.test($(selector).val())) {
					dangerFieldById(selector, 7);
					can_submit = false;
				}
			} else if (id == "payment"){
				if ($(selector).val() < 0){
					dangerFieldById(selector, 8);
					can_submit = false;
				}
			}
		}
		
		successCheckboxById("#p_agree_with_terms_checkbox");
		if (!$("#p_agree_with_terms_checkbox").prop("checked")){
			dangerCheckboxById("#p_agree_with_terms_checkbox", 4);
			can_submit = false;
		}
		
		if (can_submit){
			$("form[name='p_register_form']").submit();
		} else {
			$("input.form-control-danger:first").focus();
		}
	}
	
	function onCompanyFormSubmit(){
		
		var can_submit = true;
		
		if ($("#c_password_input").val() != $("#c_confirm_password_input").val()){
			dangerFieldById("#c_confirm_password_input", 3);
			can_submit = false;
		}
		
		for(id of company_ids){
			var selector = "#c_" + id + "_input";
			successFieldById(selector);
			if ($(selector).val() == "") {
				dangerFieldById(selector, 1);
				can_submit = false;
			} else if (id == "email") {
				if (!email_regex.test($(selector).val())) {
					dangerFieldById(selector, 6);
					can_submit = false;
				}
			} else if (id == "password" || id == "confirm_password"){
				if (!password_regex.test($(selector).val())) {
					dangerFieldById(selector, 2);
					can_submit = false;
				}
			} else if (id == "cnpj") {
				if (!cnpj_regex.test($(selector).val())) {
					dangerFieldById(selector, 2);
					can_submit = false;
				}
			} else if (id == "cpf") {
				if (!cpf_regex.test($(selector).val())) {
					dangerFieldById(selector, 2);
					can_submit = false;
				}
			} else if (id == "rg") {
				if (!rg_regex.test($(selector).val())) {
					dangerFieldById(selector, 2);
					can_submit = false;
				}
			} else if (id == "phone" || id == "cell_phone") {
				if (!phone_regex.test($(selector).val())) {
					dangerFieldById(selector, 7);
					can_submit = false;
				}
			} else if (id == "payment"){
				if ($(selector).val() < 0){
					dangerFieldById(selector, 8);
					can_submit = false;
				}
			}
			
		}
		
		successCheckboxById("#c_agree_with_terms_checkbox");
		if (!$("#c_agree_with_terms_checkbox").prop("checked")){
			dangerCheckboxById("#c_agree_with_terms_checkbox", 4);
			can_submit = false;
		}

		if (can_submit){
			$("form[name='c_register_form']").submit();
		} else {
			$("input.form-control-danger:first").focus();
		}
	}
	
	$("#p_submit_button").on("click", onPersonFormSubmit);
	$("#c_submit_button").on("click", onCompanyFormSubmit);

});
