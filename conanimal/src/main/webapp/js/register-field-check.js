$(document).ready(function(){
	console.log("working");
	$("#p_submit_button").submit(function(){
		var fields_ids = ["name", "email", "password", "confirm_password", "profession", "rg", "cpf", 
			"phone", "cell_phone", "uf", "city", "neighborhood", "street", "complement", "payment"];
		var can_submit = true;
		for(id in fields_ids){
			if (!$("#p_" + id + "_input").value){
				can_submit = false;
			}
		}
		
		if (!can_submit){
			var alert_message = '<div id="p_alert" class="alert alert-danger" role="alert"> Há campos que não foram preenchidos. Por favor, preencha todos os campos. </div>';
			$("#p_alert_box").html(alert_message);
			return false
		}
	});
});

// <script src="<c:url value='js/register-field-check.js'/>"></script>