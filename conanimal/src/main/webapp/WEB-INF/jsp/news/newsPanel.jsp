<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/headers.jsp"/>
<c:import url="/includes/main-header.jsp"/>

<div class="row w-100 mt-5 mx-0 mb-0 p-0">
	<!-- Menu lateral -->
	<c:import url="/includes/side-menu.jsp"/>
	
	<!-- Notícias -->
    <div class="col-8 px-0">
    	<div class="px-3 pb-4 pt-0 mx-4 mb-5">
        	<div class="p-3 rounded-top standard-color-blue">
            	<h4 class="text-white my-0"> Notícias </h4>
            </div>
			<c:forEach items="${news}" var="eachNews">
				<c:if test="${not eachNews.getHidden()}">
					<div class="card border-top-0">
	                    <div class="card-block">
	                        <div class="m-0 pt-1 pb-0">
	                            <a href="<c:url value='/viewNews${eachNews.getId()}'/>"><h5> ${eachNews.getTitle()} </h5></a>
	                            <hr>
	                            <p> ${eachNews.getDescription()} </p>
	                            <p class="float-right p-0 m-0"> Postado em: ${eachNews.getRegisterDate()}</p>
	                            <br>
	                            <a class="float-right" href="<c:url value='/viewNews${eachNews.getId()}'/>"> Mais informações </a>
	                        </div>
	                    </div>
	                </div>
		   		</c:if>
           	</c:forEach>
		</div>
	</div>
</div>

<c:import url="/includes/main-footer.jsp"/>
<c:import url="/includes/footers.jsp"/>