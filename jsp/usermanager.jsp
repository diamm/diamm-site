<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page isELIgnored="false" %>

<%--
  Created by IntelliJ IDEA.
  User: Elliot
  Date: 20/11/12
  Time: 12:51
  To change this template use File | Settings | File Templates.
--%>

<html>
<head><title>DIAMM User Manager</title></head>
<body>
<h1>DIAMM USER MANAGER</h1>

<div id="search">
    <h2>SEARCH</h2>

    <form id="searchForm" method="POST" action="UserAccess">
        <label for="username">By Username:</label>
        <input type="text" id="username" name="username"/>
        <label for="email">By email:</label>
        <input type="text" id="email" name="email"/>
        <input type="hidden" name="action" value="manager">
        <input type="hidden" name="search" value="1">
        <input type="submit" value="Search">
    </form>
</div>

<div id="results">
    <c:if test="${message!=null}">
        ${message}
    </c:if>
    <c:if test="${results!=null}">
        <h2>Users Found</h2>
        <p>IMPORTANT NOTE ON PASSWORDS:
            Passwords are encrypted.  They can only be reset, not retrieved.  Add a password to the box to set a new password.
        </p>
    </c:if>
    <table>
        <tr>
            <th>Username</th>
            <th>Display Name</th>
            <th>email</th>
            <th>affiliation</th>
            <th>set new password</th>
            <th> </th>
        </tr>
        <c:forEach items="${results}" var="u">
            <tr>
                <form method="POST" action="UserAccess">
                    <td><input type="text" name="username" value="${u.username}"/></td>
                    <td><input type="text" name="displayName" value="${u.displayName}"/></td>
                    <td><input type="text" name="email" value="${u.email}"/></td>
                    <td><input type="text" name="affiliation" value="${u.affiliation}"/></td>
                    <td><input type="text" name="password" value=""/></td>
                    <td><input type="hidden" name="action" value="manager">
                        <input type="hidden" name="id" value="${u.id}">
                        <input type="hidden" name="update" value="1">
                        <input type="submit" value="Set"/> </td>
                </form>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>