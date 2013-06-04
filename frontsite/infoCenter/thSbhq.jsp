<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<%@ include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="com.cssweb.hq.service.ThirdStockHQService"/>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="java.util.Date"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>
</head>
<%
 ServletContext st = this.getServletConfig().getServletContext();
  ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
  ThirdStockHQService thirdStockHQService = (ThirdStockHQService) ctx.getBean("thirdStockHQService");
  SimpleDateFormat sdf=new SimpleDateFormat("yy-MM-dd");
  String maxDate="";
  Date date=thirdStockHQService.getMaxFsrq();
  if(date!=null){
      maxDate=sdf.format(date);
  }
String bt="三板行情";
String whichCat="zxzx_sb_sbhq";

String nav2=whichCat;
%>
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=zxzx&nav1=sb" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt; <a  href="/infoCenter/index.jsp?nav=zxzx"> 资讯中心 </a> &gt;<a href="${contextPath }/infoCenter/thmarket.jsp?nav=zxzx&nav1=sb"> 三板 </a> &gt; 三板行情 </div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="/infoCenter/thmarket_lmenu.jsp">
           <jsp:param name="nav2" value="zxzx_sb_sbhq"/>
           <jsp:param name="ipic" value="3"/>
    	</jsp:include>
	  <jsp:include page="/infoCenter/Search.jsp"/>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
    <div class="left_tit2"><%=bt %>(<%=maxDate %>)</div>
    <div class="blank10"></div>
  <iframe width="100%"  src="${ctx }/sbhq.do?method=getThirdStockList" frameborder="0" scrolling="no"" marginheight="0" marginwidth="0" id="sbhq" name="sbhq" onload="frameFitSelfHeight('sbhq')"></iframe>		           
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 

</body>
</html>