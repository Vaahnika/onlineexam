<%
int m=(Integer)session.getAttribute("m");
int s=(Integer)session.getAttribute("s");
if(s==0)
{
  --m;
  s=59;
}
else
 --s;
		session.setAttribute("m",m);
		session.setAttribute("s",s);
%>
<%=m%>:<%=s%>