<%request.setCharacterEncoding("UTF-8");%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<%@page import="com.cssweb.common.dictionary.pojo.Dictionary"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page	import="com.cssweb.systemset.service.BranchNoticeService"%>
<%@page	import="com.cssweb.systemset.pojo.BranchNotice"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page	import="java.text.SimpleDateFormat"%>
<%
  ServletContext st = this.getServletConfig().getServletContext();
  ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
  BranchNoticeService branchNoticeService=(BranchNoticeService)ctx.getBean("branchNoticeService");
  Map map=new HashMap();
  map.put("isAudit", "1");
  List list = branchNoticeService.getBranchNoticeByTypeList(map, 1, 10);
%>
<div class="ritagt1">
 <a href="${contextPath }/branchNotice.do?method=getDefaultBranchNoticeList">
       	  <div class="newtit9">
       	  分支机构公告
       	  </div> </a>
        </div>
        <div class="ritagm1" style=" height:170px;overflow:hidden">
<marquee scrollamount="2" direction="up" onmouseover="this.stop()" onmouseout="this.start()">     
 <table width="95%" align="center" border="0" cellspacing="0" cellpadding="0" class=" mt10 lh23">
	    <%
	    if(list!=null&&list.size()>0)
	    {
	     for(int i=0;i<list.size();i++)
	     {
	       BranchNotice branchNotice=(BranchNotice)list.get(i);
	      %>
          <tr>
             <td width="15" align="center" valign="top"><img src="${ctx}/pic/msindex/list_02.gif" class=" mt8"/></td>
            <td title="<%=branchNotice.getTitle() %>">
            <a href="${ctx}/bussinesshall/branchNotice.jsp?id=<%=branchNotice.getId() %>"  target=\"_blank\"><%=branchNotice.getTitle()!=null&&branchNotice.getTitle().length()>18?branchNotice.getTitle().substring(0,18)+"...":branchNotice.getTitle() %> </a>
            </td>
          </tr>
          <%
        %>
        
        <%} }%>
	
  </table>
 </marquee>
 </div>