<% 
if(session.isNew())
{
response.sendRedirect("index.jsp?errcode=3");
return;
}
%>
<%@include file="menuadmin.jsp"%>
<%@include file="../sql.jsp" %>
<html>
<body>
	<table align="center" style="font-size:18px;">
		<tr>
		<th>Select Paper</th><td><select style="font-size:18px;" name="paper" id="paper">
								<%
									String selec=request.getParameter("selected");
									String query1="select * from papers";
									PreparedStatement pst1=cn.prepareStatement(query1);
									ResultSet rst=pst1.executeQuery();
									while(rst.next())
									{
								%>
									<option value='<%=rst.getString(1)%>'><%=rst.getString(2)%></option>
									<%}%>
								</select>
							</td>
							<td><input type="button" value="Save" style="font-size:18px;" onclick="updateQuestion()"/></td>
		</tr>
	</table>
	<div style="margin-top:50px;margin-left:5%;width:40%;float:left" id="msg"></div>
	
	<div  id="show" style="margin-top:50px;margin-left:12%;width:40%;float:left"></div>
</body>
<script>
function showFull(id)
	{
		var obj=new XMLHttpRequest();
		obj.onreadystatechange=function()
		{
			if(obj.readyState==4)
			{
				document.getElementById("show").innerHTML=obj.responseText;
			}
		};
		obj.open("POST","updatequestionprocess.jsp?pid="+id);
		obj.send();
	}
function del(id)
	{
		var obj=new XMLHttpRequest();
		obj.onreadystatechange=function()
		{
			if(obj.readyState==4)
			{
				document.getElementById("show").innerHTML=obj.responseText;
			}
		};
		obj.open("POST","paperprocess.jsp?del="+id);
		obj.send();
	}
	function updateQuestion()
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
		obj.open("POST","updatequestionprocess.jsp?id="+select);
		obj.send();
	}
</script>
</html>