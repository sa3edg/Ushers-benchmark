<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<div class="body">
			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_SUPER_USER', 'ROLE_USHER', 'ROLE_DATAENTRY')">
				<a href="<c:url value="addPreferredLocationsForm" />"><spring:message
						code="preferredLocation.addPreferredLocation" /></a>
				<c:if test="${not empty locations}">
				<c:set var="deleteConfirmation"><spring:message code="ushers.delecteConfirmation" /></c:set>
					<div class="table-title">
						<h3><spring:message code="menu.preferredLocations" /></h3>
					</div>
					<display:table id="locationsTable" pagesize="10" requestURI="" name="locations" class="CSSTableGenerator">
						<display:column property="name" titleKey="ushers.name" ></display:column>
						<display:column><a href="<c:url value="/editPreferredLocations?id=${locationsTable.id}" />">
				        <img src="<c:url value='/resources/images/edit.png'/>" width="30" height="30"  border="0" alt="Link to this page"> </a></display:column>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
						<display:column><a href="<c:url value="/deletePreferredLocations?id=${locationsTable.id}" />"
				        	onClick="return confirmDelete('${deleteConfirmation}');"><img src="<c:url value='/resources/images/delete.png'/>" width="30" height="30"  border="0" alt="Link to this page"> </a></display:column>
						</sec:authorize>
					</display:table>
				</c:if>
			</sec:authorize>
		</div>
	</tiles:putAttribute>
</tiles:insertDefinition>