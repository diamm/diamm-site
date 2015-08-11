<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="d" uri="DiammTags" %>

<%@ page isELIgnored="false" %>
<html>
<head><title>Note Editor</title>



</head>
<body><h3>Add new note</h3>

<div id="note">

    <script type="text/javascript" src="../../_a/s/jquery-1.6.2.min.js"></script>
    <script type="text/javascript" src="../../_a/s/tiny_mce/tiny_mce_gzip.js"></script>
    <script type="text/javascript">
        tinyMCE_GZ.init({
            plugins : 'paste,searchreplace',
            themes : 'simple,advanced',
            languages : 'en',
            disk_cache : true,
            debug : false
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function() {

            tinyMCE.init({
                mode : "textareas",
                theme : "advanced",
                theme_advanced_buttons1: 'bold,italic,underline,sub,sup,|,undo,redo'
            });

            $("#noteForm").submit(function(){
                      $.post('CollectionLink',$("#collectionForm").serialize(),function(){
                             $('#note').html('Complete');
                      }   );
                      return false;
                  }) ;
        });
    </script>

    <form action="/jsp/AnnotationManager" method="POST" id="noteForm">
        <input type="hidden" name="op" value="updateNote"/>

        <input type="hidden" name="noteKey" value="${noteKey}"/>
        <%--<input type="hidden" name="imageKey" value="${image.imagekey}"/>--%>
        <div id="noteType">
            <select name="noteType">
                <option value="COM"
                        <c:if test="${noteType == 'COM'}">selected="selected" </c:if> >Comment
                </option>
                <option value="TRA"
                        <c:if test="${noteType == 'TRA'}">selected="selected" </c:if> >Transcription
                </option>
            </select>
            <input type="radio" name="noteVis" value="PV"
                   <c:if test="${noteVisibility == 'PV'}">checked="checked"</c:if> /> Private
            <input type="radio" name="noteVis"
                   <c:if test="${noteVisibility == 'PB'}">checked="checked"</c:if> value="PB"/> Public
        </div>
        <div class="textarea">
            <textarea rows="4" cols="20" name="noteText">${noteText}</textarea>
        </div>

        <input class="submit-button" type="submit" name="create" value="Update" id="add-note-submit"/>

    </form>
</div>
</body>
</html>