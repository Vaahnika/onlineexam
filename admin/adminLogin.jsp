<%@include file="../sql.jsp" %>
		<%
		String send="select * from admin where name=?";
		PreparedStatement ps=cn.prepareStatement(send);
		ps.setString(1,(request.getParameter("name")));
		ResultSet rst=ps.executeQuery();
		if(rst.next())
		{
			if(!(request.getParameter("pass")).equals(rst.getString(2)))
				response.sendRedirect("index.jsp?errcode=1");
			else
			{
				session.setAttribute("name",request.getParameter("name"));
				response.sendRedirect("home.jsp");
			}
		}
		else
			response.sendRedirect("index.jsp?errcode=2");
		%>