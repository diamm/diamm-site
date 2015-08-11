<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Add Object to Collection</title>
    <link rel="stylesheet" type="text/css" href="../_a/c/a.css"/>
    <link rel="stylesheet" type="text/css" href="../_a/c/s.css"/>
    <!--[if IE 7]>
    <link rel="stylesheet" type="text/css" href="../_a/c/msie.7.css" media="screen"/><![endif]-->
    <!--[if IE 8]>
    <link rel="stylesheet" type="text/css" href="../_a/c/msie.8.css" media="screen"/><![endif]-->
    <!--[if IE 9]>
    <link rel="stylesheet" type="text/css" href="../_a/c/msie.9.css" media="screen"/><![endif]-->
    <script src="../_a/s/jquery-1.5.min.js" type="text/javascript"></script>
    <%-- <script src="../_a/s/c.js" type="text/javascript"></script>--%>
    <script type="text/javascript" src="http://use.typekit.com/tae2ufe.js"></script>
    <script type="text/javascript">try {
        Typekit.load();
    } catch(e) {
    }</script>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#collectionForm").submit(function() {
                $.post('CollectionLink', $("#collectionForm").serialize(), function() {
                    $('span.msg1').html('Added');
                });
                return false;
            });
        });
    </script>
</head>
<body id="t2">
<jsp:include page="banner.jsp"/>
<div id="wrapper">
    <div class="rp"><a href="${refererUrl}" title="Return to previous page">Return to previous page</a></div>
    <div id="container">
        <c:if test="${not empty collList}">
            <form action="CollectionLink" method="post" id="collectionForm">
                <input type="hidden" name="link" value="1"/>
                <p>Select a collection to add the ${collDetails.linkType} to:</p>
                <input type="hidden" name="linkId" value="${collDetails.linkId}">
                <input type="hidden" name="linkType" value="${collDetails.linkType}">
                <input type="hidden" name="selfParent" value="true">
                <input type="hidden" name="referer" value="${refererUrl}">
                <input type="submit" name="link" class="action" value="Add To">
                <select name="collIdToLink">
                    <c:forEach var="coll" items="${collList}">
                        <option value="${coll.id}"
                                <c:if test="${coll.id==collDetails.defaultCollId}">selected="selected"</c:if>>${coll.title}</option>
                    </c:forEach>
                </select>
                <span class="msg3">${messages.link}</span>
            </form>
        </c:if>

            <jsp:include page="collectionCreate.jsp">
                <jsp:param value="CollectionLink" name="collectionAction"/>
            </jsp:include>


    </div>


</div>
</body>
</html>