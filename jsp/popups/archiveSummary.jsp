<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="d" uri="DiammTags" %>

<%@ page isELIgnored="false" %>


<div id="popupSummary">
    <div class="hdp">
        <h1><span class="typeDescription">Archive: </span> ${archive.a.archivename}</h1>
    </div>
    <img class="m0" src="http://images.cch.kcl.ac.uk/diamm/liv/archives/${archive.a.archivekey}.png" alt="">

    <dl class="m0">
        <c:if test="${archive.a.address!=null&&fn:length(archive.a.address)>0}">
            <dt>Address</dt>
            <dd class="long-text">${archive.a.address}</dd>
        </c:if>
        <c:if test="${archive.a.phone!=null&&fn:length(archive.a.phone)>0}">
            <dt>Telephone</dt>
            <dd class="long-text">${archive.a.phone}</dd>
        </c:if>
        <c:if test="${archive.a.fax!=null&&fn:length(archive.a.fax)>0}">
            <dt>Fax</dt>
            <dd class="long-text">${archive.a.fax}</dd>
        </c:if>
        <c:if test="${archive.a.email!=null&&fn:length(archive.a.email)>0}">
            <dt>Email</dt>
            <dd class="long-text">${archive.a.email}</dd>
        </c:if>
        <c:if test="${archive.a.siglum!=null&&fn:length(archive.a.siglum)>0}">
            <dt>RISM Siglum</dt>
            <dd class="long-text">${archive.a.siglum}</dd>
        </c:if>
    </dl>
</div>