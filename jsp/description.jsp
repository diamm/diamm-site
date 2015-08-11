<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%--
  Created by IntelliJ IDEA.
  User: Elliott Hall
  Date: 01-Dec-2010
  Time: 13:47:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="d" uri="DiammTags" %>

<%@ page isELIgnored="false" %>

<html>
<head>
    <title>DIAMM Description</title>

    <link rel="stylesheet" type="text/css" media="all" href="../_a/c/a.css"/>
    <link rel="stylesheet" type="text/css" media="screen, projection" href="../_a/c/s.css"/>
    <!--[if IE 7]><link rel="stylesheet" type="text/css" href="../_a/c/msie.7.css" media="screen" /><![endif]-->
    <!--[if IE 8]><link rel="stylesheet" type="text/css" href="../_a/c/msie.8.css" media="screen" /><![endif]-->
    <!--[if IE 9]><link rel="stylesheet" type="text/css" href="../_a/c/msie.9.css" media="screen" /><![endif]-->
    <link rel="stylesheet" type="text/css" media="screen, projection" href="../_a/c/jquery.contenteditable.css"/>
    <script type="text/javascript" src="../_a/s/jquery-1.5.min.js"></script>
    <script type="text/javascript" src="../_a/s/jq.truncator.min.js"></script>
    <script type="text/javascript" src="../_a/s/trunq.js"></script>
    <script type="text/javascript" src="../_a/f/agp.font.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.hoverIntent.js"></script>
    <script type="text/javascript" src="../_a/s/c.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.tools.min.js"></script>
    <script type="text/javascript" src="../_a/s/shortcut.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.contenteditable.js"></script>
    <script type="text/javascript" src="http://use.typekit.com/tae2ufe.js"></script>
    <script type="text/javascript">try{Typekit.load();}catch(e){}</script>
   
</head>
<body id="t2">
<jsp:include page="banner.jsp"/>
<div id="gw">
<div id="wrapper">
<%--<div class="rp">
    <a href="${refererUrl}" title="Return to previous page">‹‹ Previous page</a>
</div>--%>
<c:if test="${source!=null}">
    <dl class="m0">
        <dt>Shelfmark</dt>
        <dd class="long-text">${source.s.shelfmark}<c:if test="${source.s.olim!=null&&fn:length(source.s.olim)>0}" > [${source.s.olim}]</c:if> </dd>

        <c:if test="${source.s.description!=null}">
            <dt>Description</dt>
            <dd class="long-text">${source.s.description}</dd>
        </c:if>

        <c:if test="${source.s.dateofsource!=null}">
            <dt>Date</dt>
            <dd class="long-text">${source.s.dateofsource}</dd>
        </c:if>

        <c:if test="${source.s.dedicationtext!=null}">
            <dt>Dedication</dt>
            <dd class="long-text">${source.s.dedicationtext}</dd>
        </c:if>

        <c:if test="${source.s.stavegauge!=null}">
            <dt>Ruling information</dt>
            <dd class="long-text">${source.s.stavegauge}</dd>
        </c:if>
    </dl>
</c:if>

<c:if test="${set!=null}">
    <h2>${set.set.description}</h2>
    <dl class="m0">
        <dt>Shelfmark</dt>
        <dd class="long-text">${set.set.clustershelfmark}</dd>
        <dt>Set Type</dt>
        <dd class="long-text">${set.alsettype.description}</dd>
    </dl>
</c:if>


<c:if test="${composer!=null}">
    <c:if test="${composer.name!=null}">
        <div class="hdp">
            <h1><span class="typeDescription">Composer: </span> ${composer.name}</h1>
        </div>
    </c:if>
    <dl class="m0">

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

        <c:if test="${composer.sources!=null}">
            <dt>Sources of music for this composer</dt>
            <dd>
                <ul>
                    <c:forEach items="${composer.sources}" var="s">
                        <li>
                            <span title="${s.sourceString}"><strong>${s.a.siglum}</strong></span> ${s.s.shelfmark}
                            <a class="t9 m1" href="Descriptions?op=SOURCE&sourceKey=${s.s.sourcekey}">View</a>
                                <%--<d:userLoggedIn>
                        <a href="CollectionLink?linkId=${s.source.sourcekey}&linkType=source" class="t9 m2">Add to a
                            Collection<a>
                                </d:userLoggedIn>--%>
                        </li>
                    </c:forEach>
                </ul>
            </dd>
        </c:if>

        <c:if test="${composer.compositions!=null&&fn:length(composer.compositions)>0}">
            <dt>Compositions</dt>
            <dd>
                <ul>
                    <c:forEach var="comp" items="${composer.compositions}">
                        <c:if test="${comp.composition.compositionName ne 'works by'}">
                            <li>
                                    ${comp.composition.compositionName}
                                <a class="t9 m1"
                                   href="Descriptions?op=COMPOSITION&compositionKey=${comp.composition.compositionkey}">View
                                    record</a>
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>
            </dd>
        </c:if>

    </dl>
</c:if>

<c:if test="${genre!=null}">
    <h2>${genre.g.genre}</h2>

</c:if>

<c:if test="${archive!=null}">
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
</c:if>

<c:if test="${composition!=null}">
    <jsp:include page="compositiondescription.jsp"/>
</c:if>


<c:if test="${bibs!=null&&fn:length(bibs)>0}">
    <jsp:include page="bibliographyList.jsp"/>
</c:if>


<c:if test="${sources!=null}">
    <div id="sources" class="record">
        <div class="hdp">
            <h1>Sources</h1>
            <ul>
                <c:forEach var="source" items="${sources}">
                    <li>
                            ${source.shelfmark}
                            <c:if test="${source.olim!=null&&fn:length(source.olim)>0}" > ${source.olim}</c:if>
                                <c:choose>
                                <c:when test="${fn:length(source.tags)>100}">
                                    ${fn:substring(source.tags, 0,100 )}
                                </c:when>
                                <c:otherwise>
                                       ${source.tags}
                                </c:otherwise>
                            </c:choose> <a class="t9 m1"
                                                   href="Descriptions?op=SOURCE&sourceKey=${source.sourcekey}">view</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</c:if>

<c:if test="${sets!=null}">
    <div id="sets" class="record">
        <div class="hdp">
            <h1>Sets</h1>
        </div>
        <ul>
            <c:forEach var="s" items="${sets}">
                <li>
                        ${s.set.clustershelfmark} <a class="t9 m1" href="Descriptions?op=SET&setKey=${s.set.setkey}">view</a>
                </li>
            </c:forEach>
        </ul>
    </div>
</c:if>


<div id="imageList">
    <c:if test="${images!=null}">
        <ul>
            <c:forEach var="image" items="${images}">
                <li>
                <c:if test="${image.filename!=null}">
                    <a href="AnnotationManager?imageKey=${image.imagekey}">
                        <img height="100" src="//diamm.cch.kcl.ac.uk/thumbsup/${image.filename}"/>
                    </a>
                    ${image.folio}
                    <c:if test="${image.copyrightstatement!=null}">${image.copyrightstatement}</></c:if>
                </c:if>
                </li>
            </c:forEach>
        </ul>
        <div class="kakadu">
            <p>Images served from JPEG2000 powered by <a href="http://www.kakadusoftware.com/">kakadu software</a> </p>
        </div>

    </c:if>
    <c:if test="${source.images==null}}">
        <p>No images available</p>
    </c:if>
</div>

<c:if test="${compositions!=null&&fn:length(compositions)>0}">
    <jsp:include page="compositionList.jsp"/>
</c:if>


<c:if test="${composers!=null}">
    <div id="composers" class="record">
        <div class="hdp">
            <h1>Composers</h1>
        </div>
        <ul>
            <c:forEach var="comp" items="${composers}">
                <li>
                        ${comp.composercomplete} <a class="t9 m1"
                                                    href="Descriptions?op=COMPOSER&composerKey=${comp.composerkey}">View</a>
                </li>
            </c:forEach>
        </ul>
    </div>
</c:if>


<c:if test="${genres!=null&&fn:length(genres)>0}}">
    <div id="genres" class="record">
        <div class="hdp">
            <h1>Genres</h1>
        </div>
        <ul>
            <c:forEach var="g" items="${genre.genres}">
                <li>
                        ${g.genre} <%--<a class="t9 m1" href="Descriptions?op=GENRE&algenreKey=${g.algenrekey}">view</a>--%>
                </li>
            </c:forEach>
        </ul>
    </div>
</c:if>

<c:if test="${items!=null&&fn:length(items)>0}">
    <div id="items" class="record">
        <div class="hdp">
            <h1>Items</h1>
        </div>
        <ul>
            <c:forEach var="i" items="${genre.items}">
                <li>
                        ${i.folio} <a class="t9 m1" href="Descriptions?op=ITEM&itemKey=${i.itemkey}">View</a>
                </li>
            </c:forEach>
        </ul>
    </div>
</c:if>

<c:if test="${source!=null}">
    <div id="annotations" class="record">
        <div class="hdp">
            <h1>Annotations</h1>
        </div>
        <ul class="itl m0">

            <c:forEach var="pbComm" items="${pbCommList}">
                <li><i class="t9 m0">Comment</i> <i class="t9 m1 editable_select">Public</i>
                    <label>${pbComm.user.displayName} (${pbComm.dateDisplay})</label>

                    <p class="editable" id="note_${pbComm.notekey}">${pbComm.notetext}</p>
                    <d:userLoggedIn>
                        <c:if test="${pbComm.user.username eq pageContext.request.remoteUser}">
                            <%--<a href="#" class="t10 m2">Edit</a>--%>
                            <a class="t9 m1"
                               href="Descriptions?op=SOURCE&sourceKey=${source.sourcekey}&action=deleteNote&noteKey=${pbComm.notekey}"
                               class="t10 m3">Delete</a>
                        </c:if>
                    </d:userLoggedIn>
                </li>
            </c:forEach>

            <d:userLoggedIn>
                <c:forEach var="pvComm" items="${pvCommList}">
                    <li><i class="t9 m0">Comment</i> <i class="t9 m1">Private</i>
                        <label>Your private comment (${pvComm.dateDisplay})</label>

                        <p class="editable" id="note_${pvComm.notekey}">${pvComm.notetext}</p>
                            <%--<a href="#" class="t10 m2">Edit</a>--%>
                        <a class="t9 m1"
                           href="Descriptions?op=SOURCE&sourceKey=${source.sourcekey}&action=deleteNote&noteKey=${pvComm.notekey}"
                           class="t10 m3">Delete</a>
                    </li>
                </c:forEach>
            </d:userLoggedIn>

            <d:userLoggedIn>
                <h1>Add new note</h1>

                <form action="Descriptions" method="POST">
                    <input type="hidden" name="op" value="SOURCE"/>
                    <input type="hidden" name="sourceKey" value="${source.sourcekey}"/>
                    <input type="hidden" name="action" value="createNote"/>

                    <div>
                        <select name="noteType">
                            <option value="COM" selected="selected">Comment</option>
                        </select>
                        <input type="radio" name="noteVis" value="PV" checked/> Private
                        <input type="radio" name="noteVis" value="PB"/> Public
                    </div>
                    <div>
                        <textarea rows="4" cols="20" name="noteText"></textarea>
                    </div>
                    <div>
                        <input type="submit" name="create" value="Add New Note">
                    </div>
                </form>
            </d:userLoggedIn>
        </ul>
    </div>
</c:if>
</div>
</div>
<div id="overlay">
      <div class="overlayContent"></div>
</div>
</body>
</html>
