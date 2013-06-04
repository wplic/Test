<%request.setCharacterEncoding("UTF-8");%>
<%@page contentType="text/html;charset=UTF-8"%>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.cssweb.runs.service.RunsLanternService" />
<jsp:directive.page import="com.cssweb.runs.pojo.RunsLantern" />
<%
		   ServletContext st = this.getServletConfig().getServletContext();
		   ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
		   RunsLanternService runsLanternService = (RunsLanternService)ctx.getBean("runsLanternService");
		   List runslist =  runsLanternService.getRunsByTime();
    
%>
<script type="text/javascript">
	function openggmarque(objid)
	{
			var url="${contextPath}";
 			url=url+"/commons/opengg.jsp?runsid="+objid;
			window.open(url,'newwindow', 'height=400, width=521, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no,top=80,left=300');
	}
		
</script>
<marquee scrollamount="3" onmouseover="this.stop()" onmouseout="this.start()" width="450">  
    			<%
    					 if (runslist != null)
    					 {	
    						for (int i = 0; i<runslist.size(); i++)
    						{
    						
    							RunsLantern runsLantern =	(RunsLantern)runslist.get(i);
    							if (runsLantern != null )
    							{
    								
    							%>·<a href="${contextPath}/commons/opengg.jsp?runsid=<%=runsLantern.getId() %>" target="_blank"><%= runsLantern.getTitle() %></a> <%
    							}
    						}
    					 }
    			
    			 %>
</marquee>
