<%--
  Created by IntelliJ IDEA.
  User: Elliott Hall
  Date: 16-Nov-2010
  Time: 10:36:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>

<c:if test="${detailItem!=null}">
    <dl>
        <c:if test="${detailItem.item.incipitfilename!=null&&fn:length(detailItem.item.incipitfilename)>0}">
            <dt class="colourA">RISM Incipit</dt>
            <dd><img src="http://images.cch.kcl.ac.uk/diamm/liv/incipits/${detailItem.item.incipitfilename}.png" alt=""/>
            </dd>
        </c:if>

       <c:if test="${detailItem.item.altincipitfilename!=null&&detailItem.item.altincipitfilename!=null&&fn:length(detailItem.item.altincipitfilename)>0}">
            <dt>Alternate Incipit</dt>
            <dd><img src="http://images.cch.kcl.ac.uk/diamm/liv/incipits/${detailItem.item.altincipitfilename}" alt=""/></dd>
        </c:if>

        <c:if test="${detailItem.item.motetincipitfilename!=null&&fn:length(detailItem.item.motetincipitfilename)>0}">
            <dt class="colourA">New Incipit</dt>
            <dd><img src="http://images.cch.kcl.ac.uk/diamm/liv/incipits/${detailItem.item.motetincipitfilename}.png" alt=""/></dd>
        </c:if>
    </dl>
</c:if>

