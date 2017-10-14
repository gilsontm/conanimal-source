<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<c:import url="/includes/headers.jsp"/>
<c:import url="/includes/main-header.jsp"/>
	
<div class="row w-100 mt-5 mx-0 mb-0 p-0">
	<!-- Menu lateral -->
	<c:import url="/includes/side-menu.jsp"/>

	<!-- Estatuto -->
    <div class="col-8 px-0">
        <div class="px-3 pb-4 pt-0 mx-4 mb-5">
            <div class="p-3 rounded-top standard-color-blue">
            	<h4 class="text-white my-0 d-inline-block"> Estatuto da ONG </h4>
            	<c:if test="${statuteFiles.size() > 0}">
            		<form method="GET" action="<c:url value='/statute/download'/>" class="float-right"> 
                		<button type="submit" class="btn btn-sm btn-danger"> Download </button>
                	</form>
            	</c:if>
            </div>
            <div class="card border-top-0">
                <div class="card-block">
                    <div class="m-0 pt-1 pb-0">
                    	<c:choose>
                    		<c:when test="${statuteFiles.size() > 0}">
                    			<c:forEach items="${statuteFiles}" var="eachFile">
                  					<div class="w-100 embed-responsive embed-responsive-1by1 my-3">
	                    				<iframe class="embed-responsive-item" src="<c:url value='/statute/${eachFile.getId()}/view'/>"> </iframe>
	                    			</div>
                  				</c:forEach>	
                    		</c:when>
                    		<c:otherwise> 
                    			<p> Nenhum arquivo cadastrado.</p>
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                </div>
            </div>
    	</div>
    </div>
</div>

<c:import url="/includes/main-footer.jsp"/>
<c:import url="/includes/footers.jsp"/>