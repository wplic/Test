<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.cssweb.collect.service.MgrInfoService"/>
<jsp:directive.page import="com.cssweb.collect.pojo.MgrInfo"/>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/assetManage/assetManage.css" rel="stylesheet" type="text/css" />
</head>
 <%
 ServletContext st = this.getServletConfig().getServletContext();
 ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
 MgrInfoService mgrInfoService = (MgrInfoService)ctx.getBean("mgrInfoService");
 long ygbh=1l;
 if(request.getParameter("ygbh")!=null&&!request.getParameter("ygbh").equals(""))
 ygbh=Long.parseLong(request.getParameter("ygbh").trim());
 List list=mgrInfoService.getMgrInfoBySearch(ygbh,"","","");
 
 %>
<body>
<div class="main">
  <!--左侧sied开始-->
  
  <!--中侧sied开始-->
  <div class="w492 fleft mlr4">
	
  	<div class="comtit1"><h4>业务人员详细信息</h4></div>

	<%if(list!=null&&list.size()>0) {
		for(int i=0;i<list.size();i++){
			 MgrInfo mgrInfo=(MgrInfo)list.get(i);
	%>
		<div class="mxjlbox">
		  <table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			  <td width="78%" valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					   <tr>
					     <td>营业部:</td>
					     <td><%=mgrInfo.getDwmc()!=null&&!mgrInfo.getDwmc().equals("")?mgrInfo.getDwmc():"" %></td> 
					   </tr>
					   <tr>
					     <td>姓名:</td>
					     <td><%=mgrInfo.getYgxm()!=null&&!mgrInfo.getYgxm().equals("")?mgrInfo.getYgxm():"" %></td> 
					   </tr>
					   <tr>
					     <td>性别:</td>
					     <td>
					     <%
						  	if(mgrInfo.getYgxb()!=null&&mgrInfo.getYgxb().equals("0")){
						  	out.print("");}else if(mgrInfo.getYgxb()!=null&&mgrInfo.getYgxb().equals("1")){
						  	out.print("男");}else if(mgrInfo.getYgxb()!=null&&mgrInfo.getYgxb().equals("2")){
						  	out.print("女");}
						  	%>
					     </td> 
					   </tr>
					   <tr>
					     <td>员工编号:</td>
					     <td><%=mgrInfo.getYgbh()>0?mgrInfo.getYgbh():"" %></td> 
					   </tr>
					    <%
						  	 List zsList= mgrInfoService.getMgrInfoZsByYgbh(mgrInfo.getYgbh());
						  	 List kmList= mgrInfoService.getMgrInfoKmByYgbh(mgrInfo.getYgbh());
						  	%>
					   <tr>
					     <td>执业资格类别:</td>
					     <td>
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
						  	 %>
					     </td> 
					   </tr>
					   <tr>
					     <td>执业资格证书编号:</td>
					     <td>
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
					   </tr>
					    <tr>
					     <td>证书有效截止日期:</td>
					   <td> 
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
						    </tr> 
					   
					   <tr>
					     <td>从业资格:</td>
					     <td>
					     <%
						  	 if(kmList!=null&&kmList.size()>0)
						  	 {
						  	   //for(int km=0;km<kmList.size();km++)
						  	  // {
						  	   // MgrInfo kmMgrInfo =(MgrInfo)kmList.get(km);
						  	   // out.print(kmMgrInfo.getKskmmc()+" <br/>");
						  	   //}
						  	    out.println("有");
						  	 }else{
						  	  out.print("无");
						  	 }
						  	 %>
					     </td> 
					   </tr>
					   
					</table>
			  </td>
			  <td width="22%"><img src="${ctx}/branches/showUploadImage.jsp?id=<%=mgrInfo.getYgbh() %>" width="106" height="146" alt="无"/></td>
			</tr>
		  </table>
		 </div>
	<%}
	}%>
  </div>  
  <!--中侧sied结束-->
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
</body>
</html>