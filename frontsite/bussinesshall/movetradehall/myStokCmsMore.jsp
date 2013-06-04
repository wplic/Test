<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
 String whichCat="";
 if(request.getParameter("whichCat")!=null&&!request.getParameter("whichCat").equals(""))
 whichCat=request.getParameter("whichCat");
  String nav2=whichCat;
 if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals(""))
 nav2=request.getParameter("nav2");

 String stock_id="";
 if(request.getParameter("stock_id")!=null&&!request.getParameter("stock_id").equals(""))
 stock_id=request.getParameter("stock_id");
 String sttdpdm="";
 if(stock_id!=null)
 {
  String [] stt = stock_id.split(",");
  if(stt.length==1)
  {
   sttdpdm=stt[0];
  }
 }
 String name="";
 if(nav2.equals("wsyyt_jygg"))
 {
  name="公  告";
 }else if(nav2.equals("zxzx_gp_gsyw"))
 {
  name="新  闻";
 }else if(nav2.equals("zxzx_gp_rdqj"))
 {
  name="股    评";
 }else if(nav2.equals("zxzx_hyxw"))
 {
  name="研究报告";
 }else if(nav2.equals("nbzx|gfyj|wgzx"))
 {
  name="管家资讯";
 }
 %>
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
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav2"),20)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
	if(request.getParameter("whichCat")!=null&&!request.getParameter("whichCat").equals("")){
		if(whichCat.indexOf("www.")>0){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script src="/js/setTab.js"></script>
</head>

<body class="body_bg">
<jsp:include page="/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：首页 > 我的理财中心 > <%=name %> </div>
  <div class="blank5"></div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
<table width="189" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
  <tr>
    <td <%=nav2.equals("wsyyt_jygg")?"class='wdlc_ltag1 white'":"class='wdlc_ltag2'" %>><a href="${ctx}/bussinesshall/movetradehall/myStokCmsMore.jsp?nav=wsyyt&nav1=wdlczx&nav2=wsyyt_jygg&whichCat=zxzx_jysgg&stock_id=<%=stock_id %>">公  告</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_gp_gsyw")?"class='wdlc_ltag1 white'":"class='wdlc_ltag2'" %>><a href="${ctx}/bussinesshall/movetradehall/myStokCmsMore.jsp?nav=wsyyt&nav1=wdlczx&nav2=zxzx_gp_gsyw&whichCat=xw&stock_id=<%=stock_id %>">新  闻</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_gp_rdqj")?"class='wdlc_ltag1 white'":"class='wdlc_ltag2'" %>><a href="${ctx}/bussinesshall/movetradehall/myStokCmsMore.jsp?nav=wsyyt&nav1=wdlczx&nav2=zxzx_gp_rdqj&whichCat=blcj_nbzx_zgsxcj|blcj_nbzx_sxzqcc|blcj_nbzx_gcjcck|blcj_nbzx_cyb&stock_id=<%=stock_id %>">股    评</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_hyxw")?"class='wdlc_ltag1 white'":"class='wdlc_ltag2'" %>><a href="${ctx}/bussinesshall/movetradehall/myStokCmsMore.jsp?nav=wsyyt&nav1=wdlczx&nav2=zxzx_hyxw&whichCat=zqyj_yjbg&stock_id=<%=stock_id %>">研究报告</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("nbzx|gfyj|wgzx")?"class='wdlc_ltag1 white'":"class='wdlc_ltag2'" %>><a href="${ctx}/bussinesshall/movetradehall/myStokCmsMore.jsp?nav=wsyyt&nav1=wdlczx&whichCat=nbzx_gftzsd|nbzx_pzbb|nbzx_gfmrtznc|nbzx_scclbg|nbzx_jjxt|nbzx_dfxcpyb|cpdy_jgjztbg&stock_id=<%=stock_id %>">管家资讯</a></td>
  </tr>
 </table>

 
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
    <div class="left_tit2" ><%=name %></div>
    <div >
    <iframe id="ifm"  height=589 name="" src="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&whichCat=<%=whichCat %>&is_delete=0&stock_id=<%=sttdpdm%>"   frameborder="0" marginheight="0" marginwidth="0"  width="100%" scrolling="no">
    </iframe>		
    </div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 

</body>
</html>