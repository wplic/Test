<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.cssweb.systemset.pojo.Branch"%>
<%@page import="com.cssweb.common.dictionary.pojo.Dictionary"%>
<%@page import="com.cssweb.systemset.pojo.BranchNotice"%>
<%@page import="com.cssweb.collect.pojo.MgrInfo"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.common.toDbLob.service.LobService"%>
<%@page import="com.cssweb.collect.service.MgrInfoService"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"   %>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.gazxfund.pojo.FundGsInfo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Branch branch = (Branch)request.getAttribute("branch");
	List listnotice = (List)request.getAttribute("listnotice"); 
	String dwbh = (String)request.getAttribute("dwbh");
	List mgrList = null;
	if (request.getAttribute("mgrList") != null)
	{
			mgrList = (List)request.getAttribute("mgrList");
	}
	String type = "";
	if (request.getAttribute("type") != null )
	{
			type = (String)request.getAttribute("type");
	}
		ServletContext st = this.getServletConfig().getServletContext();
		ApplicationContext ctx =  WebApplicationContextUtils.getRequiredWebApplicationContext(st);
		LobService lobService = (LobService)ctx.getBean("lobService");
		MgrInfoService mgrInfoService = (MgrInfoService)ctx.getBean("mgrInfoService");
		Branch	branchInfo = null;
		if (request.getAttribute("branchInfo") != null)
		{
			branchInfo =(Branch)request.getAttribute("branchInfo");
		}
			
 %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/branches/branches.css" rel="stylesheet" type="text/css" />
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script >
		function pagereset()
		{
				
				document.getElementById('current_page').value = '1';
		}
</script>
</head>

<body class="body_bg">

<jsp:include page="${contextPath }/share/top.jsp?nav=grgf&nav1=yywd" />
<form action="${contextPath }/mgrInfoAction.do?method=getMgrInfoBySearchPages&nav=grgf&nav1=yywd" id="yybListForm"  name="yybListForm" method="post">
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt; <a  href="${contextPath }/branches/index.jsp?nav=grgf">分支机构</a> &gt; 营业网点</div>
  <div class="left_tit2">
			业务人员执业信息
	</div>
    <div class="blank10"></div> 
	
  <div class="blank10"></div>
    <table cellspacing="0" cellpadding="0" width="100%" class="lh25" border="1" bordercolor="#cccccc">
				 			 		<tr  class="rrtab_tt bold">
										       <td align="center" nowrap="nowrap">姓名</td>
											   <td align="center" nowrap="nowrap">性别</td>
											   <td align="center" nowrap="nowrap">员工编号</td>
											   <td align="center" nowrap="nowrap">所在营业部名称</td>
											   <td align="center" nowrap="nowrap">执业资格</td>
											   <td align="center" nowrap="nowrap">执业资格证书编号</td>
											   <td align="center" nowrap="nowrap">证书有效截止日期</td>
											   <td align="center" nowrap="nowrap">从业资格</td>
							<%
									if (mgrList != null && mgrList.size()>0)
									{
										 for (int i = 0 ; i < mgrList.size() ; i ++ )
										 {
										 		MgrInfo mgrInfo =(MgrInfo)mgrList.get(i);
										 		 List zsList= mgrInfoService.getMgrInfoZsByYgbh(mgrInfo.getYgbh());
						      					 List kmList= mgrInfoService.getMgrInfoKmByYgbh(mgrInfo.getYgbh());
										 		  if(zsList==null&&kmList==null)
						       {
						       %>
								  <tr>
								    <td  height="80" colspan="6" align="center">
								      <a href="${contextPath }/branches/mgrInfoSearch.jsp?nav=grgf&nav1=mgrInfo"> 
								          没有找到您要查询的资料，请点击返回
								      </a>
								    </td>
								  </tr>
							   <%
						       }else{
						       %>
						   <tr>
						  	<td align="center"><a href="#" onclick="javascript:window.open('${contextPath }/branches/mgrInfo.jsp?ygbh=<%=mgrInfo.getYgbh() %>','','width=492,height=215,resizable=no,scrollbars=no,menubar=no,location=no,status=yes');"> <%=mgrInfo.getYgxm()!=null&&!mgrInfo.getYgxm().equals("")?mgrInfo.getYgxm():"" %></a></td>
						  	<td align="center">
						  	<%
						  	if(mgrInfo.getYgxb()!=null&&mgrInfo.getYgxb().equals("0")){
						  	out.print("");}else if(mgrInfo.getYgxb()!=null&&mgrInfo.getYgxb().equals("1")){
						  	out.print("男");}else if(mgrInfo.getYgxb()!=null&&mgrInfo.getYgxb().equals("2")){
						  	out.print("女");}
						  	%>
						  	</td>
						   <td align="center">
						  	<%=mgrInfo.getYgbh()>0?mgrInfo.getYgbh():"" %>
						  	</td>
						  	<td align="center">
						  	<%=mgrInfo.getDwmc()!=null&&!mgrInfo.getDwmc().equals("")?mgrInfo.getDwmc():"" %>
						  	</td>
						  	
						  	<td align="center">
						  	<%
						  	 if(zsList!=null&&zsList.size()>0)
						  	 {
						  	   for(int zs=0;zs<zsList.size();zs++)
						  	   {
						  	    MgrInfo zsMgrInfo =(MgrInfo)zsList.get(zs);
						  	    out.print(zsMgrInfo.getZyzglbmc()+" <br/>");
						  	   }
						  	 }else{
						  	   out.print(kmList!=null&&kmList.size()>0?"正在申请中":"无");
						  	 }
						  	 %></td>
						  	<td align="center">
						  	<%
						  	 if(zsList!=null&&zsList.size()>0)
						  	 {
						  	   for(int zs=0;zs<zsList.size();zs++)
						  	   {
						  	    MgrInfo zsMgrInfo =(MgrInfo)zsList.get(zs);
						  	    out.print(zsMgrInfo.getZsbh() +" <br/>");
						  	   }
						  	 }else{
						  	  out.print("无");
						  	 }
						  	 %>
						  	</td>
						  <td align="center"> 
							    <%
							  	 if(zsList!=null&&zsList.size()>0)
							  	 {
							  	   for(int zs=0;zs<zsList.size();zs++)
							  	   {
							  	    MgrInfo zsMgrInfo =(MgrInfo)zsList.get(zs);
							  	    out.print(zsMgrInfo.getZsyxqjssj() +" <br/>");
							  	   }
							  	 }else{
							  	  out.print("");
							  	 }
							  	 %>
							     </td>
						  	<td align="center">
						  		<%
						  	 if(kmList!=null&&kmList.size()>0)
						  	 {
						  	  // for(int km=0;km<kmList.size();km++)
						  	  // {
						  	    //MgrInfo kmMgrInfo =(MgrInfo)kmList.get(km);
						  	    //out.print(kmMgrInfo.getKskmmc()+" <br/>");
						  	  // }
						  	  
						  	    out.println("有");
						  	 }else{
						  	  out.print("无");
						  	 }
						  	 %>
						  	</td>
						  </tr>
						       <%
						     }
										 }
											
									}
							 %>
							   <tr>
						      		<td colspan="8" align="right"><input type="hidden" name="dwbh" id="dwbh" value="<%=dwbh %>" /><%=PageUtil.pagination("window.yybListForm",totleCount, currentPage, pagesize)%> </td>
						      </tr>
							 
							
						</table>	 
</div>
  
  

</form>
<jsp:include page="${contextPath }/share/bottom.jsp" />

</body>
</html>