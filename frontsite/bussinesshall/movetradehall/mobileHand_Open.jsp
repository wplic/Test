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
<jsp:include page="${ctx}/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a>  &gt; <a href="${ctx }/bussinesshall/movetradehall/mobileDeal.jsp?nav=wsyyt&nav1=gfydjyt">金管家手机证券</a> &gt;手机证券 </div>
  <div class="blank5"></div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="${ctx}/bussinesshall/movetradehall/mobileDeal_lmenu.jsp" />
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
    <div class="left_tit2">掌上股市 - 开通、退订方式</div>
    <div id="mobileSecu">
    <p class="title"><span class="tt5"><i>开通、退订方式</i></span></p>
    <div class="textArea">
      <p class="red2 bold">1、“掌上股市”开通方式： </p>
      <p>按炫键（或相应功能建）选择进入→“神奇宝典”→“软件超市”→“软件目录”→“掌上股市”→选择“掌上股市钻石版”→根据屏幕提示下载→安装使用。 </p>
      <p><img src="/pic/wsyyt/mobileDeal/pict_lt.gif" /></p>
      <br />
    <p class="red2 bold">2、“掌上股市”退订方式：  </p>
      <p>按炫键（或相应功能建）选择进入→“神奇宝典”→“软件超市”→“功能设置”→删除已下载订购的相关软件即可完成退订。 </p>
      <img src="/pic/wsyyt/mobileDeal/pict_lt02.gif" /></div>
    </div>
   
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="${ctx}/share/bottom.jsp" />

</body>
</html>