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
<%
	 ServletContext st = this.getServletConfig().getServletContext();
	 ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	 TvideoBoardService tvideoBoardService = (TvideoBoardService)ctx.getBean("tvideoBoardService");//视频版块管理
	 TvideoCategoryService tvideoCategoryService = (TvideoCategoryService)ctx.getBean("tvideoCategoryService");//视频分类管理
	 //取视频版块管理全部数据
	 List listtb=tvideoBoardService.getTvideoBoardAllBySp();
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/setTab.js"></script>
</head>
<script type="text/javascript">
 	function SwitchBoard(id,i,count){
 		  var url="${ctx }/bussinesshall/iptv/iptvIntroList.jsp";
 		  url=url+"?board="+id;
 		  for(var j=0;j<count;j++)
 		  {
	 		   if(i==j)
	 		   {
	 		    document.getElementById("tagtabBoard"+j).className="active red";
	 		    document.getElementById("iptvIntroIfm").src=url;
	 		   }
	 		   else
	 		   {
	 		   document.getElementById("tagtabBoard"+j).className="";
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
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a> &gt; <a href="${ctx }/bussinesshall/iptv/iptv.jsp?nav=wsyyt&nav1=iptvsp">GFTV</a> &gt; 栏目介绍</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
    <div class="iptvside_mid">
      <jsp:include page="iptv_lmenu.jsp" />          </div>
    <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始--> 
  <div class="w706 fright">
  		<div class="left_tit2">栏目介绍</div>
        <div class="right_tit2 mt3 font_73 bold">演播中心栏目介绍</div>
		<ul class="lmjs">
		     	<%
		     	String board="44";
		     	if(listtb!=null&&listtb.size()>0)
            	{
            	 for(int i=0;i<listtb.size();i++)
            	 {
            	   TvideoBoard tvideoBoard=(TvideoBoard)listtb.get(i);
            	   if(i==0) board=String.valueOf(tvideoBoard.getId());
            	  %>
            	  <li><a href="#" id="tagtabBoard<%=i %>" onclick="SwitchBoard(<%=tvideoBoard.getId() %>,<%=i %> ,<%=listtb.size()-1 %>)" <%=i==0?"class='active red'":"" %>><%=tvideoBoard.getName() %></a></li>
            	  <%
            	 }
            	} %>
        </ul>
        <div class="blank5"></div>
       <iframe id="iptvIntroIfm" name="" src="${ctx }/bussinesshall/iptv/iptvIntroList.jsp?board=<%=board %>" frameborder="0" marginheight="0" marginwidth="0"  height="325" width="100%" scrolling="no">
                   </iframe>
  </div>
   <!--右侧sied结束--> 
    <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />

</body>
</html>