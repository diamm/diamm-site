<%--
  Created by IntelliJ IDEA.
  User: Elliot
  Date: 20/11/12
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<html>
<head><title>DIAMM DBMI</title></head>
<body>
<h1>DIAMM Editing links</h1>
<h2>Note on the BIG RED BUTTON:</h2>
<p>Said giant button will do four things: copy the staging and live databases, then push the staging copy to live.  In the last step it clears the cache for the facet browser so new data is added.  Please do not refresh or close the page while this is going on, as it can take a minute or two.  The first time you load the facet browser after an upload it will be slow as it rebuilds the cache. </p>
<c:if test="${message!=null}">
    ${message}
</c:if>
<ul>
    <li><a href="UserAccess?action=manager">User Manager</a></li>
    <li><a href="DataManager?op=4">BIG RED BUTTON</a></li>
    <%--<li><a href="jsp/UploadImages">Upload Images</a></li>--%>
</ul>
</body>
</html>