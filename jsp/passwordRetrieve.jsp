<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
  <head>
    <title>Retrive Username and Password</title>
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
  <body id="t6">
    <jsp:include page="banner.jsp"/>
    <div id="container">
    <h3>Retrieve your username and password</h3>
    <c:choose>
      <c:when test="${!retrieveSuccess}">
        
          <p>To receive a reminder of your login details, enter the e-mail address you registered with, and click 'Submit'.</p>
        <div>
          <form action="UserAccess?action=retrievePassword" method="post">
            <div>
              <label>Email</label>
              <input type="text" class="text" name="email" value="${userDetails.email}" maxlength="80"/>
              <span class="msg2">${errorMessages.email}</span>
            </div>
            <div class="action">
              <input type="submit" name="submit" value="Submit">
            </div>
          </form>
        </div>
      </c:when>
      <c:otherwise>
        <p>Your DIAMM username and a new password will be sent to you by email.</p>
      </c:otherwise>
    </c:choose>        
    
    <p><a href="myDiamm.jsp">Return to Login screen</a></p>
    </div>
  </body>
</html>