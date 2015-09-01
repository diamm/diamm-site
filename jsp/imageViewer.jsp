<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%--
  Created by IntelliJ IDEA.
  User: Elliott Hall
  Date: 13-Dec-2010
  Time: 17:12:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="d" uri="DiammTags" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>DIAMM Image Viewer</title>
    <link rel="stylesheet" type="text/css" media="all" href="../_a/c/omniviewer.css"/>
    <%--<link rel="stylesheet" type="text/css" media="all" href="../_a/c/cch.css"/>--%>
    <link rel="stylesheet" type="text/css" href="../_a/c/a.css"/>
    <!--link rel="stylesheet" type="text/css" href="../_a/c/s2.css"/-->
    <link rel="stylesheet" type="text/css" href="../_a/c/s.css"/>
    <!--[if IE 7]>
    <link rel="stylesheet" type="text/css" href="../_a/c/msie.7.css" media="screen"/><![endif]-->
    <!--[if IE 8]>
    <link rel="stylesheet" type="text/css" href="../_a/c/msie.8.css" media="screen"/><![endif]-->
    <!--[if IE 9]>
    <link rel="stylesheet" type="text/css" href="../_a/c/msie.9.css" media="screen"/><![endif]-->


    <script type="text/javascript" src="../_a/s/jquery-1.6.2.min.js"></script>


    <%--<script type="text/javascript" src="../_a/s/c.js"></script>--%>
    <!--script type="text/javascript" src="../_a/s/jquery-1.4.2.min.js"></script-->
    <%-- <script type="text/javascript" src="../_a/s/jquery-ui-1.8.10.custom.min.js"></script>--%>
    <script type="text/javascript" src="../_a/s/jquery.ui.core.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.ui.button.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.ui.tabs.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.ui.mouse.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.ui.position.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.ui.draggable.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.ui.droppable.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.ui.autocomplete.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.cluetip.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.hoverIntent.js"></script>


    <%--<script type="text/javascript" src="../_a/s/jquery.jeditable.mini.js"></script>--%>
    <script type="text/javascript" src="../_a/s/jquery.tmpl.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.omniviewer-wdgt.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.mousewheel.js"></script>
    <script type="text/javascript" src="../_a/s/jq.truncator.min.js"></script>
    <script src="../_a/s/jquery.tools.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://use.typekit.com/tae2ufe.js"></script>
    <script type="text/javascript">try {
        Typekit.load();
    } catch(e) {
    }</script>
    <script type="text/javascript" src="../_a/s/tiny_mce/tiny_mce.js"></script>


    <script src="../_a/s/jquery.dimensions.min.js"></script>
    <style>

        .ui-dialog .ui-state-error {
            padding: .3em;
        }

        .validateTips {
            border: 1px solid transparent;
            padding: 0.3em;
        }
    </style>
    <script type="text/javascript">
        // The iipsrv server path (/fcgi-bin/iipsrv.fcgi by default)
        var server = '/iip/iipsrv.fcgi';
        // The *full* image path on the server. This path does *not* need to be in the web
        // server root directory. On Windows, use Unix style forward slash paths without
        // the "c:" prefix
        var images = ['${image.filename}.jp2'];
        var firstImage=images;
        var secondImage;

        // Copyright or information message
        var credit = "<c:if test="${image.copyrightstatement!=null}">${image.copyrightstatement}</c:if>";
        var ow1;
        var ow2;
    </script>
    <script type="text/javascript" src="../_a/s/imageViewer.js"></script>
</head>
<body id="t3">
<div id="gw">
<jsp:include page="banner.jsp"/>
<div id="cs">


<br/>

<div class="utl viewerActions">
    <ul>
        <li class="mega compare"><a href="#">Compare</a>

            <div class="megadrop">
                <p><strong>Show a second image</strong></p>
                <ul>
                    <li><c:if test="${prev!=null&&prev.folio!=null}">
                        <a class="openAlt" rel="${prev.filename}"
                           href="AnnotationManager?imageKey=${prev.imagekey}">previous
                            ${prev.folio} </a>
                    </c:if>
                    </li>
                    <li><c:if test="${next!=null&&next.folio!=null}">
                        <a class="openAlt" rel="${next.filename}"
                           href="AnnotationManager?imageKey=${next.imagekey}">next
                            ${next.folio} </a>
                    </c:if>
                    </li>
                    <c:if test="${seconds!=null}">
                        <c:forEach var="s" items="${seconds}">
                            <li>
                                <a class="openAlt" rel="${s.filename}"
                                   href="AnnotationManager?imageKey=${s.secondaryimagekey}">${s.caption}</a>
                            </li>
                        </c:forEach>
                    </c:if>

                    <c:if test="${source.rismimagefilename1!=null&&fn:length(source.rismimagefilename1)>0}">
                        <li>
                            <a class="openRISM"
                               href="http://images.cch.kcl.ac.uk/diamm/liv/rism/mainpages/${source.rismimagefilename1}.png">RISM
                                1</a>

                            <c:if test="${source.rismimagefilename2!=null&&fn:length(source.rismimagefilename2)>0}">
                                <a class="openRISM"
                                   href="http://images.cch.kcl.ac.uk/diamm/liv/rism/mainpages/${source.rismimagefilename2}.png">RISM
                                    2</a>
                            </c:if>
                            <c:if test="${source.rismimagefilename3!=null&&fn:length(source.rismimagefilename3)>0}">
                                <a class="openRISM"
                                   href="http://images.cch.kcl.ac.uk/diamm/liv/rism/mainpages/${source.rismimagefilename3}.png">RISM
                                    3</a>
                            </c:if>
                        </li>
                    </c:if>
                    <li><a href="#" id="swap" class="t10 m0 s5">Swap images</a></li>
                    <li><a href="#" id="mirror" class="t10 m0 s5">Synchronise Pan and Scroll</a></li>
                    <li><a href="#" id="closeComparison" class="t10 m1">Close second image</a></li>
                </ul>
            </div>
        </li>
        <c:if test="${commented!=null&&fn:length(commented)>0}">
            <li class="mega ">
                <a href="#">Images I've annotated</a>

                <div class="megadrop">
                    <ul>

                        <c:forEach var="s" items="${commented}">
                            <c:if test="${s.filename ne image.filename}">
                                <li>
                                    <a class="openAlt" rel="${s.filename}"
                                       href="AnnotationManager?imageKey=${s.imagekey}">${s.sourceBySourcekey.shelfmark}
                                        > ${s.folio}</a>
                                </li>
                            </c:if>
                        </c:forEach>

                    </ul>

                </div>
            </li>
        </c:if>
        <d:userLoggedIn>
            <li class="mega comment">
                <a href="#">Comment</a>

                <div class="megadrop">
                    <ul>
                        <li><a id="addComment" rel="#add-note" href="note_0">Add comment</a></li>

                    </ul>

                </div>
            </li>
        </d:userLoggedIn>
        <d:userLoggedIn>
            <li class="mega collection">

                <a href="CollectionLink?linkId=${image.imagekey}&linkType=image" class="collectionOverlay"
                   rel="#overlay">Add to collection</a>

            </li>
            <c:if test="${attachedCollections!=null&&fn:length(attachedCollections)>0}">
                <li class="mega imagecollections">
                    <a href="#">Collections with this image</a>

                    <div class="megadrop">
                        <ul>
                            <c:forEach var="coll" items="${attachedCollections}">
                                <li>
                                    <a href="CollectionManage?fullDetails=fullDetails&origCollId=${coll.id}">${coll.title}</a>
                                </li>

                            </c:forEach>
                        </ul>
                    </div>


                </li>
            </c:if>

        </d:userLoggedIn>
        <li class="mega collection">

            <a href="#" id="tO" rel="#testOverlay">Fullscreen</a>

        </li>
        <li class="mega collection">

            <a href="#" id="manuscript" rel="#thumbOverlay">Manuscript</a>

        </li>

    </ul>
</div>


<div class="hdp">
    <h1>${source.shelfmark}: ${image.folio}</h1>
    <ul class="itp">
        <c:if test="${prev==null}">
            <li class="s5">&#8249; </li>
        </c:if>
        <c:if test="${prev!=null}">
            <li><a href="AnnotationManager?imageKey=${prev.imagekey}">&#8249; </a></li>
        </c:if>
        <c:if test="${sourceImages!=null}">
            <c:choose>
                <c:when test="${fn:length(sourceImages)>20}">
                    <li class="s4"><a href="4" target="_self">...</a>
                        <ul>
                            <c:forEach var="i" items="${sourceImages}" varStatus="c">
                                <c:choose>
                                    <c:when test="${i.orderno==image.orderno}">
                                        <li class="s1">${i.folio} </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a href="AnnotationManager?imageKey=${i.imagekey}">${i.folio}</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </ul>
                    </li>
                </c:when>
                <c:otherwise>
                    <c:forEach var="i" items="${sourceImages}" varStatus="c">
                        <c:choose>
                            <c:when test="${i.orderno==image.orderno}">
                                <li class="s1">${i.folio} </li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="AnnotationManager?imageKey=${i.imagekey}">${i.folio}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </c:otherwise>

            </c:choose>
        </c:if>

        <c:if test="${next!=null}">
            <li><a href="AnnotationManager?imageKey=${next.imagekey}"> &#8250;</a></li>
        </c:if>
        <c:if test="${next==null}">
            <li class="s5">&#8250;</li>
        </c:if>
    </ul>
</div>
<div class="imb">

    <div id="ow_1" class="u u1"></div>
    <div id="ow_2" class="u u2"></div>
</div>
<div class="kakadu">
    <p>Images served from JPEG2000 powered by <a href="http://www.kakadusoftware.com/">kakadu software</a> </p>
</div>
<h3>Image Metadata</h3>
<img src="http://images.cch.kcl.ac.uk/diamm/liv/archives/${archive.archivekey}.png" alt="" class="m0"/>
<dl class="m0">
    <c:if test="${image.copyrightstatement!=null}">
        <dt>Image copyright:</dt>
        <dd> ${image.copyrightstatement}</dd>
    </c:if>
    <dt>Source Path:</dt>
    <dd><a href="FacetManager?op=1&FacetType=SOURCEFACET&alCityKey=${city.alcitykey}">${city.city}</a> &#8250; <a
            href="Descriptions?op=ARCHIVE&archiveKey=${archive.archivekey}">${archive.archivename}</a> &#8250; <a
            href="Descriptions?op=SOURCE&sourceKey=${source.sourcekey}">${source.shelfmark}</a> &#8250;
        <strong>${image.folio}</strong></dd>
</dl>

<h3 id="annotations">Annotations</h3>

<div id="transcriptions" class="itl m0">

    <c:if test="${pbCommList!=null&&fn:length(pbCommList)>0}">
    <p class="ko">Comments</p>
    <ul>
        <c:forEach var="pbComm" items="${pbCommList}">
            <li><label>${pbComm.user.displayName} (${pbComm.dateDisplay}) </label>
                <d:userLoggedIn>
                    <c:if test="${pbComm.user.username eq pageContext.request.remoteUser}">
                        <div class="editIcons">
				<span class="edit"><a rel="#update-note"
                                      href="note_${pbComm.notekey}"
                                      class="t10 m2">Edit</a></span>
                            <a href="AnnotationManager?op=deleteNote&noteKey=${pbComm.notekey}&imageKey=${image.imagekey}"
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
        </c:if>
        <c:if test="${pvCommList!=null&&fn:length(pvCommList)>0}">
        <d:userLoggedIn>
            <c:forEach var="pvComm" items="${pvCommList}">
                <li><label>Your private comment (${pvComm.dateDisplay})
                </label>

                    <div class="editIcons">
					<span class="edit"><a rel="#update-note"
                                          href="note_${pvComm.notekey}"
                                          class="t10 m2 privateNote">Edit</a></span>
                        <a href="AnnotationManager?op=deleteNote&noteKey=${pvComm.notekey}&imageKey=${image.imagekey}"
                           class="t10 m3">Delete</a>
                    </div>
                    <div id="note_${pvComm.notekey}">${pvComm.notetext}</div>

                </li>
            </c:forEach>
        </d:userLoggedIn>
    </ul>
    <!-- end comments -->
    </c:if>
    <c:if test="${pbTranList!=null&&fn:length(pbTranList)>0}">
        <!-- Added transcriptions -->
        <p class="ko">Transcriptions</p>
        <ul>
            <li>
                <c:forEach var="pbTran" items="${pbTranList}">

                <label>${pbTran.user.displayName} (${pbTran.dateDisplay})</label>

                <div class="editIcons">
				<span class="edit"><a rel="#update-note"
                                      href="note_${pbTran.notekey}"
                                      class="t10 m2 noteTrans">Edit</a></span>
                    <a href="AnnotationManager?op=deleteNote&noteKey=${pbTran.notekey}&imageKey=${image.imagekey}"
                       class="t10 m3">Delete</a>
                </div>

                <div id="note_${pbTran.notekey}">${pbTran.notetext} </div>
                <d:userLoggedIn>
                    <c:if test="${pbTran.user.username eq pageContext.request.remoteUser}">
                        <%--<a href="#" class="t10 m2">Edit</a>--%>

                    </c:if>
                </d:userLoggedIn>
            </li>
            </c:forEach>


        </ul>
    </c:if>
    <d:userLoggedIn>
        <c:forEach var="pvTran" items="${pvTranList}">
            <p><i class="t9 m1">Private</i>
                <label>Your private transcription (${pvTran.dateDisplay})</label>

            <div class="editIcons">
				 <span class="edit"><a rel="#update-note"
                                       href="note_${pvTran.notekey}"
                                       class="t10 m2">Edit</a></span>
                <a href="AnnotationManager?op=deleteNote&noteKey=${pvComm.notekey}&imageKey=${image.imagekey}"
                   class="t10 m3">Delete</a>
            </div>

            <div class="editable" id="note_${pvTran.notekey}">${pvTran.notetext} </div>

            </p>
        </c:forEach>
    </d:userLoggedIn>

    <!-- end added transcriptions -->
    <!-- end existing notes -->
    <d:userLoggedIn>
        <div id="add-note">
            <h3>Add new note</h3>

            <form action="AnnotationManager" method="POST">
                <input type="hidden" name="op" value="createNote"/>
                <input type="hidden" name="imageKey" value="${image.imagekey}"/>

                <div id="noteType">
                    <select name="noteType">
                        <option value="COM" selected="selected">Comment</option>
                        <option value="TRA">Transcription</option>
                    </select>
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
                    <input type="radio" name="noteVis" value="PV" id="updateNotePrivate"/> Private
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
<div id="fs"></div>

<div id="overlay">
    <div class="overlayContent"></div>

</div>

<div id="testOverlay">
    <div style="position:absolute; z-index:9999; top: 0; left: 0; opacity: 0.8; font-size:85%; color: #333; line-height: 1.35em; padding:10px; background:#fff;">
        <span>${city.city} &#8250; ${archive.archivename} &#8250; ${source.shelfmark} &#8250; f. ${image.folio}<br/>${image.copyrightstatement}</span>
    </div>
    <div id="ow_3"></div>
</div>

<div id="thumbOverlay">
    <div class="overlayContent" id="imageList">
        <ul>
            <c:forEach var="i" items="${sourceImages}" varStatus="c">
                <c:choose>
                    <c:when test="${i.orderno==image.orderno}">
                        <li class="s1"><img height="100" style="border:3px solid #c00;padding:3px"
                                            src="/thumbsup/${i.filename}"/>
                            <span>${i.folio}</span></li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <c:if test="${i.filename!=null}">
                                <a href="AnnotationManager?imageKey=${i.imagekey}"><img height="100"
                                        src="//diamm.cch.kcl.ac.uk/thumbsup/${i.filename}"/></a>
                                <c:if test="${i.folio!=null}"><span>${i.folio}</span></c:if>
                            </c:if>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </ul>
    </div>
</div>

</body>

</html>


