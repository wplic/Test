<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
 <style type="text/css">
#scrollDiv{width:450px;height:250px;min-height:35px;line-height:35px;overflow:hidden}
#scrollDiv li{height:25px;padding-left:10px;}
</style>
<%
  ServletContext st = this.getServletConfig().getServletContext();
  ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
  BranchNoticeService branchNoticeService=(BranchNoticeService)ctx.getBean("branchNoticeService");
  Map map=new HashMap();
  map.put("isAudit", "1");
  List list = branchNoticeService.getBranchNoticeByTypeList(map, 1, 10);
%>

       	 <div class="title">
							<h3>分支机构公告</h3>
							<a href="${contextPath }/branchNotice.do?method=getDefaultBranchNoticeList" class="more">更多</a>
						</div>
						<div class="cont hover">
						<img style="display: none;" id="leftwing3" src="${contextPath}/images/up_image.gif"></img>
						          <DIV id="artList2" style="text-align: center;">
<ul style="line-height:25px">

	    <%
	    if(list!=null&&list.size()>0)
	    {
	    %>
     
  <%
	     for(int i=0;i<list.size();i++)
	     {
	       BranchNotice branchNotice=(BranchNotice)list.get(i);
	      %>
         
 <li><span><a title="<%= branchNotice.getTitle() %>" href="${ctx}/bussinesshall/branchNotice.jsp?id=<%=branchNotice.getId() %>"  target=\"_blank\"><%=branchNotice.getTitle()!=null&&branchNotice.getTitle().length()>12?branchNotice.getTitle().substring(0,12)+"...":branchNotice.getTitle() %> </a>
  
</span></li>
        
        <%}
        %>
       
       
        <% }%> </ul>
				</DIV>
					<div style="TEXT-ALIGN: center;"><A href="###"><img id="rightwnimg3" src="${contextPath}/images/dowm_image.gif"></a></img></div>
				<script type="text/javascript">
		Effect.HtmlMove("artList2","ul/li","scrollTop",2,"leftwing3","rightwnimg3",4000,5);
	</script>
				</div>
					  								