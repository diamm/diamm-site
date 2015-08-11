<%--
  Created by IntelliJ IDEA.
  User: Elliot
  Date: 14/03/11
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="d" uri="DiammTags" %>

<%@ page isELIgnored="false" %>


<div class="title">
<c:choose>
    <c:when test="${detailItem!=null}">
        <h1><span class="typeDescription">Item: </span> <span
                title="${detailItem.sourceString}"><strong>${detailItem.archive.siglum}</strong></span> ${detailItem.source.shelfmark}
            no. ${detailItem.item.positionms} f. ${detailItem.folioString}</h1>
        </div>
        <div class="t03" id="detailTabs">
        <ul class="nvt">

            <li>
                <a href="#fullItem" title="All available metadata for an item will be displayed here">
                    <b>Information</b>
                </a>
            </li>
            <li>
                <a href="#incipits" title="thumbnails of all incipits">
                    <b>Incipits</b>
                </a>
            </li>
            <li>
                <a href="#texts" title="transcribed text from the composition">
                    <b>Text</b>
                </a>
            </li>
            <li>
                <a href="#imageList">
                    <b>Image List</b>
                </a>
            </li>


        </ul>


        <div id="fullItem" class="s7">
            <jsp:include page="fullitem.jsp"/>
        </div>

        <div id="incipits" class="s7">
            <jsp:include page="incipits.jsp"/>
        </div>

        <div id="texts" class="s7">
            <jsp:include page="texts.jsp"/>
        </div>


        <div id="imageList" class="s7">
            <c:if test="${detailItem!=null&&detailItem.images!=null&&fn:length(detailItem.images)>0}">
                <h3>Folios/pages showing this composition</h3>
                <ul>
                    <c:forEach var="image" items="${detailItem.images}">
                        <li>
                            <c:if test="${image.filename!=null}">
                                <a href="AnnotationManager?imageKey=${image.imagekey}"><img height="100"
                                        src="//diamm.cch.kcl.ac.uk/thumbsup/${image.filename}"/></a>
                                <c:if test="${image.folio!=null}"><span>${image.folio}</span></c:if>
                            </c:if>
                                <%--todo restore collections
                                    <d:userLoggedIn>
                                <a href="CollectionLink?linkId=${image.imagekey}&linkType=image" class="t9 m2">Add to a Collection<a>

                                </d:userLoggedIn>--%>
                        </li>
                    </c:forEach>
                </ul>
            </c:if>

            <c:if test="${detailItem!=null&&detailItem.sourceImages!=null&&fn:length(detailItem.sourceImages)>0}">
                <h3>All images in ${detailItem.archive.siglum} ${detailItem.source.shelfmark}</h3>
                <ul>
                    <c:forEach var="image" items="${detailItem.sourceImages}">
                        <li>
                            <c:if test="${image.filename!=null}">
                                <a href="AnnotationManager?imageKey=${image.imagekey}"><img height="100"
                                        src="//diamm.cch.kcl.ac.uk/thumbsup/${image.filename}"/></a>
                                <c:if test="${image.folio!=null}"><span>${image.folio}</span></c:if>
                            </c:if>
                        </li>
                    </c:forEach>
                </ul>
            </c:if>
            <c:if test="${detailItem!=null&&detailItem.images==null}}">
                <p>No images available</p>
            </c:if>
            <div class="kakadu">
                <p>Images served from JPEG2000 powered by <a href="http://www.kakadusoftware.com/">kakadu software</a>
                </p>
            </div>
        </div>


    </c:when>
    <c:otherwise>


        <h1>Help with searching DIAMM</h1>

           <p class="searchpage">To reveal more information under each heading in the left column click on the + sign beside the heading to unfold the sub-lists; to read full descriptions click on the page icon; to add the heading to the search criteria click on the text. The numbers shown refer to item records in the database.</p>
        <p ><a rel="#overlay" class="helpIcon searchpage" href="searchhelp.jsp">Read the full guide to browsing the manuscript
            database.</a></p>

    </c:otherwise>
</c:choose>
</div>
