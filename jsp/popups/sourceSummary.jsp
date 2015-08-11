<%--
  Created by IntelliJ IDEA.
  User: Elliot
  Date: 10/08/11
  Time: 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="d" uri="DiammTags" %>

<%@ page isELIgnored="false" %>
<div id="popupSummary">
    <h1><span class="typeDescription">Source:</span> <strong>${source.a.siglum}</strong>    </h1>
     ${source.sourceString}
     ${source.s.shelfmark}
    <c:if test="${source.s.tags!=null&&fn:length(source.s.tags)>0}">
        <p>${source.s.tags}</p>
    </c:if>
</div>