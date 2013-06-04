<%@ page contentType="text/html; charset=utf-8" language="java" %>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.theme.service.ThemeVideoService"/>
<jsp:directive.page import="com.cssweb.theme.pojo.ThemeVideo"/>
<jsp:directive.page import="com.cssweb.theme.service.ThemeCategoryService"/>
<jsp:directive.page import="com.cssweb.theme.pojo.ThemeCategory"/>
<jsp:directive.page import="com.cssweb.theme.service.ThemeArticleCategoryService"/>
<jsp:directive.page import="com.cssweb.theme.pojo.ThemeArticleCategory"/>
<jsp:directive.page import="java.util.*"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证劵_社会公益基金</title>
<link href="${contextPath }/gyjj/css/community.css" rel="stylesheet" type="text/css" />
<script src="${contextPath }/gyjj/js/swfobject_source.js" type=text/javascript></script>
</head>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

String themeid = null==request.getParameter("themeid")?"0":request.getParameter("themeid");
String videoid = null==request.getParameter("videoid")?"0":request.getParameter("videoid");

ServletContext st = this.getServletConfig().getServletContext();
ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
ThemeVideoService themeVideoService = (ThemeVideoService) ctx.getBean("themeVideoService");
ThemeCategoryService themeCategoryService = (ThemeCategoryService) ctx.getBean("themeCategoryService");
ThemeArticleCategoryService themeArticleCategoryService = (ThemeArticleCategoryService) ctx.getBean("themeArticleCategoryService");

ThemeCategory  theme=themeCategoryService.getById(Long.parseLong(themeid));
Map map = new HashMap();
map.put("sortName","UPDATETIME");
map.put("dir","desc");
map.put("begin","0");
map.put("end","100");
List artcatlist = themeArticleCategoryService.getFrontByMap(Long.parseLong(themeid),map);

ThemeVideo video = themeVideoService.getById(Long.parseLong(videoid));
String docent="";//视频主讲
String title="";//视频主题
String content="";//视频内容
String urlLink="";//视频链接
List list=null;
if(video!=null)
{
  title=video.getTitle();
  if(video.getDocent()!=null)
	  docent=video.getDocent();
  if(video.getContent()!=null)
	  content=video.getContent();
  if(video.getUrllink() !=null)
	  urlLink=video.getUrllink();
 }
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
   if(request.getParameter("themeid")!=null&&!request.getParameter("themeid").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("themeid"),6)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}
  if(request.getParameter("themeid")!=null&&!request.getParameter("themeid").equals("")){
				if(sqlInjectValidate.vakidateSqlIfIngter(request.getParameter("themeid"))){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}
%>
<body>
<!-- header begin -->
<jsp:include page="/gyjj/index_top.jsp?nav=grhg" />
<!-- header end -->
<div id="subbanner"><img src="${contextPath }/gyjj/images/subBanner.jpg" /></div>
<div class="subMainconter">
  <div class="newshowup"><img src="${contextPath }/gyjj/images/newshowup.jpg" /></div>
  <div class="newshowMain">
      <dl class="newsTitle">
        <dt><%=title%></dt>
        <dd><span>主讲：<%=docent %></span></dd>
      </dl>
      <div class="videoBox">
      <div id="av">
			 	<object classid="clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95" id="MediaPlayer1" width="100%" height="700"> 
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
      <div class="close"><a href="#" onClick="javascript:window.opener=null;window.close();"><img src="${contextPath }/gyjj/images/closeBtn.jpg" /></a></div>
  </div>
  <div class="newshowdown"><img src="${contextPath }/gyjj/images/newshowdown.jpg" /></div>
</div>
<div class="clear"></div>
<jsp:include page="/gyjj/index_bottom.jsp" />
</body>
</html>
