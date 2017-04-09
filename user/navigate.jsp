<%@ include file="../sql.jsp"%>
<%

if(session.isNew())
{
response.sendRedirect("index.jsp?errcode=3");
return;
}
		String go=request.getParameter("to");
		ResultSet rs=(ResultSet)session.getAttribute("result");
		if(go.equals("next"))
			rs.next();
		else if(go.equals("previous"))
			rs.previous();
		else
			rs.absolute(Integer.parseInt(go));
		session.setAttribute("qn",rs.getRow());
		int []cans1=(int[])session.getAttribute("answer");
		int qn=(Integer)session.getAttribute("qn");
		int x=cans1[qn-1];
%>
		<table border="0" cellpadding="10" width="100%">
		<tr><th align="left">(<label id="number"><%out.println(session.getAttribute("qn"));%></label>)&nbsp;&nbsp;<%=rs.getString(3)%></th></tr>
		<tr><td><input type="radio" class="freeze" <%if(x==1){out.println("checked");}%> name="ans" value="1" onclick="store(this.value)"/>&nbsp;&nbsp;<%=rs.getString(4)%></td></tr>
		<tr><td><input type="radio" class="freeze"<%if(x==2){out.println("checked");}%> name="ans" value="2" onclick="store(this.value)"/>&nbsp;&nbsp;<%=rs.getString(5)%></td></tr>
		<tr><td><input type="radio" class="freeze"<%if(x==3){out.println("checked");}%> name="ans" value="3" onclick="store(this.value)"/>&nbsp;&nbsp;<%=rs.getString(6)%></td></tr>
		<tr><td><input type="radio" class="freeze"<%if(x==4){out.println("checked");}%> name="ans" value="4" onclick="store(this.value)"/>&nbsp;&nbsp;<%=rs.getString(7)%></td></tr>
		<%
		if(request.getParameter("show")!=null && request.getParameter("show").equals("corr"))
		{
		%>
		 <tr><th align="left">Correct answer is:<%=rs.getString(8)%></th></tr>
		 <%}%>
		</table>
