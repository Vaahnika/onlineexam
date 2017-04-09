<html>
	<head>
	
	</head>
	<body>
		<div style="width:100%;height:200px;">
		<img src="../image/exam.jpg" style="width:100%;height:100%"/>
		</div>
		<hr style="border:2px solid red;"/>
		<table style="border:1px solid blue;" width="100%">
			<tr style="background-color:lightgreen">
				<td align="center"><a href="javascript:;" onclick="showUser()">User Give Test</a></td>
				<td align="center"><a href="javascript:;" onclick="showAdmin()">Admin Login</a></td>
			</tr>
		</table>
		<center>
		<div id="user" style="display:none;margin-top:2%;">
			<form action="userLogin.jsp">
				<table style="border:1px solid blue;">
				<tr>
					<th>Enter Name</th><td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>Enter Phone</th><td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<th>Select Test</th><td><select><option>----Select---</option><option>C++</option><option>Java</option> </select></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="submit"></td>
				</tr>
				</table>
			</form>
		</div>
		<div id="admin" style="display:none;margin-top:2%;">
			<form action="adminLogin.jsp" method="post">
				<table style="border:1px solid blue;">
				<tr>
					<th>Enter name</th><td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>Enter Password</th><td><input type="password" name="pass"></td>
				</tr>				
				<tr>
					<td colspan="2" align="center"><input type="submit" value="login"></td>
				</tr>
				
				</table>
			</form>
		</div>
		<%
		if(request.getParameter("errcode")!=null && request.getParameter("errcode").equals("2"))
			out.println("<h2 style='color:red'>Incorrect User Name</h2>");
		if(request.getParameter("errcode")!=null && request.getParameter("errcode").equals("1"))
			out.println("<h2 style='color:red'>Incorrect Password</h2>");
		if(request.getParameter("errcode")!=null && request.getParameter("errcode").equals("3"))
			out.println("<h2 style='color:red'>Please login first</h2>");
		%>
		</center>
		<script>
			function showUser()
			{
				document.getElementById("admin").style.display="none";
				document.getElementById("user").style.display="block";
			}
			function showAdmin()
			{
				document.getElementById("user").style.display="none";
				document.getElementById("admin").style.display="block";
			}
		</script>
	</body>