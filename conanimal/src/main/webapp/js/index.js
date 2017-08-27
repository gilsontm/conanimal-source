// handle custom file inputs
$(function(){
	$("input[type=file]").change(function (){
		var fieldVal = $(this).val();
		if (fieldVal != undefined || fieldVal != "") {
			$(this).next(".custom-file-control").attr('data-content', fieldVal);
		}
	});
})
