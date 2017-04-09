<%@ include file="../sql.jsp"%>
<%
		int []cans=(int[])session.getAttribute("answer");
		ResultSet st=(ResultSet)session.getAttribute("result");
		int tot=cans.length;
		int attempt=0;
		for(int i=0;i<tot;i++)
		{
		if(cans[i]!=0)
			attempt++;
		}
		out.println("total questions:"+tot);
		out.println("total attempted questions:"+attempt);
%>