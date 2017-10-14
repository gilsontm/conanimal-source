<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div  id="image_modal" class="modal fade">
	<div class="modal-dialog" role="document">
    	<div class="modal-content">
      		<div class="modal-body">
        		<img src="" id="image_modal_image" class="img-fluid d-block mx-auto" alt="">
      		</div>
    	</div>
  	</div>
</div>

<script src="<c:url value='/js/jquery-3.2.1.min.js'/>"> </script>
<script src="<c:url value='/js/tether.min.js'/>"> </script>
<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/js/index.js'/>"></script>
<!--<script src="<c:url value='js/register-field-check.js'/>"></script>-->

</body>
</html>