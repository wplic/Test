<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page	import="com.cssweb.video.service.TvideoProgramLiveService"%>
<%@page	import="com.cssweb.video.pojo.TvideoProgramLive"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script src="/js/setTab.js"></script>
</head>
<%
	 ServletContext st = this.getServletConfig().getServletContext();
	 ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	 TvideoProgramLiveService tvideoProgramLiveService = (TvideoProgramLiveService)ctx.getBean("tvideoProgramLiveService");
	SimpleDateFormat sdfymd=new SimpleDateFormat("yyyyMMdd");
	SimpleDateFormat sdf=new SimpleDateFormat("HH:mm");
	List list=null;
	if(request.getAttribute("list")!=null)
	{
	  list=(List)request.getAttribute("list");
	}
 %>
<body class="body_bg">
<jsp:include page="/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：首页 &gt; 网上营业厅 &gt; 收视指南 &gt; 历史看点</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
    <div class="iptvside_mid">
        <jsp:include page="iptv_lmenu.jsp" />
        <br /><br /><br /><br /><br /><br />
    </div>
    <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始--> 
  <div class="w706 fright">
  		<div class="left_tit2">历史看点</div>
		<div class="mt15 plr13">
		<%
		 if(list!=null&&list.size()>0)
		  {
		   for(int i=0;i<list.size();i++)
		   {
		    TvideoProgramLive tvideoProgramLive=(TvideoProgramLive)list.get(i);
		     if(i%3==0){
		       %>
		        <ul <%=i%2==0?"class='history'":"class='history2'" %>>
		       <%
		     }
		    %>
		    <li class="li_list3">
                <a href="#"><%=tvideoProgramLive.getDayTvideo() %>看点
                    <span>
                        <ul class="lh21 tclckd">
                        <%
                         Date date=sdfymd.parse(tvideoProgramLive.getDayTvideo());
                         List dayList= tvideoProgramLiveService.getBeginAndEndByDayTvideoAll(date,date);
                         if(dayList!=null&&dayList.size()>0)
                         {
                           for(int j=0;j<dayList.size();j++)
                           {
                            TvideoProgramLive tp=(TvideoProgramLive)dayList.get(j);
                            %>
                             <li class="li_list1"><%=sdf.format(tp.getLiveTime()) %>  &nbsp;&nbsp;&nbsp;  <%=tp.getTitle().length()>11?tp.getTitle().substring(0,11)+"...":tp.getTitle() %></li>
                            <% 
                            }
                         }
                        %>
                        </ul>
                    </span>
                </a>
                </li>
		    <%
		    if(i%3==2){
		       %>
		        </ul>
		       <%
		     }
		   }
		   if(list.size()%3!=2){
		       %>
		        </ul>
		       <%}
		  }
		 %>
		</div>
	<div style="height:10px; overflow:hidden"></div>
  </div>
   <!--右侧sied结束--> 
    <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />

</body>
</html>