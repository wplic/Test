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

<body class="body_bg">
<jsp:include page="/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a>  &gt; <a href="${ctx }/bussinesshall/movetradehall/mobileDeal.jsp?nav=wsyyt&nav1=gfydjyt">金管家手机证券</a>&gt;资费说明 </div>
  <div class="blank5"></div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="mobileDeal_lmenu.jsp?nav2=zfsm" />
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
    <div class="left_tit2">资费说明</div>
    <p class="mt5"><img src="/pic/wsyyt/mobileDeal/mobile_ban1.jpg" /></p><br />
    <p class=" mtb10 pl10">“金管家手机频道”客户利用该系统进行行情、资讯的查看和交易委托，在推广期间暂不收取任何费用。</p>
    <table width="97%" align="center" border="1" class="lh24" bordercolor="#cccccc" cellspacing="0" cellpadding="0">
  <tr>
    <td width="18%" class="tab_th1 bold" align="center">项目</td>
    <td width="82%" class="tab_th1 bold" align="center">说明</td>
  </tr>
  <tr>
    <td class="pl10">系统名称</td>
    <td class="pl10">金管家手机频道手机交易软件V2.0</td>
  </tr>
  <tr>
    <td class="pl10">手机运营商</td>
    <td class="pl10">中国移动</td>
  </tr>
  <tr>
    <td class="pl10">软件下载</td>
    <td class="pl10">免费</td>
  </tr>
  <tr>
    <td class="pl10">软件使用</td>
    <td class="pl10">免费</td>
  </tr>
  <tr>
    <td class="pl10">上  网  费</td>
    <td class="pl10">GPRS上网流量费</td>
  </tr>
  <tr>
    <td class="pl10">备    注</td>
    <td class="pl10">备    注	中国移动的上网数据流量费用为0.02元/K，客户使用系统产生的数据流量基本在30M之内，因此建议咨询当地中国移动10086申请数据业务套餐。</td>
  </tr>
    </table>

  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />

</body>
</html>