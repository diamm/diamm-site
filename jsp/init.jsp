<%--
  Created by IntelliJ IDEA.
  User: Elliott Hall
  Date: 29-Jun-2010
  Time: 12:32:04

  op=2&alCountryKey=1&facetType=SOURCEFACET
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="d" uri="DiammTags" %>

<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">


<head>
    <%--<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>--%>
    <title>DIAMM</title>

    <%--<link rel="stylesheet" href="../_a/c/site.css" />
    <link rel="stylesheet" href="../_a/c/grids.css" />
    <link rel="stylesheet" type="text/css" media="all" href="../_a/c/style.css" />--%>


    <link rel="stylesheet" type="text/css" media="all" href="../_a/c/a.css"/>
    <link rel="stylesheet" type="text/css" media="screen, projection" href="../_a/c/s.css"/>
    <link rel="stylesheet" type="text/css" media="screen, projection" href="../_a/c/jquery.cluetip.css"/>
    <!--[if IE 7]>
    <link rel="stylesheet" type="text/css" href="../_a/c/msie.7.css" media="screen"/><![endif]-->
    <!--[if IE 8]>
    <link rel="stylesheet" type="text/css" href="../_a/c/msie.8.css" media="screen"/><![endif]-->
    <!--[if IE 9]>
    <link rel="stylesheet" type="text/css" href="../_a/c/msie.9.css" media="screen"/><![endif]-->

    <script type="text/javascript" src="../_a/s/jquery-1.6.2.min.js"></script>


    <script type="text/javascript" src="../_a/s/jquery-ui-1.8.13.custom.min.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.ui.autocomplete.html.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.cluetip.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.hoverIntent.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.tools.min.js"></script>

    <!-- replace cufon with Typekit-->
    <script type="text/javascript" src="http://use.typekit.com/tae2ufe.js"></script>
    <script type="text/javascript">try {
        Typekit.load();
    } catch(e) {
    }</script>


    <script type="text/javascript" src="../_a/s/c.js"></script>
    <script type="text/javascript" src="../_a/s/jquery.twitter.js"></script>


    <script type="text/javascript">
        $(document).ready(function () {

            $(".autoInput").autocomplete({   appendTo: "#autocompleteDrop", html: 'html',
                source:  function(request, response) {
                    var id = 1;//$(this.element).attr('name').replace('criteriaInput', '');
                    var itemType = $(this.element).attr('id'); //$('#criteriaType' + id).val();
                    var search = $(this.element).val();
                    $.getJSON("SearchManager", {search:search,op:2,iid:id,itemType:itemType}, response);
                },
                minLength: 2,
                select
                        :
                        function(event, ui) {
                            $(this).val(ui.item.label);
                            var id = $(this).attr('id');
                            $('#value' + id).val(ui.item.id);
                        }
            });
            $("#detailTabs").tabs();
            <c:if test="${detailItem!=null&&detailItem.disablestring!=null}">
            $("#detailTabs").tabs("option", "disabled", [${detailItem.disablestring}]);

            </c:if>


            $("#imageonlyToggle").change(function() {
                if ($("#imageonlyToggle").attr('checked')) {
                    $("#imageonly").val(1);
                } else {
                    $("#imageonly").val(0);
                }
                $('#optionForm').submit();
            });

            $("#groupSelect").change(function() {

                $('#optionForm').submit();
            });

        });
    </script>

    <style>
        .ui-tabs .ui-tabs-hide {
            display: none;
        }

    </style>
</head>
<body id="t1" class="home page page-id-4 page-template page-template-frontpage-php singular two-column right-sidebar">
<jsp:include page="banner.jsp"/>
<div id="gw">


<div id="cs">
<div class="c c1" id="searchPane">
<div class="g n2">
<div class="u u1">
    <h2>Search <a class="helpIcon" rel="#overlay" href="searchhelp.jsp">help with searching</a></h2>

    <div class="itl m3">
        <h3>Search Criteria <a href="FacetManager?op=4" class="t9 reset">Reset</a> <a id="empty_controls"
                                                                                      href="FacetManager?op=4"
                                                                                      class="t9 m4"
                                                                                      title="Reset">Reset</a></h3>
        <ul>
            ${searchDescription}
        </ul>
    </div>
    <ul id="facetAccordion" class="nvh">
        <li id="sourceFacet">
            <h3 class="showList hide"><a href="FacetManager?op=9&FacetType=SOURCEFACET">Source</a> <c:if
                    test="${sourceLabel!=null}">: ${sourceLabel} </c:if> <a
                    href="FacetManager?op=9&FacetType=SOURCEFACET"
                    class="t9 m0 <c:if test="${openFacet ne 'SOURCEFACET'}">s78</c:if> <c:if test="${openFacet eq 'SOURCEFACET'}">s77</c:if>"
                    title="Collapse this Facet">Collapse</a>
            </h3>
            <c:if test="${openFacet eq 'SOURCEFACET'}">
                ${sourceTree}
            </c:if>
        </li>

        <li id="composerFacet">
            <h3 class="showList hide"><a href="FacetManager?op=9&FacetType=COMPOSERFACET">Composer</a> <c:if
                    test="${composerLabel!=null}">: ${composerLabel} </c:if> <a
                    href="FacetManager?op=9&FacetType=COMPOSERFACET"
                    class="t9 m0 <c:if test="${openFacet ne 'COMPOSERFACET'}">s78</c:if> <c:if test="${openFacet eq 'COMPOSERFACET'}">s77</c:if>"
                    title="Collapse this Facet">Collapse</a></h3>
            <c:if test="${openFacet eq 'COMPOSERFACET'}">
                <ul class="nvz">
                    <c:forEach var="letter" items="${composerPicker.alphabet}">
                        <c:choose>
                            <c:when test="${composerLetter eq letter}">
                                <li class="s1">${letter}</li>
                            </c:when>
                            <c:when test="${composerPicker.letterSwitch[letter]==true}">
                                <li>
                                    <a href="FacetManager?op=1&FacetType=COMPOSERFACET&composerLetter=${letter}">${letter}</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="s5">${letter}</li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
                <form class="fms" method="post" action="FacetManager">
                    <fieldset class="m0">
                        <input type="hidden" name="op" value="1"/>
                        <input type="hidden" name="FacetType" value="COMPOSERFACET"/>
                        <input type="hidden" id="valueCOMPOSER" value="${composerkey}" name="composerKey"/>
                        <input class="autoInput" id="COMPOSER" name="composerSearch" value="${composerSearch}">
                        <button type="submit" id="composerPicker"><b class="t9 m5">Go</b></button>
                    </fieldset>
                </form>
                <ul class="composerList">
                    <c:forEach var="c" items="${Composers}">
                        <li>
                            <label><a
                                    href="FacetManager?op=1&FacetType=COMPOSERFACET&composerKey=${c.key}">${c.label}</a></label>
                            <dfn>${c.count}</dfn> <a href="Descriptions?op=COMPOSER&summary=1&composerKey=${c.key}"
                                                     class="t9 m1">View
                            Record</a>
                        </li>
                    </c:forEach>
                </ul>
            </c:if>
        </li>

        <li id="genreFacet">
            <jsp:include page="genreFacet.jsp"/>
        </li>
        <li id="textFacet">
            <jsp:include page="textFacet.jsp"/>
        </li>
        <li id="secondaryFacet">
            <jsp:include page="secondaryFacet.jsp"/>

        </li>
    </ul>
</div>
<div class="u u2" id="results">
    <h2><strong>${pageNav.recordCount}</strong> Matching Records</h2>
    <ul class="utl">
        <li><label>Display:</label>
            <c:choose>
                <c:when test="${pageNav.rowsPerPage == 10}">
                    <b class="s1">10</b>
                    -
                    <a href="FacetManager?op=1&rowsPerPage=20&prevRowsPerPage=10">20</a>
                    -
                    <a href="FacetManager?op=1&rowsPerPage=40&prevRowsPerPage=10">40</a>
                </c:when>
                <c:when test="${pageNav.rowsPerPage == 20}">
                    <a href="FacetManager?op=1&rowsPerPage=10&prevRowsPerPage=20">10</a>
                    -
                    <b class="s1">20</b>
                    -
                    <a href="FacetManager?op=1&rowsPerPage=40&prevRowsPerPage=20">40</a>
                </c:when>
                <c:otherwise>
                    <a href="FacetManager?op=1&rowsPerPage=10&prevRowsPerPage=40">10</a>
                    -
                    <a href="FacetManager?op=1&rowsPerPage=20&prevRowsPerPage=40">20</a>
                    -
                    <b class="s1">40</b>
                </c:otherwise>
            </c:choose>
            records at a time
        </li>
        <li><label>Include:</label>
            <c:choose>
                <c:when test="${imageonly==null||imageonly==0}">
                    <b>All items</b> - <a href="FacetManager?op=1&FacetType=ITEM&imageonly=1">Items with
                    Images</a>
                </c:when>
                <c:when test="${imageonly!=null&&imageonly==1}">
                    <a href="FacetManager?op=1&FacetType=ITEM&imageonly=0">All items</a> - <b class="s1">Items with
                    Images</b>
                </c:when>
            </c:choose>
        </li>
        <li><label>Group by:</label>

            <form id="optionForm" action="FacetManager">
                <select name="groupType" id="groupSelect">
                    <option
                            <c:if test="${groupType eq 'SOURCE'}">selected="selected"</c:if> value="SOURCE">Source
                    </option>
                    <option
                            <c:if test="${groupType eq 'COMPOSER'}">selected="selected"</c:if> value="COMPOSER">Composer
                    </option>
                    <option
                            <c:if test="${groupType eq 'PROVENANCE'}">selected="selected"</c:if> value="PROVENANCE">
                        Provenance
                    </option>
                    <option
                            <c:if test="${groupType eq 'GENRE'}">selected="selected"</c:if> value="GENRE">Genre
                    </option>
                    <option
                            <c:if test="${groupType eq 'DATE'}">selected="selected"</c:if> value="DATE">Century
                    </option>
                </select>

                <input type="hidden" name="op" value="1"/>
                <input type="hidden" name="FacetType" value="ITEM"/>

            </form>
        </li>
    </ul>

    <dl>
        <c:forEach var="group" items="${ItemGroupList}">
            <dt><!--a href="#"-->${group.label}<!--/a--></dt>

            <c:forEach var="item" items="${group.itemList}" varStatus="index">
                <dd <c:if test="${index.first}">class="s9"</c:if>>


                    <span title="${item.sourceString}"><strong>${item.archive.siglum}</strong></span> ${item.source.shelfmark}
                    <c:if test="${item.item.positionms!=null&&fn:length(item.item.positionms)>0}">no. ${item.item.positionms}</c:if>
                    <c:if test="${item.folioString!=null&&fn:length(item.folioString)>0}">f. ${item.folioString}</c:if>
                    <c:if test="${item.images!=null&&fn:length(item.images)>0}"><img class="i1"
                                                                                     src="../../_a/i/_a11.png"
                                                                                     alt="image icon"/></c:if>
                    <a class="t9 m1" href="FacetManager?op=6&detailItemKey=${item.key}">View Record</a>


                    <d:userLoggedIn>
                        <a href="CollectionLink?linkId=${item.key}&linkType=item" class="t9 m2 overlay" rel="#overlay">Add
                            to a Collection</a>
                    </d:userLoggedIn>
                </dd>
            </c:forEach>

        </c:forEach>
    </dl>

    <div class="itp">
        <c:if test="${pageNav !=null}">
        <h3>Page <strong>${pageNav.selectedPage}</strong> of <strong>${pageNav.pageCount}</strong></h3>

        <ul>
            <c:choose>
                <c:when test="${pageNav.selectedPage > 1}">
                    <li><a href="FacetManager?op=1&pageNum=1">&#8249;&#8249;
                    </a></li>
                    <li>
                        <a href="FacetManager?op=1&pageNum=${pageNav.selectedPage-1}">
                            &#8249;</a></li>
                </c:when>
                <c:otherwise>
                    <li class="s5">&#8249;&#8249;</li>
                    <li class="s5">&#8249;</li>
                </c:otherwise>
            </c:choose>

            <c:if test="${pageNav.extendLeft}">
                <c:forEach var="pageNo" begin="${pageNav.firstPage}" end="${pageNav.lastPage-1}">
                    <li><a href="FacetManager?op=1&pageNum=${pageNo}">${pageNo}</a>
                    </li>
                </c:forEach>
            </c:if>

            <li class="s4"><a href="#" target="_self">...</a>
                <ul>
                    <c:choose>
                        <c:when test="${pageNav.pageCount>100&&(pageNav.pageCount-pageNav.selectedPage)>51}">
                            <c:forEach var="pageNo" step="50" begin="${pageNav.firstPage}" end="${pageNav.pageCount}">
                                <c:choose>
                                    <c:when test="${pageNav.selectedPage == pageNo}">
                                        <li class="s1">${pageNo}</li>
                                    </c:when>
                                    <c:otherwise>
                                        <li>
                                            <a href="FacetManager?op=1&pageNum=${pageNo}">${pageNo}</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="pageNo" begin="${pageNav.firstPage}" end="${pageNav.pageCount}">
                                <c:choose>
                                    <c:when test="${pageNav.selectedPage == pageNo}">
                                        <li class="s1">${pageNo}</li>
                                    </c:when>
                                    <c:otherwise>
                                        <li>
                                            <a href="FacetManager?op=1&pageNum=${pageNo}">${pageNo}</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>

                </ul>
            </li>

            <c:if test="${pageNav.extendRight&&(pageNav.pageCount-pageNav.selectedPage)>2}">
                <c:forEach var="pageNo" begin="${pageNav.selectedPage+1}" end="${pageNav.selectedPage+3}">
                    <li><a href="FacetManager?op=1&pageNum=${pageNo}">${pageNo}</a>
                    </li>
                </c:forEach>
            </c:if>

            <c:choose>
                <c:when test="${pageNav.selectedPage < pageNav.pageCount}">
                    <li>
                        <a href="FacetManager?op=1&pageNum=${pageNav.selectedPage+1}">&#8250;</a></li>
                    <li>
                        <a href="FacetManager?op=1&pageNum=${pageNav.pageCount}">&#8250;&#8250;</a></li>
                </c:when>
                <c:otherwise>
                    <li class="s5">&#8250;</li>
                    <li class="s5">&#8250;&#8250;</li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
    </c:if>
</div>
</div>

</div>

<div class="c c2">
    <jsp:include page="itemdetail.jsp"/>


</div>
</div>
</div>
<div id="f2">

</div>
</div>
<div id="autocompleteDrop"></div>
<div id="overlay">
    <div class="overlayContent"></div>
</div>
</body>
</html>