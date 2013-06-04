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
<jsp:include page="${contextPath}/bussinesshall/top_wsyyt.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main" style="text-align:center; padding:10px;">
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="900" height="466">
 <param name="movie" value="/pic/wsyyt/mobileDeal_sk/wsyyt_ind1_f8.swf" />
    <param name="wmode" value="opaque">
    <param name="quality" value="high" />
    <embed src="/pic/wsyyt/mobileDeal_sk/wsyyt_ind1_f8.swf" wmode="transparent" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="900" height="466"></embed>
  </object>
</div>
<jsp:include page="${contextPath}/share/bottom.jsp" />

<map name="Map" id="Map"><area shape="rect" coords="35,12,87,42" href="#" /><area shape="rect" coords="7,153,59,172" href="#" /><area shape="rect" coords="165,27,230,49" href="#" /><area shape="rect" coords="247,19,346,45" href="financingCenter.jsp" /><area shape="rect" coords="703,54,770,73" href="#" /><area shape="rect" coords="825,135,886,157" href="#" /></map></body>
</html>