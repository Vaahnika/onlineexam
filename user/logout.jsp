<%
	session.invalidate();
	//out.println(session.getAttribute("name"));
	response.sendRedirect("index.jsp");
%>