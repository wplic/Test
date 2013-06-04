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
  <div class="dqwz">当前位置：首页 > 网上营业厅 > 移动营业厅 </div>
  <div class="blank5"></div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="/wsyyt/mobileDeal_lmenu.jsp" />
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
    <div class="left_tit2">手机证券 - 业务介绍</div>
    <div id="mobileSecu">
    <p class="title"><span class="tt1"><i>业务介绍</i></span></p>
    <div class="textArea">
    <img src="/pic/wsyyt/mobileDeal_sk/yd_logo.jpg"  class="fright"/>
    <p>中国移动“手机证券”是中国移动、北京掌上网科技有限公司、各券商等三方合作推出的手机炒股业务。为中国移动用户提供实时证券行情、资讯咨询、在线交易等证券相关服务的业务。
    </p><br />
    <p>广发证券已经接入“移动证券”平台，广发证券客户也可以登陆该平台看行情、交易。“移动证券”的技术支持由于是第三方SP提供，客户除了要支付上网流量费，还需要支付行情、交易服务费用。
    </p>
    </div>
    </div>
   
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/commons/bottom.jsp" />

</body>
</html>