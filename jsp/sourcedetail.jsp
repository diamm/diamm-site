<!DOCTYPE html>
<%--
  Created by IntelliJ IDEA.
  User: Elliot
  Date: 02/06/11
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="d" uri="DiammTags" %>

<%@ page isELIgnored="false" %>
<html class="j">
<head><title>Source Description</title>
    <link rel="stylesheet" type="text/css" media="all" href="../_a/c/a.css"/>
    <link rel="stylesheet" type="text/css" media="screen, projection" href="../_a/c/s.css"/>
    <!--[if IE 7]>
    <link rel="stylesheet" type="text/css" href="../_a/c/msie.7.css" media="screen"/><![endif]-->
    <!--[if IE 8]>
    <link rel="stylesheet" type="text/css" href="../_a/c/msie.8.css" media="screen"/><![endif]-->
    <!--[if IE 9]>
    <link rel="stylesheet" type="text/css" href="../_a/c/msie.9.css" media="screen"/><![endif]-->
    <link rel="stylesheet" type="text/css" href="../_a/c/jquery.lightbox-0.5.css" media="screen"/>
    <%--<script type="text/javascript" src="../_a/s/jquery-1.5.min.js"></script>--%>
    <script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.min.js"></script>
    <%--<script type="text/javascript" src="../_a/s/jquery-ui.min.js"></script>--%>
    <%--<script type="text/javascript" src="../_a/s/jquery-ui-1.8.10.custom.min.js"></script>--%>
    <script type="text/javascript" src="../_a/s/jquery-ui-1.8.13.custom.min.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.ui.autocomplete.html.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.cluetip.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.hoverIntent.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.tools.min.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.lightbox-0.5.min.js"></script>
    <script type="text/javascript" src="../_a/s/tiny_mce/tiny_mce.js"></script>
    <script type="text/javascript" src="https://raw.github.com/luis-almeida/unveil/master/jquery.unveil.min.js"></script>
    <%--<script type="text/javascript" src="../_a/s/c.js"></script>--%>
    <script type="text/javascript">
        $(document).ready(function () {
            $("img").unveil(200);

            tinyMCE.init({
                mode : "textareas",
                theme : "advanced",
                plugins: 'paste',
                convert_urls : false,
                theme_advanced_buttons1: 'bold,italic,underline,sub,sup,|,undo,redo' ,
                theme_advanced_buttons2 : "",
                theme_advanced_buttons3 : ""

            });
            $("a[rel='lightbox']").lightBox({
                imageLoading: '../_a/i/lightboximages/lightbox-ico-loading.gif',
                imageBtnClose: '../_a/i/lightboximages/lightbox-btn-close.gif',
                imageBtnPrev: '../_a/i/lightboximages/lightbox-btn-prev.gif',
                imageBtnNext: '../_a/i/lightboximages/lightbox-btn-next.gif'
            });

            // $("#f1").hide();
            $("#detailTabs").tabs();

            $("a.deleteNote").click(function() {
                var url = $(this).attr('href');
                alert(url);
                $(this).parents("li").hide();
                $.post(url);
                return false;
            });

            $("a[rel='#add-note']").overlay();

            $("a[rel='#update-note']").overlay({
                mask:'#333',
                onBeforeLoad: function() {
                    var sel = this.getTrigger().attr("href");
                    var key = sel.replace('note_', '');
                    var text = $('#' + sel).html();
                    if (text) {
                        tinyMCE.execCommand('mceInsertContent', false, text);
                    }
                    if (this.getTrigger().attr("class").indexOf('private') > -1) {
                        $('#updateNotePrivate').click();
                    }
                    else if (this.getTrigger().attr("class").indexOf('Trans') > -1) {
                        $('#updateNoteType').val('TRA');
                    }
                    $('#updateNoteKey').val(key);

                },
                onLoad: function() {
                    /*
                     if (hideViewFullRecord == false) {
                     linkHTML = '<p><a href="' + url + '">View full record</a></p>';
                     } else {
                     linkHTML = '';
                     }
                     if ($(removeBlock).length) {
                     $(removeBlock).html(linkHTML);
                     } else {
                     $('.overlayContent').append(linkHTML);
                     }*/
                },
                fixed:true
            });

        });
    </script>

    <!-- replace cufon with Typekit-->
    <script type="text/javascript" src="http://use.typekit.com/tae2ufe.js"></script>
    <script type="text/javascript">try {
        Typekit.load();
    } catch(e) {
    }</script>

</head>
<body id="t2">
<jsp:include page="banner.jsp"/>

<div id="gw">

<div id="wrapper">

<%--<div class="rp">
    <a href="${refererUrl}" title="Return to previous page">‹‹ Previous page</a>
</div>--%>
<div class="title">
    <div id="popupSummary">
        <h1><span class="typeDescription">Source:</span> <span
                title="${source.sourceString}"><strong>${source.a.siglum}</strong></span> ${source.s.shelfmark} </h1>
        <c:if test="${source.s.tags!=null&&fn:length(source.s.tags)>0}">
            <p>${source.s.tags}</p>
        </c:if>
    </div>
</div>
<div class="t03" id="detailTabs">
<ul class="nvt">
    <li>
        <a href="#information" title="All available metadata for an item will be displayed here">
            <b>Description</b>
        </a>
    </li>
    <c:if test="${source.bibs!=null}">
        <li>
            <a href="#bibliography" title="All available metadata for an item will be displayed here">
                <b>Bibliography</b>
            </a>
        </li>
    </c:if>
    <c:if test="${source.items!=null}">
        <li>
            <a href="#contents" title="All available metadata for an item will be displayed here">
                <b>Contents</b>
            </a>
        </li>
    </c:if>
    <c:if test="${source.sets!=null||source.copyists!=null||source.persons!=null}">
        <li>
            <a href="#relationships" title="All available metadata for an item will be displayed here">
                <b>Relationships</b>
            </a>
        </li>
    </c:if>
    <c:if test="${source.images!=null&&fn:length(source.images)>0}">
        <li>
            <a href="#imageList" title="All available metadata for an item will be displayed here">
                <b>Images</b>
            </a>
        </li>
    </c:if>
    <li>
        <a href="#notes" title="All available metadata for an item will be displayed here">
            <b>Notes</b>
        </a>
    </li>

</ul>
<div id="information" class="s7">

    <c:if test="${source!=null}">
        <dl class="m0">

            <dt class="colourA">Archive</dt>
            <dd class="long-text"><img
                    src="http://images.cch.kcl.ac.uk/diamm/liv/archives/${source.a.archivekey}.png" alt=""
                    class="m0"/>
                    ${source.a.archivename} [${source.a.siglum}]
            </dd>

            <dt class="colourA">Shelfmark</dt>
            <dd class="long-text">${source.s.shelfmark} ${source.s.olim}</dd>

            <c:if test="${source.s.dateofsource!=null}">
                <dt class="colourB">Date</dt>
                <dd class="long-text">${source.s.dateofsource}</dd>
            </c:if>

            <c:if test="${source.s.description!=null}">
                <dt class="colourA">Description</dt>
                <dd class="long-text">${source.s.description}</dd>
            </c:if>

            <c:if test="${source.sourceprovs!=null}">
                <c:forEach var="sp" items="${source.sourceprovs}">
                    <dt class="colourB">Provenance</dt>
                    <dd class="long-text"><c:if test="${sp.sp.uncertain eq 'Y'}">?</c:if>
                        <c:if test="${sp.prov!=null}">
                            ${sp.prov.country}
                        </c:if>
                        <c:if test="${sp.sp.region!=null&&fn:length(sp.sp.region)>0}">
                            , ${sp.sp.region}
                        </c:if>
                        <c:if test="${sp.sp.protectorate!=null&&fn:length(sp.sp.protectorate)>0}">
                            , ${sp.sp.protectorate}
                        </c:if>
                        <c:if test="${sp.sp.city!=null&&fn:length(sp.sp.city)>0}">
                            , ${sp.sp.city}
                        </c:if>
                        <c:if test="${sp.sp.institution!=null&&fn:length(sp.sp.institution)>0}">
                            , ${sp.sp.institution}
                        </c:if>

                    </dd>
                </c:forEach>
            </c:if>


            <c:if test="${source.s.notation!=null&&fn:length(source.s.notation)>0}">
                <dt class="colourB">Notation</dt>
                <dd class="long-text">${source.s.notation}</dd>
            </c:if>

            <c:if test="${source.s.rismimagefilename1!=null&&fn:length(source.s.rismimagefilename1)>0}">
                <dt>RISM</dt>
                <dd class="long-text">
                    <a rel='lightbox'
                       href="http://images.cch.kcl.ac.uk/diamm/liv/rism/mainpages/${source.s.rismimagefilename1}.png">RISM
                        1</a>

                    <c:if test="${source.s.rismimagefilename2!=null&&fn:length(source.s.rismimagefilename2)>0}">
                        <a rel='lightbox'
                           href="http://images.cch.kcl.ac.uk/diamm/liv/rism/mainpages/${source.s.rismimagefilename2}.png">RISM
                            2</a>
                    </c:if>
                    <c:if test="${source.s.rismimagefilename3!=null&&fn:length(source.s.rismimagefilename3)>0}">
                        <a rel='lightbox'
                           href="http://images.cch.kcl.ac.uk/diamm/liv/rism/mainpages/${source.s.rismimagefilename3}.png">RISM
                            3</a>
                    </c:if>
                </dd>
            </c:if>


        </dl>
    </c:if>
</div>
<c:if test="${source.bibs!=null}">
    <div id="bibliography" class="s7">

        <h3 class="colourA">Bibliography</h3>
        <ul>
            <c:forEach items="${source.bibs}" var="bib">
                <li>
                    <a class="t9 m1" href="BibliographyDetail?bibId=${bib.bib.bibliographykey}">View</a>
                        ${bib.bib.fulltextcalculated}
                    <c:if test="${bib.page!=null&&fn:length(bib.page)>0}">
                        , ${bib.page}
                    </c:if>
                    <c:if test="${bib.page!=null&&fn:length(bib.page)>0}">
                        [Notes: ${bib.notes}]
                    </c:if>
                </li>
            </c:forEach>
        </ul>

    </div>
</c:if>


<c:if test="${source.items!=null}">
    <div id="contents" class="s7">

        <h3 class="colourA">Table of contents</h3>
        <ul>
            <c:forEach items="${source.items}" var="detailItem">

                <li>
                    <a class="t9 m1" href="Descriptions?op=ITEM&itemKey=${detailItem.key}">View</a>
                        ${detailItem.item.positionms}
                    <c:if test="${fn:length(detailItem.folioString)>0}">${detailItem.folioString}</c:if>
                    <c:if test="${detailItem.composition!=null&&fn:length(detailItem.composition.compositionName)>0}">
                        ${detailItem.composition.compositionName}
                        <c:if test="${detailItem.composition.compositioncomposersByCompositionkey!=null}">

                            <c:forEach var="comp" items="${detailItem.composition.compositioncomposersByCompositionkey}"
                                       varStatus="vs">

                                <c:if test="${!vs.first}">
                                    /
                                </c:if>

                                <c:if test="${comp.composerByComposerkey.composerkey>0}">
                                    <c:if test="${vs.first}">
                                        &nbsp; -
                                    </c:if>
                                    <c:if test="${comp.attributionuncertain!='N'}">
                                        ?
                                    </c:if>
                                    ${comp.composerByComposerkey.composercomplete}
                                </c:if>
                            </c:forEach>

                        </c:if>
                    </c:if>

                </li>
            </c:forEach>
        </ul>

    </div>
</c:if>
<c:if test="${source.sets!=null||source.copyists!=null||source.persons!=null}">
    <div id="relationships" class="s7">
        <h3 class="colourA">Relationships</h3>
        <dl>
            <c:if test="${source.sets!=null&&fn:length(source.sets)>0}">
                <dt class="colourA">Linked Manuscripts</dt>
                <dd>
                    <ul>
                        <c:forEach var="c" items="${source.sets}">
                            <li>
                                    ${c.alsettype.description} ${c.set.clustershelfmark}
                                <c:if test="${c.linkedsources!=null}">
                                    <ul>
                                        <c:forEach items="${c.linkedsources}" var="link">
                                            <c:if test="${link.s.sourcekey!=source.s.sourcekey}">
                                                <li>
                                                    <a class="t9 m1"
                                                       href="Descriptions?op=SOURCE&sourceKey=${link.s.sourcekey}">View</a>
                                                    <span title="${link.sourceString}"><strong>${link.a.siglum}</strong></span>
                                                        ${link.s.shelfmark}
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                    </ul>

                                </c:if>
                            </li>
                        </c:forEach>
                    </ul>
                </dd>
            </c:if>

            <c:if test="${source.copyists!=null}">
                <dt class="colourA">Copyists</dt>
                <dd>

                    <ul>
                        <c:forEach var="copyist" items="${source.copyists}">
                            <li>Copyist:<c:if
                                    test="${copyist.sourcecopyist.attributionUncertain eq 'Y'}">?</c:if> ${copyist.copyist.copyistname}
                                (${copyist.type.copyisttype})
                            </li>
                        </c:forEach>
                    </ul>
                </dd>
            </c:if>
            <c:if test="${source.persons!=null}">
                <dt class="colourA">Persons and places</dt>
                <dd>

                    <ul>
                        <c:forEach items="${source.persons}" var="p">
                            <li><c:if
                                    test="${p.sourcealperson.attributionUncertain eq 'Y'}">?</c:if> ${p.sourcealperson.alpersonrelationship.relationshipType}: ${p.p.fullname}
                                <c:if test="${p.affiliation.alaffiliationkey>0}"> (${p.affiliation.affiliation}) </c:if>
                            </li>
                        </c:forEach>
                    </ul>

                </dd>
            </c:if>
        </dl>
    </div>
</c:if>
<c:if test="${source.images!=null&&fn:length(source.images)>0}">
    <div id="imageList" class="s7">

        <ul>
            <c:forEach var="image" items="${source.images}">
                <li>
                    <c:if test="${image.filename!=null}">

                        <a href="AnnotationManager?imageKey=${image.imagekey}">
                            <img height="100" src="../_a/i/spinner.gif"
                                 data-src="/thumbsup/${image.filename}"/>
                        </a>
                        <span> ${image.folio}</span>

                    </c:if>
                </li>
            </c:forEach>
        </ul>
        <div class="kakadu">
            <p>Images served from JPEG2000 powered by <a href="http://www.kakadusoftware.com/">kakadu software</a></p>
        </div>
    </div>
</c:if>
<div id="notes" class="s7">
    <div id="transcriptions" class="itl m0">

        <ul>
            <c:forEach var="pbComm" items="${publicSourceNotes}">
                <li><label>${pbComm.user.displayName} (${pbComm.dateDisplay}) </label>
                    <d:userLoggedIn>
                        <c:if test="${pbComm.user.username eq pageContext.request.remoteUser}">
                            <div class="editIcons">
				<span class="edit"><a rel="#update-note"
                                      href="note_${pbComm.notekey}"
                                      class="t10 m2">Edit</a></span>
                                <a href="AnnotationManager?op=deleteNote&noteKey=${pbComm.notekey}&sourceKey=${source.s.sourcekey}"
                                   class="t10 m3 deleteNote">Delete</a>
                            </div>

                        </c:if>
                    </d:userLoggedIn>

                    <div id="note_${pbComm.notekey}">${pbComm.notetext}
                        <d:userLoggedIn>
                            <c:if test="${pbComm.user.username eq pageContext.request.remoteUser}">
                                <%--<a href="#" class="t10 m2">Edit</a>--%>

                            </c:if>
                        </d:userLoggedIn>
                    </div>

                </li>
            </c:forEach>

            <d:userLoggedIn>
                <c:forEach var="pvComm" items="${privateSourceNotes}">
                    <li><label>Your private comment (${pvComm.dateDisplay})
                    </label>

                        <div class="editIcons">
					<span class="edit"><a rel="#update-note"
                                          href="note_${pvComm.notekey}"
                                          class="t10 m2 privateNote">Edit</a></span>
                            <a href="AnnotationManager?op=deleteNote&noteKey=${pvComm.notekey}&sourceKey=${source.s.sourcekey}"
                               class="t10 m3">Delete</a>
                        </div>
                        <div id="note_${pvComm.notekey}">${pvComm.notetext}</div>

                    </li>
                </c:forEach>
            </d:userLoggedIn>
        </ul>

        <d:userLoggedIn>
            <a id="addComment" rel="#add-note" href="note_0">Add comment</a>

            <div id="add-note">
                <h3>Add new note</h3>

                <form action="AnnotationManager" method="POST">
                    <input type="hidden" name="op" value="createNote"/>
                    <input type="hidden" name="sourceKey" value="${source.s.sourcekey}"/>
                    <input type="hidden" name="noteType" value="COM"/>

                    <div id="noteType">
                        <input type="radio" name="noteVis" value="PV" checked="checked"/> Private
                        <input type="radio" name="noteVis" value="PB"/> Public
                    </div>
                    <div class="textarea">
                        <textarea rows="4" cols="20" name="noteText"></textarea>
                    </div>

                    <input class="submit-button" type="submit" name="create" value="Add New Note" id="add-note-submit"/>

                </form>
            </div>
            <div id="update-note">

                <form action="/jsp/AnnotationManager" method="POST" id="noteForm">
                    <input type="hidden" name="op" value="updateNote"/>
                    <input type="hidden" name="imageKey" value="${image.imagekey}"/>
                    <input type="hidden" name="noteKey" id="updateNoteKey" value="0"/>
                        <%--<input type="hidden" name="imageKey" value="${image.imagekey}"/>--%>
                    <div id="noteType">
                        <select name="noteType" id="updateNoteType">
                            <option value="COM">Comment</option>
                            <option value="TRA">Transcription</option>
                        </select>
                        <input type="radio" name="noteVis" value="PV" id="updateNotePrivate"
                                /> Private
                        <input type="radio" name="noteVis" id="updateNotePublic"
                               checked="checked" value="PB"/> Public
                    </div>
                    <div class="textarea">
                        <textarea rows="4" cols="20" id="updateNoteText" name="noteText"></textarea>
                    </div>
                    <input class="submit-button" type="submit" name="create" value="Update" id="update-note-submit"/>

                </form>
            </div>
        </d:userLoggedIn>
    </div>
</div>

</div>

</div>
</div>
<div id="overlay">
    <div class="overlayContent"></div>
</div>
</body>
</html>
