<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/investorEdu/investorEdu.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	if(request.getParameter("nav1")!=null&&!request.getParameter("nav1").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav1"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
	if(request.getParameter("nav")!=null&&!request.getParameter("nav").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
	if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav2"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
%>
 <%
   String whichCat="cyb_cybxgjd";
   if(request.getParameter("whichCat")!=null&&!request.getParameter("whichCat").equals(""))
   whichCat=request.getParameter("whichCat").trim();
   
   String whichCatName="创业板相关解读";
   if(whichCat.equals("cyb_cybxgdt"))
   whichCatName="创业板相关动态";
   
   String nav2="cybxgjd";
   if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals(""))
   nav2=request.getParameter("nav2").trim();
   
 %>
<body class="body_bg">
<jsp:include page="${contextPath}/share/top.jsp?nav=tzzyd&nav1=cyb" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt;<a href="${contextPath }/investorEdu/investorSchool.html"> 投资者园地</a> &gt; <%=whichCatName %></div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="investorCyb_lmenu.jsp" />
      <jsp:include page="/infoCenter/Search.jsp"/>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
  
  <!--右侧sied开始-->
  <div class="w706 fright">
  <div class="left_tit2"><%=whichCatName %>
  </div> 
    <div class="blank10"></div>
	  <jsp:include page="/investorEdu/CmsinvestorStocklist.jsp">
	           <jsp:param name="whichCat" value="<%=whichCat %>"/>
	           <jsp:param name="state" value="1"/>
	           <jsp:param name="is_delete" value="0"/>
	           <jsp:param name="nav2" value="<%=nav2 %>"/>
	    </jsp:include>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="${contextPath}/share/bottom.jsp" />
</body>
</html>