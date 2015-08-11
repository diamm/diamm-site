<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page isELIgnored="false" %>
<div class="title">
<h1><span class="typeDescription">Composition: </span> ${composition.composition.compositionName}</h1>
</div>
<div id="composer">
    <dl>
        <dt>Composer</dt>
        <dd>
            <c:if test="${composition.composerLinks!=null}">
                <c:forEach var="cc" varStatus="x" items="${composition.composerLinks}">
                    <c:if test="${!x.first}">/</c:if>
                    <c:if test="${cc.attributionuncertain!=null&&cc.attributionuncertain eq 'Y'}">?</c:if>
                    ${cc.composerByComposerkey.composercomplete}
                </c:forEach>
            </c:if>
        </dd>
        <c:if test="${composition.composition.maxnumberofvoices!=null}">
            <dt>Number of voices</dt>
            <dd>${composition.composition.maxnumberofvoices}</dd>
        </c:if>

        <dt>Sources</dt>
        <dd>
            <ul>
                <c:forEach items="${composition.sources}" var="s">
                    <li>
                        <span title="${s.sourceString}"><strong>${s.a.siglum}</strong></span> ${s.s.shelfmark}
                        <a class="t9 m1" href="Descriptions?op=SOURCE&sourceKey=${s.s.sourcekey}">View</a>
                    </li>
                </c:forEach>
            </ul>
        </dd>

        <c:if test="${composition.cycleString!=null&&fn:length(composition.cycleString)>0}">
            <dt class="colourB">Related works</dt>
            <dd>
                    ${composition.cycleString}
            </dd>
        </c:if>

        <c:if test="${composition.composition.notesconcordances!=null&&fn:length(composition.composition.notesconcordances)>0}">
            <dt>Notes</dt>
            <dd>${fn:replace(composition.composition.notesconcordances,"\\r","<br/>")} </dd>
        </c:if>


        <c:if test="${composition.bibs!=null&&fn:length(composition.bibs)>0}">
            <dt class="colourA">Bibliography for this item</dt>
            <dd>

                <ul>
                    <c:forEach var="bib" items="${composition.bibs}">
                        <li>
                                ${bib.bib.fulltextcalculated}
                            <c:if test="${bib.notes!=null&&fn:length(bib.notes)>0}">
                                , ${bib.notes}
                            </c:if></li>
                    </c:forEach>
                </ul>
            </dd>
        </c:if>


    </dl>
</div>