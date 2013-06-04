<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script src="/js/setTab.js"></script>
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
	if(request.getParameter("menuobj1")!=null&&!request.getParameter("menuobj1").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("menuobj1"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
	if(request.getParameter("menuobj2")!=null&&!request.getParameter("menuobj2").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("menuobj2"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
%>
<body class="body_bg">
<jsp:include page="/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a>  &gt; <a href="${ctx }/bussinesshall/movetradehall/mobileDeal.jsp?nav=wsyyt&nav1=gfydjyt">金管家手机证券</a>&gt;移动证券学校 </div>
  <div class="blank5"></div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="mobileDeal_lmenu.jsp?nav2=ydzqxx" />
<table width="93%" class="mt10" align="center">
  <tr>
    <td class="right_tit1">金管家手机证券公告</td>
  </tr>
</table>
<jsp:include page="newsListNotify.jsp">
            <jsp:param name="catName" value="金管家手机证券公告" />
            <jsp:param name="whichCat" value="wsyyt_ydjyt_ydjytgg"/>
            <jsp:param name="state" value="1"/>
            <jsp:param name="showSize" value="5"/>
    </jsp:include>

  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
    <div class="left_tit2">移动证券学校</div>
    <p class="mt10" align="center"><a href="/bussinesshall/movetradehall/mobileDeal_School_jczs.jsp?menuobj1=hor1&menuobj2=board1"><img src="/pic/wsyyt/mobileDeal/mobile_ban2.jpg" /></a></p><br />
     <div class="lh24" style="width:654px; margin-left:auto; margin-right:auto">
    <jsp:include page="newsListSholl.jsp">
            <jsp:param name="catName" value="手机炒股基础知识" />
            <jsp:param name="whichCat" value="wsyyt_zqxx_jczs"/>
            <jsp:param name="state" value="1"/>
            <jsp:param name="showSize" value="4"/>
    </jsp:include>
    <p class="mtb10" align="center"><a href="/bussinesshall/movetradehall/mobileDeal_School_cjwt.jsp?menuobj1=hor1&menuobj2=board1"><img src="/pic/wsyyt/mobileDeal/mobile_ban3.jpg" /></a></p>
    <jsp:include page="newsListSholl.jsp">
            <jsp:param name="catName" value="常见问题" />
            <jsp:param name="whichCat" value="wsyyt_zqxx_cjwt"/>
            <jsp:param name="state" value="1"/>
            <jsp:param name="showSize" value="4"/>
    </jsp:include>
    	</div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />

</body>
</html>