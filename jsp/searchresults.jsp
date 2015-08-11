<%--
  Created by IntelliJ IDEA.
  User: Elliot
  Date: 22/02/11
  Time: 12:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="d" uri="DiammTags" %>

<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
<head><title>DIAMM Search Results</title>
    <link rel="stylesheet" type="text/css" href="../_a/c/a.css"/>
    <link rel="stylesheet" type="text/css" href="../_a/c/s.css"/>
    <!--[if IE 7]>
    <link rel="stylesheet" type="text/css" href="../_a/c/msie.7.css" media="screen"/><![endif]-->
    <!--[if IE 8]>
    <link rel="stylesheet" type="text/css" href="../_a/c/msie.8.css" media="screen"/><![endif]-->
    <!--[if IE 9]>
    <link rel="stylesheet" type="text/css" href="../_a/c/msie.9.css" media="screen"/><![endif]-->
    <script type="text/javascript" src="../_a/s/jquery-1.5.min.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.tools.min.js"></script>
    <script type="text/javascript" src="../_a/s/c.js"></script>
    <%--<script type="text/javascript" src="../_a/s/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../_a/s/jquery-ui.min.js"></script>
    --%>
	<script type="text/javascript" src="http://use.typekit.com/tae2ufe.js"></script>
	<script type="text/javascript">try {
	    Typekit.load();
	} catch(e) {
	}</script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('a.t10.m4[rel="#overlay"]').overlay({
                mask:'#333',
                onBeforeLoad: function() {
                   /* $('a[rel="#overlay"]').live("click", function() {
                        checkOverlayStatus();
                    });*/
                    $("#overlay").removeAttr("class");
                    $("#overlay").attr("class", "loginBox");
                    var wrap = this.getOverlay().find('.overlayContent');
                    url = this.getTrigger().attr("href");
                    tgt = url + " #container";
                    wrap.load(tgt, function() {
                        //$('').empty();
                    });

                },
                onLoad: function() {
                    $('#loginForm').submit(function() {
                        $.post('j_security_check', $("#loginForm").serialize(), function(data) {
                            //$('#loginForm').data("overlay").close()
                            // document.location.reload();
                            var msg = data.replace('/[\n|\r]/g', '');
                            if (msg.indexOf('not possible') > -1) {
                                $('span.msg2').html(data);
                            } else {
                                document.location.reload();
                            }
                        });
                        return false;
                    });
                },
                fixed:true
            });


            $("a.collectionOverlay").overlay({
                mask:'#333',
                onBeforeLoad: function() {
                    /*$("a.t9.m2.overlay").live("click", function() {
                        checkOverlayStatus();
                    });*/
                    $('div.overlayContent').empty();
                    $("#overlay").removeAttr("class");
                    $("#overlay").attr("class", "collectionsDbBox");
                    var wrap = this.getOverlay().find('.overlayContent');
                    url = this.getTrigger().attr("href");
                    tgt = url + " #container";
                    wrap.load(tgt, function() {
                        //$('').empty();
                    });

                },
                onLoad: function() {
                    alert('wertrt');
                    $('#collectionForm').submit(function() {
                        $.post('CollectionLink', $("#collectionForm").serialize(), function() {
                            $('span.msg3').html('Added');
                        });
                        return false;
                    });

                    $('#newCollection').submit(function() {
                        $.post('CollectionLink', $("#newCollection").serialize(), function() {
                            $('span.msg3').html('Collection created.');
                        });
                        return false;
                    });
                },
                fixed:true
            });


        });
    </script>


</head>
<body id="t2">
<div id="gw">
    <jsp:include page="banner.jsp"/>
    <div id="cs">
        <div class="hdp">
            <h1><c:if test="${resultCount>0}"><strong>${resultCount}</strong> Matching Records</c:if><c:if
                    test="${resultCount==0}"> No Results Found</c:if></h1>
        </div>

        <ul class="utl">
            <li>
                <label>Show matching:</label>
                <c:if test="${resultType==1}">
                    <b class="s1">Items</b> - <a href="SearchManager?op=8&resultType=2">Sources</a>
                </c:if>
                <c:if test="${resultType==2}">
                    <a href="SearchManager?op=8&resultType=1">Items</a> - <b class="s1">Sources</b>
                </c:if>
            </li>
            <li><a href="SearchManager?op=7">Refine Search</a>
            </li>
            <li><a href="SearchManager?op=9">New Search</a>
            </li>
        </ul>

        <%--<form action="SearchManager" name="resultForm" id="resultForm">
            <input type="hidden" name="op" value="8"/>
            <select name="resultType" id="resultType">
                <option value="1" <c:if test="${resultType==1}">selected="selected" </c:if>>Item</option>
                <option value="2" <c:if test="${resultType==2}">selected="selected" </c:if>>Source</option>
            </select>
        </form>--%>
        <ul class="m1">
            <c:forEach items="${itemResults}" var="item">
                <li>

                    <span title="${item.sourceString}"><strong>${item.archive.siglum}</strong></span> ${item.source.shelfmark}
                    <c:if test="${item.item.positionms!=null&&fn:length(item.item.positionms)>0}">no. ${item.item.positionms}</c:if>
                    <c:if test="${item.folioString!=null&&fn:length(item.folioString)>0}">f. ${item.folioString}</c:if>
                    <c:if test="${item.images!=null&&fn:length(item.images)>0}"><img class="i1"
                                                                                     src="../../diamm/_a/i/_a11.png"
                                                                                     alt="image icon"/></c:if>
                    <a class="t9 m1" href="Descriptions?op=ITEM&itemKey=${item.key}">View Record</a>


                    <d:userLoggedIn>
                    <a href="CollectionLink?linkId=${item.key}&linkType=item" class="t9 m2 collectionOverlay" rel="#overlay">Add to a Collection<a>
                        </d:userLoggedIn>
                </li>
            </c:forEach>
            <c:forEach items="${sourceResults}" var="s">
                <li>
                    <span title="${s.sourceString}"><strong>${s.a.siglum}</strong></span> ${s.source.shelfmark}
                    <a class="t9 m1" href="Descriptions?op=SOURCE&sourceKey=${s.source.sourcekey}">View</a>
                    <d:userLoggedIn>
                    <a href="CollectionLink?linkId=${s.source.sourcekey}&linkType=source" class="t9 m2 collectionOverlay rel="#overlay">Add to a
                        Collection<a>
                            </d:userLoggedIn>
                </li>
            </c:forEach>
        </ul>
        <c:if test="${pageNav !=null}">
            <div class="itp">
                <h3>Listing records ${pageNav.pageFirstIndex} - ${pageNav.pageLastIndex}
                    of ${pageNav.recordCount}</h3>
                <ul>
                    <c:choose>
                        <c:when test="${pageNav.selectedPage > 1}">
                            <li><a href="SearchManager?op=8&pageNum=1">&#8249;&#8249;
                                First</a></li>
                            <li>
                                <a href="SearchManager?op=8&pageNum=${pageNav.selectedPage-1}">
                                    &#8249; Previous</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="s5">&#8249;&#8249; First</li>
                            <li class="s5">&#8249; Previous</li>
                        </c:otherwise>
                    </c:choose>


                    <c:forEach var="pageNo" begin="${pageNav.firstPage}" end="${pageNav.lastPage}">
                        <c:choose>
                            <c:when test="${pageNav.selectedPage == pageNo}">
                                <li class="s1">${pageNo}</li>
                            </c:when>
                            <c:otherwise>
                                <li>
                                    <a href="SearchManager?op=8&pageNum=${pageNo}">${pageNo}</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>


                    <c:choose>
                        <c:when test="${pageNav.selectedPage < pageNav.pageCount}">
                            <li>
                                <a href="SearchManager?op=8&pageNum=${pageNav.selectedPage+1}">Next
                                    &#8250;</a></li>
                            <li>
                                <a href="SearchManager?op=8&pageNum=${pageNav.pageCount}">Last
                                    &#8250;&#8250;</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="s5">Next &#8250;</li>
                            <li class="s5">Last &#8250;&#8250;</li>
                        </c:otherwise>
                    </c:choose>

                </ul>


            </div>
        </c:if>

    </div>
    <div id="fs"></div>
</div>
<div id="overlay">
    <div class="overlayContent"></div>
</div>
</body>
</html>
