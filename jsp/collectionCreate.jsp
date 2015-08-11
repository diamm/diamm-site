<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
<div>
  <h3>Create New Collection</h3>
  <form action="${param.collectionAction}" method="post" id="newCollection">
      <input type="hidden" name="create" value="1"/>
    <ul class="register">
      <li><label>Title <span class="msg1">*</span><span class="msg2">${messages.title}</span></label><br />
      <input class="overlay-input" type="text" class="text" name="createdCollTitle" value="${collDetails.createdCollTitle}" maxlength="30"/>
        </li>
   
   <li>
      <label>Description <span class="msg2">${messages.description}</span></label><br />
      <input class="overlay-input" type="text" class="text2" name="createdCollDescription" value="${collDetails.createdCollDescription}" maxlength="100"/>
   </li>
    
    <li class="buttons">
      <c:if test="${not empty collDetails.linkType}">
        <input type="hidden" name="linkId" value="${collDetails.linkId}">
        <input type="hidden" name="linkType" value="${collDetails.linkType}">
        <input type="hidden" name="selfParent" value="true">
	    <input type="hidden" name="referer" value="${refererUrl}">
      </c:if>
      <input type="submit" name="createsub" value="Create" class="submit-button" />
    </li>
    </ul>
  </form>
</div>
