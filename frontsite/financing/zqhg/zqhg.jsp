<%@ page contentType="text/html; charset=utf-8" language="java" %>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="com.css.cms.document.DocumentManager"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
	<link href="/css/style.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
	.wrap_2left_{width:920px; margin:0 auto;}
	</style>
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页 </a>  - 约定购回式证券交易业务介绍</div>
</div>
<div class="wrap_2left_">
	<jsp:include page="content.jsp"></jsp:include>
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>