<%--
  Created by IntelliJ IDEA.
  User: Elliot
  Date: 06/04/11
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page isELIgnored="false" %>
<div id="add-to-existing">
	<h3>Select a collection to add the image to:</h3>
    <form action="CollectionLink" method="post">
        
        <input type="hidden" name="linkId" value="" />
        <input type="hidden" name="linkType" value="image" />
        
        <select name="collIdToLink">
        <c:forEach var="coll" items="${collList}">
            <option value="${coll.id}"
                    <c:if test="${coll.id==collDetails.defaultCollId}">selected</c:if>>${coll.title}</option>
        </c:forEach>
        </select>
		<input class="submit-button" type="submit" name="link" value="Add" />
        <span class="msg1">${messages.link}</span>
    </form>
</div>

<div id="createCollLink">
    <jsp:include page="collectionCreate.jsp">
        <jsp:param value="CollectionLink" name="collectionAction"/>
    </jsp:include>
</div>
