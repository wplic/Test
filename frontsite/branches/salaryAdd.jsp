<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/branches/branches.css" rel="stylesheet" type="text/css" />
</head>

<body class="body_bg">
<jsp:include page="${contextPath }/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt; <a  href="${contextPath }/branches/index.jsp?nav=grgf">分支机构</a> &gt;产品与服务</div>
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
    <div class="left_tit2">广发薪加薪业务</div>
    <div class="blank10"></div>
    <div><img src="../pic/branches/banner4.jpg" title="广发证券薪加薪业务" /></div>
    <div class="blank10"></div>
    <div class="kline">
      <div class="qiebg">
      <div class="p10 lh22">
        <p>
          <span class="bold">广发薪加薪五大优点：</span><br />
          1、风险小：银行负责代理资金清算，国家信用，本金百分百安全；<br />
          2、收益好：预计年净收益在1.7%-3%之间，且免缴利息税，是活期储蓄存款年净收益的2.8至
          5.2倍；<br />
          3、分红快：每月分红一次，月末直接进入客户本人储蓄帐户；<br />
          4、流动强：可随时增加投资金额，月末本金随分红一起划回客户帐户；<br />
          5、起点低：投资起点金额1万元，并以1万元的整数倍递增。</p><br />
      <p>
        欢迎广大客户来电垂询，垂询电话：020-87555888-877<br />
      </p>
      <p class="inden25">&nbsp; </p>
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