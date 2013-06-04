<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	String whichCat = request.getParameter("whichCat");
	if (null == whichCat)
		whichCat = "ts_zl_zl";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/business/business.css" rel="stylesheet" type="text/css" />
<script src="/js/about_lmenu.js"></script>
</head>
	<body>
		<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页</a> - 上市公司退市信息专栏</div>

  <div class="comtit1"><h4>上市公司退市信息专栏列表</h4></div>
  <div class="blank5"></div>
  
<div >
<div class="tlbg2">
  	<jsp:include page="/about/aboutList.jsp">
			<jsp:param name="whichCat" value="<%=whichCat%>" />
			<jsp:param name="showSize" value="20" />
			<jsp:param name="titleWidth" value="56" />
		</jsp:include>
     


<div class="blank5"></div>
</div>
</div>
</div>
<jsp:include page="/commons/msbottom.jsp" />
	</body>

<script type="text/javascript"> 
var _aq = _aq || [];
_aq.push(['_setSiteId', 10001]);_aq.push(['_setCatalogId', 45]); _aq.push(['_trackPageview']); (function() {
var ga = document.createElement( 'script'); ga.type = 'text/javascript'; ga.async = true; ga.src='http://121.8.153.59:8080/stat/stat.js'; var s = document.getElementsByTagName( 'script')[0]; s.parentNode.insertBefore(ga, s); })();
</script>
</html>