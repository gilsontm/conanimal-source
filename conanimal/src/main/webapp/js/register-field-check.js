$(document).ready(function(){
	var feedback_messages = {
			1 : "Este campo é de preenchimento obrigatório",
			2 : "Valor inválido",
			3 : "Confirmação de senha deve ser igual à senha digitada",
			4 : "Você precisa concordar com o estatuto e legislações da ONG para prosseguir",
			5 : "Senha muito curta"
	}
	
	function dangerFieldById(id, message_id){
		$(id).addClass("form-control-danger");
		var parent = $(id).parent();
		parent.addClass("has-danger");
		parent.children("label").removeClass("text-white");
		parent.children(".form-control-feedback").html(feedback_messages[message_id]);
	}
		
	function successFieldById(id){
		$(id).removeClass("form-control-danger");
		var parent = $(id).parent();
		parent.removeClass("has-danger");
		parent.children("label").addClass("text-white");
		parent.children(".form-control-feedback").html("");
	}
	
	function dangerCheckboxById(id){
		var parent = $(id).parent;
		parent.removeClass("has-success");
		parent.addClass("has-danger");
		parent.children("label").removeClass("text-white");
		parent.children(".form-control-feedback").html(feedback_messages[4]);
	}
	
	function successCheckboxById(id){
		var parent = $(id).parent;
		parent.removeClass("has-danger");
		parent.addClass("has-success");
		parent.children("label").removeClass("text-white");
		parent.children(".form-control-feedback").html("");
	}
	
	function onPersonFormSubmit(event){
		
		var can_submit = true;
		if ($("#p_password_input").val() != $("#p_confirm_password_input").val()){
			dangerFieldById("#p_confirm_password_input", 3);
			can_submit = false;
		}
		
		var field_ids = ["name", "email", "password", "confirm_password", "profession", "rg", "cpf", 
			"phone", "cell_phone", "uf", "city", "neighborhood", "street", "complement", "payment"];
		
		for(id of field_ids){
			successFieldById("#p_" + id + "_input");
			if ($("#p_" + id + "_input").val() == ""){
				dangerFieldById("#p_" + id + "_input", 1);
				can_submit = false;
			} else if (id == "password" || id == "confirm_password"){
				var regex_password = /^[a-z0-9]+$/i;
				if ($("#p_" + id + "_input").val().length < 8){
					dangerFieldById("#p_" + id + "_input", 5);
					can_submit = false;
				} else if (!regex_password.test($("#p_" + id + "_input").val())){
					dangerFieldById("#p_" + id + "_input", 2);
					can_submit = false;
				}
			}
		}

		if (can_submit){
			$("form[name='p_register_form']").submit();
		} else {
			$("input.form-control-danger:first").focus();
			$("#p_submit_button").remove()
			$("form[name='p_register_form']").append('<button type="submit" id="p_submit_button" class="btn btn-block btn-danger mt-4"> Cadastrar </button>');
			$("#p_submit_button").on("click", onPersonFormSubmit);
		}
	}
	
	$("#p_submit_button").on("click", onPersonFormSubmit);

});
