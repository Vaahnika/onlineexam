<%@include file="../sql.jsp" %>
<%
if(request.getParameter("id")!=null)
	{
	String selec=request.getParameter("id");
	String query1="select * from questions where paperid=?";
	PreparedStatement pst1=cn.prepareStatement(query1);
	pst1.setString(1,selec);
	ResultSet rst=pst1.executeQuery();
	
int count=0;
	while(rst.next())
	{
		%>
			<div style="margin-topm:10px"><%=++count%>)<input type="radio" name="question" onclick="showFull(<%=rst.getString(1)%>)"><%=rst.getString(3)%></div>
		<%
	}
}
if(request.getParameter("pid")!=null)
	{
	String selec=request.getParameter("pid");
	String query1="select * from questions where id=?";
	PreparedStatement pst1=cn.prepareStatement(query1);
	pst1.setString(1,selec);
	ResultSet rst=pst1.executeQuery();
	while(rst.next())
	{
		%>
			<form action="update.jsp">
			<table>
				<tr><td><input type="hidden" value="<%=rst.getString(1)%>" name="id">
				<textarea name="que"><%=rst.getString(3)%></textarea></td></tr>
				<tr><td><textarea name="ans1"><%=rst.getString(4)%></textarea></td></tr>
				<tr><td><textarea name="ans2"><%=rst.getString(5)%></textarea></td></tr>
				<tr><td><textarea name="ans3"><%=rst.getString(6)%></textarea></td></tr>
				<tr><td><textarea name="ans4"><%=rst.getString(7)%></textarea></td></tr>
				<tr>
				<td><select style="font-size:18px;"  name="corr">
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									</select></td>
				</tr>
				<tr><td><input type="submit" name="update" value="update">&nbsp;<input type="submit" name="delete" value="Delete"></td></tr>
			</table>
			</form>
		<%
	}
	}	
	%>
