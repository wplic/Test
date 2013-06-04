<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<html><title>广发证券</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<%@page	import="com.cssweb.gpdmGazx.service.GazxObjectService"%>
<%@page	import="com.cssweb.gpdmGazx.pojo.GazxObject"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<body>
<% 
     SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	 ServletContext st = this.getServletConfig().getServletContext();
	 ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	 GazxObjectService gazxObjectService = (GazxObjectService)ctx.getBean("gazxObjectService");
   //取多少条记录
    int showSize =6;
    if(request.getParameter("showSize")!=null&&!request.getParameter("showSize").equals(""))
      showSize = Integer.parseInt(request.getParameter("showSize").trim());
    String pgdm="";
    if(request.getParameter("stock_id")!=null&&!request.getParameter("stock_id").equals(""))
    {
     pgdm=request.getParameter("stock_id");
    }
    String table="gsgg";
	if(request.getParameter("table")!=null)
	  table=request.getParameter("table");
	 
	List list=gazxObjectService.getBygazxObjectList(table,pgdm,1,showSize);
	if(list!=null&&list.size()>0)
	{
	 for(int i=0;i<list.size();i++)
	 {
	   GazxObject gazxObject=(GazxObject)list.get(i);
%>        
	  
             <tr>
               <td width="769" class="red">
               <a href="${contextPath }/cms/newsContentGazx.jsp?guid=<%= gazxObject.getGuid()%>&table=<%=table %>" target=\"_blank\">
		          · <%=gazxObject.getZt()!=null&&gazxObject.getZt().length()>60?gazxObject.getZt().subSequence(0,60)+"...":gazxObject.getZt() %> </a>
               </td>
               <td width="121" class="red"><%=gazxObject.getZhxgrq()!=null?sdf.format(gazxObject.getZhxgrq()):""%></td>
             </tr>
<%}} %>
  </body>
  </html>