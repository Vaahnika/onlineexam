<% 
if(session.isNew())
{
response.sendRedirect("index.jsp?errcode=3");
return;
}
%>
<%@include file="../sql.jsp" %>
<%@include file="menuadmin.jsp"%>
<html>
<body>
	<table align="center" style="font-size:18px;">
		<tr>
		<th>Select Paper</th><td><select style="font-size:18px;" name="paper" id="paper">
								<%
									String selec=request.getParameter("selected");
									String query1="select name from papers";
									PreparedStatement pst1=cn.prepareStatement(query1);
									ResultSet rst=pst1.executeQuery();
									while(rst.next())
									{
								%>
									<option><%=rst.getString(1)%></option>
									<%}%>
								</select>
							</td>
							<td><input type="button" value="Select" style="font-size:18px;" onclick="addQuestion()"/></td>
							<%
								if(request.getParameter("flag")!=null && (request.getParameter("flag")).equals("success"))
								{%>
								<td><font color="blue">Question added</font></td>
								<%}
							%>
		</tr>
	</table>
	<div align="center" id="msg"></div>
	
	<div align="center" id="show" style="margin-top:50px;"></div>
</body>
<script>
	function addQuestion()
	{
		var obj=new XMLHttpRequest();
		var select=document.getElementById("paper").value;
		obj.onreadystatechange=function()
		{
			if(obj.readyState==4)
			{
				document.getElementById("msg").innerHTML=obj.responseText;
			}
		};
		obj.open("POST","questionprocess.jsp?selected="+select);
		obj.send();
	}
</script>
</html>