<% 
if(session.getAttribute("name")==null)
{
response.sendRedirect("index.jsp?errcode=3");
return;
}
%>
<%@include file="menuadmin.jsp"%>
<h2 align="center">Welcome to Admin Area</h2>