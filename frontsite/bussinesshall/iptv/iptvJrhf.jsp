<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page	import="com.cssweb.video.service.*"%>
<%@page	import="com.cssweb.video.pojo.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page	import="com.cssweb.video.service.TvideoProgramService"%>
<%@page	import="com.cssweb.video.pojo.TvideoProgram"%>
<%@page	import="com.cssweb.video.service.StreamService"%>
<%@page	import="com.cssweb.video.pojo.Stream"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	if(request.getParameter("nav1")!=null&&!request.getParameter("nav1").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav1"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}
	if(request.getParameter("nav")!=null&&!request.getParameter("nav").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}
	if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav2"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}
	 ServletContext st = this.getServletConfig().getServletContext();
	 ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	 TvideoProgramService tvideoProgramService = (TvideoProgramService)ctx.getBean("tvideoProgramService");//视频
	 //
	 List isFixListtb=tvideoProgramService.getTvideoProgramByIsfix();
	 //
	 List notFixList=tvideoProgramService.getTvideoProgramByNewDate();
	 SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
	 SimpleDateFormat sdftime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	 SimpleDateFormat sdfbs=new SimpleDateFormat("yyyy-MM-dd");
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a> &gt; <a href="${ctx }/bussinesshall/iptv/iptv.jsp?nav=wsyyt&nav1=iptvsp">GFTV</a> &gt;  视频点播</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
    <div class="iptvside_mid">
        <jsp:include page="iptv_lmenu.jsp" />
    </div>
    <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始--> 
  <div class="w706 fright">
  		
		<div class="left_tit2">今日回放</div>
 <div class="kline">
      <div class="qiebg">
			
		       <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">
			    今日证券资讯节目
		       </div>
<table width="100%" cellspacing="0" border="0" cellpadding="0">
<% if(isFixListtb!=null&&isFixListtb.size()>0){
    StreamService streamService = (StreamService)ctx.getBean("streamService");
	
   for(int i=0;i<isFixListtb.size();i++){
     boolean datefalse= false;
     TvideoProgram tvideoProgram=(TvideoProgram)isFixListtb.get(i);
      String dateStream="";
	  Stream stream = streamService.getStreamByName(tvideoProgram.getUrlLink());
		if(stream!=null&&stream.getFileName()!=null&&!stream.getFileName().equals("")&&!stream.getFileName().trim().equals(""))
		{
		 String fName=stream.getFileName().trim();
		 if(fName.length()>14)
		 dateStream=fName.substring(fName.length()-14);
		}
		if(!dateStream.equals("")) 
		{
		 try{
		  Date dsdate=sdf.parse(dateStream);
		  datefalse=sdfbs.format(dsdate).equals(sdfbs.format(new Date()))?true:false;
		 }catch(Exception e){
		  datefalse=false;
		 }
		}
	 if(datefalse){
    %>
     <tr>
     <td width="1%" height="25"></td>
     <td align="left" width="50%" height="25">
      <img src="/pic/index/list_11.gif"/>
      <a href="${ctx}/bussinesshall/iptv/tvPlayObject.jsp?id=<%=tvideoProgram.getId()%>" target="_blank" title="<%=tvideoProgram.getContent()!=null?tvideoProgram.getContent():"" %>">
     <%=tvideoProgram.getTitle()%></a>
    </td>
    <td align="left" width="30%">
     <%=tvideoProgram.getDocent()!=null?tvideoProgram.getDocent():""%>
    </td>
    <td>
	<%
	
	%>
	</td>
	</tr>
	<%
    }
  }
}
%>  
  
</table>
</div>
   <div class="qiebg">	
	 <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">
			    专题节目
		       </div>
				<table width="100%" cellspacing="0" border="0" cellpadding="0">
				<% if(notFixList!=null&&notFixList.size()>0){
				   for(int i=0;i<notFixList.size();i++){
				   TvideoProgram tvideoProgram=(TvideoProgram)notFixList.get(i);
				 %>
		 <tr>
		     <td width="1%" height="25"></td>
		     <td align="left" width="50%" height="25">
		      <img src="/pic/index/list_11.gif"/>
		      <a href="${ctx}/bussinesshall/iptv/tvPlayObject.jsp?id=<%=tvideoProgram.getId()%>" target="_blank" title="<%=tvideoProgram.getContent()!=null?tvideoProgram.getContent():"" %>">
		     <%=tvideoProgram.getTitle()%></a>
		    </td>
		    <td align="left" width="30%">
		     <%=tvideoProgram.getDocent()!=null?tvideoProgram.getDocent():""%>
		    </td>
		    <td>
			<%
			String dateStream="";
			
			if(tvideoProgram.getUrlLink()!=null&&!tvideoProgram.getUrlLink().equals("")){
			 String fName=tvideoProgram.getUrlLink().trim();
			 if(fName.length()>18)
			 dateStream=fName.substring(fName.length()-18,fName.length()-4);
			}
			%>
			<% if(!dateStream.equals("")) 
				{
				 try{
				  Date dsdate=sdf.parse(dateStream);
				  out.print(sdftime.format(dsdate));
				 }catch(Exception e){
				  out.print("");
				 }
				}
			%>
			</td>
			</tr>
			<%
		  }
		}
		%> </table>
  </div>
</div>
   <!--右侧sied结束--> 
    <div class="clearfloat"></div><!--清除浮动--> 
</div>
</div>
<jsp:include page="/share/bottom.jsp" />

</body>
</html>