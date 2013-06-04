<%@page import="com.css.cms.category.CategoryTree"%>
<%@page import="com.css.cms.category.CategoryFactory"%>
<%@page import="com.css.cms.category.CategoryNode"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<jsp:directive.page import="com.css.system.Configuration" />
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<script src="/js/jsIfUtils.js"></script>
<head>
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
	if(request.getParameter("nav3")!=null&&!request.getParameter("nav3").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav3"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<script src="/js/setTab.js"></script>
</head>
<% 
    String hangqingUrlzx = Configuration.getProperty("hangqingUrlzx");
	String whichCat = request.getParameter("whichCat");
	if(StringUtils.isEmpty(whichCat)){
		whichCat = "zxzx_gp_gsyw";
	}
	CategoryTree catTree = CategoryFactory.getCategoryTree();
	CategoryNode catNode = catTree.getCategoryNode(whichCat);
	String displayName = ""; //资讯当前所在栏目的中文名称
	if(catNode!=null){
		displayName = catNode.getDisplayName();
	}
 %>
<body class="body_bg">
<jsp:include page="${ctx }/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：首页 > 资讯中心>股票 > <%=displayName %></div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="${ctx }/infoCenter/stockgg_lmenu.jsp" />
<jsp:include page="${ctx }/infoCenter/Search.jsp"/>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
    <div class="left_tit2"><%=displayName %></div>
    <div class="blank10"></div>
     <jsp:include flush="true" page="/infoCenter/stockTop.jsp">
	          <jsp:param name="whichCat" value="<%=whichCat %>"/>
	          <jsp:param name="imgUrl" value="/pic/infoCenter/gsyw.jpg"/>
	 </jsp:include>
    <div class="blank10"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td valign="top">
         <iframe width="100%"  src="${contextPath}/infoCenter/stockList.jsp?whichCat=<%=whichCat%>&showSize=18&buttonName=1" frameborder="0" scrolling="no"" marginheight="0" marginwidth="0" id="fundNews" name="fundNews" onload="frameFitSelfHeight('fundNews')"></iframe>
        </td>
        <td width="236" valign="top" class="bg_ec">
        	
        	<div class="w236 fright">
    	<ul class="info_tab1">
       <li class="active red" id="tagtabs71" onmouseover="SwitchNews('tabs7', 1, 3,'active red','link white')"><a href="#">大盘行情</a></li>
      <li class="link white" id="tagtabs72" onmouseover="SwitchNews('tabs7', 2, 3,'active red','link white')"><a href="#">广发基金</a></li>
      <li class="link white" id="tagtabs73" onmouseover="SwitchNews('tabs7', 3, 3,'active red','link white')"><a href="#">广发理财</a></li>
    </ul>
    <div class="blank5"></div>
           <iframe src="<%=hangqingUrlzx %>" id="hqIframes" name="hqIframes"  marginWidth="0" marginHeight="0" frameBorder="0" noresize width="100%" scrolling="no"></iframe>


    <ul class="info_tab1">
       <li class="active red" id="tagtabs81" onmouseover="SwitchNews('tabs8', 1, 2,'active red','link white')"><a href="#">涨幅前五名</a></li>
      <li class="link white" id="tagtabs82" onmouseover="SwitchNews('tabs8', 2, 2,'active red','link white')"><a href="#">跌幅前五名</a></li>
    </ul>
    <div class="blank5"></div>
    <table width="95%" class="lh24 bg_ff center" border="0" cellspacing="0" cellpadding="0" align="center" id="tabs81">
     <jsp:include flush="true" page="zdflist.jsp">
             <jsp:param name="zd" value="涨"/>
		     <jsp:param name="num" value="5"/>
        </jsp:include>
    </table>
    <table width="95%" class="lh24 bg_ff center" border="0" cellspacing="0" cellpadding="0" align="center" id="tabs82" style=" display:none">
       <jsp:include flush="true" page="zdflist.jsp">
             <jsp:param name="zd" value="跌"/>
		     <jsp:param name="num" value="5"/>
        </jsp:include>
    </table>
    </div>
        	</td>
      </tr>
    </table>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 

</body>
</html>