<%--
  Created by IntelliJ IDEA.
  User: Elliott Hall
  Date: 15-Nov-2010
  Time: 12:24:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page isELIgnored="false" %>

<h3 class="showList hide"><a href="FacetManager?op=9&FacetType=SECONDARYFACET">Other</a> <c:if test="${secondaryLabel!=null}">: ${secondaryLabel} </c:if> <a href="FacetManager?op=9&FacetType=SECONDARYFACET" class="t9 m0 <c:if test="${openFacet ne 'SECONDARYFACET'}">s78</c:if> <c:if test="${openFacet eq 'SECONDARYFACET'}">s77</c:if>" title="Collapse this Facet">Collapse</a></h3>
  <c:if test="${openFacet eq 'SECONDARYFACET'}">
<form class="fms" method="post" action="FacetManager">
    <fieldset class="m0">
        <input type="hidden" name="op" value="1"/>
        <input type="hidden" name="FacetType" value="SECONDARYFACET"/>
        <ul>
            <li>
                <label>Provenance</label>


                <input type="hidden" id="valuePROVENANCE" value="${alprovenancekey}" name="alprovenancekey"/>
                <input class="autoInput" id="PROVENANCE" name="alprovenance" value="${alprovenance}">
                    <button type="submit" class="select-go-button"><b class="t9 m5">Go</b></button>

                <%--<select name="alprovenancekey" id="provenanceSelect">
                    <option value="">Select</option>
                    <c:forEach var="prov" items="${provs}">
                        <option
                                <c:if test="${alprovenancekey==prov.key}">selected="selected"</c:if>
                                value="${prov.key}">${prov.label} (${prov.count})
                        </option>
                    </c:forEach>
                </select>--%>
            </li>
            <li>
                <label>Person </label>
                 <input type="hidden" id="valuePERSON" value="${alperson}" name="alpersonkey"/>
                <input class="autoInput" id="PERSON" name="alprovenance" value="${person}">
                    <button type="submit" class="select-go-button"><b class="t9 m5">Go</b></button>
                <%--<select name="alpersonkey" id="personSelect">
                    <option value="">Select</option>
                    <c:forEach var="person" items="${persons}">
                        <option
                                <c:if test="${alpersonkey==person.key}">selected="selected"</c:if>
                                value="${person.key}">${person.label} (${person.count})
                        </option>
                    </c:forEach>
                </select>--%>
				
            </li>
            
            <li class="x4">
                <label>Languages</label>
                <input type="hidden" id="valueLANGUAGE" value="${allanguagekey}" name="allanguagekey"/>
                <input class="autoInput" id="LANGUAGE" name="language" value="${language}">
                    <button type="submit" class="select-go-button"><b class="t9 m5">Go</b></button>
                <%--<select name="allanguagekey">
                    <option value="">Select</option>
                    <c:forEach var="crit" items="${languages}">
                        <option
                                <c:if test="${allanguagekey==crit.key}">selected="selected"</c:if>
                                value="${crit.key}">${crit.label} (${crit.count})
                        </option>
                    </c:forEach>
                </select>--%>
            </li>
            <li class="x4">
                <label>Century </label>
                <label for="century1">Start Date</label>
                <select class="century" name="century1" id="century1">
                    <option value="">Select</option>
                    <c:forEach var="cent" items="${centuries}">
                        <option
                                <c:if test="${century1==cent}">selected="selected"</c:if> value="${cent}">${cent}th
                            Century
                        </option>
                    </c:forEach>
                </select>
                <label for="century2">End Date</label>
                <select class="century" name="century2" id="century2">
                    <option value="">Select</option>
                    <c:forEach var="cent" items="${centuries}">
                        <option
                                <c:if test="${century2==cent}">selected="selected"</c:if> value="${cent}">${cent}th
                            Century
                        </option>
                    </c:forEach>
                </select>
                <button type="submit" class="select-go-button"><b class="t9 m5">Go</b></button>
            </li>
            <%--<li>
                <label> Set </label>
                <select name="setkey" id="setSelect">
                    <option value="">Select</option>
                    <c:forEach var="crit" items="${sets}">
                        <option
                                <c:if test="${setkey==crit.key}">selected="selected"</c:if>
                                value="${crit.key}">${crit.label} (${crit.count})
                        </option>
                    </c:forEach>
                </select>
            </li>
            <li>
                <label> Notation </label>
                <select name="alnotationtypekey" id="notationSelect">
                    <option value="">Select</option>
                    <c:forEach var="crit" items="${notations}">
                        <option
                                <c:if test="${alnotationtypekey==crit.key}">selected="selected"</c:if>
                                value="${crit.key}">${crit.label} (${crit.count})
                        </option>
                    </c:forEach>
                </select>
            </li>--%>
            <li>
                <label> Clef </label>
                <input type="hidden" id="valueCLEF" value="${alclefkey}" name="alClefKey"/>
                <input class="autoInput" id="CLEF" name="alprovenance" value="${clef}">
                    <button type="submit" class="select-go-button"><b class="t9 m5">Go</b></button>
                <%--<select name="alClefKey" id="clefSelect">
                    <option value="">Select</option>
                    <c:forEach var="crit" items="${clefs}">
                        <option
                                <c:if test="${clefkey==crit.key}">selected="selected"</c:if>
                                value="${crit.key}">${crit.label} (${crit.count})
                        </option>
                    </c:forEach>
                </select>--%>
            </li>
        </ul>


    </fieldset>
</form>
	
      </c:if>
<div id="autocompleteDrop"></div>