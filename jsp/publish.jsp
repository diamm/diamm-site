<%--
  Created by IntelliJ IDEA.
  User: Elliot
  Date: 08/04/11
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/xml;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<xml>
    <c:if test="${recentImages!=null}">
        <recentImages>
            <c:forEach var="image" items="${recentImages}">
                <image>
                    <title>${image.folio}</title>
                    <description>${image.sourceBySourcekey.archiveByArchivekey.siglum}  ${image.sourceBySourcekey.shelfmark}</description>
                    <url>//diamm.cch.kcl.ac.uk/thumbsup/${image.filename}</url>
                    <linkurl>jsp/AnnotationManager?imageKey=${image.imagekey}</linkurl>
                </image>
            </c:forEach>
        </recentImages>
    </c:if>
    <c:if test="${recentComments!=null}">
        <recentComments>
            <c:forEach var="note" items="${recentComments}">
            <note>
                <attached>${note.attachmentText}</attached>
                <timestamp>
                     ${note.note.dateModified}
                </timestamp>
                <noteText>${note.notetext}</noteText>
                <link>jsp/AnnotationManager?imageKey=${note.imagekey}</link>
            </note>
            </c:forEach>
        </recentComments>
    </c:if>
</xml>
