<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.cssweb.collect.service.TcsswebRyxxService"/>
<jsp:directive.page import="com.cssweb.collect.pojo.TcsswebRyxx"/>
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
 TcsswebRyxxService tcsswebRyxxService = (TcsswebRyxxService)ctx.getBean("tcsswebRyxxService");
 String zsbh="1";
  List list=null;
 if(request.getParameter("zsbh")!=null&&!request.getParameter("zsbh").equals(""))
  list=tcsswebRyxxService.getTcsswebRyxxBySearch("","",request.getParameter("zsbh"));
 
 %>
<body>
<div class="main">
  <!--左侧sied开始-->
  
  <!--中侧sied开始-->
  <div class="w492 fleft mlr4">
	
  	<div class="comtit1"><h4>业务人员详细信息</h4></div>

	<%if(list!=null&&list.size()>0) {
		for(int i=0;i<list.size();i++){
			 TcsswebRyxx tcsswebRyxx=(TcsswebRyxx)list.get(i);
	%>
		<div class="mxjlbox">
		  <table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			  <td width="78%" valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					   <tr>
					     <td>营业部:</td>
					     <td>
					     <%=tcsswebRyxx .getDeptname()!=null&&!tcsswebRyxx .getDeptname().equals("")?tcsswebRyxx .getDeptname():"" %>
					     </td> 
					   </tr>
					   <tr>
					     <td>姓名:</td>
					     <td><%=tcsswebRyxx.getRyxm()!=null&&!tcsswebRyxx.getRyxm().equals("")?tcsswebRyxx.getRyxm():"" %></td> 
					   </tr>
					   <tr>
					     <td>性别:</td>
					     <td>
					    <%=tcsswebRyxx.getSex()!=null&&!tcsswebRyxx.getSex().equals("")?tcsswebRyxx.getSex():""%>
					     </td> 
					   </tr>
					   <tr>
					     <td>员工编号:</td>
					     <td><%=tcsswebRyxx.getUserid()!=null&&!tcsswebRyxx.getUserid().equals("")?tcsswebRyxx.getUserid():""%></td> 
					   </tr>
					    
					   <tr>
					     <td>执业资格类别:</td>
					     <td>
					     <%=tcsswebRyxx.getZyzg()!=null&&!tcsswebRyxx.getZyzg().equals("")?tcsswebRyxx.getZyzg():"" %>
					     </td> 
					   </tr>
					   <tr>
					     <td>执业资格证书编号:</td>
					     <td>
					     <%=tcsswebRyxx.getZsbh()!=null&&!tcsswebRyxx.getZsbh().equals("")?tcsswebRyxx.getZsbh():"" %>
					     </td> 
					   </tr>
					    <tr>
					     <td>证书有效截止日期:</td>
					   <td> 
						    <%=tcsswebRyxx.getJzrq()!=null&&!tcsswebRyxx.getJzrq().equals("")?tcsswebRyxx.getJzrq():"" %>
						     </td>
						    </tr> 
					   
					   <tr>
					     <td>从业资格:</td>
					     <td>
					    有
					     </td> 
					   </tr>
					   
					</table>
			  </td>
			  <td width="22%"><img src="${ctx}/branches/showUploadImagez.jsp?zsbh=<%=tcsswebRyxx.getZsbh() %>" width="106" height="146" alt="无"/></td>
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