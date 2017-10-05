
$(function(){
	
	function displayImageModal(source){
		$("#image-modal-image").attr("src", source);
		$("#image-modal").modal("show");
	}
	
	$('input[type="file"]').change(function (){
		var fieldVal = $(this).val();
		if (fieldVal != undefined || fieldVal != "") {
			$(this).next(".custom-file-control").attr('data-content', fieldVal);
		} else {
			$(this).next(".custom-file-control").attr('data-content', "Selecionar arquivo...");
		}
		
	});
	
	$('.img-thumbnail').click(function(e){
		var source = $(e.target).attr("src");
		displayImageModal(source);
	});
	
	$('.img-fluid').click(function(e){
		if ($(e.target).parent().hasClass("img-wrapper")){
			var source = $(e.target).attr("src");
			displayImageModal(source);
		}
	});
	
	$('.hide-partner-button').click(function(e){
		var id = $(e.target).attr("data-id");
		var name = $(e.target).attr("data-name");
		$("#hide-partner-set").html("<c:set var='url' value='/hidePartner" + id + "'/>"); // to be fixed
		$("#partner-name-field").html(name);
	});
})

