<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="com.oreilly.servlet.Base64Decoder"%>
<%@page import="com.oreilly.servlet.Base64Encoder"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	if(request.getParameter("nav1")!=null&&!request.getParameter("nav1").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav1"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
	if(request.getParameter("nav")!=null&&!request.getParameter("nav").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
	if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav2"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
	if(request.getParameter("menu3")!=null&&!request.getParameter("menu3").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav2"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
	
	if(request.getParameter("state")!=null&&!request.getParameter("state").equals("")){
		if(sqlInjectValidate.vakidateSqlIfIngter(request.getParameter("state"))){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
	if(request.getParameter("urlPre")!=null&&!request.getParameter("urlPre").equals("")){
		if(sqlInjectValidate.vakidateSqlIfByUrl(request.getParameter("urlPre"))){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
%>
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=zxzx&nav1=xw" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt;  <a href="${contextPath }/infoCenter/index.jsp?nav=zxzx">资讯中心</a> &gt; 新闻</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	   <jsp:include page="/infoCenter/info_lmenu.jsp">
           <jsp:param name="nav2" value="zxzx_jryw"/>
    	</jsp:include>
	  <jsp:include page="/infoCenter/Search.jsp"/>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->	  
	  <jsp:include page="${contextPath }/infoCenter/jrywzs_news.jsp">
           <jsp:param name="catName" value="今日要闻综述" />
           <jsp:param name="whichCat" value="zxzx_jryw"/>
           <jsp:param name="state" value="1"/>
           <jsp:param name="showSize" value="5"/>
    	</jsp:include>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 

</body>
</html>