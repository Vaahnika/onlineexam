<% 
if(session.isNew())
{
response.sendRedirect("index.jsp?errcode=3");
return;
}
if(application.getAttribute((String)session.getAttribute("testcode"))!=null)
{
	Cookie co=new Cookie("JSESSIONID",(String)application.getAttribute((String)session.getAttribute("testcode")));
	co.setPath("/miniproject/");
	response.addCookie(co);
	response.sendRedirect("starttest.jsp");
	return;
}
%>
<%@ include file="../sql.jsp"%>
<img src="../image/exam.jpg" style="width:100%;height:200px;"/>
<hr style="border:1px solid red;"/>
<form action="starttest.jsp" method="post">
<div align="center"><select style="font-size:18px" onchange="enable(this.selectedIndex)">
	<option>Choose paper</option>
								<%
									String selec=request.getParameter("selected");
									String query1="select allowed_for,papers.name from papers join user_test on papers.paperid=user_test.allowed_for";
									PreparedStatement pst1=cn.prepareStatement(query1);
									ResultSet rst=pst1.executeQuery();
									while(rst.next())
									{
								%>
		<option value="<%=rst.getString(1)%>"><%=rst.getString(2)%></option>
									<%}%>
	</select>
</div>
<div align="center"><input type="submit" value="Start Test" style="font-size:18px;margin-top:60px" disabled id="start"/></div>
</form>
<script>
function enable(index)
{
	if(index>0)
	  document.getElementById("start").disabled=false;
	 else
	  document.getElementById("start").disabled=true;
}
</script>