<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="d" uri="DiammTags" %>

<%@ page isELIgnored="false" %>

<div id="popupSummary">
    <c:if test="${composer.name!=null}">
        <div class="hdp">
            <h1><span class="typeDescription">Composer: </span> ${composer.name}</h1>
        </div>
    </c:if>

    <c:if test="${composer.c.datesPublic!=null&&fn:length(compfoser.c.datesPublic)>0}">
        <dt>Dates</dt>
        <dd class="long-text">${composer.c.datesPublic}</dd>
    </c:if>


    <c:if test="${composer.c.variantspellings!=null&&fn:length(composer.c.variantspellings)>0}">
        <dt>Aliases</dt>
        <dd class="long-text">${composer.c.variantspellings}</dd>
    </c:if>

    <c:if test="${composer.c.info!=null&&fn:length(composer.c.info)>0}">
        <dt>Bibliography</dt>
        <dd class="long-text">${fn:replace(composer.c.info,"\\r","<br/>")}</dd>
        <c:if test="${composer.c.infoSource!=null&&fn:length(composer.c.infoSource)>0}">
            <dt>Biography source</dt>
            <dd class="long-text">${composer.c.infoSource}</dd>
        </c:if>
    </c:if>

</div>