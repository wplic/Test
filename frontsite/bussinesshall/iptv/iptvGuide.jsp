<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page	import="com.cssweb.video.pojo.TvideoProgram"%>
<%@page	import="com.cssweb.video.pojo.TvideoProgramLive"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page	import="com.cssweb.common.toDbLob.service.LobService"%>
<%@page	import="com.cssweb.common.toDbLob.pojo.TextBlob"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/setTab.js"></script>
</head>
<%
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	LobService lobService = (LobService)ctx.getBean("lobService");	
  SimpleDateFormat sdf=new SimpleDateFormat("HH:mm");
  SimpleDateFormat sdfzb=new SimpleDateFormat("yyyy-MM-dd");
  TvideoProgramLive tvideoProgramLiveWeek=null;//当天的数据 今日看点
  if(request.getAttribute("tvideoProgramLiveWeek")!=tvideoProgramLiveWeek)
	  tvideoProgramLiveWeek=(TvideoProgramLive)request.getAttribute("tvideoProgramLiveWeek");
   TvideoProgramLive tvideoProgramLive1=null;//当天的数据 今日看点//星期一
  if(request.getAttribute("tvideoProgramLive1")!=null)
	 tvideoProgramLive1=(TvideoProgramLive)request.getAttribute("tvideoProgramLive1");
   TvideoProgramLive tvideoProgramLive2=null;//星期二
  if(request.getAttribute("tvideoProgramLive2")!=null)
	 tvideoProgramLive2=(TvideoProgramLive)request.getAttribute("tvideoProgramLive2");

   TvideoProgramLive tvideoProgramLive3=null;//星期三
  if(request.getAttribute("tvideoProgramLive3")!=null)
	 tvideoProgramLive3=(TvideoProgramLive)request.getAttribute("tvideoProgramLive3");
 
   TvideoProgramLive tvideoProgramLive4=null;//星期四
  if(request.getAttribute("tvideoProgramLive4")!=null)
	 tvideoProgramLive4=(TvideoProgramLive)request.getAttribute("tvideoProgramLive4");
   TvideoProgramLive tvideoProgramLive5=null;//星期五
  if(request.getAttribute("tvideoProgramLive5")!=null)
	 tvideoProgramLive5=(TvideoProgramLive)request.getAttribute("tvideoProgramLive5");
 
			
	Calendar cd = Calendar.getInstance();
	int dayOfWeek = cd.get(Calendar.DAY_OF_WEEK);
	       
  List listJx=null;//最新IPTV精选 取得10条数据 防止没有图片的情况出现
    if(request.getAttribute("listJx")!=null)
	  listJx=(List)request.getAttribute("listJx"); 
 	  	  	    
%>
 <script type="text/javascript">
 		function iptvListByYearMon(){
 		  var year = document.getElementById("year").value;
 		  var mon = document.getElementById("mon").value;
 		  var url="${ctx}/tvideo.do?method=getYearMonTvideo";
 		  if(year!="")
 		  {
 		    url=url+"&year="+encodeURI(year);
 		  }
 		  if(mon!="")
 		  {
 		    url=url+"&mon="+encodeURI(mon);
 		  }
 		  window.open(url); 
 	}
 </script>
<body class="body_bg">
<jsp:include page="/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a> &gt; <a href="${ctx }/bussinesshall/iptv/iptv.jsp?nav=wsyyt&nav1=iptvsp">金管家财富频道</a> &gt;  一周导视</div>
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
   	<div class="left_tit2">一周导视</div>
    
	 <!--<div id="tabs2" style="height:280px" class="mt5"> -->
    <div id="tabs2" class="mt5">
<table width="100%" bgcolor="#b90001">
              <tr>
                <td width="30">&nbsp;</td>
                <td <%=dayOfWeek==2?"class='yzds_hov red'":"class='yzds_a white'" %> id="tagWeek1" onmouseover="SwitchNews('Week', 1, 5,'yzds_hov red','yzds_a white')"><a href="#">周一</a></td>
                <td <%=dayOfWeek==3?"class='yzds_hov red'":"class='yzds_a white'" %> id="tagWeek2" onmouseover="SwitchNews('Week', 2, 5,'yzds_hov red','yzds_a white')"><a href="#">周二</a></td>
                <td <%=dayOfWeek==4?"class='yzds_hov red'":"class='yzds_a white'" %> id="tagWeek3" onmouseover="SwitchNews('Week', 3, 5,'yzds_hov red','yzds_a white')"><a href="#">周三</a></td>
                <td <%=dayOfWeek==5?"class='yzds_hov red'":"class='yzds_a white'" %> id="tagWeek4" onmouseover="SwitchNews('Week', 4, 5,'yzds_hov red','yzds_a white')"><a href="#">周四</a></td>
                <td <%=dayOfWeek==6?"class='yzds_hov red'":"class='yzds_a white'" %> id="tagWeek5" onmouseover="SwitchNews('Week', 5, 5,'yzds_hov red','yzds_a white')"><a href="#">周五</a></td>
                <td>&nbsp;</td>
              </tr>
            </table>
     		<table width="100%" class="lh24 yzds_bor" id="week1" <%=dayOfWeek==2?"":"style='display:none'"%>>
     		      <tr><td>
		         <%
		         if(tvideoProgramLive1!=null)
		         {
		         TextBlob tb=lobService.getTextBlobById(tvideoProgramLive1.getIntro());
		        if(tb!=null){
		         out.print(new String(tb.getSource(), "UTF-8"));}
		         }
		         %>
		      </td></tr>
   		  </table>
          
          <table width="100%" class="lh24 yzds_bor" id="week2" <%=dayOfWeek==3?"":"style='display:none'" %>>
     		     <tr><td>
		         <%
		         if(tvideoProgramLive2!=null)
		         {
		         TextBlob tb=lobService.getTextBlobById(tvideoProgramLive2.getIntro());
		        if(tb!=null){
		         out.print(new String(tb.getSource(), "UTF-8"));}
		         }
		         %>
		      </td></tr>
   		  </table>
          
          <table width="100%" class="lh24 yzds_bor" id="week3" <%=dayOfWeek==4?"":"style='display:none'"%>>
     		     <tr><td>
		         <%
		         if(tvideoProgramLive3!=null)
		         {
		         TextBlob tb=lobService.getTextBlobById(tvideoProgramLive3.getIntro());
		        if(tb!=null){
		         out.print(new String(tb.getSource(), "UTF-8"));}
		         }
		         %>
		      </td></tr>
   		  </table>
          
          <table width="100%" class="lh24 yzds_bor" id="week4" <%=dayOfWeek==5?"":"style='display:none'"%>>
     		     <tr><td>
		         <%
		         if(tvideoProgramLive4!=null)
		         {
		         TextBlob tb=lobService.getTextBlobById(tvideoProgramLive4.getIntro());
		        if(tb!=null){
		         out.print(new String(tb.getSource(), "UTF-8"));}
		         }
		         %>
		      </td></tr>
   		  </table>
          
          <table width="100%" class="lh24 yzds_bor" id="week5" <%=dayOfWeek==6?"":"style='display:none'"%>>
     		    <tr><td>
		         <%
		         if(tvideoProgramLive5!=null)
		         {
		         TextBlob tb=lobService.getTextBlobById(tvideoProgramLive5.getIntro());
		        if(tb!=null){
		         out.print(new String(tb.getSource(), "UTF-8"));}
		         }
		         %>
		      </td></tr>
   		  </table>
     </div>
    </div>
  <!--中间内容结束-->  
   
   <!--右侧sied开始--> 
  <div class="w262 fright ptb9">
     <div class="side_top"></div>
       <div class="side_mid">
           <p class="right_tit1">最新公告</p>     
	<div class="iptvgg lh21 font_43">
	 <marquee direction="up" height="260" scrollamount="3" onmouseover="this.stop()" onmouseout="this.start()">
	
	<jsp:include page="/cms/iptvWeek.jsp">
		<jsp:param name="catName" value="iptv公告" />
		<jsp:param name="whichCat" value="wsyyt_iptvgg"/>
		<jsp:param name="state" value="1"/>
		<jsp:param name="showSize" value="2"/>
	</jsp:include>     
       </marquee>
      </div>
       <!--  
    	<p class="right_tit1">直播预告</p>
   
    <div style="height:5px; overflow:hidden"></div>-->
     <%-- 
        <ul class="lh25 ml25 mt10" id="dp1" style=" display:block;height:130px">
        <%
        if(listNdt!=null&&listNdt.size()>0)
         {
           Date datenew =new Date();
           int j=0;
           for(int i=0;i<listNdt.size()&&j<3;i++)
           {
             TvideoProgramLive t= (TvideoProgramLive)listNdt.get(i);
             if((sdf.parse(sdf.format(t.getLiveTime()))).after(sdf.parse(sdf.format(datenew)))){
             j++;
             %>
               <li class=" li_list2"><%=sdf.format(t.getLiveTime()) %>  <%=t.getTitle().length()>10?t.getTitle().substring(0,10)+"...":t.getTitle() %></li> 
             <%
             }
           }
         }
         %>
        
		</ul>--%> 
		   
		<p class="side_line"></p>
      <div style="height:5px; overflow:hidden"></div>
        <p class="right_tit1">最新IPTV精选</p>
        <table width="90%" align="center" class="mt10">
               <%
         int j=0;
         if(listJx!=null&&listJx.size()>0)
         {
           for(int i=0;i<listJx.size()&&i<10;i++)
           {
             //System.out.println("            ---------------="+i);
             TvideoProgram t= (TvideoProgram)listJx.get(i);
             if(t.getPicId()>0){
             %>
             
	          <tr>
	          <td width="55%">
	          <a href="${ctx}/bussinesshall/iptv/tvPlayObject.jsp?id=<%=t.getId()%>" target="_blank">
	             <img src="${ctx}/share/showUploadImage.jsp?id=<%=t.getPicId()%>" width="104" height="94"/>
	          </a>
	           </td>
	           <td width="45%" align="center">
	           <a href="${ctx}/bussinesshall/iptv/tvPlayObject.jsp?id=<%=t.getId()%>" target="_blank">
	           <p class="blue bold">
	           <%=t.getTitle().length()>32?t.getTitle().substring(0,32)+"...":t.getTitle() %> </p>
	           </a>
	           <p><%=sdfzb.format(t.getUploadDate()) %></p></td>
	          </tr>
             <%
             j++;
             if(j==4)
             break;
             }
           }
         } 
        %>

        </table>

       </div>
            <div class="side_bot"></div>
        <div style="height:10px; overflow:hidden"></div>
  </div>
   <!--右侧sied结束--> 
    <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />

</body>
</html>