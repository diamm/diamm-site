<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
<head>
    <title>My Diamm</title>
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
    <script type="text/javascript">

    </script>
    <script type="text/javascript" src="http://use.typekit.com/tae2ufe.js"></script>
    <script type="text/javascript">try {
        Typekit.load();
    } catch(e) {
    }</script>
</head>
<body id="t6">
<jsp:include page="banner.jsp"/>

<div id="cs">
    <div class="c c1">
        <c:choose>
            <c:when test="${userDetails!=null}">
                <h2>My Details</h2>
                <ul class="s8">

                    <li><a href="MyDiamm">Your comments</a></li>
                    <li><a href="UserAccess?action=changePassword">Change password</a></li>

                    <li><a href="CollectionManage">Manage my collections</a></li>

                </ul>

                 <div>
                <form action="UserAccess" method="post">
                    <input type="hidden" value="editAccount" name="action"/>
                    <ul class="register">
                        <li>
                            <label>Username</label><span class="msg1">*</span><br/>
                            <input type="text" class="text" name="username" value="${userDetails.username}"
                                   maxlength="20"/>

                        </li>
                        <li>
                            <label>Name</label><span class="msg1">*</span><br/>
                            <input type="text" class="text" name="displayName" value="${userDetails.displayName}"
                                   maxlength="50"/>

                        </li>
                        <li>
                            <label>Email</label><span class="msg1">*</span><br/>
                            <input type="text" class="text" name="email" value="${userDetails.email}" maxlength="80"/>

                        </li>
                        <li>
                            <label>Affiliation (max 200 characters)</label><br/>
                            <textarea name="affiliation">${userDetails.affiliation}</textarea>
                        </li>
                        <li class="buttons">
                            <input type="submit" name="submit" value="Submit">

                        </li>
                    </ul>
                </form>
                     </div>
            </c:when>
            <c:when test="${editResult!=null}">
                <h2>Details Changed</h2>

                <ul class="s8">

                    <li><a href="UserAccess?action=editAccount">Edit my details</a></li>
                    <li><a href="UserAccess?action=changePassword">Change password</a></li>

                    <li><a href="CollectionManage">Manage my collections</a></li>

                </ul>
            </c:when>
            <c:otherwise>
                <h2>My Diamm</h2>
                <ul class="s8">

                    <li><a href="UserAccess?action=editAccount">Edit my details</a></li>
                    <li><a href="UserAccess?action=changePassword">Change password</a></li>

                    <li><a href="CollectionManage">Manage my collections</a></li>

                </ul>

            </c:otherwise>
        </c:choose>

    </div>
    <h3 id="annotations">Your comments</h3>
    <h4>Images</h4>
    <ul id="transcriptions" class="itl m0">
        <c:forEach var="pbComm" items="${commList}">
            <c:if test="${pbComm.noteImage!=null}">
                <li class="commentsListItem">
                    <div class="comments image">
                        <a href="AnnotationManager?imageKey=${pbComm.noteImage.imagekey}"><img height="100"
                                                                                               src="//diamm.cch.kcl.ac.uk/thumbsup/${pbComm.noteImage.filename}"/></a>
                        <c:if test="${pbComm.noteImage.folio!=null}"><span>${pbComm.noteImage.folio}</span></c:if>
                    </div>
                    <div class="comments">
                        <span class="commentDate">${pbComm.noteVisibility.description} (${pbComm.dateDisplay})</span>
                        <span class="commentText">${pbComm.notetext}</span>
                    </div>
                </li>
            </c:if>
        </c:forEach>
    </ul>

    <h4>Sources</h4>
    <ul class="itl m0">
        <c:forEach var="pbComm" items="${commList}">
            <c:if test="${pbComm.noteSource!=null}">
                <li class="commentsListItem">
                    <div class="comments image">
                        <a href="FacetManager?op=1&FacetType=SOURCEFACET&alCityKey=${pbComm.noteSource.archiveByArchivekey.alcityByAlcitykey.alcitykey}">${pbComm.noteSource.archiveByArchivekey.alcityByAlcitykey.city}</a>
                        &#8250; <a
                            href="Descriptions?op=ARCHIVE&archiveKey=${pbComm.noteSource.archiveByArchivekey.archivekey}">${pbComm.noteSource.archiveByArchivekey.archivename}</a>
                        &#8250; <a
                            href="Descriptions?op=SOURCE&sourceKey=${pbComm.noteSource.sourcekey}">${pbComm.noteSource.shelfmark}</a>

                    </div>
                    <div class="comments">
                        <span class="commentDate">${pbComm.noteVisibility.description} (${pbComm.dateDisplay})</span>
                        <span class="commentText">${pbComm.notetext}</span>
                    </div>
                </li>
            </c:if>
        </c:forEach>
    </ul>
    <div class="kakadu">
        <p>Images served from JPEG2000 powered by <a href="http://www.kakadusoftware.com/">kakadu software</a></p>
    </div>

</div>
</body>
</html>
