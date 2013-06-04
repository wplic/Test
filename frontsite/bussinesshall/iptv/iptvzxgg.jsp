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
<body class="body_bg">
<jsp:include page="/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.html?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.html?nav=wsyyt">网上营业厅</a>  &gt;   <a href="${ctx }/bussinesshall/iptv/iptv.jsp?nav=wsyyt&nav1=iptvsp">金管家财富频道</a> &gt;  最新公告</div>
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
  
  <!--中间内容开始-->
 <div class="w706" fright>
	<div class="barCf">最新公告</div>
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
          <td valign="top">
          <jsp:include page="${ctx }/bussinesshall/iptv/iptvzxggList.jsp">
           <jsp:param name="whichCat" value="wsyyt_iptvgg"/>
           <jsp:param name="showSize" value="20"/>
           <jsp:param name="titleWidth" value="56"/>
           <jsp:param name="state" value="1"/>
    	</jsp:include>
          </td>
            </tr>
        </table>
       </div>
   <!--右侧sied结束--> 
    <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />

</body>
</html>