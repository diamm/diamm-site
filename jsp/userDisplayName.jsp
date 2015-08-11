<%@ page import="uk.ac.kcl.cch.diamm.model.DiammUser" %>
<%@ page import="uk.ac.kcl.cch.diamm.dao.DiammUserDAO" %>
<%@ page import="uk.ac.kcl.cch.diamm.dao.DAOFactory" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="DiammTags" prefix="d" %>
<%
    //This is a very ugly workaround for Cocoon integration problem.
    String username = request.getParameter("username");
    DiammUser user=null;
    if (username != null) {
    		DiammUserDAO userDao = DAOFactory.getFactory().getDiammUserDAO();
    		userDao.beginTransaction();
    		user = userDao.findByUsername(username);
        	userDao.commitTransaction();

    	}
if (user!=null){
%>
<user>
        <name>
            <%=user.getDisplayName()%>
        </name>

</user>
<%}else{%>
      <user/>
<%}%>