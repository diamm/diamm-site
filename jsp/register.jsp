<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <head>
        <title>Register with DIAMM</title>
        <link rel="stylesheet" type="text/css" href="../_a/c/a.css"/>
        <link rel="stylesheet" type="text/css" href="../_a/c/s.css"/>
        <!--[if IE 7]><link rel="stylesheet" type="text/css" href="../_a/c/msie.7.css" media="screen" /><![endif]-->
        <!--[if IE 8]><link rel="stylesheet" type="text/css" href="../_a/c/msie.8.css" media="screen" /><![endif]-->
        <!--[if IE 9]><link rel="stylesheet" type="text/css" href="../_a/c/msie.9.css" media="screen" /><![endif]-->
        <script src="../_a/s/jquery-1.5.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="http://use.typekit.com/tae2ufe.js"></script>
        <script type="text/javascript">try {
            Typekit.load();
        } catch(e) {
        }</script>
    <script src="../_a/s/c.js" type="text/javascript"></script>
</head>
<body>
    <jsp:include page="banner.jsp"/>
    <div id="container">
        <h3>Register with DIAMM</h3>   
        <c:choose>
        <c:when test="${!registerSuccess}">

        <form action="UserAccess" method="post">
            <fieldset class="f5">
                <legend>User Agreement</legend>
                <ol>
                    <li>You will not communicate the password and username you are given to any other person or any third party for any reason (please apply to diamm@music.ox.ac.uk for teaching/course accounts);</li>
                    <li>You will not download, copy, redistribute or print any image obtained through the DIAMM website, nor use any image from DIAMM for a commercial purpose;</li>
                    <li>You understand that downloading images from the DIAMM website is theft;</li>
                    <li>You will not reproduce text from the site in any other medium apart from quoted excerpts as permitted by UK copyright law;</li>
                    <li>You are permitted to make and publish editions and/or make recordings of music from any source accessed through the site;</li>
                    <li>You are permitted to make links to any page of the website from any other resource or medium (please note that although every effort is made to ensure permanence of URLs, the site owner is not responsible for maintaining links outside the website should page URLs change);</li>
                    <li>You will inform DIAMM and the manuscript owner of the relevant manuscript of any publication regarding a manuscript source, so that bibliographical information about manuscripts can be maintained;</li>
                    <li>You will acknowledge the use of DIAMM where appropriate in any publications or distributed research;</li>
                    <li>You will not infringe any copyright either of the manuscript owners or the image creator;</li>
                    <li>You understand that a breach of the rights or ownership covered in this agreement may result in prosecution under UK law.</li>
                    <li><label for="agree4"><input type="checkbox" name="agree4" id="agree4" value="-1" />I agree</label></li>
		<input type="hidden" id="agree1" name="agree1" value="1" />
		<input type="hidden" id="agree2" name="agree2" value="1" />
		<input type="hidden" id="agree3" name="agree3" value="1" />
                </ol>
            </fieldset>
            <input type="hidden" name="action" value="register"/>
            <span class="msg2">${errorMessages.terms}</span>
            <ul class="register">
                <li>
                <label>Username</label><span class="msg1">*</span><br />
                <input type="text" class="text" name="username" value="${userDetails.username}" maxlength="20"/>
                <span class="msg2">${errorMessages.username}</span>
                </li>
                <li>
                <label>Name</label><span class="msg1">*</span><br />
                <input type="text" class="text" name="displayName" value="${userDetails.displayName}" maxlength="50"/>
                <span class="msg2">${errorMessages.displayName}</span>
                </li>
                <li>
                <label>Email</label><span class="msg1">*</span><br />
                <input type="text" class="text" name="email" value="${userDetails.email}" maxlength="80"/>
                <span class="msg2">${errorMessages.email}</span>
                </li>
                <li>
                <label>Affiliation (max 200 characters)</label><br />
                <textarea name="affiliation" >${userDetails.affiliation}</textarea>
                <span class="msg2">${errorMessages.affiliation}</span>
                </li>
                <li class="buttons">
                <input type="submit" name="submit" value="Submit">
                <input type="submit" name="reset" value="Reset">
                </li>
            </ul>
        </form>

        </c:when>
        <c:otherwise>
        <p>You have now successfully registered as a DIAMM user and will receive your login details by email.</p>
        </c:otherwise>
        </c:choose>

        <p><a href="myDiamm.jsp">Return to Login screen</a></p>
    </div>
</body>
</html>
