<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/branches/branches.css" rel="stylesheet" type="text/css" />
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
%>
<body class="body_bg">
<jsp:include page="${contextPath }/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt; <a  href="${contextPath }/branches/index.jsp?nav=grgf">分支机构</a> &gt; 产品与服务</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="productsServices_lmenu.jsp" />
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
    <div class="left_tit2">E对壹短信定制服务</div>
    <div class="blank10"></div>
       <div><img src="/pic/branches/banner6.jpg" title="E对壹短信定制服务" /></div>
    <div class="blank10"></div>
    <div class="kline">
      <div class="qiebg">
      <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">短信亮点</div>
      <div class="p10 lh22">
        <p>　
        <br />帐户交易类信息——资产信息及时掌控，帐户变动及时提醒！
 <br />包括提示帐户明细、帐户市值、成交提示、委托提示、转帐提示、帐户安全提示、新股中签提示、分红派息提示等相关信息。
 <br />持仓个股类信息——持仓信息及时提示，个股动向尽在掌握！
 <br />包括持仓股票报价、持仓股票交易所信息提示、持仓股票价位报警、持仓股票异常换手率提示、持仓股票连续多日收阳提示、持仓股票连续多日收阴提示、持仓股票多日累计换手率超30%、持仓股票异动提示、封闭式基金净值等相关信息。
 <br />提示预警类信息——掌握新股发行动向，洞察市场异动个股！ 
 <br />包括新股发行提示、新股上市提示、新股开盘行情报价、深沪指数报道、深沪五大涨幅个股提示、深沪五大跌幅个股提示、深沪五大活跃股、深沪五大换手率、沪A大盘预警、深A大盘预警、中签号码（率）等相关信息。
 <br />国内外财经类信息——精选国内外财经要闻，获取第一手财经资讯！
 <br />包括国内要闻、国际要闻、港澳台要闻等相关信息。
 <br />投资建议类信息——专家把脉市场趋势，为您搜寻潜力产品！
 <br />包括投资操作策略、早间财经、内参快讯、盘中荐股、重点基金推荐等相关信息。
        
        
          <br />
        </p>
      </div>
    </div>
    </div>
    
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="${contextPath }/share/bottom.jsp" />

</body>
</html>