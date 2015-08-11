<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>My Collections</title>
  <link rel="stylesheet" type="text/css" href="../_a/c/a.css"/>
  <link rel="stylesheet" type="text/css" href="../_a/c/s.css"/>
    <!--[if IE 7]><link rel="stylesheet" type="text/css" href="../_a/c/msie.7.css" media="screen" /><![endif]-->
    <!--[if IE 8]><link rel="stylesheet" type="text/css" href="../_a/c/msie.8.css" media="screen" /><![endif]-->
    <!--[if IE 9]><link rel="stylesheet" type="text/css" href="../_a/c/msie.9.css" media="screen" /><![endif]-->
    <script src="../_a/s/jquery-1.5.min.js" type="text/javascript"></script>
    <script src="../_a/s/cufon.min.js" type="text/javascript"></script>
    <script src="../_a/f/agp.font.js" type="text/javascript"></script>
    <script type="text/javascript" src="../_a/s/jquery.tools.min.js"></script>

    <script src="../_a/s/c.js" type="text/javascript"></script>

</head>
<body id="t6">
<jsp:include page="banner.jsp"/>
<h3>My Collections</h3>
<hr />

<c:if test="${not empty link}">
  <div>
    ${link.title} to add: ${link.id} 
  </div>
</c:if>

<div>
  <table>
    <tr>
      <th>Title</th>
      <th>Description</th>
      <th></th>
      <c:if test="${not empty link}"><th></th></c:if>
    </tr>
    <c:forEach items="${collectionList}" var="collection">

      <c:url value="Collection" var="collectionViewUrl">
        <c:param name="action" value="view"/>
        <c:param name="viewId" value="${collection.id}"/>
        <c:if test="${not empty link}">
          <c:param name="linkId"   value="${link.id}"/>
          <c:param name="linkType" value="${link.type}"/>
        </c:if>
      </c:url>
      
      <c:url value="Collection" var="collectionLinkUrl">
        <c:param name="action" value="link"/>
        <c:param name="collectionId" value="${collection.id}"/>
        <c:param name="linkId"       value="${link.id}"/>
        <c:param name="linkType"     value="${link.type}"/>
      </c:url>
      
      <tr>
        <td>${collection.title}</td>
        <td>${collection.description}</td>
        <td><a href="${collectionViewUrl}">view/edit</a></td>
        <c:if test="${not empty link}"><td><a href="${collectionLinkUrl}">add ${link.type}</a></td></c:if>
      </tr>
    </c:forEach>
  </table>
</div>

<div>
  <form action="Collection?action=create" method="post">
    <h4>Create New Collection</h4>
    <div>
      <label>Title</label><br />
      <input type="text" name="newTitle" value="${newCol.title}"/>
    </div>
    <div>
      <label>Description</label><br />
      <input type="text" name="newDescription" value="${newCol.description}"/>
    </div>
    <div>
      <c:if test="${not empty link}">
        <input type="hidden" name="linkId" value="${link.id}">
        <input type="hidden" name="linkType" value="${link.type}">
      </c:if>
      <input type="submit" name="create" value="Create">
    </div>
  </form>
</div>

<div>
  <form action="Collection?action=edit" method="post">
    <h4>Collection Details</h4>
    <div>
      <label>Title</label><br />
      <input type="text" name="viewTitle" value="${viewedCollection.title}"/>
    </div>
    <div>
      <label>Description</label><br />
      <input type="text" name="viewDescription" value="${viewedCollection.description}"/>
    </div>
    <div>
      <c:if test="${not empty viewedCollection.sourceList}">
        <h4>Sources:</h4>
        <c:forEach items="${viewedCollection.sourceList}" var="source">
          ${source.sourcekey} <br />
        </c:forEach>
      </c:if>
      <c:if test="${not empty viewedCollection.itemList}">
        <h4>Items:</h4>
        <c:forEach items="${viewedCollection.itemList}" var="item">
          ${item.itemkey} <br />
        </c:forEach>
      </c:if>
      <c:if test="${not empty viewedCollection.imageList}">
        <h4>Images:</h4>
        <c:forEach items="${viewedCollection.imageList}" var="image">
          ${image.imagekey} <br />
        </c:forEach>
      </c:if>
    </div>
    <div>
      <c:if test="${not empty link}">
        <input type="hidden" name="linkId" value="${link.id}">
        <input type="hidden" name="linkType" value="${link.type}">
      </c:if>
      <input type="hidden" name="viewId" value="${viewedCollection.id}">
      <input type="submit" name="save" value="Save Changes">
      <input type="submit" name="delete" value="Delete Collection">
    </div>
  </form>
</div>
      <div id="overlay">
      <div class="overlayContent"></div>
</div>
</body>
</html>