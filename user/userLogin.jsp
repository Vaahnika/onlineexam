<%@include file="../sql.jsp" %>
		<%
		String send="select * from user_test where testcode=?";
		PreparedStatement ps=cn.prepareStatement(send);
		ps.setString(1,(request.getParameter("code")));
		ResultSet rst=ps.executeQuery();
		if(rst.next())
		{
			if(!(request.getParameter("pass")).equals(rst.getString(2)))
				response.sendRedirect("index.jsp?errcode=1");
			else
			{
				session.setAttribute("name",rst.getString(3));
				session.setAttribute("testcode",request.getParameter("code"));
				response.sendRedirect("home.jsp");
			}
		}
		else
			response.sendRedirect("index.jsp?errcode=2");
		%>