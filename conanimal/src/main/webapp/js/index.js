$(function(){
	
	var next = 2;
	
	function displayImageModal(source){
		$("#image_modal_image").attr("src", source);
		$("#image_modal").modal("show");
	}
		
	$("body").on("change", 'input[type="file"]', function (){
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
	
	$("#add_file_button").click(function(e){
		e.preventDefault();
		if (next <= 16) {
			$("#report_file_container").append('<div class="form-group row"><label class="col-3 col-form-label">' + 
					'Arquivo ' + next +' </label> <div class="col-9"> <label class="custom-file"> <input type="file"' + 
					'class="custom-file-input" name="files"> <span class="custom-file-control" data-content="' + 
					'Selecionar arquivo..."></span> </label> </div> </div>');
			next ++;
		}
	});
})

