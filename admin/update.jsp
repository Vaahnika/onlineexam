<%@include file="../sql.jsp" %>
<%
if(request.getParameter("update")!=null)
	{
	String selec=request.getParameter("id");
	String que=request.getParameter("que");
	String ans1=request.getParameter("ans1");
	String ans2=request.getParameter("ans2");
	String ans3=request.getParameter("ans3");
	String ans4=request.getParameter("ans4");
	String corr=request.getParameter("corr");
									String query="update questions set question=?,ans1=?,ans2=?,ans3=?,ans4=?,correct=? where id=?";
									PreparedStatement pst=cn.prepareStatement(query);
									pst.setString(7,selec);
									pst.setString(1,que);
									pst.setString(2,ans1);
									pst.setString(3,ans2);
									pst.setString(4,ans3);
									pst.setString(5,ans4);
									pst.setString(6,corr);								
	if(pst.executeUpdate()>0)
	{
		response.sendRedirect("updatequestion.jsp?flag=success");
	}
}
if(request.getParameter("delete")!=null)
	{
	String selec=request.getParameter("id");
									String query="delete from questions where id=?";
									PreparedStatement pst=cn.prepareStatement(query);
									pst.setString(1,selec);								
	if(pst.executeUpdate()>0)
	{
		response.sendRedirect("updatequestion.jsp?flag=success");
	}
}
%>