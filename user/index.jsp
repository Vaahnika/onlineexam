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
				<td align="center"><a href="javascript:;">User Give Test</a></td>
			</tr>
		</table>
		<center>
		<div id="user" style="margin-top:2%;">
			<form action="userLogin.jsp">
				<table style="border:1px solid blue;">
				<tr>
					<th>Enter test code</th><td><input type="text" name="code"></td>
				</tr>
				<tr>
					<th>Enter password</th><td><input type="text" name="pass"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center"><input type="submit" value="submit"></td>
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
	</body>