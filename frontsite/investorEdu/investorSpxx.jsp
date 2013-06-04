<%@ page contentType="text/html; charset=utf-8" language="java" %>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="com.cssweb.video.service.TvideoBoardService"/>
<jsp:directive.page import="com.cssweb.video.service.TvideoCategoryService"/>
<jsp:directive.page import="com.cssweb.video.service.TvideoProgramService"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.video.pojo.TvideoBoard"/>
<jsp:directive.page import="com.cssweb.video.pojo.TvideoCategory"/>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>

<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script src="${ctx }/js/setTab.js"></script>

</head>
<bean:parameter name="nav" id="nav" value=""/>
<bean:parameter name="nav1" id="nav1" value=""/>
<bean:parameter name="nav2" id="nav2" value=""/>
<bean:parameter name="nav3" id="nav3" value=""/>
<%
	 ServletContext st = this.getServletConfig().getServletContext();
	 ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	 TvideoBoardService tvideoBoardService = (TvideoBoardService)ctx.getBean("tvideoBoardService");//视频版块管理
	 TvideoCategoryService tvideoCategoryService = (TvideoCategoryService)ctx.getBean("tvideoCategoryService");//视频分类管理
	 TvideoProgramService tvideoProgramService = (TvideoProgramService)ctx.getBean("tvideoProgramService");//视频
	 //取视频版块管理全部数据
	 TvideoBoard tvideoBoard=tvideoBoardService.getTvideoBoardByCode("tv_jgsrx");
	 long boardId = 0L;
	 List tvideoCatList = null;
	 if(tvideoBoard!=null){
	 	boardId = tvideoBoard.getId();
	 	tvideoCatList = tvideoCategoryService.getTvideoCategoryByBoardId(boardId);
	 }
	 String[] str =new String[2];
	 str[0]="tv_spjy";
	 str[1]="tv_jgsrx";
	 List cats = tvideoCategoryService.getTvideoCategoryByBoardCodes(str);
	 pageContext.setAttribute("cats",cats);
%>
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=tzzyd&nav1=spxx" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt;<a href="${contextPath }/investorEdu/investorSchool.html"> 投资者园地</a> &gt;<a href="${contextPath }/investorEdu/investorBaseStock.jsp?nav=tzzyd&nav1=spjy1&nav2=gpsrx">视频教育</a> &gt; 基股三人行 </div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
    <div class="iptvside_mid">
        <jsp:include page="investorVideo_lmenu.jsp" />
        <table width="95%" style="border-collapse:collapse" border="1" bgcolor="#ffffff" bordercolor="#cfcfcf" class="lh21 mt5" align="center">
	  <tr>
		<td width="94%" class="info_th01" style=" border-bottom:0">视频查询</td>
	  </tr>
	  <tr>
		<td style="padding:5px">
		<form name="form1" action="${ctx}/tvideo.do?method=getTpSearchResultByParam" method="post"> 
		<input type="hidden" name="nav" value="<%=nav %>"/>
		<input type="hidden" name="nav1" value="<%=nav1 %>"/>
		<input type="hidden" name="nav2" value="<%=nav2 %>"/>
		<input type="hidden" name="nav3" value="<%=nav3 %>"/>
		<table width="100%" class="font_43">
		  <tr>
			<td>时间：</td>
			<td>
			<input type="text" id="startTime" name="startTime" value="${startTime }" onfocus="this.blur()"  style="width:86px; border:1px solid #c3c3c3;"  ><a href="javascript:void(0)" onclick="gfPop.fStartPop(document.form1.startTime,document.form1.endTime);return false;" HIDEFOCUS><img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="middle"></a>
			</td>
		  </tr>
		  <tr>
			<td>到：</td>
			<td>
			 <input type="text" name="endTime" id="endTime"  value="${endTime }" onfocus="this.blur()"  style="width:86px; border:1px solid #c3c3c3;" ><a href="javascript:void(0)" onClick="gfPop.fEndPop(document.form1.startTime,document.form1.endTime);return false;" HIDEFOCUS><img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="middle"></a>
			</td>
		  </tr>
		  <tr>
			<td>栏目：</td>
			<td><label>
			  <select name="category" id="category">
			  	<option value="">--所有栏目--</option>
			  	<c:forEach items="${cats}" var="bean">
			  		<option value="${bean.code }" <c:if test="${bean.code eq category}">selected</c:if>>${bean.name }</option>
			  	</c:forEach>
				
			  </select>
			</label></td>
		  </tr>
		  <tr>
			<td>关键字：</td>
			<td><input type="text" name="title" value="${title }" id="title" class="input108"/></td>
		  </tr>
		  <tr>
			<td height="28" colspan="2" align="center"><input type="submit" class="but_01" name="button3" id="button3" value="查询" /></td>
		  </tr>
		</table>
			</form></td>
	  </tr>
	</table>
    </div>
    <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始--> 
  <div class="w706 fright">
  		<div class="left_tit2">
  		  <table width="98%" border="0" cellspacing="0" cellpadding="0" style=" text-indent:0px">
  		    <tr>
  		      <td width="5%">&nbsp;</td>
  		      <td width="17%" class="red bold">基股三人行</td>
  		      <td width="26%">&nbsp;</td>
  		      <td width="26%" class="font_43 font_normal">
  		     
  		      </td>
  		      <td width="17%" class="font_43 font_normal">
  		      </td>
  		      <td width="9%" class="red bold" align="center"></td>
	        </tr>
	      </table>
		</div>
        <table class="mt10">

  <tr>
    <td width="8">&nbsp;</td>
    <td valign="top" bgcolor="#f1f1f1" class="p20" width="100%">
   		 <iframe id="iptvIfm" name="" src="${ctx }/tvideo.do?method=getTpByBoardAndCategoryId&videoBoard=<%=boardId %>" frameborder="0" marginheight="0" marginwidth="0" onload="this.height =document.frames['iptvIfm'].document.body.scrollHeight" width="100%" scrolling="no">
                   </iframe>
   
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