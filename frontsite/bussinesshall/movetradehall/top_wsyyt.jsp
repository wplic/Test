<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<jsp:directive.page import="com.css.system.Configuration" />
<% 
String gfymhq = Configuration.getProperty("gfymhq"); 
String gfymjy = Configuration.getProperty("gfymjy");
%>
</head>
<div id="topWsyyt">
<p class="logobar"><span>您好！欢迎来到广发证券网上营业厅 <a href="#">返回主站</a></span><a href="/index.jsp" onfocus="this.blur()"><img src="/pic/wsyyt/mobileDeal_sk/logo_wsyyt.jpg" /></a></p>
<div class="topMenu"><a href="#" onclick="javascript:alert('正在构建中');" class="sm">预约开户</a><a href="tradeAffiche.jsp" class="sm">交易公告</a><a href="#" onclick="openWin('<%=gfymhq %>');" class="sm">实时行情</a><a href="#" onclick="openWin('<%=gfymjy %>');" class="sm">页面交易</a><a href="softDownload.jsp" class="sm">软件下载</a><a href="iptv.jsp" class="sm">IPTV频道</a><a href="mobileDeal.jsp" class="lm">广发移动交易厅</a><a href="#" class="sm">95575</a><a href="financingCenter.jsp" class="lm">我的理财中心</a></div>
</div>

</html>




