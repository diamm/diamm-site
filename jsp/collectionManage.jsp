<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Collection Management</title>
    <link rel="stylesheet" type="text/css" href="../_a/c/a.css"/>
    <link rel="stylesheet" type="text/css" href="../_a/c/s.css"/>
    <!--[if IE 7]>
    <link rel="stylesheet" type="text/css" href="../_a/c/msie.7.css" media="screen"/><![endif]-->
    <!--[if IE 8]>
    <link rel="stylesheet" type="text/css" href="../_a/c/msie.8.css" media="screen"/><![endif]-->
    <!--[if IE 9]>
    <link rel="stylesheet" type="text/css" href="../_a/c/msie.9.css" media="screen"/><![endif]-->
    <script src="../_a/s/jquery-1.5.min.js" type="text/javascript"></script>
    <script src="../_a/s/cufon.min.js" type="text/javascript"></script>
    <script src="../_a/f/agp.font.js" type="text/javascript"></script>
    <script src="../_a/s/c.js" type="text/javascript"></script>
    <script type="text/javascript" src="../_a/s/c.js"></script>

</head>
<body id="t6">
<jsp:include page="banner.jsp"/>
<div id="cs">
<div class="c c1">
<h2>Collection Management</h2>
   <ul class="s8">
        <li><a href="MyDiamm">Your comments</a></li>
        <li><a href="UserAccess?action=editAccount">Edit my details</a></li>
        <li><a href="UserAccess?action=changePassword">Change password</a></li>

    </ul>
<div id="collectionList" class="box">
    <h3>Collection List</h3>


    <c:forEach items="${collList}" var="coll">
        <c:url value="CollectionManage" var="collectionEditUrl">
            <c:param name="edit" value="edit"/>
            <c:param name="origCollId" value="${coll.id}"/>
        </c:url>
        <c:url value="CollectionManage" var="collectionFullDetailsUrl">
            <c:param name="fullDetails" value="fullDetails"/>
            <c:param name="origCollId" value="${coll.id}"/>
        </c:url>
        <dl class="list">
            <dt class="title"><span>Title: </span>${coll.title} <span class="edit"><a class="t9 m1"
                                                                                      href="${collectionEditUrl}"
                                                                                      title="Edit">edit</a></span>
                        <span class="view"><a title="View" class="t9 m1"
                                              href="${collectionFullDetailsUrl}">view</a></span></dt>
            <dd class="desc"><span>Description: </span>${coll.description}</dd>
        </dl>

    </c:forEach>
    <c:if test="${mode eq 'modeEdit'}"><span class="n1">New Collection</span><a class="t9 m8"
                                                                                href="CollectionManage">Create
        New Collection</a></c:if>
</div>

<c:choose>
    <c:when test="${empty mode or mode eq 'modeCreate'}">
        <div id="newCollection" class="box">
            <jsp:include page="collectionCreate.jsp">
                <jsp:param value="CollectionManage" name="collectionAction"/>
            </jsp:include>
        </div>
    </c:when>
    <c:otherwise>
        <div id="editCollection" class="box">
            <div id="container">
                <h3>Edit Collection</h3>
                <c:choose>
                <c:when test="${empty origColl}">
                    <p>None Selected</p>
                </c:when>
                <c:otherwise>
                <form action="CollectionManage" method="post">
                    <ul class="register">
                        <li>

                            <label>Original Title</label><br/>
                            <input type="text" class="text" name="origCollTitle" value="${origColl.coll.title}"
                                   disabled="disabled"/>
                        </li>
                        <li>
                            <label>Original Description</label><br/>
                            <input type="text" class="text2" name="origCollDescription"
                                   value="${origColl.coll.description}" disabled="disabled"/>
                        </li>
                        <li>
                            <label>New Title</label><span class="msg2">${messages.title}</span><br/>
                            <input type="text" class="text" name="editedCollTitle"
                                   value="${collDetails.editedCollTitle}"/>
                        </li>
                        <li>
                            <label>New Description</label><br/>
                            <input type="text" class="text2" name="editedCollDescription"
                                   value="${collDetails.editedCollDescription}"/>
                        </li>
                        <li class="buttons">
                            <input type="hidden" name="origCollId" value="${origColl.coll.id}">
                            <input type="submit" name="save" value="Update">
                            <input type="submit" name="delete" value="Delete Collection">
                        </li>
                        <span class="msg1">${messages.edit}</span>
                    </ul>

                </form>
            </div>
            </c:otherwise>
            </c:choose>
        </div>
        <div id="collectionObjects" class="box">
            <h3>In this collection</h3>
            <c:choose>
                <c:when test="${empty origColl.sourceList and empty origColl.itemList and empty origColl.coll.imageList}">
                    <p>This collection is empty</p>
                </c:when>
                <c:otherwise>

                    <c:if test="${not empty origColl.sourceList}">
                        <c:forEach items="${origColl.sourceList}" var="s">
                            <c:url value="CollectionManage" var="unlinkUrl">
                                <c:param name="unlink" value="unlink"/>
                                <c:param name="origCollId" value="${origColl.coll.id}"/>
                                <c:param name="unlinkId" value="${s.s.sourcekey}"/>
                                <c:param name="unlinkType" value="source"/>
                            </c:url>
                            <li>

                                <span title="${s.sourceString}"><strong>${s.a.siglum}</strong></span> ${s.s.shelfmark}
                                <a class="t9 m1" href="Descriptions?op=SOURCE&sourceKey=${s.s.sourcekey}">View</a>
                                <a href="${unlinkUrl}">remove</a>
                            </li>
                        </c:forEach>
                        <%--<table class="coll">
                            <tr>
                                <th colspan="2">Sources</th>
                            </tr>
                            <c:forEach items="${origColl.sourceList}" var="source">

                                <c:url value="CollectionManage" var="unlinkUrl">
                                    <c:param name="unlink" value="unlink"/>
                                    <c:param name="origCollId" value="${origColl.id}"/>
                                    <c:param name="unlinkId" value="${source.sourcekey}"/>
                                    <c:param name="unlinkType" value="source"/>
                                </c:url>
                                <tr>
                                    <td class="action"><a href="${unlinkUrl}">remove</a></td>
                                    <td class="default">${source.shelfmark}</td>
                                </tr>
                            </c:forEach>
                        </table>--%>
                    </c:if>

                    <c:if test="${not empty origColl.itemList}">
                        <h2>Items</h2>
                        <ul class="m1">
                            <c:forEach items="${origColl.itemList}" var="item">
                                <li>

                                    <c:url value="CollectionManage" var="unlinkUrl">
                                        <c:param name="unlink" value="unlink"/>
                                        <c:param name="origCollId" value="${origColl.coll.id}"/>
                                        <c:param name="unlinkId" value="${item.item.itemkey}"/>
                                        <c:param name="unlinkType" value="item"/>
                                    </c:url>

                                    <span title="${item.sourceString}"><strong>${item.archive.siglum}</strong></span> ${item.source.shelfmark}
                                    <c:if test="${item.item.positionms!=null&&fn:length(item.item.positionms)>0}">no. ${item.item.positionms}</c:if>
                                    <c:if test="${item.folioString!=null&&fn:length(item.folioString)>0}">f. ${item.folioString}</c:if>

                                    <a class="t9 m1" href="Descriptions?op=ITEM&itemKey=${item.item.itemkey}">View
                                        Record</a>
                                    <a href="${unlinkUrl}">remove</a>
                                </li>
                            </c:forEach>
                        </ul>


                        <%--<tr>
                            <td class="action"><a href="${unlinkUrl}">remove</a></td>
                            <td class="default">
                                <c:if test="${not empty item.compositionByCompositionkey.compositionName}">
                                    Composition: ${item.compositionByCompositionkey.compositionName}<br/>
                                </c:if>
                                <c:if test="${not empty item.sourceBySourcekey}">
                                    Archive: ${item.sourceBySourcekey.archiveByArchivekey.archivename}; ${item.sourceBySourcekey.shelfmark}
                                    <br/>
                                </c:if>
                                <c:if test="${not empty item.sourceBySourcekey.olim}">
                                    Olim: ${item.sourceBySourcekey.olim}<br/>
                                </c:if>
                                <c:if test="${not empty item.sourceBySourcekey.description}">
                                    Description: ${item.sourceBySourcekey.description}<br/>
                                </c:if>
                                <c:if test="${not empty item.sourceBySourcekey.pagemeasurements}">
                                    Page Measurements: ${item.sourceBySourcekey.pagemeasurements}<br/>
                                </c:if>
                                <c:if test="${not empty item.sourceBySourcekey.notation}">
                                    Notation: ${item.sourceBySourcekey.notation}<br/>
                                </c:if>
                                <c:if test="${not empty item.sourceBySourcekey.notes}">
                                    Notes: ${item.sourceBySourcekey.notes}<br/>
                                </c:if>
                                Foliation:
                                <c:if test="${item.folioStart!=null}">${item.folioStart}</c:if>
                                <c:if test="${item.folioStartAlt ne 'null'}">${item.folioStartAlt}</c:if>
                                <c:if test="${item.folioStart!=null&&item.folioEnd!=null}">-</c:if>
                                <c:if test="${item.folioEnd!=null}">${item.folioEnd}</c:if>
                                <c:if test="${item.folioEndAlt ne 'null'}">${item.folioEndAlt}</c:if>
                            </td>
                        </tr>--%>


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
                                    <a href="AnnotationManager?imageKey=${image.imagekey}"><img height="100"
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
    </c:otherwise>
</c:choose>
</div>
</div>
<div id="overlay">
      <div class="overlayContent"></div>
</div>
</body>
</html>
