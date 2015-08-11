<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
<head>
    <title>Change Your DIAMM Password</title>
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
    <script type="text/javascript" src="http://use.typekit.com/tae2ufe.js"></script>
    <script type="text/javascript">try {
        Typekit.load();
    } catch(e) {
    }</script>

</head>
<body id="t6">
<jsp:include page="banner.jsp"/>
<div id="container">
    <h3>Change Your DIAMM Password</h3>

    <ul class="s8">
        <li><a href="MyDiamm">Your comments</a></li>
        <li><a href="UserAccess?action=editAccount">Edit my details</a></li>


        <li><a href="CollectionManage">Manage my collections</a></li>

    </ul>
    <c:choose>
        <c:when test="${!changeSuccess}">
            <div>
                <form action="UserAccess?action=changePassword" method="post">
                    <ul class="register">
                        <li>
                            <label>Username</label><br/>
                            <input type="text" class="text" name="username" value="${userDetails.username}" readonly/>
                        </li>
                        <li>
                            <label>Current Password</label><span class="msg1">*</span><br/>
                            <input type="password" class="text" name="currentPassword" value="${userDetails.password}"
                                   maxlength="20"/>
                            <span class="msg2">${errorMessages.password}</span>
                        </li>
                        <li>
                            <label>New Password</label><span class="msg1">*</span><br/>
                            <input type="password" class="text" name="newPassword1" value="${userDetails.newPassword1}"
                                   maxlength="20"/>
                            <span class="msg2">${errorMessages.newPassword1}</span>
                        </li>
                        <li>

                            <label>New Password (re-type)</label><span class="msg1">*</span><br/>
                            <input type="password" class="text" name="newPassword2" value="${userDetails.newPassword2}"
                                   maxlength="20"/>
                            <span class="msg2">${errorMessages.newPassword2}</span>
                        </li>
                        <li class="buttons">
                            <input type="submit" name="submit" value="Submit">
                            <input type="submit" name="reset" value="Reset">
                        </li>
                    </ul>
                </form>
            </div>
        </c:when>
        <c:otherwise>
            <p>You have successfully changed your DIAMM password.</p>
        </c:otherwise>
    </c:choose>

    <p><a href="myDiamm.jsp">Return to My Diamm Page</a></p>
</div>
</body>
</html>