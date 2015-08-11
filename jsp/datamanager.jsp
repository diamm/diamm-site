<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Elliot
  Date: 04/09/12
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head><title>DIAMM Data Manager</title></head>
<body>
<h1>DIAMM DATA MANAGEMENT</h1>
<p>To move data from stg to live, do the following:

<ol>
    <li>Click on link below to back up staging server.  A new backup will appear in the first list (all are time and date coded.)</li>
    <li>Click 'push to live' to use this data for the live server.  The live server will be backed up automatically.</li>
    <li>To undo a push, press the 'Restore' link on one of the live backups.</li>

</ol>
</p>
<div id="exported">
    <a href="DataManager?op=3">Back up Staging Server</a>
    <table class="export">
        <tr>
            <th>Most Recent backups from staging server</th>
            <th class="edit">Download</th>
        </tr>
        <c:forEach var="file" items="${stgFileList}">
           <tr class="filename">
                        <td class="filename">${file}</td>
                        <td class="download"><a href="DataManager?op=4&filename=${file}">Push to Live</a></td>
                    </tr>
        </c:forEach>
    </table>
    <c:if test="${empty stgFileList}">There are no backups</c:if>

    <table class="export">
        <tr>
            <th>Most Recent backups from live server</th>
            <th class="edit">Download</th>
        </tr>
        <c:forEach var="file" items="${liveFileList}">
            <c:choose>
                <c:when test="${file eq sessionScope.myExport}">
                    <tr class="myFilename">
                        <td class="filename">${file}</td>
                        <td class="download"><a href="DataManager?op=4&filename=${file}"><img src="images/download.png"
                                                                                             title="Push to Live"/></a></td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <tr class="filename">
                        <td class="filename">${file}</td>
                        <td class="download"><a href="DataManager?op=4&filename=${file}">Restore to Live</a></td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </table>
    <c:if test="${empty liveFileList}">There are no backups</c:if>
</div>
</body>
</html>