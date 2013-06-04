<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("menu3"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
%>
<body class="body_bg">
<jsp:include page="${contextPath}/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index"> 首页 </a> &gt;<a href="${contextPath }/infoCenter/fund.jsp?nav=zxzx&nav1=jj&nav2=ggxl"> 基金</a> &gt; 基金新闻</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="${contextPath}/infoCenter/fund_lmenu.jsp" />
	  <!-- 资讯检索 -->
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
    <div class="left_tit2">基金新闻</div>
    <div class="blank10"></div>
       <jsp:include flush="true" page="${contextPath}/infoCenter/gfJjxlTop.jsp">
	          <jsp:param name="whichCat" value="zxzx_jj_jjxw"/>
	          
	 </jsp:include>
    
    <div class="blank10"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td valign="top">
        	<iframe width="100%"  src="${contextPath}/infoCenter/stockList.jsp?whichCat=zxzx_jj_jjxw&showSize=16" frameborder="0" scrolling="no"" marginheight="0" marginwidth="0" id="fundNews" name="fundNews" height="500" ></iframe>
        </td>
        <td width="236" valign="top" class="bg_ec">
				<jsp:include flush="true" page="${contextPath}/infoCenter/fundyjsgg.jsp"></jsp:include>	
    			<div class="blank5"></div>
    				<jsp:include flush="true" page="${contextPath}/infoCenter/kfsjj.jsp">
			          <jsp:param name="beginNum" value="1"/>
			           <jsp:param name="endNum" value="10"/>
			        </jsp:include>
        	</td>
      </tr>
    </table>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>

<jsp:include page="/share/bottom.jsp" />
<script src="/js/setTab.js"></script>
</body>
</html>
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 
