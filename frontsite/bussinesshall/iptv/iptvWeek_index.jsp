<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.cssweb.common.toDbLob.pojo.TextBlob"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ include file="/commons/taglibs.jsp"%>
<html><title>广发证券</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/setTab.js"></script>
<script src="${ctx}/js/setImg.js"></script>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page	import="com.cssweb.video.service.TvideoProgramLiveService"%>
<%@page	import="com.cssweb.video.pojo.TvideoProgramLive"%>
<%@page	import="com.citics.util.WeekBeginDay"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<jsp:directive.page import="com.css.cms.document.model.DocumentFrontListProvider"/>
<%@page	import="com.cssweb.common.toDbLob.service.LobService"%>
<%@page	import="com.cssweb.common.toDbLob.pojo.TextBlob"%>
 
<%@page	import="com.cssweb.video.pojo.TvideoProgram"%>
<%@page	import="com.cssweb.video.service.TvideoProgramService"%>
<%
	 ServletContext st = this.getServletConfig().getServletContext();
	 ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	 TvideoProgramLiveService tvideoProgramLiveService = (TvideoProgramLiveService)ctx.getBean("tvideoProgramLiveService");
	 LobService lobService = (LobService)ctx.getBean("lobService");	
		Calendar calendar = Calendar.getInstance();
		int sysWeek =	calendar.get(Calendar.DAY_OF_WEEK) - 1;
		TvideoProgramLive tvideoProgramLiveWeek= tvideoProgramLiveService.getTvideoProgramLiveByWeek(String.valueOf(sysWeek));
		//得到当天的数据
		
		//星期一
		TvideoProgramLive tvideoProgramLive1 =tvideoProgramLiveService.getTvideoProgramLiveByWeek("1");
		//星期二
		TvideoProgramLive tvideoProgramLive2 =tvideoProgramLiveService.getTvideoProgramLiveByWeek("2");
		//星期三
		TvideoProgramLive tvideoProgramLive3 =tvideoProgramLiveService.getTvideoProgramLiveByWeek("3");
		//星期四
		TvideoProgramLive tvideoProgramLive4 =tvideoProgramLiveService.getTvideoProgramLiveByWeek("4");
		//星期五
		TvideoProgramLive tvideoProgramLive5 =tvideoProgramLiveService.getTvideoProgramLiveByWeek("5");
	
	
	 //财富频道  最新公告替换==>最新IPTV精选(取数据)
	 TvideoProgramService tvideoProgramService =(TvideoProgramService) ctx.getBean("tvideoProgramService");
	 SimpleDateFormat sdfzb=new SimpleDateFormat("yyyy-MM-dd"); 
	 Map map =new HashMap();
		map.put("sortName", "UPLOAD_DATE");
	    map.put("dir", "desc");//按什么来 排序
		map.put("recommend","1");//是否推荐 0:不推荐 1:推荐
		map.put("state","1");
		map.put("begin", 0);
		map.put("end", 10);//取4条数据
	List listJx=tvideoProgramService.getBytvideoProgramMap(map); 
		
%>
<body>
  <div class="w262 fright ptb9">
     <div class="side_top"></div>
       <div class="side_mid">
    	<p class="right_tit1">收视指南</p>
        <div class="dpzs_tab">
           <table align="center">
              <tr>
                <td class="dpzs_hov red bold" id="tagdp1" onmouseover="SwitchNews('dp', 1, 3,'dpzs_hov red bold','dpzs_a bold')"><a href="javascript:void(0)">今日节目</a></td>
                <td class="dpzs_a bold" id="tagdp2" onmouseover="SwitchNews('dp', 2, 3,'dpzs_hov red bold','dpzs_a bold')"><a href="javascript:void(0)">一周导视</a></td>
                <td class="dpzs_a bold" id="tagdp3" onmouseover="SwitchNews('dp', 3, 3,'dpzs_hov red bold','dpzs_a bold')"><a href="javascript:void(0)">热线</a></td>
              </tr>
          </table>
    </div>
    <div style="height:5px; overflow:hidden"></div>
    <div>
     <div id="dp1" style=" display:block">
        <ul class="lh21 ml25">
        <li>
         <%
         if(tvideoProgramLiveWeek!=null)
         {
         TextBlob tb=lobService.getTextBlobById(tvideoProgramLiveWeek.getIntro());
         if(tb!=null){
		         out.print(new String(tb.getSource(), "UTF-8"));}
         }
         %>
       </li>
      
		</ul>
        </div>
               <div id="dp2" style="display:none">
           <ul class="yzds_box">
            	<li class="hove red" id="tagyzds1" onmouseover="SwitchNews('yzds', 1, 5,'hove red','white')"><a href="#">周一</a></li>
                <li class="white" id="tagyzds2" onmouseover="SwitchNews('yzds', 2, 5,'hove red','white')"><a href="#">周二</a></li>
                <li class="white" id="tagyzds3" onmouseover="SwitchNews('yzds', 3, 5,'hove red','white')"><a href="#">周三</a></li>
                <li class="white" id="tagyzds4" onmouseover="SwitchNews('yzds', 4, 5,'hove red','white')"><a href="#">周四</a></li>
                <li class="white" id="tagyzds5" onmouseover="SwitchNews('yzds', 5, 5,'hove red','white')"><a href="#">周五</a></li>
            </ul>
            <ul class="lh21 ml25 mt10" id="yzds1" style=" display:block">
              <li>
		         <%
		         if(tvideoProgramLive1!=null)
		         {
		         TextBlob tb=lobService.getTextBlobById(tvideoProgramLive1.getIntro());
		        if(tb!=null){
		         out.print(new String(tb.getSource(), "UTF-8"));}
		         }
		         %>
		       </li>
            </ul>
            
            <ul class="lh21 ml25 mt10" id="yzds2" style="display:none">
                 <li>
		         <%
		         if(tvideoProgramLive2!=null)
		         {
		         TextBlob tb=lobService.getTextBlobById(tvideoProgramLive2.getIntro());
		        if(tb!=null){
		         out.print(new String(tb.getSource(), "UTF-8"));}
		         }
		         %>
		       </li>
            </ul>
            
            <ul class="lh21 ml25 mt10" id="yzds3" style="display:none">
                  <li>
		        <%
		         if(tvideoProgramLive3!=null)
		         {
		         TextBlob tb=lobService.getTextBlobById(tvideoProgramLive3.getIntro());
		         if(tb!=null){
		         out.print(new String(tb.getSource(), "UTF-8"));}
		         }
		         %>
		       </li>
            </ul>
            <ul class="lh21 ml25 mt10" id="yzds4" style="display:none">
              <li>   
		         <%
		         if(tvideoProgramLive4!=null)
		         {
		         TextBlob tb=lobService.getTextBlobById(tvideoProgramLive4.getIntro());
                 if(tb!=null){
		         out.print(new String(tb.getSource(), "UTF-8"));}
		         }
		         %>
		       </li>
            </ul>
            <ul class="lh21 ml25 mt10" id="yzds5" style="display:none">
                 <li>
		         <%
		         if(tvideoProgramLive5!=null)
		         {
		         TextBlob tb=lobService.getTextBlobById(tvideoProgramLive5.getIntro());
		         if(tb!=null){
		         out.print(new String(tb.getSource(), "UTF-8"));}
		         }
		         %>
		       </li>
            </ul>
        </div>
        
        <div class="lh21" id="dp3" style=" display:none">
        <p align="center"><img src="/pic/wsyyt/iptv/iptvrx.jpg" /></p>
        <p class="mt10 ml25">协调：020-87555888-496<br />
主持：020-87555888-282<br />
演播中心股民热线<br />
020-87555716<br />
020-87555906<br />
020-87557562</p>
		</div>
		</div>
		<p class="side_line"></p>
      <div style="height:5px; overflow:hidden"></div>
        <p class="right_tit1">最新金管家财富频道精选</p>  
	
	          <table width="90%" align="center" class="mt10" >
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
             if(j==3)
             break;
             }
           }
         } 
        %>

        </table>
  
	  
      </div> 
            <div class="side_bot"></div>
  </div>
  </body>
  </html>