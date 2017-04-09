<%
if(request.getParameter("selected")!=null)
	{
	String selec=request.getParameter("selected");
%>
	<form method="post" action="savequestion.jsp">
	<table border="0">
	<tr>
		<th>Paper Name</th><td><input type="text" name="subject" value="<%=selec%>" readonly/></td>
	</tr>
	<tr>
		<th>Question</th><td><textarea style="width:500px" name="que"></textarea></td>
	</tr>
	<tr>
		<th>Answer 1</th><td><textarea style="width:500px"  name="ans1"></textarea></td>
	</tr>
	<tr>
		<th>answer 2</th><td><textarea style="width:500px"  name="ans2"></textarea></td>
	</tr>
	<tr>
		<th>answer 3</th><td><textarea style="width:500px"  name="ans3"></textarea></td>
	</tr>
	<tr>
		<th>answer 4</th><td><textarea style="width:500px"  name="ans4"></textarea></td>
	</tr>
	<tr>
		<th>Correct Answer</th><td><select style="font-size:18px;"  name="corr">
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									</select></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" value="Save"/>&nbsp;&nbsp;&nbsp;<input type="reset" value="Clear"/></td>
	</tr>
	</table>
	</form>
<%
	}
%>