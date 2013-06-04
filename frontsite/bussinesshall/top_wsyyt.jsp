<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<%@page import="com.cssweb.client.pojo.TsystemWebuser"%>
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
String yykf= Configuration.getProperty("yykf");
%>
<script type="text/javascript">
	function openWin(url)
	{
			var ah = screen.availHeight - 30;
			var aw = screen.availWidth - 10;
			window.open(url, 'newwindow', 'height='+ah +', width='+aw+', top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no, status=no');
				//window.close();		
	}
	
	function openNewWindows(url)
	{
			var ah = screen.availHeight - 30;
			var aw = screen.availWidth - 10;
			window.open(url, 'newwindows', 'height='+ah +', width='+aw+', top=0, left=0, toolbar=yes, menubar=yes, scrollbars=yes, resizable=yes,location=yes, status=yes');
			//window.parent.close();	
	}
</script>
</head>
<div id="topWsyyt">
<p class="logobar"><span>您好！欢迎来到广发证券网上营业厅 <a href="${contextPath }/index.html"  target="_blank">返回主页</a></span><a href="/index.html" onfocus="this.blur()"><img src="/pic/logo.png" /></a></p>
<div class="topMenu"><a id="yykh" href="#" onclick="javascript:window.open('<%=yykf %>');"  class="sm">预约开户</a><a id="jygg" onclick="openNewWindows('${contextPath }/bussinesshall/tradeAffiche.html');" href="#"  class="sm">交易公告</a><a id="ymhq" href="#" class="sm" onclick="openNewWindows('<%=gfymhq %>');">页面行情</a><a href="#" class="sm" onclick="openNewWindows('<%=gfymjy %>');">页面交易</a><a id="rjxz" onclick="openNewWindows('${contextPath }/bussinesshall/softDownload.html');" href="#" class="sm">软件下载</a><a id="iptvsp" onclick="openNewWindows('${contextPath }/bussinesshall/iptv/iptv.html');" href="#" class="sm">财富频道</a><a id="gfydjyt" onclick="openNewWindows('${contextPath }/mobile/index.jsp');" href="#" class="lm">金管家手机证券</a><a id="qwwqw" onclick="openNewWindows('${contextPath }/bussinesshall/95575.html');" href="#" class="sm">95575</a>
<%
	TsystemWebuser tsystemWebuser=null;
	if(request.getSession().getAttribute("tsystemWebuser")!=null)
		tsystemWebuser=(TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
	if(tsystemWebuser==null) {
		%>
			<a id="wdlczx" onclick="openNewWindows('${contextPath }/bussinesshall/movetradehall/financingCenter.html');" href="#" class="lm">我的理财中心</a> 
		<%
	}
	else
	{
		%>
			<a id="wdlczx" onclick="openNewWindows('${contextPath }/bussinesshall/financingCzh.html');" href="#" class="lm">我的理财中心</a>
		<%	
	}	
 %>
</div>
</div>

</html>




