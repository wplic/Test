<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="/commons/taglibs.jsp"%>
<%@page import="java.util.List"%>
<%@page	import="com.cssweb.gpdmGazx.pojo.GazxObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%
 SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 String nav2="";
 if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals(""))
 nav2=request.getParameter("nav2");
 String whichCat=nav2;
 List list=null;
 if(request.getAttribute("list")!=null)
 {
  list=(List)request.getAttribute("list");
 }
 String name="";
 if(whichCat.equals("wsyyt_jygg"))
 {
  name="公  告";
 }else if(whichCat.equals("zxzx_gp_gsyw"))
 {
  name="新  闻";
 }else if(whichCat.equals("zxzx_gp_rdqj"))
 {
  name="股    评";
 }else if(whichCat.equals("zxzx_hyxw"))
 {
  name="研究报告";
 }else if(whichCat.equals("nbzx|gfyj|wgzx"))
 {
  name="管家资讯";
 }
        String nav="";
		if(request.getParameter("nav")!=null&&!request.getParameter("nav").equals(""))
			nav=request.getParameter("nav");
		String nav1="";
		if(request.getParameter("nav1")!=null&&!request.getParameter("nav1").equals(""))
			nav1=request.getParameter("nav1");
		
 %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/setTab.js"></script>
</head>

<body class="body_bg">
<jsp:include page="/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp"> 首页</a> > <a href="${contextPath }/bussinesshall/financingCzh.jsp">我的理财中心</a> > <%=name %> </div>
  <div class="blank5"></div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
<table width="189" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
  <tr>
    <td <%=nav2.equals("wsyyt_jygg")?"class='wdlc_ltag1 white'":"class='wdlc_ltag2'" %>><a href="${ctx}/gazxObject.do?method=getListByGpdmAndTable&nav=wsyyt&nav1=wdlczx&nav2=wsyyt_jygg&gpdm=${gpdm }&table=gsgg">公  告</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_gp_gsyw")?"class='wdlc_ltag1 white'":"class='wdlc_ltag2'" %>><a href="${ctx}/gazxObject.do?method=getListByGpdmAndTable&nav=wsyyt&nav1=wdlczx&nav2=zxzx_gp_gsyw&gpdm=${gpdm }&table=gsbd">新  闻</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_gp_rdqj")?"class='wdlc_ltag1 white'":"class='wdlc_ltag2'" %>><a href="${ctx}/gazxObject.do?method=getListByGpdmAndTable&nav=wsyyt&nav1=wdlczx&nav2=zxzx_gp_rdqj&gpdm=${gpdm }&table=ggdp">股    评</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_hyxw")?"class='wdlc_ltag1 white'":"class='wdlc_ltag2'" %>><a href="${ctx}/gazxObject.do?method=getListByGpdmAndTable&nav=wsyyt&nav1=wdlczx&nav2=zxzx_hyxw&gpdm=${gpdm }&table=gsyj">研究报告</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("nbzx|gfyj|wgzx")?"class='wdlc_ltag1 white'":"class='wdlc_ltag2'" %>><a href="${ctx}/bussinesshall/movetradehall/myStokCmsMore.jsp?nav=wsyyt&nav1=wdlczx&whichCat=nbzx|gfyj|wgzx&stock_id=${gpdm }">管家资讯</a></td>
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
    <form name="gazxObjectForm" action="${ctx}/gazxObject.do?method=getListByGpdmAndTable&nav=wsyyt&nav1=wdlczx" method="post">
		 <table width="90%" align="center" class="lh28 mt20  font_st list_bline1">
		 <input type="hidden" name="gpdm" value="${gpdm }"/>
		 <input type="hidden" name="table" value="${table}"/>
		 <input type="hidden" name="nav2" value="<%=nav2 %>"/>
		 <%
			if(list!=null&&list.size()>0)
				{
				 for(int i=0;i<list.size();i++)
				 {
				   GazxObject gazxObject=(GazxObject)list.get(i);
%>    
		          <tr>
		            <td width="415">
		            <a href="${contextPath }/cms/newsContentGazx.jsp?guid=<%= gazxObject.getGuid()%>&table=${table}" target=\"_blank\">
		           ·<%=gazxObject.getZt()!=null&&gazxObject.getZt().length()>36?gazxObject.getZt().subSequence(0,36)+"...":gazxObject.getZt() %> </a></td>
		            <td width="208"><div align="center"><%=gazxObject.getZhxgrq()!=null?sdf.format(gazxObject.getZhxgrq()):""%></div></td>
		          </tr><%
		          
		           %>
		  <%}
		  } %>
		             
		</table>
		<div class="ym_bg mt5 center">
      <p align="center">
      <%=PageUtil.pagination("window.gazxObjectForm",totleCount, currentPage, pagesize)%>
      </p>
    </div>
	</form>	
    </div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
</body>
</html>