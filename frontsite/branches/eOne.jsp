<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/branches/branches.css" rel="stylesheet" type="text/css" />
</head>

<body class="body_bg">
<jsp:include page="${contextPath }/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt; <a  href="${contextPath }/branches/index.jsp?nav=grgf">分支机构</a> &gt; 产品与服务</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="productsServices_lmenu.jsp" />
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
    <div class="left_tit2">E对壹服务</div>
    <div class="blank10"></div>
       <div>
	          <a href="${contextPath }/branches/eOneFwnr.jsp?nav=grgf&nav1=cpyfw&nav2=ededxdzfw">
<img border="0" src="/pic/branches/banner6.jpg" title="E对壹服务" /></a></div>
    <div class="blank10"></div>
    <div class="kline">
      <div class="qiebg">
      <div class="p10">
       <a href="${contextPath }/branches/eOneFwnr.jsp?nav=grgf&nav1=cpyfw&nav2=ededxdzfw">
          <p align="center" style="font-size:30px;color:#003994;" class="bold">金管家e对壹服务</p>
        <p align="center" style="font-size:30px;color:#003994;" class="bold">定制个性信息，畅享财富成长!</p>
         <p align="right" style="color:#FF0000;">点击查看</p>
       </a>
      </div>
        <div class="p10 lh22"> 
          <p>　广发证券金管家E对壹服务，是广发证券基于您的个性化需求，集合公司各类资讯产品精华的手机资讯服务，包括短信以及彩信两大产品。金管家E对壹服务为您量身定制个性化的手机资讯套餐，令您可随时随地、随手掌握唯您专属的投资理财服务。
		  <br>　客户开通E对壹短信（彩信）定制服务须前往开户营业部办理，详情请咨询95575金管家热线或营业部客户经理、投资顾问。<br />
            <br />
          </p>
      </div>
    </div>
    </div>
    
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="${contextPath }/share/bottom.jsp" />

</body>
</html>