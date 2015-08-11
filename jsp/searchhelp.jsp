<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
  <head>
    <title>Add Object to Collection</title>
    <link rel="stylesheet" type="text/css" href="../_a/c/a.css"/>
    <link rel="stylesheet" type="text/css" href="../_a/c/s.css"/>
    <!--[if IE 7]><link rel="stylesheet" type="text/css" href="../_a/c/msie.7.css" media="screen" /><![endif]-->
    <!--[if IE 8]><link rel="stylesheet" type="text/css" href="../_a/c/msie.8.css" media="screen" /><![endif]-->
    <!--[if IE 9]><link rel="stylesheet" type="text/css" href="../_a/c/msie.9.css" media="screen" /><![endif]-->
    <script src="../_a/s/jquery-1.5.min.js" type="text/javascript"></script> 
   <%-- <script src="../_a/s/c.js" type="text/javascript"></script>--%>
    <script type="text/javascript" src="http://use.typekit.com/tae2ufe.js"></script>
    <script type="text/javascript">try{Typekit.load();}catch(e){}</script>
      <script type="text/javascript">
          $(document).ready(function() {
                  $("#collectionForm").submit(function(){
                      $.post('CollectionLink',$("#collectionForm").serialize(),function(){
                             $('span.msg1').html('Added');
                      }   );
                      return false;
                  }) ;
          }   );
      </script>
  </head>
  <body id="t2">
    <jsp:include page="banner.jsp"/>
    <div id="wrapper">
    <div class="rp"><a href="${refererUrl}" title="Return to previous page">Return to previous page</a></div>
	
	<div id="container">
	  
		<h2>Browsing the MS database: quick start guide</h2>

		<h3>Selecting facets</h3>

		<p>In the "Search" column click on the plus / minus icons to expand the list of facets (Source, Composer, Genre, Text and Other).</p>
		
		<p><img src="../_a/i/help-images/facet-closed.png" width="280" height="37" alt="Screen shot showing closed facet" /></p>
		
		<p><img src="../_a/i/help-images/facet-open.png" width="280" height="341" alt="Screen shot showing open facet" /></p>

		<p>You can refine your search by clicking on the plus / minus icons to the left of each search heading.</p>
		
		<p>To select a search term click on it. This will display all matching records in the central column. The search term will also appear in the "Search criteria" box in the first column. You can remove this search term by clicking on the "X" icon which displays alongside it.</p>
		
		<p><img src="../_a/i/help-images/criteria-matching-records.png" width="592" height="243" alt="Screen shot showing search criteria and matching records" /></p>
		

		<p>To find out more about a particular search term you can click on the <img src="../_a/i/help-images/paper-icon.png" width="22" height="22" alt="Paper icon" /> icon to its right. This will open an overlay box containing more information.</p>
		
		<p><img src="../_a/i/help-images/overlay.png" width="600" height="293" alt="Screen shot of an overlay showing more information" /></p>

		<h3>Matching records</h3>

		<p>The middle column contains a list of all matching records from your search. You can group them using the options in the "Group by" dropdown box. The available options are:</p> 
		
		<ul>
			<li>Source</li>
			<li>Composer</li>
			<li>Provenance</li>
			<li>Genre and Century</li>
		</ul>

		<p>If an individual result has an <img src="../_a/i/help-images/mss-has-image.png" width="22" height="22" alt="Screen shot of manuscript image icon" /> icon there are images of the manuscript available.</p>

		<p>Clicking on the <img src="../_a/i/help-images/paper-icon.png" width="22" height="22" alt="Paper icon" /> icon next to a search result will open full details of the result in the third column.</p>

		<p>If you are logged in, clicking on the <img src="../_a/i/help-images/add-to-collection.png" width="23" height="22" alt="Add To Collection" /> icon will let you add the result to your own collection.</p>

		<h3>Starting a new search</h3>

		<p>You can start a new search by clicking on the <img src="../_a/i/help-images/reset.png" width="74" height="27" alt="Screenshot of the reset button"/> button in the Search criteria box.</p>
	
    </div>
    
	
    </div>
  </body>
</html>