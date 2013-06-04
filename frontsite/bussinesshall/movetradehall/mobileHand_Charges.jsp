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
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a>  &gt; <a href="${ctx }/bussinesshall/movetradehall/mobileDeal.jsp?nav=wsyyt&nav1=gfydjyt">金管家手机证券</a> &gt;手机证券</div>
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
    <div class="left_tit2">掌上股市 - 资费</div>
    <div id="mobileSecu">
    <p class="title"><span class="tt4"><i>开通、退订方式</i></span></p>
    <div class="textArea">
      <p class="red2 bold">信息费：</p>
      <p>支持各证券公司交易的统一客户端版本——“掌上股市钻石版”：30元/月（6月30日前免费）<br /> 
掌上股市广发证券冠名版”——18元/月 <br />
通用证券行情软件版本——“神奇股票行情版”：10元/月 
</p>
      <br />
    <p class="red2 bold">流量费：  </p>
      <p>[普通用户]<br /> 
　　默认按0.02元/KB计收流量费，但长时间使用会产生较高的费用，推荐使用流量套餐。<br /> 
　　[套餐用户]
　 </p>
      <p>　流量费按照包月收取。每运行一个图形界面(如K线图)约产生1.5KB流量费，每运行一个700字左右的文字界面(如资讯信息)约产生4KB流量费，用户可按使用需要向当地联通营业部申请合宜的流量费套餐。</p>
      <br />
    </div>
    </div>
   
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="${ctx}/share/bottom.jsp" />

</body>
</html>