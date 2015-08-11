<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page isELIgnored="false" %>



<div id="composition" class="record">
    <div class="hdp">
        <h1>Compositions</h1>
    </div>
    <ul>
        <c:forEach var="comp" items="${compositions}">
            <li>
            ${comp.compositionName}
                <a class="t9 m1" href="Descriptions?op=COMPOSITION&compositionKey=${comp.compositionkey}">View record</a>
            </li>
        </c:forEach>
    </ul>
</div>