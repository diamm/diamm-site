<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
<head>
    <title>Login Form</title>

    <link rel="stylesheet" type="text/css" href="../_a/c/a.css"/>
    <link rel="stylesheet" type="text/css" href="../_a/c/s.css"/>
    <!--[if IE 7]>
    <link rel="stylesheet" type="text/css" href="../_a/c/msie.7.css" media="screen"/><![endif]-->
    <!--[if IE 8]>
    <link rel="stylesheet" type="text/css" href="../_a/c/msie.8.css" media="screen"/><![endif]-->
    <!--[if IE 9]>
    <link rel="stylesheet" type="text/css" href="../_a/c/msie.9.css" media="screen"/><![endif]-->
    <script src="../_a/s/jquery-1.5.min.js" type="text/javascript"></script>
    <script src="../_a/f/agp.font.js" type="text/javascript"></script>
    <script src="../_a/s/c.js" type="text/javascript"></script>

    <script type="text/javascript" src="http://use.typekit.com/tae2ufe.js"></script>
    <script type="text/javascript">try {
        Typekit.load();
    } catch(e) {
    }</script>


</head>
<body id="t6">

<c:choose>
    <c:when test="${not empty param['retry']}">
        It was not possible to log in with the supplied username and password
    </c:when>

    <c:otherwise>
        <jsp:include page="banner.jsp"/>
        <div id="cs">
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

        </div>
    </c:otherwise>
</c:choose>

</body>
</html>