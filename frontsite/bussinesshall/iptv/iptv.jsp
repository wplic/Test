<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page	import="com.cssweb.video.service.TvideoProgramService"%>
<%@page	import="com.cssweb.video.pojo.TvideoProgram"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
     SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	 ServletContext st = this.getServletConfig().getServletContext();
	 ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	 TvideoProgramService tvideoProgramService = (TvideoProgramService)ctx.getBean("tvideoProgramService");
	 Map map =new HashMap();
	 map.put("sortName", "UPLOAD_DATE");
     map.put("dir", "desc");//按什么来 排序
	 map.put("recommend","1");//是否推荐 0:不推荐 1:推荐
	 map.put("begin", 0);
	 map.put("end", 10);//取4条数据
	 List listJx =tvideoProgramService.getBytvideoProgramMap(map);
	 //取投资者教育数据
	 List listtzz=tvideoProgramService.getTvideoProgramByBoardCode("tv_spjy");
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
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
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/setTab.js"></script>
</head>
<script type="text/javascript">
 		function  selectImgById(id,i,count){
 		  var url="${ctx}/bussinesshall/iptv/iptvJxsp.jsp?id="+id
 		  document.getElementById("iptvJxsp").src=url;
 		  for(var j=1;j<=count;j++)
 		  {
 		    if(j==i)
 		    {
 		      document.getElementById("xjimg"+i).style.border = "2px solid #cc0202";
			  document.getElementById("xjimg"+i).style.padding = "1px";
 		    }else{
 		    	document.getElementById("xjimg"+j).style.border = "1px solid #d2d2d2";
            	document.getElementById("xjimg"+j).style.padding = "2px";
	            document.getElementById("xjimg"+j).style.background = "#ffffff";
 		    }
 		  }
 		  
 	}
 </script>
<body class="">
<jsp:include page="/share/top.jsp" />

<div class="body_bg">
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.html?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.html?nav=wsyyt">网上营业厅</a>  &gt;   金管家财富频道</div>
</div>
<div class="wrap_3c">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
    <div class="iptvside_mid">
        <jsp:include page="iptv_lmenu.jsp" />
    </div>
    <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
  
  <!--中间内容开始-->
  <div class="w443 fleft">
   	<div class="left_tit2">
   	<span class="fright"><span class="red"><a href="${ctx}/bussinesshall/iptv/iptvzxgg.jsp">更多&gt;&gt;</a></span></span>
   	最新公告
   	</div>
   	<table><tr><td height="5"></td></tr></table>
   	
   	<marquee direction="up" height="150" scrollamount="3" onmouseover="this.stop()" onmouseout="this.start()">
	
	<jsp:include page="/cms/iptvWeek.jsp">
		<jsp:param name="catName" value="iptv公告" />
		<jsp:param name="whichCat" value="wsyyt_iptvgg"/>
		<jsp:param name="state" value="1"/>
		<jsp:param name="showSize" value="2"/>
	</jsp:include>     
       </marquee>  
   <div class="iptabbox mt10">
    <table>
          <tr>
            <td align="center" width="30"><img src="${ctx}/pic/wsyyt/iptv/list_01.jpg"/></td>
            <td class="iptabhov red bold" width="150" align="center" id="tagtabs1" onmouseover="SwitchNews('tabs', 1, 2,'iptabhov red bold','')"><a href="javascript:void(0)"><a href="${ctx}/bussinesshall/iptv/iptvChannel.html">金管家财富频道特点介绍</a></td>
            <td width="10"></td>
            <td width="130" align="center" id="tagtabs2"></td>
          </tr>
        </table>
	 </div>
     <p align="center" id="tabs1"><img src="${ctx}/pic/wsyyt/iptv/banner2.jpg"/></p>
     <div id="tabs2" style=" display:none">
     		 <table width="90%" align="center" class="lh28 mt15  font_st list_bline1">
              <%if(listtzz!=null&&listtzz.size()>0){ 
              for(int i=0;i<listtzz.size()&&i<5;i++)
              {
              TvideoProgram tvideoProgram=(TvideoProgram)listtzz.get(i);
              %>
               <tr>
                <td width="76%"><a href="${ctx}/bussinesshall/iptv/tvPlayObject.jsp?id=<%=tvideoProgram.getId()%>" target="_blank">·<%=tvideoProgram.getTitle() %></a></td>
                <td width="24%"><%=sdf.format(tvideoProgram.getUploadDate()) %></td>
              </tr>
              <%} }%>
             
            </table>

    </div>
     
  </div>
  <!--中间内容结束-->  
     <div class="w262 fright ptb9">
   <!--右侧sied开始--> 
  
	<jsp:include page="/bussinesshall/iptv/iptvWeek_index.jsp" />
       </div>
   <!--右侧sied结束--> 
    <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />

</div>
</body>
<script type="text/javascript"> 
var _aq = _aq || [];
_aq.push(['_setSiteId', 10001]);_aq.push(['_setCatalogId', 22]); _aq.push(['_trackPageview']); (function() {
var ga = document.createElement( 'script'); ga.type = 'text/javascript'; ga.async = true; ga.src='http://121.8.153.59:8080/stat/stat.js'; var s = document.getElementsByTagName( 'script')[0]; s.parentNode.insertBefore(ga, s); })();
</script>
</html>