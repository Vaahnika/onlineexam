<% 
if(session.isNew())
{
response.sendRedirect("index.jsp?errcode=3");
return;
}
%>
<%@include file="menuadmin.jsp"%>
<html>
<body>
	<table align="center" style="font-size:18px;">
		<tr>
		<th>Select Paper</th><td><select style="font-size:18px;" name="paper" id="paper">
									<option>c++</option>
									<option>Core Java</option>
									<option>Advance Java</option>
									<option>PHP</option>
									<option>C language</option>
								</select>
							</td>
							<td><input type="button" value="Save" style="font-size:18px;" onclick="addPaper()"/></td>
		</tr>
	</table>
	<div align="center" id="msg"></div>
	
	<div align="center" style="margin-top:40px;">
		<a href="javascript:;" onclick="show()" style="font-size:18px;">Show Papers</a>
	</div>
	
	<div align="center" id="show" style="margin-top:50px;"></div>
</body>
<script>
function show()
	{
		var obj=new XMLHttpRequest();
		obj.onreadystatechange=function()
		{
			if(obj.readyState==4)
			{
				document.getElementById("show").innerHTML=obj.responseText;
			}
		};
		obj.open("POST","paperprocess.jsp?show=all");
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
	function addPaper()
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
		obj.open("POST","paperprocess.jsp?selected="+select);
		obj.send();
	}
</script>
</html>