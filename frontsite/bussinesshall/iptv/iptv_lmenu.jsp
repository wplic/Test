<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<%@ include file="/commons/taglibs.jsp"%>
<%
 String nav2="";
 if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals(""))
 nav2=request.getParameter("nav2");
 %>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<p align="center" class="mb6"><img src="${ctx}/pic/wsyyt/iptv/menu_pic1.jpg" /></p>
<ul class="iptv_mbox">
    <li  <%=nav2.equals("cszn")?"class='active white'":"" %>><a href="${ctx}/bussinesshall/iptv/iptvCszn.jsp">收视指南</a></li>
    <li  <%=nav2.equals("sszn")?"class='active white'":"" %>><a href="${ctx}/tvideo.do?method=getWeekTvideo&amp;nav=wsyyt&amp;nav1=iptvsp&amp;nav2=sszn">一周导视</a></li>
    <li  <%=nav2.equals("spzb")?"class='active white'":"" %>>
    <a href="${ctx}/tvideo.do?method=getNewDateTimeTvideoObject&amp;nav=wsyyt&amp;nav1=iptvsp&amp;nav2=spzb">视频直播</a>
    </li>
    <li  <%=nav2.equals("zpdb")?"class='active white'":"" %>><a href="${ctx}/bussinesshall/iptv/iptvDplay.html">视频点播</a></li>
    <li  <%=nav2.equals("pdjs")?"class='active white'":"" %>><a href="${ctx}/bussinesshall/iptv/iptvChannel.html">频道介绍</a></li>
    <li  <%=nav2.equals("lmjs")?"class='active white'":"" %>><a href="${ctx}/bussinesshall/iptv/iptvIntro.html">栏目介绍</a></li>
    <li  <%=nav2.equals("fxsfc")?"class='active white'":"" %>><a href="${ctx}/bussinesshall/iptv/iptvAnalyst.html">投资顾问风采</a></li>
    <li  <%=nav2.equals("wxfg")?"class='active white'":"" %>><a href="${ctx}/bussinesshall/iptv/iptvWxfg.html">卫星覆盖</a></li>
    <li  <%=nav2.equals("jrhf")?"class='active white'":"" %>><a href="${ctx}/bussinesshall/iptv/iptvJrhf.jsp?nav=wsyyt&nav1=iptvsp&nav2=jrhf">今日回放</a></li>
    <li  <%=nav2.equals("lxwm")?"class='active white'":"" %>><a href="${ctx}/bussinesshall/iptv/iptvLxwm.jsp">联系我们</a></li>
    
</ul>
<div style=" height:60px"></div>
