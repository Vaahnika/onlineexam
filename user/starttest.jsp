<%@ include file="../sql.jsp"%>
<div style="width:100%;height:200px;">
		<img src="../image/exam.jpg" style="width:100%;height:100%"/>
		</div>
		<%
		int noq=0,m=0,s=0;
		
if(session.isNew())
{
response.sendRedirect("index.jsp?errcode=3");
return;
}
		if(application.getAttribute((String)session.getAttribute("testcode"))==null)
		{
		String query="select *from(select *from  questions order by DBMS_RANDOM.VALUE) where rownum<=2";
		Statement st=cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
		ResultSet rst=st.executeQuery(query);
		session.setAttribute("result",rst);
		rst.last();
		noq=rst.getRow();
		session.setAttribute("noq",noq);
		session.setAttribute("qn",1);
		int ans[]=new int[noq];
		session.setAttribute("answer",ans);
		m=noq/2;
		s=0;
		if(noq%2!=0)
		  s=30;
		session.setAttribute("m",m);
		session.setAttribute("s",s);
		application.setAttribute((String)session.getAttribute("testcode"),session.getId());
		}
	%>
	<table style="border:1px solid blue;" width="100%">
			<tr style="background-color:lightgreen">
				<td align="center">Total questions &nbsp;&nbsp;&nbsp;<%=session.getAttribute("noq")%></td>
				<td align="center">Time remaining &nbsp;&nbsp;&nbsp;<label id="time"><%=session.getAttribute("m")%>:<%=session.getAttribute("s")%></label></td>
			</tr>
		</table>
<div id="container">
	<form name="frm">
	<body onload='navigate("<%=session.getAttribute("qn")%>")'>
	<div id="question" style="margin:30 0 0 100;width:60%;float:left;border:0px solid red">
	</div>
	<div style="float:left;margin:3% 0 0 0%;width:30%" id="pallette">
	</div>
	<table style="margin-top:50%;margin-left:30%;float:none;position:absolute" >
	<tr><td><input type="button" class="freeze" value="First" onclick="navigate('1')" name="first"/></td><td><input type="button" class="freeze" name="first" value="Previous" onclick="navigate('previous')"/></td><td><input type="button"class="freeze" value="Next" onclick="navigate('next')"name="last"/></td><td><input type="button"class="freeze" name="last" value="Last"onclick="navigate('<%=noq%>')"/></td><td><input type="button"class="freeze" value="Clear Response" onclick="form.reset();store('0')"/><input type="button" value="End Test" onclick="end()"/></td>
	</tr>
	</table></form>
	</div>
	
	<script>
	var toq=<%=session.getAttribute("noq")%>;
	var min=toq/2;
	var timer=setInterval(showTime,1000);
	function showTime()
		{	
			var at=document.getElementById("time").innerHTML.trim();
			if(at=="0:0")
			{
				clearInterval(timer);
				var x=document.getElementsByClassName("freeze");
				for(j=0;j<x.length;j++)
				 x[j].disabled=true;
			return;
			}
			var obj=new XMLHttpRequest();
			obj.onreadystatechange=function()
			{
				if(obj.readyState==4)
				{
				 var res=obj.responseText;
				 document.getElementById("time").innerHTML=res;
				}
			};
			obj.open("GET","timer.jsp");
			obj.send();
		}
		function navigate(to)
		{	
			loadBt();
			var obj=new XMLHttpRequest();
			obj.onreadystatechange=function()
			{
				if(obj.readyState==4)
				{
				 var res=obj.responseText;
				 document.getElementById("question").innerHTML=res;
				 var number=document.getElementById("number").textContent;
				 if(number==1)
				{
					var x=document.getElementsByName("first");
						for(i=0;i<x.length;i++)
							x[i].disabled=true;
					var x=document.getElementsByName("last");
						for(i=0;i<x.length;i++)
							x[i].disabled=false;
					
					return;
				}
				else if(document.getElementById("number").textContent==toq)
				{
					var x=document.getElementsByName("last");
						for(i=0;i<x.length;i++)
							x[i].disabled=true;
					var x=document.getElementsByName("first");
						for(i=0;i<x.length;i++)
							x[i].disabled=false;
							return;
				}
				else
				{
				var x=document.getElementsByName("last");
						for(i=0;i<x.length;i++)
							x[i].disabled=false;
					var x=document.getElementsByName("first");
						for(i=0;i<x.length;i++)
							x[i].disabled=false;
							return;
				
				}
				
				}
			};
			obj.open("GET","navigate.jsp?to="+to);
			obj.send();
		}
		function loadBt()
		{	

			var obj=new XMLHttpRequest();
			obj.onreadystatechange=function()
			{
				if(obj.readyState==4)
				{
				 var res=obj.responseText;
				  document.getElementById("pallette").innerHTML=res;
				}
			};
			obj.open("GET","store.jsp");
			obj.send();
		}
		function end()
		{	
			var obj=new XMLHttpRequest();
			obj.onreadystatechange=function()
			{
				if(obj.readyState==4)
				{
				 var res=obj.responseText;
				 if(confirm("Are you sure want to submit the test"+res))
					location.href="finalsubmit.jsp";
				}
			};
			obj.open("GET","endtest.jsp");
			obj.send();
		}
		function store(value)
		{
			var obj=new XMLHttpRequest();
			obj.onreadystatechange=function()
			{
				if(obj.readyState==4)
				{
				 var res=obj.responseText;
				  document.getElementById("pallette").innerHTML=res;
				}
			};
			obj.open("GET","store.jsp?value="+value);
			obj.send();
		}
	</script>
	</body>