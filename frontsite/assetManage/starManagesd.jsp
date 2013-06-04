<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page	import="com.cssweb.video.service.TvideoProgramService"%>
<%@page	import="com.cssweb.video.pojo.TvideoProgram"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page	import="com.cssweb.video.service.TvideoCategoryService"%>
<%@page	import="com.cssweb.video.pojo.TvideoCategory"%>
<%@page	import="com.cssweb.video.service.StreamService"%>
<%@page	import="com.cssweb.video.pojo.Stream"%>
<jsp:directive.page import="com.css.system.Configuration" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/assetManage/assetManage.css" rel="stylesheet" type="text/css" />
</head>
<%@ include file="/commons/turnPage.jsp"%>
<%
    long id=133l;
    if(request.getParameter("id")!=null&&!request.getParameter("id").equals(""))
    id=Long.parseLong(request.getParameter("id").trim());
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	TvideoCategoryService tvideoCategoryService = (TvideoCategoryService)ctx.getBean("tvideoCategoryService");
	TvideoCategory tvideoCategory = tvideoCategoryService.getTvideoCategoryByCode("009");
	
	 //System.out.println("         urlLink======"+urlLink);
 %>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 视频资讯</div>
</div>
<div>
  <!--左侧sied开始-->
  <div class="wrap_2left">
  <div class="w210 fleft">
	  <jsp:include page="${contextPath }/assetManage/assetInfo_index_lmenu.jsp?nav=spxx" />
  </div>
  <!--左侧sied结束-->
  <div class="w706 fright">
  		<div class="left_tit2">视频资讯</div>
       <iframe id="iptvIfm" name="iptvIfm" src="${ctx }/tvideo.do?method=getSdByCategoryId&category=<%=tvideoCategory.getId()%>" frameborder="0" marginheight="0" marginwidth="0" height="100%" width="100%" scrolling="no">
                   </iframe>

  <div style="height:10px; overflow:hidden"></div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
</div>
<jsp:include page="/commons/msbottom.jsp" />

</body>
</html>