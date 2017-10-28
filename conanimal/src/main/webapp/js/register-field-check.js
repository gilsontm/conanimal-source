$(function(){
	
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
	
	function dangerFieldByElement(element, message_id){
		var parent = $(element).closest(".form-group");
		$(element).addClass("form-control-danger");
		parent.addClass("has-danger");
		if (parent.children("label").hasClass("text-white")){
			parent.children("label").removeClass("text-white");
		}
		parent.children(".form-control-feedback").html(feedback_messages[message_id]);
	}
	
	function successFieldByElement(element, text_white=true){
		var parent = $(element).closest(".form-group");
		$(element).removeClass("form-control-danger");
		parent.removeClass("has-danger");
		if (text_white){
			parent.children("label").addClass("text-white");
		}
		parent.children(".form-control-feedback").html("");
	}
	
	function dangerCheckboxBySelector(selector, message_id){
		var parent = $(selector).closest(".form-check");
		parent.addClass("has-danger");
		parent.children(".form-control-feedback").html(feedback_messages[message_id]);
	}
	
	function successCheckboxBySelector(selector){
		var parent = $(selector).closest(".form-check");
		parent.removeClass("has-danger");
		parent.children(".form-control-feedback").html("");
	}
		
	var email_regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	var password_regex = /^[a-z0-9]{8,}$/i;
	var cpf_regex = /^[0-9]{11}$/;
	var cnpj_regex = /^[0-9]{14}$/;
	var rg_regex = /^[0-9]+$/;
	var phone_regex = /^[0-9]{10,}$/;
	
	function onFormSubmit(event, form_name, text_white){
		
		var can_submit = true;
		
		$("form[name='" + form_name + "'] :input:not([type='button'],[type='checkbox'],[type='hidden'])").each(function() {
			successFieldByElement(this, text_white);
			if($(this).val() == ""){
				dangerFieldByElement(this, 1);
				can_submit = false;
			}
		});
		
		$("form[name='" + form_name + "'] :input[type='email']").each(function(){
			if (!email_regex.test($(this).val())) {
				dangerFieldByElement(this, 6);
				can_submit = false;
			}
		});
		
		$("form[name='" + form_name + "'] :input[type='password']").each(function(){
			if (!password_regex.test($(this).val())){
				dangerFieldByElement(this, 2);
				can_submit = false;
			}
		});
		
		$("form[name='" + form_name + "'] :input[type='tel']").each(function(){
			if (!phone_regex.test($(this).val())) {
				dangerFieldByElement(this, 7);
				can_submit = false;
			}
		});
		
		if ($("form[name='" + form_name + "'] :input[type='password']").length > 1) {
			if ($("form[name='" + form_name + "'] :input[name='password']").val() != $("form[name='" + form_name + "'] :input[name='confirm_password']").val()){
				dangerFieldByElement("form[name='" + form_name + "'] :input[name='confirm_password']", 3);
				can_submit = false;
			}
		}
		
		if ($("form[name='" + form_name + "'] :input[name='cnpj']:not([type='hidden'])").length > 0){
			if (!cnpj_regex.test($("form[name='" + form_name + "'] :input[name='cnpj']").val())) {
				dangerFieldByElement("form[name='" + form_name + "'] :input[name='cnpj']", 2);
				can_submit = false;
			}
		}
		
		if (!cpf_regex.test($("form[name='" + form_name + "'] :input[name='cpf']").val())){
			dangerFieldByElement("form[name='" + form_name + "'] :input[name='cpf']", 2);
			can_submit = false;
		}
		
		if (!rg_regex.test($("form[name='" + form_name + "'] :input[name='rg']").val())){
			dangerFieldByElement("form[name='" + form_name + "'] :input[name='rg']", 2);
			can_submit = false;
		}
		
		if ($("form[name='" + form_name + "'] :input[name='payment']").val() < 0){
			dangerFieldByElement("form[name='" + form_name + "'] :input[name='payment']", 8);
			can_submit = false;
		}
		
		if ($("form[name='" + form_name + "'] :input[name='agree_with_terms']").length > 0) {
			successCheckboxBySelector("form[name='" + form_name + "'] :input[name='agree_with_terms']");
			if (!$("form[name='" + form_name + "'] :input[name='agree_with_terms']").prop("checked")){
				dangerCheckboxBySelector("form[name='" + form_name + "'] :input[name='agree_with_terms']", 4);
				can_submit = false;
			}
		}
		
		if (can_submit){
			console.log("Submting")
			$("form[name='" + form_name + "']").submit();
		} else {
			//$(':focus').blur();
			$("input.form-control-danger :first").focus();
		}
	}
	
	if ($("#p_submit_button").length > 0){
		$("#p_submit_button").on("click", function(event){onFormSubmit(event, "p_register_form")});
	}
	if ($("#c_submit_button").length > 0){
		$("#c_submit_button").on("click", function(event){onFormSubmit(event, "c_register_form")});
	}
	
	if ($("#update_user_submit_button").length > 0){
		$("#update_user_submit_button").on("click", function(event){onFormSubmit(event, "update_user_form", false)});
	}
	if ($("#update_password_submit_button").length > 0){
		$("#update_password_submit_button").on("click", function(event){onFormSubmit(event, "update_password_form", false)});
	}

});
