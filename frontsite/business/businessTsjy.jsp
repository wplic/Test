<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
String whichCat = request.getParameter("whichCat");
if(null==whichCat)
	whichCat = "sy_wxts_zgfyfxjyx";
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
  <div class="dqwz">当前位置：<a href="${contextPath }/default.jsp">首页</a> - 温馨提示 </div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
<div class="sidemenu">
  		<table>
          <tr>
            <td class="<%="sy_wxts_zgfyfxjyx".equals(whichCat)?"active sideblue":"link sideblue"%>"><a href="${ctx }/business/businessWxts.jsp?whichCat=sy_wxts_zgfyfxjyx">风险教育信</a></td>
          </tr>
          <tr>
            <td class="<%="sy_wxts_fxqfgxzs".equals(whichCat)?"active sideblue":"link sideblue"%>"><a href="${ctx }/business/businessWxts.jsp?whichCat=sy_wxts_fxqfgxzs">反洗钱法规与小知识</a></td>
          </tr>
          <tr>
            <td class="<%="sy_wxts_tsjy".equals(whichCat)?"active sideblue":"link sideblue"%>"><a href="${ctx }/business/businessTsjy.jsp?whichCat=sy_wxts_tsjy">投诉流程</a></td>
          </tr>
        </table>

  </div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  		<div class="comtit1"><h4>投诉流程</h4></div>

       <table width="678" border="0" cellpadding="0" cellspacing="0">
		  <tr>
		    <td><img src="${ctx }/pic/branches/tslc1.jpg" /></td>
		  </tr>
		  <tr>
		    <td><img src="${ctx }/pic/branches/tslc2.jpg" /></td>
		  </tr>
		  <tr>
		    <td><img src="${ctx }/pic/branches/tslc3.jpg" /></td>
		  </tr>
		</table>
    <div class="blank10"></div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div><div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>