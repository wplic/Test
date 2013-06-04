<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>
<script type="text/ecmascript">
			function mySwitchNews(ids)
			{
				if (ids == 'tagtabs11')
				{
						document.getElementById('tagtabs11').className = 'active red bold';
						document.getElementById('tagtabs12').className = ' white bold';
						document.getElementById('tagtabs13').className = ' white bold';
						//document.getElementById('fundSort').src= '${contextPath}/fundValueAction.do?method=getOpenFundValueList&nav=zxzx&nav1=jj';
				}
				if (ids == 'tagtabs12')
				{
						document.getElementById('tagtabs11').className = ' white bold';
						document.getElementById('tagtabs12').className = 'active red bold';
						document.getElementById('tagtabs13').className = ' white bold';
				}
				if (ids == 'tagtabs13')
				{
						document.getElementById('tagtabs11').className = ' white bold';
						document.getElementById('tagtabs12').className = ' white bold';
						document.getElementById('tagtabs13').className = 'active red bold';
				}
			}
</script>

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
	if(request.getParameter("menu")!=null&&!request.getParameter("menu").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("menu"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
	if(request.getParameter("menu2")!=null&&!request.getParameter("menu2").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("menu2"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
	if(request.getParameter("menu3")!=null&&!request.getParameter("menu3").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("menu3"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
 %>
<body class="body_bg">
<jsp:include page="${contextPath}/share/top.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index"> 首页 </a> &gt;<a href="${contextPath }/infoCenter/fund.jsp?nav=zxzx&nav1=jj&nav2=ggxl"> 基金</a> &gt; 基金超市</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	 	  <jsp:include page="${contextPath}/infoCenter/fund_lmenu.jsp" />
<jsp:include page="/infoCenter/Search.jsp"/>
  </div>
  <div class="iptvside_bot"></div>
  <div class="blank5"></div>
  <p align="center"><a href="${contextPath }/fundFilterAction.do?method=getFilterList"><img src="${contextPath}/pic/infoCenter/ban_jjsx.jpg" /></a></p>
  <div class="blank5"></div>
  <p align="center"><a href="#"><img src="${contextPath}/pic/infoCenter/ban_jjwj.jpg" /></a></p>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  <div class="left_tit2">基金净值</div>
    <div class="blank5"></div>
    <ul class="gsyw_box2" >
        	<li class="active red bold" id="tagtabs11" onmouseover="mySwitchNews('tagtabs11')"><a href="${contextPath}/fundValueAction.do?method=getOpenFundValueList&nav=zxzx&nav1=jj" target="fundSort">开放式基金</a></li>
            <li class=" white bold" id="tagtabs12" onmouseover="mySwitchNews('tagtabs12')"><a href="${contextPath}/fundValueAction.do?method=getCloseFundValueList" target="fundSort">封闭式基金</a></li>
            <li class=" white bold" id="tagtabs13" onmouseover="mySwitchNews('tagtabs13')"><a href="${contextPath }/fundMoneyValueAction.do?method=getFundMoneyValueList" target="fundSort">货币型基金</a></li>
    </ul>
    
    
    <table   border="1" class="lh24 center"  bordercolor="#cccccc" width="100%" id="tabs11">
     			<tr>
     					<td>
     							 <iframe id="fundSort" name="fundSort"  width="100%" height="720" 
     							   src="${contextPath}/fundValueAction.do?method=getOpenFundValueList&nav=zxzx&nav1=jj"  frameborder="0" scrolling="no"" marginheight="0" marginwidth="0"  ></iframe>
     					</td>
     			</tr>
    </table>
   
    
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<script src="/js/setTab.js"></script>
<jsp:include page="${contextPath}/share/bottom.jsp" />
</body>
</html>