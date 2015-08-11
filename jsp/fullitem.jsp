<%--
  Created by IntelliJ IDEA.
  User: Elliott Hall
  Date: 16-Nov-2010
  Time: 10:30:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page isELIgnored="false" %>
<c:if test="${detailItem!=null}">
<img src="http://images.cch.kcl.ac.uk/diamm/liv/archives/${detailItem.archive.archivekey}.png" alt=""  class="m0"/>
    <dl>

        <c:if test="${detailItem.item!=null&&fn:length(detailItem.item.motetincipitstandard)>0}">
            <dt class=”colourA”>Title</dt>
            <dd>${detailItem.item.motetincipitstandard}</dd>
        </c:if>

        <c:if test="${detailItem.item!=null&&fn:length(detailItem.item.positionms)>0}">
            <dt class="colourB">Position in Source</dt>
            <dd>No. ${detailItem.item.positionms}<c:if
                    test="${fn:length(detailItem.folioString)>0}">, fol(s)/pages ${detailItem.folioString}</c:if></dd>
        </c:if>

            <%--if CompositionComposer::uncertain = “Y” then precede composer name(s) with “?”}
   Composer::composerComplete IF more than one composer, keep on same line, but separate names with “ / “.
   (Always include “?” if there is more than one composer)}--%>
        <c:if test="${detailItem.composers!=null}">
            <dt class="colourB">Composer(s)</dt>
            <dd>
                    ${detailItem.composerString}
            </dd>

        </c:if>

        <c:if test="${detailItem.genres!=null}">
            <dt class="colourB">Genre and work type</dt>
            <dd>
                <ul>
                    <c:forEach var="g" items="${detailItem.genres}">
                        <li>${g.genre} <%--<a class="t9 01 m1" href="Descriptions?op=GENRE&alGenreKey=${g.algenrekey}">view</a>--%> </li>
                    </c:forEach>
                </ul>
            </dd>
        </c:if>
         <c:if test="${detailItem.composition.maxnumberofvoices!=null}">
                <dt class="colourB">Max number of voices</dt>
                <dd>
                     ${detailItem.composition.maxnumberofvoices}
                </dd>
            </c:if>

        <c:if test="${detailItem.cycleString!=null&&fn:length(detailItem.cycleString)>0}">
               <dt class="colourB">Related works</dt>
                <dd>
                        ${detailItem.cycleString}
                </dd>
        </c:if>

        <c:if test="${detailItem.cognates!=null}">
            <dt class="colourB">Concordances and cognates</dt>
            <dd>     <ul>
                <c:forEach var="c" items="${detailItem.cognates}">
                    <c:if test="${c.item!=detailItem.item}">
                        <li> <span title="${c.sourceString}"><strong>${c.archive.siglum}</strong></span> ${c.source.shelfmark}<c:if test="${c.source.olim!=null&&fn:length(c.source.olim)>0}" > [${c.source.olim}]</c:if>
                            No. ${c.item.positionms}

                    </c:if>
                </c:forEach>
                </ul>
            </dd>
         </c:if>

        <c:if test="${detailItem.item.notes!=null&&fn:length(detailItem.item.notes)>0}">
               <dt class="colourB">Notes</dt>
                <dd>
                   ${detailItem.item.notes}
                </dd>
        </c:if>



        <c:if test="${detailItem.bibs!=null&&fn:length(detailItem.bibs)>0}">
             <dt class="colourA">Bibliography for this item</dt>
             <dd>

                 <ul>
                     <c:forEach var="bib" items="${detailItem.bibs}">
                         <li>
                     ${bib.bib.fulltextcalculated}
                     <c:if test="${bib.notes!=null&&fn:length(bib.notes)>0}">
                        , ${bib.notes}
                    </c:if>  </li>
                     </c:forEach>
                 </ul>
             </dd>
         </c:if>

        <c:if test="${detailItem.compbibs!=null&&fn:length(detailItem.compbibs)>0}">
             <dt class="colourA">Bibliography for this composition</dt>
             <dd>

                 <ul>
                    <c:forEach var="bib" items="${detailItem.compbibs}">
                        <li>
                     ${bib.bib.fulltextcalculated}
                    <c:if test="${bib.notes!=null&&fn:length(bib.notes)>0}">
                        , ${bib.notes}
                    </c:if> </li>
                     </c:forEach>
                 </ul>
             </dd>
         </c:if>

        <c:if test="${detailItem.item.datecomposed!=null&&fn:length(detailItem.item.datecomposed)>0}">
               <dt class="colourB">Date Composed</dt>
                <dd>
                   ${detailItem.item.datecomposed}
                </dd>
        </c:if>

        <c:if test="${detailItem.item.datecopied!=null&&fn:length(detailItem.item.datecopied)>0}">
               <dt class="colourB">Date Copied</dt>
                <dd>
                   ${detailItem.item.datecopied}
                </dd>
        </c:if>

        <c:if test="${detailItem.item.musicnotationstylekey!=null&&fn:length(detailItem.item.musicnotationstylekey)>1&& detailItem.item.musicnotationstylekey ne '0' }">
               <dt class="colourB">Notation Style</dt>
                <dd>
                   ${detailItem.item.musicnotationstylekey}
                </dd>
        </c:if>

        <c:if test="${detailItem.item.restligatureconfig!=null&&fn:length(detailItem.item.restligatureconfig)>0}">
               <dt class="colourB">Rest-ligature configuration</dt>
                <dd>
                   ${detailItem.item.restligatureconfig}
                </dd>
        </c:if>

        <c:if test="${detailItem.item.textnotationcolour!=null&&fn:length(detailItem.item.textnotationcolour)>0}">
               <dt class="colourB">Colour</dt>
                <dd>
                   ${detailItem.item.textnotationcolour}
                </dd>
        </c:if>

        <c:if test="${detailItem.item.corrections!=null&&fn:length(detailItem.item.corrections)>0}">
               <dt class="colourB">Corrections</dt>
                <dd>
                   ${detailItem.item.corrections}
                </dd>
        </c:if>

    </dl>





</c:if>