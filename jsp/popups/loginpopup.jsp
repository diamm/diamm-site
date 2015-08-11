<%--
  Created by IntelliJ IDEA.
  User: Elliot
  Date: 23/08/11
  Time: 12:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="d" uri="DiammTags" %>

<%@ page isELIgnored="false" %>
<c:choose>
    <c:when test="${not empty param['retry']}">
        It was not possible to log in with the supplied username and password
    </c:when>
    <c:when test="${pageContext.request.remoteUser!=null}">
        <%=request.getHeader("referer")%>
    </c:when>
    <c:otherwise>
         ${pageContext.request.remoteUser}
        <div id="container" class="log">
            <h1>Login to DIAMM</h1>
            <p><strong>If you registered with the previous version of DIAMM, all spaces in usernames have been changed to underscores.  e.g. John Smith is now John_Smith</strong></p>
            <form action="j_security_check" method="post" id="loginForm">

                <dl>
                    <dt><label>Username</label></dt>
                    <dd><input type="text" class="text" name="j_username" maxlength="20"/></dd>
                </dl>
                <dl>

                    <dt><label>Password</label></dt>
                    <dd><input type="password" class="text" name="j_password" maxlength="20"/></dd>
                </dl>
                <input type="hidden" name="referrer" value="<%=request.getHeader("referer")%>"/>

                <div class="action">
                    <input type="submit" name="login" value="Login">
                    <span class="msg2"> </span>
                </div>
            </form>

            <ul>
                <li><a href="UserAccess?action=retrievePassword">Forgotten your login details?</a></li>
                <li><a href="/jsp/UserAccess?action=register">Don't have an account? <strong>Register now</strong>.</a>
                </li>
            </ul>
        </div>


    </c:otherwise>
</c:choose>