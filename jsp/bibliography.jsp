<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<html >
<head>

<title>Untitled Document</title>
<link rel="stylesheet" type="text/css" href="../_a/c/a.css"/>
<link rel="stylesheet" type="text/css" href="../_a/c/s.css"/>
<link rel="stylesheet" type="text/css" href="../_a/c/user.css"/>
  
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="../_a/c/msie.7.css" media="screen" /><![endif]-->
<!--[if IE 8]><link rel="stylesheet" type="text/css" href="../_a/c/msie.8.css" media="screen" /><![endif]-->
<!--[if IE 9]><link rel="stylesheet" type="text/css" href="../_a/c/msie.9.css" media="screen" /><![endif]-->
  
<script type="text/javascript" src="../_a/s/jquery-1.5.min.js"></script>
<script type="text/javascript" src="../_a/f/agp.font.js"></script>
<script type="text/javascript" src="../_a/s/c.js"></script>
<!--
<script type="text/javascript" src="_a/s/jquery-ui-1.8.10.custom.min.js"></script>
-->
<script type="text/javascript" src="../_a/s/jquery.ui.core.js"></script>
<script type="text/javascript" src="../_a/s/jquery.ui.widget.js"></script>
<script type="text/javascript" src="../_a/s/jquery.ui.button.js"></script>
<script type="text/javascript" src="../_a/s/jquery.ui.position.js"></script>
<script type="text/javascript" src="../_a/s/jquery.ui.autocomplete.js"></script>

<script type="text/javascript" src="http://use.typekit.com/tae2ufe.js"></script>
<script type="text/javascript">try{Typekit.load();}catch(e){}</script>
  <script type="text/javascript" src="../_a/s/jquery.tools.min.js"></script>
    <script type="text/javascript" src="../_a/s/c.js"></script>
  


</head>
<body id="t2">
  <div id="gw">
    <jsp:include page="banner.jsp"/>
    <div id="cs">
      <div class="hdp">
      <h1>Search the bibliography database</h1>
      </div>
      
      <form action="Bibliography" method="get" class="biblio">
        
        <ul class="fields">
          <li class="left">
            <label>Title</label><br />
            <input type="text" class="text" name="title" value="${bibSearch.title}"/>
          </li>
          <li class="right">
            <label>Person</label><br />
            <select name="authoreditor">
              <option value="all" <c:if test="${bibSearch.authoreditor eq 'all'}">selected="selected"</c:if> >All</option>
              <option value="author" <c:if test="${bibSearch.authoreditor eq 'author'}">selected="selected"</c:if> >Author</option>
              <option value="editor" <c:if test="${bibSearch.authoreditor eq 'editor'}">selected="selected"</c:if> >Editor</option>
              <option value="compiler" <c:if test="${bibSearch.authoreditor eq 'compiler'}">selected="selected"</c:if>>Compiler</option>
              <option value="Festschrift dedicatee" <c:if test="${bibSearch.authoreditor eq 'Festschrift dedicatee'}">selected="selected"</c:if>>Festschrift dedicatee</option>
              <option value="translator" <c:if test="${bibSearch.authoreditor eq 'translator'}">selected="selected"</c:if>>Translator</option>
              <option value="publisher" <c:if test="${bibSearch.authoreditor eq 'publisher'}">selected="selected"</c:if>>Publisher</option>
              <option value="copyist" <c:if test="${bibSearch.authoreditor eq 'copyist'}">selected="selected"</c:if>>Copyist</option>
            </select>
            <input type="text" class="text" name="author" value="${bibSearch.author}"/>
          </li>
          <li class="left">
            <label>Year</label><br />
            <input type="text" class="text" name="year" value="${bibSearch.year}"/>
          </li>
          <li class="right">
            <label>Publisher</label><br />
            <input type="text" class="text" name="publisher" value="${bibSearch.publisher}"/>
          </li>
          <li class="bt">
            <input type="submit" name="search" value="Search"/>
            <input type="submit" name="reset"  value="Reset"/>
          </li>
        </ul>
      </form>
      

    <div class="hdp">
      <c:choose>
        <c:when test="${pageNav.hasRecords}">
          <h1>Results <strong>${pageNav.firstRecordInPage} - ${pageNav.lastRecordInPage} of ${pageNav.totalRecordCount}</strong> Matching Records</h1>
        </c:when>
        <c:otherwise>
        </c:otherwise>
      </c:choose> 
    </div>

        <c:if test="${bibList!=null&&fn:length(bibList)==0}">
            <h2>No Results</h2>
            </c:if>
    <c:if test="${not empty bibList}">
      <ul class="m1">
        <c:forEach items="${bibList}" var="bib" varStatus="rowNum">
	      <c:url value="BibliographyDetail" var="bibDetailUrl">
	        <c:param name="parent"             value="bib"/>
	        <c:param name="title"              value="${bibSearch.title}"/>
	        <c:param name="author"             value="${bibSearch.author}"/> 
    	    <c:param name="year"               value="${bibSearch.year}"/>
	        <c:param name="publisher"          value="${bibSearch.publisher}"/>
              <c:param name="authoreditor"          value="${bibSearch.authoreditor}"/>
	        <c:param name="totalRecordCount"   value="${pageNav.totalRecordCount}"/>
	        <c:param name="bibOriginatingPage" value="${pageNav.selectedPage}"/>
	        <c:param name="bibPositionInPage"  value="${rowNum.count}"/>
	      </c:url>
          <li>${bib.fulltextcalculated} <a href="${bibDetailUrl}" class="t9 m1">View Record</a></li>
        </c:forEach>
      </ul>    
    </c:if>
    
    <c:if test="${pageNav.hasMultiplePages}">
      <c:url value="Bibliography" var="bibSearchUrl">
	    <c:param name="title"     value="${bibSearch.title}"/>
	    <c:param name="author"    value="${bibSearch.author}"/>
	    <c:param name="year"      value="${bibSearch.year}"/>
	    <c:param name="publisher" value="${bibSearch.publisher}"/>
           <c:param name="authoreditor"          value="${bibSearch.authoreditor}"/>
	    <c:param name="search"    value="Search"/>
	  </c:url>
      <jsp:include page="pageNavigator.jsp">
        <jsp:param value="${bibSearchUrl}" name="urlRoot"/>
      </jsp:include>
    </c:if>

  </div>
  <div id="fs"> </div>
</div>
   <div id="overlay">
      <div class="overlayContent"></div>
</div>
</body>
</html>
