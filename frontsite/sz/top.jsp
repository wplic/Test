<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'top.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="${ctx}/css/branchcomp/index.css" rel="stylesheet"
		type="text/css" />
	<link href="${ctx}/css/branchcomp/socroll.css" rel="stylesheet"
		type="text/css" />

  </head>
  
  <body>
<div id="top">
			<div class="logo_box">
				<div class="lit_logo">
					<img src="${ctx}/images/branchcomp/lit_logo.jpg" width="104"
						height="33" />
				</div>
				<a href="http://www.gf.com.cn/"><img src="${ctx}/images/branchcomp/big_logo.jpg"
						width="165" height="44" />
				</a>
			</div>
		</div>

		<div id="dh_box">
			<div class="dh_lt"></div>
			<div class="dh_mid">
				<div class="dh_one" id="index" >
					<a href="${ctx}/sz/index.html">首页</a>
				</div>
				<div class="dh_shu"></div>
				<div class="dh_unone" id="yingye" onmouseover="className='dh_one'"
					onmouseout="className='dh_unone'" >
					<a href="${ctx}/sz/yingye.jsp">营业部信息</a>
				</div>
				<div class="dh_shu"></div>
				<div class="dh_unone" id="yuye" onmouseover="className='dh_one'"
					onmouseout="className='dh_unone'">
					<a href="${ctx}/sz/yuye.jsp">预约开户</a>
				</div>

			</div>
			<div class="dh_rt"></div>

		</div>
  </body>
</html>
