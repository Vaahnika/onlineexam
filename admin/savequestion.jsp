<%@include file="../sql.jsp" %>
<%
if(request.getParameter("subject")!=null)
	{
	String selec=request.getParameter("subject");
	String que=request.getParameter("que");
	String ans1=request.getParameter("ans1");
	String ans2=request.getParameter("ans2");
	String ans3=request.getParameter("ans3");
	String ans4=request.getParameter("ans4");
	String corr=request.getParameter("corr");
									String query="select paperid from papers where name=?";
									PreparedStatement pst=cn.prepareStatement(query);
									pst.setString(1,selec);
									ResultSet rst=pst.executeQuery();
									rst.next();
									String id=rst.getString(1);
									out.println(id);
	String query1="insert into questions values(question_seq.nextval,?,?,?,?,?,?,?)";
	PreparedStatement pst1=cn.prepareStatement(query1);
	pst1.setString(1,id);
	pst1.setString(2,que);
	pst1.setString(3,ans1);
	pst1.setString(4,ans2);
	pst1.setString(5,ans3);
	pst1.setString(6,ans4);
	pst1.setString(7,corr);
	if(pst1.executeUpdate()>0)
	{
		response.sendRedirect("addquestion.jsp?flag=success");
	}
}
else
{
out.println("hhh");
}
%>