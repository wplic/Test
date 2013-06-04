<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/investorEdu/investorEdu.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>
 <%
   String whichCat="rzrq_xgjd";
   if(request.getParameter("whichCat")!=null&&!request.getParameter("whichCat").equals(""))
   whichCat=request.getParameter("whichCat").trim();
   
   String whichCatName="融资融券相关解读";
   String menu="6";
   if(whichCat.equals("rzrq_xgdt")){
   whichCatName="融资融券相关动态";
   menu="7";
   }
 %>
<body>
<jsp:include page="${contextPath}/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt;<a href="${contextPath }/investorEdu/investorSchool.html"> 投资者园地</a> &gt; <%=whichCatName %></div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="${contextPath}/financing/flash_lmenu.jsp?menu=<%=menu %>" />
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
  
  <!--右侧sied开始-->
  <div class="w706 fright">
  <div class="comtit1"><h4><%=whichCatName %></h4></div>
    <div class="blank10"></div>
	  <jsp:include page="/financing/cmsListAll.jsp">
	           <jsp:param name="whichCat" value="<%=whichCat %>"/>
	           <jsp:param name="category" value="<%=whichCat %>"/>
	           <jsp:param name="state" value="1"/>
	           <jsp:param name="is_delete" value="0"/>
	    </jsp:include>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="${contextPath}/commons/msbottom.jsp" />
</body>
</html>