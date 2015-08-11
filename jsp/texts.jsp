<%--
  Created by IntelliJ IDEA.
  User: Elliott Hall
  Date: 16-Nov-2010
  Time: 10:36:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page isELIgnored="false" %>

<c:if test="${detailItem!=null&&detailItem.texts!=null}">

    <h3>Incipit and full text - Original Spelling</h3>

    <table>
        <tbody>
        <tr>
            <th>Voice</th>
            <th>Texts</th>
            <th>Clef</th>
            <th>Mensuration</th>
            <th>Language</th>
            <th>Incipit</th>
                <%--<th>Full text (original)</th>
              <th>Full text (standardised)</th>--%>
        </tr>
        <c:forEach var="t" items="${detailItem.texts}">

            <tr>
                <td><c:if test="${t.t.voicepart!=null}">${t.t.voicepart}</c:if></td>
                <td><c:if test="${t.voice!=null}">${t.voice.voice}</c:if></td>
                <td><c:if
                        test="${t.clef!=null&&t.clef.clef!=null&&t.clef.clef ne 'no designation'}">${t.clef.clef}</c:if></td>
                <td><c:if
                        test="${t.mensuration!=null&&t.mensuration.mensurationsign ne 'null'}">${t.mensuration.mensurationsign}</c:if></td>
                <td>
                    <c:if test="${t.langs!=null}">
                        <c:forEach var="l" items="${t.langs}">
                            ${l.language}
                        </c:forEach>
                    </c:if>
                </td>
                <td>${t.t.textincipit}
                <c:if test="${t.t.standardspellingincipit!=null}">
                     (standardised: ${t.t.standardspellingincipit})
                </c:if>

                </td>
            </tr>
            <tr>
                <th>Full Text (Original)</th>
                <td colspan="5"><c:if test="${t.fullterm!=null&&fn:length(t.fullterm)>0}">
                    ${t.fullterm}
                </c:if></td>
            </tr>
            <tr class="ruled-bottom">
                <th>Full Text (Standardised)</th>
                <td colspan="5"><c:if test="${t.fulltermstandard!=null&&fn:length(t.fulltermstandard)>0}">
                    ${t.fulltermstandard}
                </c:if></td>
            </tr>


        </c:forEach>
        </tbody>
    </table>

</c:if>