<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.cssweb.video.service.TvideoBoardService"%>
<%@page import="com.cssweb.video.service.TvideoCategoryService"%>
<%@page import="com.cssweb.video.service.TvideoProgramService"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.video.pojo.TvideoProgram"%>
<%@ include file="/commons/taglibs.jsp"%>
<bean:parameter name="nav" id="nav" value=""/>
<bean:parameter name="nav1" id="nav1" value=""/>
<bean:parameter name="nav2" id="nav2" value=""/>
<bean:parameter name="nav3" id="nav3" value=""/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/investorEdu/investorEdu.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/style.css" rel="stylesheet" type="text/css" />
<style>
.ibtab1{ border-collapse:collapse; border-spacing:0; font-size:12px; text-align:center}
.ibtab1 td{ height:20px; line-height:20px; border:1px solid #ccc}
</style>
</head>
<%
	String code ="ib_spyj";//investorVideo.jsp
	if(request.getParameter("code")!=null&&!request.getParameter("code").equals(""))
	code=request.getParameter("code");
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	TvideoBoardService tvideoBoardService = (TvideoBoardService)ctx.getBean("tvideoBoardService");//视频版块管理
	TvideoCategoryService tvideoCategoryService = (TvideoCategoryService)ctx.getBean("tvideoCategoryService");//视频分类管理
	TvideoProgramService tvideoProgramService = (TvideoProgramService)ctx.getBean("tvideoProgramService");//视频
	List proList =  tvideoProgramService.getTvideoProgramByCategoryCode(code,5);
    List butProList = tvideoProgramService.getTvideoProgramByCateCode(code);
    
    
	String[] str =new String[2];
	str[0]="ib_spyj";
	str[1]="tv_jgsrx";
	List cats = tvideoCategoryService.getTvideoCategoryByBoardCodes(str);
	pageContext.setAttribute("cats",cats);
%>
<body>
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
  <div class="left_tit2">股指期货基础知识</div> 
  <div><img src="/pic/investorEdu/IB4.jpg" /></div>	
	<div class="blank10"></div>
	
	<%if(proList!=null && proList.size()>0){
    		TvideoProgram pro = null;
    		 String urlLink="";//视频链接
    		for(int i=0;i<proList.size();i++){
    			pro = (TvideoProgram)proList.get(i);
    			if(pro.getUrlLink()!=null)
    				urlLink=pro.getUrlLink();
    	%>
    		<div class="jysppic" id="tabs<%=i+1 %>" <%=i==0?"":"style=' display:none'" %>>
    			<div id="av">
			 	<object classid="clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95" id="MediaPlayer1" width="350" height="280"> 
				<param name="AudioStream" value="-1">
			    <param name="AutoSize" value="-1">
			    <!--是否自动调整播放大小-->
			    <param name="AutoStart" value="-1">
			    <!--是否自动播放-->
			    <param name="AnimationAtStart" value="-1">
			    <param name="AllowScan" value="-1">
			    <param name="AllowChangeDisplaySize" value="-1">
			    <param name="AutoRewind" value="0">
			    <param name="Balance" value="0">
			    <!--左右声道平衡,最左-9640,最右9640-->
			    <param name="BaseURL" value>
			    <param name="BufferingTime" value="15">
			    <!--缓冲时间-->
			    <param name="CaptioningID" value>
			    <param name="ClickToPlay" value="-1">
			    <param name="CursorType" value="0">
			    <param name="CurrentPosition" value="0">
			    <!--当前播放进度 -1 表示不变,0表示开头单位是秒,比如10表示从第10秒处开始播放,值必须是-1.0或大于等于0-->
			    <param name="CurrentMarker" value="0">
			    <param name="DefaultFrame" value>
			    <param name="DisplayBackColor" value="0">
			    <param name="DisplayForeColor" value="16777215">
			    <param name="DisplayMode" value="0">
			    <param name="DisplaySize" value="0">
			    <!--视频1-50%, 0-100%, 2-200%,3-全屏其它的值作0处理,小数则采用四舍五入然后按前的处理-->
			    <param name="Enabled" value="-1">
			    <param name="EnableContextMenu" value="-1">
			    <!-- 是否用右键弹出菜单控制-->
			    <param name="EnablePositionControls" value="-1">
			    <param name="EnableFullScreenControls" value="-1">
			    <param name="EnableTracker" value="1">
			    <!--是否允许拉动播放进度条到任意地方播放"0"为不允许"-1"为允许-->
			    <param name="Filename" value="<%=urlLink%>" valuetype="ref">
			    <!--播放的文件地址-->
			    <param name="InvokeURLs" value="-1">
			    <param name="Language" value="-1">
			    <param name="Mute" value="0">
			    <!--是否静音-->
			    <param name="PlayCount" value="1">
			    <!--重复播放次数,0为始终重复-->
			    <param name="PreviewMode" value="-1">
			    <param name="Rate" value="1">
			    <!--播放速率控制,1为正常,允许小数-->
			    <param name="SAMIStyle" value>
			    <!--SAMI样式-->
			    <param name="SAMILang" value>
			    <!--SAMI语言-->
			    <param name="SAMIFilename" value>
			    <!--字幕ID-->
			    <param name="SelectionStart" value="-1">
			    <param name="SelectionEnd" value="-1">
			    <param name="SendOpenStateChangeEvents" value="-1">
			    <param name="SendWarningEvents" value="-1">
			    <param name="SendErrorEvents" value="-1">
			    <param name="SendKeyboardEvents" value="0">
			    <param name="SendMouseClickEvents" value="0">
			    <param name="SendMouseMoveEvents" value="0">
			    <param name="SendPlayStateChangeEvents" value="-1">
			    <param name="ShowCaptioning" value="0">
			    <!--是否显示字幕,为一块黑色,下面会有一大块黑色,一般不显示-->
			    <param name="ShowControls" value="-1">
			    <!--是否显示控制,比如播放,停止,暂停-->
			    <param name="ShowAudioControls" value="-1">
			    <!--是否显示音量控制-->
			    <param name="ShowDisplay" value="0">
			    <!--显示节目信息,比如版权等-->
			    <param name="ShowGotoBar" value="0">
			    <!--是否启用上下文菜单-->
			    <param name="ShowPositionControls" value="-1">
			    <!--是否显示往前往后及列表,如果显示一般也都是灰色不可控制-->
			    <param name="ShowStatusBar" value="-1">
			    <!--当前播放信息,显示是否正在播放,及总播放时间和当前播放到的时间-->
			    <param name="ShowTracker" value="-1">
			    <!--是否显示当前播放跟踪条,即当前的播放进度条-->
			    <param name="TransparentAtStart" value="0">
			    <param name="VideoBorderWidth" value="0">
			    <!--显示部的宽部,如果小于视频宽,则最小为视频宽,或者加大到指定值,并自动加大高度.此改变只改变四周的黑框大小,不改变视频大小-->
			    <param name="VideoBorderColor" value="0">
			    <!--显示黑色框的颜色, 为RGB值,比如ffff00为黄色-->
			    <param name="VideoBorder3D" value="0">
			    <param name="Volume" value="0">
			    <!--音量大小,负值表示是当前音量的减值,值自动会取绝对值,最大为0,最小为-9640-->
			    <param name="WindowlessVideo" value="0">
			    <!--如果是0可以允许全屏，否则只能在窗口中查看-->
          </object>
			</div>
    		<h4><%=pro.getTitle()==null?"":(pro.getTitle().length()>10?pro.getTitle().substring(0,10):pro.getTitle()) %></h4>
    		 <p><%=pro.getContent()==null?"":(pro.getContent().length()>50?(pro.getContent().substring(0,50)+"..."):pro.getContent()) %></p>
    		</div>
    	<%		
    		}
    	}
    	%>
	
    
    <div class="jysplist">
    	<ul>
    	<%if(proList!=null && proList.size()>0){
    		TvideoProgram pro = null;
    		for(int i=0;i<proList.size();i++){
    			pro = (TvideoProgram)proList.get(i);
    	%>
    		<li id="tagtabs<%=i+1 %>" <%=i==0?"class='active'":"" %> onmouseover="SwitchNews('tabs', <%=i+1 %>, <%=proList.size() %>,'active','')"><a href="#">
    		
                	 <img src="${ctx}/share/showUploadImage.jsp?id=<%=pro.getPicId()%>" width="70" height="50" alt="无图片"/>
              
    		<h4><%=pro.getTitle()==null?"":(pro.getTitle().length()>10?pro.getTitle().substring(0,10):pro.getTitle()) %></h4><p><%=pro.getContent()==null?"":(pro.getContent().length()>10?pro.getContent().substring(0,10):pro.getContent()) %></p></a></li>	
    	<%		
    		}
    	}
    	%>
    
        </ul>
    </div>
    <div class=" blank5"></div>
    <div class="line_bor1"></div>
    <div id="spjy"><span class="smwz red"><a href="${ctx}/tvideo.do?method=getIbtvByParam&category=<%=code %>&nav2=ibtzzjy&nav3=ib_spyj">更多>></a></span>
    
    <a href="${ctx}/gf/IBedu/index.html" target="_blank"> <font size="2" color="red">股指期货投资者教育视频</font></a>
    </div>
    
    <%if(butProList!=null && butProList.size()>0){
    	TvideoProgram pro = null;
    	for(int j=0;j<butProList.size();j++){
    		pro = (TvideoProgram)butProList.get(j);
    		if(j%5==0){
    %>
    	<div class=" blank5"></div>
    	<div id="spjy_box2">
    	<%} %>
    	<span <%=(j+1)%5==0?"":"class='mr26'" %>><a href="${ctx}/investorEdu/investorPlayObject.jsp?id=<%=pro.getId()%>" target="_blank">
    		<%if(pro.getPicId()>0){ %>
                	 <img src="${ctx}/share/showUploadImage.jsp?id=<%=pro.getPicId()%>" width="105" height="80"/>
                	<%}else{ %>
                	<img src="${ctx}/pic/wsyyt/iptv/sppic1.jpg" />
                	<%} %>
    	<h4><%=pro.getTitle()==null?"":(pro.getTitle().length()>8?pro.getTitle().substring(0,8):pro.getTitle()) %></h4></a></span>
    	<%=(j+1)%5==0?"</div>":"" %>	
    <%		
    	}
    	if(butProList.size()%5!=0){
    	%>	</div>
    	<%
    	}
    }
    %>
   
    
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>