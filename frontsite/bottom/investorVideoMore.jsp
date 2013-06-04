<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
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

<%@page import="com.cssweb.video.pojo.TvideoProgram"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
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
	TvideoCategoryService tvideoCategoryService = (TvideoCategoryService)ctx.getBean("tvideoCategoryService");
	List list = (List)request.getAttribute("list");
	String[] str =new String[2];
	str[0]="ib_spyj";
	str[1]="tv_jgsrx";
	List cats = tvideoCategoryService.getTvideoCategoryByBoardCodes(str);
	pageContext.setAttribute("cats",cats);
%>
<body class="body_bg">
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：首页 - 期货IB业务 - 投资者教育园地 - 股指期货基础知识</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	<jsp:include page="FuturesIB_lmenu.jsp?nav2=ibtzzjy&nav3=ib_spyj" />	
  </div>
  <!--左侧sied结束-->
 
   
  <!--右侧sied开始--> 
  <div class="w706 fright">
  		<div class="left_tit2">
  		  <table width="98%" border="0" cellspacing="0" cellpadding="0" style=" text-indent:0px">
  		    <tr>
  		      <td width="5%">&nbsp;</td>
  		      <td width="17%" class="red bold"><%=(list==null||list.size()<=0)?"":((TvideoProgram)list.get(0)).getCategoryName() %></td>
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
   		 <form name="iptvForm" action="${ctx}/tvideo.do?method=getIbtvByParam" method="post"> 
   		 	<input type="hidden" name="category" value="${category }">
   		 	 <input type="hidden" name="title" value="${title }">
   		 	 <input type="hidden" name="startTime" value="${startTime }">
   		 	 <input type="hidden" name="endTime" value="${endTime }">
            <%if(list!=null&&list.size()>0) {
              for(int i=0;i<list.size();i++)
              {
               TvideoProgram tvideoProgram=(TvideoProgram)list.get(i);
               String spp="sppic_box fleft ml10";
               if(i%4==0){
               spp="sppic_box fleft";
               %>
               <div class="clearfloat"></div>
               <%} %>
               <div class="<%=spp %>"> 
                	 <a href="${ctx}/investorEdu/investorPlayObject.jsp?id=<%=tvideoProgram.getId()%>" target="_blank">
                	<%if(tvideoProgram.getPicId()>0){ %>
                	 <img src="/share/showUploadImage.jsp?id=<%=tvideoProgram.getPicId()%>" width="115" height="85"/>
                	<%}else{ %>
                	<img src="/pic/wsyyt/iptv/sppic1.jpg" />
                	<%} %>
                	</a>
                    <p class="font_31u">
                    <a href="${ctx}/investorEdu/investorPlayObject.jsp?id=<%=tvideoProgram.getId()%>" target="_blank">
                    <%=tvideoProgram.getTitle().length()>9?tvideoProgram.getTitle().substring(0,9)+"...":tvideoProgram.getTitle() %></a></p></div>
                
               <%
             
               
              }
             }%>
             <div class="clearfloat"></div>
             <p align="center"> <%=PageUtil.pagination("window.iptvForm",totleCount, currentPage, pagesize)%></p>
    </form> 
   
   </td>
  </tr>
</table>
  </div>
   <!--右侧sied结束--> 
    <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/commons/msbottom.jsp" /></body>
</html>