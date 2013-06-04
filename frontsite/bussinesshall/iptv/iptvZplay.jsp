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
<script language=JavaScript>
function DetectActiveX()
 {
    try
    {
       var comActiveX = new ActiveXObject("HxPlayerCtrl.hxPlayer.1");   
    }
    catch(e)
    {
	//alert("您必需先安装GFTV客户端才能观看！建议使用IE浏览器观看");
	//window.location.href=' http://www.gf.com.cn/front/softInfo.do?method=getSoftListByCategoryId&tabtagsId=4&category_id=400';
	return false;   
    }
    return true;
 }
</SCRIPT>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/setTab.js"></script>
</head>
<jsp:include page="/bussinesshall/iptv/zbtyHpleTemp.jsp" />
<%
	Complaints complaints = (Complaints)request.getSession().getAttribute("complaints");
	String intro = (String)request.getSession().getAttribute("intro");
%>
<body class="body_bg" onload="DetectActiveX()">
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
<br/>
  <p> 尊敬的客户您好，广发证券财富频道已经升级，如果您看不到视频节目，请下载安装广发财富频道视频插件——为您提供更加稳定的，基于p2p技术的视频流，欢迎下载使用。<br/></p>
  <a href='${ctx}/front/softInfo.do?method=getSoftListByCategoryId&tabtagsId=4&category_id=400' >
  <font class="bold" style="color:#2c5ea3;cursor:hand;">
 <p>  下载地址&gt;&gt;</font></a> </p>
  <br/>
  <p> 安装说明：请下载该插件，安装前用winrar解压缩，然后运行解压缩包中的gftv_setup.exe，可安装于电脑任何位置，安装完毕后即可观看广发财富频道直播节目。</p>
<a href="${ctx}/bussinesshall/iptv/iptvZplay_to.jsp"><font class="bold" style="color:#2c5ea3;cursor:hand;">播放有问题的客户也可按此恢复到原来的直播方式&gt;&gt;</font></a><br/>
  <br/>  </p>  
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
<table width="100%" border="0"  cellpadding="0" cellspacing="0">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;双击可看全屏
  <tr>
    <td valign="top" ><div align="center">
		<object id="player" width="380" height="350" classid="CLSID:49AED553-FAEE-4F36-BE58-96308776546d" codebase="${ctx }/pic/commons/gftv.cab#Version=1,0,0,0" > 
		     <param NAME="src" VALUE="3c3bf92291b91e4663bcf323b5abe84a">
		</object>
      </div></td> 
  </tr>
</table>

			</div>
			</a>
            
            
            </td>
            <td valign="top">
            			<div>
      			<table>
      			<tr>
      				<td class="red bold">今日节目表</td>
      			</tr>
      				<tr>
      					<td><%=intro!=null?intro:"没有节目" %></td>
      				</tr>
      			</table>
       		</div>
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