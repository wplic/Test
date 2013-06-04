<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
</head>

<body class="body_bg">
<jsp:include page="/commons/top.jsp" />

<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：首页 > 网上营业厅 > 我的理财中心</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
    <div class="iptvside_mid">
   	  <p style="padding:15px 20px; line-height:22px">广发交易客户自己的网上大户室，持仓、资讯、服务、理财尽享其中！</p>
        <jsp:include page="/wsyyt/financing_login.jsp" />
    </div>
    <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始--> 
  <div class="w706 fright">
  		<div class="left_tit2"><span class="dqwz">我的理财中心</span></div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mt5">
          <tr>
            <td><img src="/pic/wsyyt/wdlc/wdlc_a1.jpg" /></td>
          </tr>
          <tr>
            <td><img src="/pic/wsyyt/wdlc/wdlc_a2.jpg" border="0" usemap="#Map" /></td>
          </tr>
        </table>
  </div>
  

   <!--右侧sied结束--> 
    <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/commons/bottom.jsp" />


<map name="Map" id="Map"><area shape="rect" coords="69,5,125,18" href="#" /><area shape="rect" coords="71,22,120,36" href="myStock.jsp" /><area shape="rect" coords="69,43,120,59" href="#" /><area shape="rect" coords="212,59,244,71" href="#" /><area shape="rect" coords="359,29,395,40" href="#" /><area shape="rect" coords="470,16,539,26" href="#" /><area shape="rect" coords="559,42,609,57" href="#" /></map></body>
</html>