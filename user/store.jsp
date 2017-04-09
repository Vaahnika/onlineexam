<%@ include file="../sql.jsp"%>
<%

		int []cans=(int[])session.getAttribute("answer");
		if(request.getParameter("value")!=null)
		{	
			int value=Integer.parseInt(request.getParameter("value"));
			int qn=(Integer)session.getAttribute("qn");
			cans[qn-1]=value;
		}
%>
<h4>Question Pallette</h4>
	<%
	for(int i=0;i<cans.length;i++)
	{
	if(cans[i]==0)
		{
		%>
		<input class="freeze" type="button" value="<%=i+1%>" onclick='navigate(this.value)' style="background-color:red;color:white"/>
		<%
		}
	else
		{%>
		<input class="freeze" type="button" value="<%=i+1%>" onclick='navigate(this.value)' style="background-color:green;color:white"/>	
		<%
		}
	}
	%>