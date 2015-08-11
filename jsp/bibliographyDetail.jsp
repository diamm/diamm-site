<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Bibliography Search</title>
    <link rel="stylesheet" type="text/css" href="../_a/c/a.css"/>
    <link rel="stylesheet" type="text/css" href="../_a/c/s.css"/>
    <!--[if IE 7]><link rel="stylesheet" type="text/css" href="../_a/c/msie.7.css" media="screen" /><![endif]-->
    <!--[if IE 8]><link rel="stylesheet" type="text/css" href="../_a/c/msie.8.css" media="screen" /><![endif]-->
    <!--[if IE 9]><link rel="stylesheet" type="text/css" href="../_a/c/msie.9.css" media="screen" /><![endif]-->
    <script type="text/javascript" src="../_a/s/jquery-1.5.min.js"></script>
    <script type="text/javascript" src="../_a/s/cufon.min.js"></script>
    <script type="text/javascript" src="../_a/f/agp.font.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.tools.min.js"></script>
       <script type="text/javascript" src="../_a/s/c.js"></script>

  
</head>
<body id="t2">
<div id="gw">
<jsp:include page="banner.jsp"/>
<div id="wrapper">
<div class="rp">
    <c:choose>
        <c:when test="${parent=='bib'}">
            <c:url value="Bibliography" var="bibSearchUrl">
                <c:param name="title" value="${bibSearch.title}"/>
                <c:param name="author" value="${bibSearch.author}"/>
                <c:param name="authoreditor" value="${bibSearch.authoreditor}"/>
                <c:param name="year" value="${bibSearch.year}"/>
                <c:param name="publisher" value="${bibSearch.publisher}"/>
                <c:param name="search" value="Search"/>
                <c:param name="nextPage" value="${recordNav.selectedPage}"/>
            </c:url>
            <a href="${bibSearchUrl}" title="Return to bibliography list">&laquo; Bibliography List</a>
        </c:when>
        <c:otherwise>
           <%-- <a href="${refererUrl}" title="Return to previous page">&laquo; Previous page</a>--%>
        </c:otherwise>
    </c:choose>
</div>

<div id="recordview" class="record">
    <div class="hdp">
        <h1>${bib.bib.fulltextcalculated}</h1>
    </div>

    <div>
        <dl class="m0">

            <c:if test="${not empty bib.bib.journal}">
                <dt>Journal:</dt>
                <dd>${bib.bib.journal}</dd>
            </c:if>
            <c:if test="${not empty bib.bib.articletitle}">
                <dt>Article Title:</dt>
                <dd>${bib.bib.articletitle}</dd>
            </c:if>
            <c:if test="${not empty bib.bib.vol}">
                <dt>Volume:</dt>
                <dd>${bib.bib.vol}</dd>
            </c:if>
            <c:if test="${not empty bib.bib.dissertation}">
                <dt>Dissertation:</dt>
                <dd>${bib.bib.dissertation}</dd>
            </c:if>
            <c:if test="${not empty bib.bib.degree}">
                <dt>Degree:</dt>
                <dd>${bib.bib.degree}</dd>
            </c:if>
            <c:if test="${not empty bib.bib.university}">
                <dt>University:</dt>
                <dd>${bib.bib.university}</dd>
            </c:if>
            <c:if test="${not empty bib.bib.notes}">
                <dt>Notes:</dt>
                <dd>${bib.bib.notes}</dd>
            </c:if>
            <c:if test="${not empty bib.bib.informationsource}">
                <dt>Information Source:</dt>
                <dd>${bib.bib.informationsource}</dd>
            </c:if>
            <c:if test="${not empty bib.bib.publisher}">
                <dt>Publisher:</dt>
                <dd>${bib.bib.publisher}</dd>
            </c:if>

            <c:if test="${bib.compositions!=null&&fn:length(bib.compositions)>0}">
                <dt>Compositions</dt>
                <dd>
                    <ul>
                        <c:forEach var="c" items="${bib.compositions}">
                            <li>
                                    ${c.composition.compositionName}
                                <c:if test="${c.composers!=null}">&nbsp; / &nbsp;
                                    <c:forEach var="c" varStatus="x" items="${c.composers}">
                                        <c:if test="${!x.first}">/</c:if>
                                        ${c.composercomplete}
                                    </c:forEach>
                                </c:if>
                            </li>
                        </c:forEach>
                    </ul>
                </dd>
            </c:if>
            <c:if test="${bib.sources!=null&&fn:length(bib.sources)>0}">
                <dt>Sources</dt>
                <dd>
                    <ul>
                        <c:forEach var="s" items="${bib.sources}">
                            <li>
                                <span title="${s.sourceString}"><strong>${s.a.siglum}</strong></span> ${s.s.shelfmark}
                                <a class="t9 m1"
                                   href="Descriptions?op=SOURCE&sourceKey=${s.s.sourcekey}">View</a>
                            </li>
                        </c:forEach>
                    </ul>
                </dd>
            </c:if>

            <c:if test="${bib.items!=null&&fn:length(bib.items)>0}">
                <dt>MS items</dt>
                <dd>
                    <ul>
                        <c:forEach var="item" items="${bib.items}">
                            <li>
                                <span title="${item.sourceString}"><strong>${item.archive.siglum}</strong></span> ${item.source.shelfmark}
                                no. ${item.item.positionms} f. ${item.folioString}
                                <c:if test="${item.images!=null&&fn:length(item.images)>0}"><img class="i1"
                                                                                                 src="../../diamm/_a/i/_a11.png"
                                                                                                 alt="image icon"/></c:if>
                                <a class="t9 m1" href="FacetManager?op=6&detailItemKey=${item.key}">View
                                    Record</a>
                            </li>
                        </c:forEach>
                    </ul>
                </dd>
            </c:if>
            <c:if test="${bib.composers!=null&&fn:length(bib.composers)>0}">

                <dt>Composer(s)</dt>
                <dd>
                    <c:forEach var="c" varStatus="x" items="${bib.composers}">
                        <c:if test="${!x.first}">/</c:if>
                        ${c.composercomplete}
                    </c:forEach>
                </dd>
            </c:if>

        </dl>
    </div>
</div>

<c:if test="${parent=='bib'}">


    <%--<div>
      <div id="sources" class="record">
        <div class="hdp">
          <h1>Sources: &nbsp;None</c:if></h1>
        </div>
        <ul class="s9">
        <c:forEach items="${bib.bib.archiveToSourceList}" var="archiveToSource">
          <li>${archiveToSource.archiveDetails}
            <ul>
            <c:forEach items="${archiveToSource.sourceList}" var="source">
              <li>${source.shelfmark} <a class="t9 m1" href="Descriptions?op=SOURCE&sourceKey=${source.sourcekey}">View record</a></li>
            </c:forEach>
            </ul>
          </li>
        </c:forEach>
        </ul>
      </div>
    </div>--%>

    <c:url value="BibliographyDetail" var="bibNavigateUrl">
        <c:param name="parent" value="bib"/>
        <c:param name="title" value="${bibSearch.title}"/>
        <c:param name="author" value="${bibSearch.author}"/>
        <c:param name="year" value="${bibSearch.year}"/>
        <c:param name="publisher" value="${bibSearch.publisher}"/>
        <c:param name="authoreditor" value="${bibSearch.authoreditor}"/>
        <c:param name="totalRecordCount" value="${recordNav.totalRecordCount}"/>
        <c:param name="bibOriginatingPage" value="${recordNav.selectedPage}"/>
    </c:url>

    <div class="itp m1">
        <h3>Record ${recordNav.selectedRecord} of ${recordNav.totalRecordCount}</h3>
        <c:if test="${recordNav.hasMultipleRecords}">
            <jsp:include page="recordNavigator.jsp">
                <jsp:param value="${bibNavigateUrl}" name="urlRoot"/>
            </jsp:include>
        </c:if>
    </div>

</c:if>

</div>
</div>
<div id="overlay">
      <div class="overlayContent"></div>
</div>
</body>
</html>