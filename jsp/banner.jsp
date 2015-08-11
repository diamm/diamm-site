<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="DiammTags" prefix="d" %>
<%@ page isELIgnored="false" %>

<div id="hs">
    <div id="bs">
        <h3 title="DIAMM"><a href="/" title="Return to the DIAMM Home Page">DIAMM</a></h3>
        <h4 title="Digital Image Archive of Medieval Music">Digital Image Archive of Medieval Music</h4>

        <div class="gx"></div>
        <d:userNotLoggedIn>
            <ul class="utl">
                <li><a href="MyDiamm" rel="#overlay" class="t10 m4">Login</a></li>
                <li class="ix"><a href="UserAccess?action=register" class="t10 m6">Register</a></li>
            </ul>
        </d:userNotLoggedIn>
        <d:userLoggedIn>
            <ul class="utl">
                <li><label>Hello, <d:userDisplayName/></label></li>
                <li><a href="MyDiamm">MyDIAMM</a></li>
                <li class="ix"><a href="UserAccess?action=logout" class="t10 m5">Logout</a></li>
            </ul>
        </d:userLoggedIn>
    </div>
    <div xmlns="http://www.w3.org/1999/xhtml" id="ns">
        <ul class="nvg">
            <li class="i1"><a href="/"><b>Home</b></a></li>
            <li><a href="/about/"><b>About</b></a></li>
            <li><a href="/ms-database/"><b>MS Database</b></a></li>
            <li><a href="/advanced-search/"><b>Advanced Search</b></a></li>
            <li><a href="/bibliography"><b>Bibliography</b></a></li>
            <li><a href="/publications/"><b>Publications</b></a></li>
            <li><a href="/resources/"><b>Resources</b></a></li>
            <li><a href="/discussion/"><b>Discussion</b></a></li>
            <li><a href="/services/"><b>Services</b></a></li>
            <li class="ix"><a href="/website-help/"><b>Website Help</b></a></li>
        </ul>
    </div>


    <%--${menu}
     <div id="ns">
      <ul class="nvg">
        <li class="i1"><a href="../index.html">Home</a></li>
        <li><a href="../about/index.html">About</a></li>
        <li><a href="FacetManager">Manuscript Database</a></li>
        <li><a href="Bibliography">Bibliography</a></li>
        <li><a href="../publications/index.html">Publications</a></li>
        <li><a href="../services/index.html">Services</a></li>
        <li><a href="../resources/index.html">Resources</a></li>
        <li class="ix"><a href="../help/index.html">Website Help</a></li>
      </ul>
    </div>--%>
</div>