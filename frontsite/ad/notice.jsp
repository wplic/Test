<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page	import="com.cssweb.runs.service.RunsLanternService"%>
<%@page	import="com.cssweb.runs.pojo.RunsLantern"%>
<%@page import="java.util.List"%>

<%
	 ServletContext st = this.getServletConfig().getServletContext();
	 ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	 RunsLanternService runsLanternService = (RunsLanternService)ctx.getBean("runsLanternService");
	 List runslist = null;
   	 if(runsLanternService.getRunsByTime()!=null)
   	    runslist=runsLanternService.getRunsByTime();
   	
   	
%>
<link href="${ctx}/css/style.css" rel="stylesheet" type="text/css" />
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="marqu">
	  <tr>
	    <td width="32" valign="top"><img src="${ctx}/pic/index/list_03.gif" /></td>
	    <td>
		    <marquee scrollamount="3" onmouseover="this.stop()" onmouseout="this.start()" width="640">
		    <%
    					 if (runslist != null)
    					 {	
    						for (int i = 0; i<runslist.size(); i++)
    						{
    							RunsLantern runsLantern =	(RunsLantern)runslist.get(i);
    							if (runsLantern != null )
    							{
    								%>·<a href="#" onclick="openggmarque('<%=runsLantern.getId() %>');return false;"><%= runsLantern.getTitle() %></a> <%
    							}
    						}
    					 }
    			
    			 %>
		    </marquee>
	    </td>
      </tr>
   </table>
<script type="text/javascript">
	function openggmarque(objid)
	{
			var url="${ctx}";
 			url=url+"/ad/opengg.jsp?runsid="+objid;
			window.open(url,'newwindow', 'height=400, width=521, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no,top=80,left=300');
	}
		
</script>