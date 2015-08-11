<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<%--
  Created by IntelliJ IDEA.
  User: Elliot
  Date: 14/02/11
  Time: 12:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page isELIgnored="false" %>
<html class="j">
<head><title>Search DIAMM</title>
    <link rel="stylesheet" type="text/css" media="all" href="../_a/c/a.css"/>
    <link rel="stylesheet" type="text/css" media="screen, projection" href="../_a/c/s.css"/>
    <!--[if IE 7]><link rel="stylesheet" type="text/css" href="../_a/c/msie.7.css" media="screen" /><![endif]-->
    <!--[if IE 8]><link rel="stylesheet" type="text/css" href="../_a/c/msie.8.css" media="screen" /><![endif]-->
    <!--[if IE 9]><link rel="stylesheet" type="text/css" href="../_a/c/msie.9.css" media="screen" /><![endif]-->

    <script type="text/javascript" src="../_a/s/jquery-1.5.min.js"></script>
<script type="text/javascript" src="../_a/s/jquery.tools.min.js"></script>
    <%--<script type="text/javascript" src="../_a/s/jquery-ui.min.js"></script>--%>
    <%--<script type="text/javascript" src="../_a/s/jquery-ui-1.8.10.custom.min.js"></script>--%>
    <script type="text/javascript" src="../_a/s/jquery-ui-1.8.13.custom.min.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.ui.autocomplete.html.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.cluetip.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.hoverIntent.js"></script>

    <!-- replace cufon with Typekit-->
    <script type="text/javascript" src="http://use.typekit.com/tae2ufe.js"></script>
    <script type="text/javascript">try {
        Typekit.load();
    } catch(e) {
    }</script>

    <!--<script type="text/javascript" src="../_a/s/c.js"></script>-->
    <script type="text/javascript">
        maxCriteria=${maxCriteria};
    </script>
    <script type="text/javascript" src="../_a/s/search.js"></script>
    <style type="text/css">
        .hideClass {
            display: none;
        }
    </style>
</head>
<body id="t2">
<jsp:include page="banner.jsp"/>

<div class="rp">
    <a href="SearchManager?op=9">Reset Search</a>
</div>
<div id="container">
    <h3>Add Criteria</h3>

    <form id="searchManagerForm" action="SearchManager" method="POST">
        <a href="#" class="addButton">Add new search criterion</a>
        <c:forEach var="i" begin="1" end="${maxCriteria}" varStatus="status">
            <div id="c${i}"
                 <c:if test="${i>1 and values[i]==null}">class="hideClass"</c:if> >
                <c:choose>
                    <c:when test="${i>1}">
                        <a href="#" class="hideButton">X</a>
                        <select id="op${i}" name="op${i}">
                            <option value="0">AND</option>
                            <option value="1">OR</option>
                        </select>
                    </c:when>
                    <c:otherwise> </c:otherwise>
                </c:choose>
                <select id="criteriaType${i}" name="criteriaType${i}" class="criteriaSelector">
                    <c:forEach items="${searchTypes}" var="type">
                        <option value="${type}"
                                <c:if test="${criteriaTypes[i]==type}">selected="selected" </c:if>>
                            ${fn:toLowerCase(type)}


                        </option>
                    </c:forEach>
                </select>
                <input class="autoInput" id="criteriaInput${i}" name="criteriaInput${i}"
                       value="<c:if test="${labels[i]!=null}">${labels[i]}</c:if>" />

<span id="ac${i}" class="hasAutoComplete acenabled" title="Auto complete is available for this field"></span>
                <ul id="complete${i}"></ul>
				
            </div>
        </c:forEach>
        <select name="resultType">
            <option value="1" <c:if test="${resultType==1}">selected="selected" </c:if>>Item</option>
            <option value="2" <c:if test="${resultType==2}">selected="selected" </c:if>>Source</option>
        </select>
        <input type="checkbox" name="imageOnly" <c:if test="${imageOnly==1}">checked="checked"</c:if> value="1" />
		<span class="legend">Only show items with images</span>
        <input type="hidden" name="op" value="4"/>
        <input value="Search" type="submit" class="submit-button" />
    </form>
</div>
<div id="autocompleteDrop"></div>
<div id="overlay">
      <div class="overlayContent"></div>
</div>
</body>
</html>