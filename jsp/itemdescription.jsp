<%--
  Created by IntelliJ IDEA.
  User: Elliot
  Date: 22/02/11
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
<head><title>Item Description</title>
    <link rel="stylesheet" type="text/css" media="all" href="../_a/c/a.css"/>
    <link rel="stylesheet" type="text/css" media="screen, projection" href="../_a/c/s.css"/>
    <!--[if IE 7]><link rel="stylesheet" type="text/css" href="../_a/c/msie.7.css" media="screen" /><![endif]-->
    <!--[if IE 8]><link rel="stylesheet" type="text/css" href="../_a/c/msie.8.css" media="screen" /><![endif]-->
    <!--[if IE 9]><link rel="stylesheet" type="text/css" href="../_a/c/msie.9.css" media="screen" /><![endif]-->
    <script type="text/javascript" src="../_a/s/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.ui.core.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.ui.tabs.js"></script>
    <script type="text/javascript" src="http://use.typekit.com/tae2ufe.js"></script>
    <script type="text/javascript">try{Typekit.load();}catch(e){}</script>
            <script type="text/javascript" src="../_a/s/jquery.tools.min.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.hoverIntent.js"></script>
    <script type="text/javascript" src="../_a/s/c.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            // $("#f1").hide();
            $("#detailTabs").tabs();
            <c:if test="${detailItem!=null&&detailItem.disablestring!=null}">
            $("#detailTabs").tabs("option", "disabled", [${detailItem.disablestring}]);

            </c:if>
        });
    </script>
</head>
<body>
<jsp:include page="banner.jsp"/>

<jsp:include page="itemdetail.jsp"/>
  <div id="overlay">
      <div class="overlayContent"></div>
</div>
</body>
</html>