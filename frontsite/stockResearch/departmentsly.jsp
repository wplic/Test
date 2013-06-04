<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/stockResearch/stockResearch.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页</a>  -  <a href="/stockResearch/index.html">证券研究</a> - <a href="/stockResearch/departmentsInfo.html">发展研究中心简介</a> - 部门荣誉</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/stockResearch/departments_lmenu.jsp?nav2=zqyj_bmly" />
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w706 fright">
  		<div class="comtit1"><h4>部门荣誉</h4></div>
   <div class="clearfloat h25"></div>
        <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
            <jsp:include page="${contextPath}/stockResearch/newsIndexList.jsp">
            		<jsp:param name="catName" value="zqyj_bmly"/>
            		<jsp:param name="showSize" value="1"/>
            </jsp:include>
        </table>
   <div class="clearfloat h25"></div>
  </div>
   <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>