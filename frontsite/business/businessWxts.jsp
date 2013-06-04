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
  		<div class="comtit1"><h4>温馨提示</h4></div>
    <div class="clearfloat h15"></div>
       <jsp:include page="/about/aboutList.jsp">
           <jsp:param name="whichCat" value="<%=whichCat%>"/>
           <jsp:param name="showSize" value="20"/>
           <jsp:param name="titleWidth" value="56"/>
    	</jsp:include>
    <div class="blank10"></div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div><div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
<script type="text/javascript"> 
var _aq = _aq || [];
_aq.push(['_setSiteId', 10001]);_aq.push(['_setCatalogId', 57]); _aq.push(['_trackPageview']); (function() {
var ga = document.createElement( 'script'); ga.type = 'text/javascript'; ga.async = true; ga.src='http://121.8.153.59:8080/stat/stat.js'; var s = document.getElementsByTagName( 'script')[0]; s.parentNode.insertBefore(ga, s); })();
</script>
</html>