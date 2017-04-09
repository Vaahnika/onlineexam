<%@include file="../sql.jsp" %>
<%
if(request.getParameter("selected")!=null)
	{
	String selec=request.getParameter("selected");
	String query1="select name from papers where name=?";
	PreparedStatement pst1=cn.prepareStatement(query1);
	pst1.setString(1,selec);
	ResultSet rst=pst1.executeQuery();
	if(rst.next())
	{
	 out.println("<h2>you can not add a paper twice</h2>");
	 return;
	}
	 else
	{
	String query2="insert into papers values(paper_seq.nextval,?)";
	PreparedStatement pst=cn.prepareStatement(query2);
	pst.setString(1,selec);
	if(pst.executeUpdate()>0)
	{
		out.println("<h2>Paper added successfully.....</h2>");
	}
	}
}
if(request.getParameter("del")!=null)
	{
	String selec=request.getParameter("del");
	String query1="delete from papers where paperid=?";
	PreparedStatement pst1=cn.prepareStatement(query1);
	pst1.setString(1,selec);
	if(pst1.executeUpdate()>0)
	{
		String query="select *from papers";
	Statement st=cn.createStatement();
	ResultSet rst=st.executeQuery(query);
	%>
		<table border="1">
			<tr>
				<th>Paper id</th><th>Paper Name</th><th>Action</th>
			</tr>
	<%
	while(rst.next())
	{
	%>
		<tr>
			<td><%=rst.getString(1)%></td>
			<td><%=rst.getString(2)%></td>
			<td><a href="javascript:;" onclick="del(<%=rst.getString(1)%>)">Delete</a></td>
		</tr>
	<%
	}
	%>
		</table>
	<%
	}
	
}
if((request.getParameter("show"))!=null)
{
	String query="select *from papers";
	Statement st=cn.createStatement();
	ResultSet rst=st.executeQuery(query);
	%>
		<table border="1">
			<tr>
				<th>Paper id</th><th>Paper Name</th><th>Action</th>
			</tr>
	<%
	while(rst.next())
	{
	%>
		<tr>
			<td><%=rst.getString(1)%></td>
			<td><%=rst.getString(2)%></td>
			<td><a href="javascript:;" onclick="del(<%=rst.getString(1)%>)">Delete</a></td>
		</tr>
	<%
	}
	%>
		</table>
	<%
}
%>