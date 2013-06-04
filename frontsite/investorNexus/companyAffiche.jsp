<%@ page contentType="text/html; charset=utf-8" language="java" %>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/style.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/investorNexus/investorNexus.css" rel="stylesheet" type="text/css" />

</head>
<%
		String category = "tzzgx_gsgg";
 %>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页</a> - <a href="/investorNexus/index.html">投资者关系</a> - 公司公告</div>
</div>
<div class="wrap_3c">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/investorNexus/index_lmenu.jsp" />
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w492 fleft mlr4">
  		  <jsp:include page='${ctx}/commons/doc/doc.jsp'></jsp:include>
<div class="blank10"></div>
  </div>
  <!--中侧sied结束--> 
    <!--右侧sied开始-->
  <jsp:include page="/investorNexus/include_right.jsp" />
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>