<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Collection Details</title>
    <link rel="stylesheet" type="text/css" href="../_a/c/a.css"/>
    <link rel="stylesheet" type="text/css" href="../_a/c/s.css"/>
    <!--[if IE 7]>
    <link rel="stylesheet" type="text/css" href="../_a/c/msie.7.css" media="screen"/><![endif]-->
    <!--[if IE 8]>
    <link rel="stylesheet" type="text/css" href="../_a/c/msie.8.css" media="screen"/><![endif]-->
    <!--[if IE 9]>
    <link rel="stylesheet" type="text/css" href="../_a/c/msie.9.css" media="screen"/><![endif]-->

    <script src="../_a/s/jquery-1.5.min.js" type="text/javascript"></script>
    <script src="../_a/s/c.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://use.typekit.com/tae2ufe.js"></script>
    <script type="text/javascript">try{Typekit.load();}catch(e){}</script>
    <script type="text/javascript" src="../_a/s/jquery.tools.min.js"></script>
        <script type="text/javascript" src="../_a/s/c.js"></script>


</head>
<body id="t6">
<jsp:include page="banner.jsp"/>
<div id="cs">
    <div class="c c1">
        <div class="rp">
            <a href="${refererUrl}" title="Return to previous page">Return to previous page</a>
        </div>
        <div class="hdp">
            <h1>${origColl.coll.title}</h1>
        </div>


        <div id="container" class="y1">
            <c:choose>
            <c:when test="${empty origColl.sourceList and empty origColl.itemList and empty origColl.coll.imageList}">
                <div>This collection is empty</div>
            </c:when>
            <c:otherwise>

            <c:if test="${not empty origColl.sourceList}">
                <ul>

                    <c:forEach items="${origColl.sourceList}" var="s">

                        <li>

                            <span title="${s.sourceString}"><strong>${s.a.siglum}</strong></span> ${s.s.shelfmark}
                            <a class="t9 m1" href="Descriptions?op=SOURCE&sourceKey=${s.s.sourcekey}">View</a>

                        </li>
                    </c:forEach>
                </ul>

            </c:if>

            <c:if test="${not empty origColl.itemList}">
            <h2>Items</h2>
            <ul class="m1">
                <c:forEach items="${origColl.itemList}" var="item">
                    <li>


                        <span title="${item.sourceString}"><strong>${item.archive.siglum}</strong></span> ${item.source.shelfmark}
                        <c:if test="${item.item.positionms!=null&&fn:length(item.item.positionms)>0}">no. ${item.item.positionms}</c:if>
                        <c:if test="${item.folioString!=null&&fn:length(item.folioString)>0}">f. ${item.folioString}</c:if>

                        <a class="t9 m1" href="Descriptions?op=ITEM&itemKey=${item.item.itemkey}">View
                            Record</a>

                    </li>
                </c:forEach>
            </ul>

        </c:if>

        <c:if test="${not empty origColl.coll.imageList}">
                        <ul>
                        <c:forEach items="${origColl.coll.imageList}" var="image">
                            <c:url value="CollectionManage" var="unlinkUrl">
                                <c:param name="unlink" value="unlink"/>
                                <c:param name="origCollId" value="${origColl.coll.id}"/>
                                <c:param name="unlinkId" value="${image.imagekey}"/>
                                <c:param name="unlinkType" value="image"/>
                            </c:url>
                            <li>
                                <c:if test="${image.filename!=null}">
                                    <a href="AnnotationManager?imageKey=${image.imagekey}"><img  height="100"
                                            src="/thumbsup/${image.filename}"/></a>
                                    <c:if test="${image.folio!=null}"><span>${image.folio}</span></c:if>
                                </c:if>
                                <a href="${unlinkUrl}">remove</a>
                            </li>

                        </c:forEach>
                        </ul>
            <div class="kakadu">
                <p>Images served from JPEG2000 powered by <a href="http://www.kakadusoftware.com/">kakadu software</a> </p>
            </div>

                    </c:if>
        </c:otherwise>
        </c:choose>
    </div>
</div>
</div>
<div id="overlay">
      <div class="overlayContent"></div>
</div>
</body>
</html>
