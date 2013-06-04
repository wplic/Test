<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<%@page import="com.cssweb.complaints.pojo.Complaints"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<%@page	import="com.cssweb.video.pojo.TvideoProgramLive"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<jsp:include page="/share/pdLogin.jsp" />
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
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a> &gt; <a href="${ctx }/bussinesshall/iptv/iptv.jsp?nav=wsyyt&nav1=iptvsp">GFTV</a> &gt; 视频直播</div>
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
  		<div class="left_tit2">视频直播</div>
<p>
<br>
  <p>尊敬的客户您好！</p>
  <br/>
 <p>
<a href="${ctx}/tvideo.do?method=getNewDateTimeTvideoObject&nav=wsyyt&nav1=iptvsp&nav2=spzb">
<font class="bold" style="color:#2c5ea3;cursor:hand;">
欢迎使用p2p技术的视频流的直播方式&gt;&gt;</font></a><br/></p>
  <br/>      
<table width="95%" align="center" class="mt15">
          <tr>
            <td width="495" valign="top">
            <a name='1'>
          	<script language="JavaScript">
<!--
    if ( navigator.appName == "Netscape" )
    {
        //-- 此行确保在浏览器中刚刚安装的插件能得到升级，
        //-- 而不用退出浏览器。
        navigator.plugins.refresh();
         // 我们不需要 IE 中的 APPLET 
        // ***请注意如果您不需要脚本事件，完全可以删除以下两行
        document.write("\x3C" + "applet MAYSCRIPT Code=NPDS.npDSEvtObsProxy.class")
        document.writeln(" width=5 height=5 name=appObs\x3E \x3C/applet\x3E")
    }
//-->
</script>
<%
	Complaints complaints = (Complaints)request.getSession().getAttribute("complaints");
	String intro = (String)request.getSession().getAttribute("intro");
%>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;双击可看全屏
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><div align="center">
        <object classid="clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95"  
              codebase="http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=6,4,5,715"  
              type="application/x-oleobject" width="380" height="288" align="middle"  
              standby="Loading Microsoft Windows Media Player components..." id="mp_3216425264" >
          <param name="AllowChangeDisplaySize" value="1">
          <param name="AutoRewind" value="1">
          <param name="Autosize" value="1">
          <param name="AutoStart" value="1">
          <param name="Balance" value="0">
          <param name="BufferingTime" value="3">
          <param name="ClickToPlay" value="1">
          <param name="DisplaySize" value="4">
          <param name="EnableContextMenu" value="1">
          <param name="EnableFullScreenControls" value="1">
          <param name="EnableTracker" value="1">
          <param name="Filename" value="http://121.14.2.19/3c3bf92291b91e4663bcf323b5abe84a">
          <param name="Mute" value="0">
          <param name="PlayCount" value="1">
          <param name="ShowControls" value="1">
          <param name="ShowAudioControls" value="1">
          <param name="ShowDisplay" value="0">
          <param name="ShowGotoBar" value="0">
          <param name="ShowPositionControls" value="0">
          <param name="ShowStatusBar" value="1">
          <param name="ShowTracker" value="1">
          <param name="VideoBorderColor" value="0">
          <param name="VideoBorderWidth" value="0">
          <param name="Volume" value="-500">
          <embed  
          src="http://121.14.2.19/3c3bf92291b91e4663bcf323b5abe84a"  
          width="400"  
          height="300"  
          autostart="1" align="middle" type="application/x-mplayer2"  
          pluginspage="http://microsoft.com/windows/mediaplayer/en/download/" 
          id=MediaPlayer  
          name="mp_3216425264"  
          autosize="1"  
          clicktoplay="1" 
          displaysize="0"  
          enablecontextmenu="1" 
          enablefullscreencontrols="1" 
          EnableTracker="1"  
          mute="0" 
          playcount="1" 
          showcontrols="1"  
          showaudiocontrols="1"  
          showdisplay="0"  
          showgotobar="0"  
          showpositioncontrols="0"  
          showstatusbar="1"  
          showtracker="1"  
          > </embed> </object>
      </div></td>
  </tr>
</table>

			</div>
			</a>
            
            
            </td>
              <td>
            			<div>
      			<table align="center">
      			<tr>
      				<td class="red bold">今日节目表</td>
      			</tr>
      			<tr><td>  </td></tr>
      				<tr>
      					<td><%=intro!=null?intro:"没有节目" %></td>
      				</tr>
      			</table>
       		</div>
            </td>
            <td valign="top" class="font_43 lh25">
            </td>
          </tr>
          <tr>
          		<td colspan="2" width="60%">
          		<hr />
          			<table>
          				<tr>
      					<td class="red bold">值班投资顾问介绍</td>
      				</tr>
      				<%
      					if(complaints!=null){%>
      						<tr>
      					<td align="left">
      						<strong><font style="color: black">姓名</font></strong>：<%=complaints.getName()!=null?complaints.getName():"匿名" %>
      					</td>
      				</tr>
      				<tr>
      					<td align="left">
      						<strong><font style="color: black">类型</font></strong>：<%=complaints.getType()=="1"?"专家":"分析师" %>
      					</td>
      				</tr>
      				<tr>
      					<td align="left">
      						<strong><font style="color: black">简介</font></strong>：<%=complaints.getRemark()!=null?complaints.getRemark():"暂无简介" %>
      					</td>
      				</tr>
      					<%}
      					else{%>
      						<tr><td>今日无值班人员</td></tr>
      						<%
      					}
					%>
          			</table>
          		</td>
          </tr>
        </table>
              <div style="height:10px; overflow:hidden"></div>
  </div>
   <!--右侧sied结束--> 
    <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />

</body>
</html>