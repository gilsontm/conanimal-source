<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/headers.jsp"/>
<c:import url="/includes/main-header.jsp"/>

<div class="row w-100 mt-5 mx-0 mb-0 p-0">
	<!-- Menu lateral -->
	<c:import url="/includes/side-menu.jsp"/>
	
	<div class="col-8 px-0">
    	<div class="px-3 pb-4 pt-0 mx-4 mb-5">
        	<div class="p-3 rounded-top standard-color-blue">
            	<h4 class="text-white my-0"> Prestação de contas </h4>
            </div>
            
            <c:choose> 
            	<c:when test="${reports.size() > 0}">
            		<c:forEach begin="0" end="${reports.size() - 1}" var="id">
						<div class="card border-top-0">
		                    <div class="card-block">
		                        <div class="m-0 pt-1 pb-0">
		                            <h5 class="d-inline-block"> ${reports.get(id).getTitle()} </h5>
		                            <form method="GET" action="<c:url value='/report/${reports.get(id).getId()}/download'/>" class="float-right"> 
		                            	<button class="btn btn-sm btn-danger"> Download </button>
		                            </form>
		                            <hr>
		                            <a class="btn btn-block standard-color-blue text-white my-1" href="#report_${reports.get(id).getId()}_collapse" data-toggle="collapse" aria-expanded="false" aria-controls="report_${reports.get(id).getId()}_collapse">
		                            	Anexos
		                            </a>
		                            <div class="collapse" id="report_${reports.get(id).getId()}_collapse">
		                            	<c:forEach begin="1" end="${listReportFiles.get(id)}" var="fileId">
		                            		<iframe>
		                            			<div class="w-100 embed-responsive embed-responsive-1by1 my-3">
	                    							<iframe class="embed-responsive-item" src="<c:url value='/report/${reports.get(id).getId()}/viewFile/${fileId}'/>"></iframe>
	                    						</div>
		                            		</iframe>
		                            	</c:forEach>
		                            </div>
		                            <p class="float-right p-0 m-0"> Cadastrado em: ${reports.get(id).getRegisterDate()}</p>
		                        </div>
		                    </div>
		                </div>
		           	</c:forEach>
            	</c:when>
            	<c:otherwise>
		            <div class="card border-top-0">
	                    <div class="card-block">
	                        <div class="m-0 pt-1 pb-0">
	                            <p> Nenhuma prestação de contas cadastrada. </p>
	                        </div>
	                    </div>
	                </div>
            	</c:otherwise>      
            </c:choose>
        </div>
    </div>
</div>

<c:import url="/includes/main-footer.jsp"/>
<c:import url="/includes/footers.jsp"/>