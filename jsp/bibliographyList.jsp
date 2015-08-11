<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page isELIgnored="false" %>

<div id="bibliography" class="record">
<div class="hdp">
  <h1>Bibliography</h1>
  </div>
    <ul>
        <c:forEach var="bib" items="${bibs}">
            <li>
                ${bib.bib.fulltextcalculated} ${bib.notes} <a class="t9 m1" href="BibliographyDetail?bibId=${bib.bib.bibliographykey}">View</a>
            </li>
        </c:forEach>
    </ul>
</div>