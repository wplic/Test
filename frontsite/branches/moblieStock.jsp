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
    <div class="left_tit2">移动证券</div>
    <div class="blank10"></div>
       <div><img src="/pic/branches/banner5.jpg" title="广发证券移动证券业务" /></div>
    <div class="blank10"></div>
    <div class="kline">
      <div class="qiebg">
      <div class="p10 lh22">
        <p>　　通过联通BREW掌上股市平台，客户可以浏览股市行情、下单交易、下载券商提供的股市资讯。随着手机功能逐步电脑化，利用手机的增值功能提供股市业务对于习惯网上交易的客户群较有吸引力，也解决了他们移动办公时交易的难题。联通掌上股市采用的CDMA数据技术从理论上比移动的GSM带宽要高1-2倍，其交互性更是前几年基于STK短信的手机炒股模式不能比较的，所以具有一定的市场需求和较大的发展潜力。<br />
          <br />
          　　在拓展初期，联通公司采取预存话费送手机的政策，以及集团网、来电包月等套餐，短时间内造成较大的轰动效应。我司与中国联通合作推出的掌上股市项目自04年8月份推出后，目前已有客户约3000人参与，主要分布在沿海发达城市和少数内陆省会城市。部分城市如上海、青岛、汕头、广州等，联通掌上股市已经成为一种比较重要的拓展服务工具。<br />
          <br />
          　　我司下一步重点将加强渠道建设和咨询合作，争取把我司的资讯产品通过运营商渠道提供给广大客户，为客户提供更大的赢利机会。<br />
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