<%@ include file="../sql.jsp"%>
<body>
<div style="width:100%;height:200px;">
		<img src="../image/exam.jpg" style="width:100%;height:100%"/>
</div>
<hr style="border:2px solid red;"/>
<%

if(session.isNew())
{
response.sendRedirect("index.jsp?errcode=3");
return;
}
		int []cans=(int[])session.getAttribute("answer");
		ResultSet rstst=(ResultSet)session.getAttribute("result");
		int marks=0;
		int q=0;
		int at=cans.length;
		rstst.beforeFirst();
		while(rstst.next())
		{
				if(cans[q++]!=rstst.getInt(8))
		{
		%>
		<input class="freeze" type="button" value="<%=q%>" onclick='navigate(this.value)' style="background-color:red;color:white;font-size:18px"/>
		<%
		}
	else
		{
		marks++;
		%>
		<input class="freeze" type="button" value="<%=q%>" onclick='navigate(this.value)' style="background-color:green;color:white;font-size:18px"/>	
		<%
		}
		}
		
%>

<table align="center" border="0" style="margin-top:30px;">
<tr><th>Total marks:</th><th><%=at%></th></tr><tr><th>You obtained:</th><th><%=marks%></th></tr>
<tr><th>Legend:</th><th style="background-color:red">Incorrect/Unattempted</th><th style="background-color:green">Correct</th></tr>
</table>
<div id="question"></div>
<script>
function navigate(to)
		{	
			var obj=new XMLHttpRequest();
			obj.onreadystatechange=function()
			{
				if(obj.readyState==4)
				{
				 var res=obj.responseText;
				 document.getElementById("question").innerHTML=res;
				 }
			};
			obj.open("GET","navigate.jsp?to="+to+"&show=corr");
			obj.send();
		}
</script>
</body>