<%@ page contentType="text/html; charset=utf-8" language="java" %>


<%
String leftnav = "management1";
if(request.getParameter("leftnav")!=null&&!request.getParameter("leftnav").equals(""))
leftnav=request.getParameter("leftnav");
leftnav = leftnav == null? "one": leftnav;
String leftnav2 = "";
if(request.getParameter("leftnav")!=null&&!request.getParameter("leftnav").equals(""))
leftnav=request.getParameter("leftnav");
%>

<div class="moLeft">

<div class="leftTit"><a href="${ctx }/mobile/index.jsp?nav=wsyyt&nav1=gfydjyt"><img src="${contextPath }/pic/mobile/moleft2.jpg" width="204" height="71" border="0"/></a></div>
<div class="<%= leftnav.equals("management1")?"nav_s white":"nav"%>" onFocus=blur() onclick="updown('2','1')"><a href="${contextPath }/mobile/index.jsp?nav=wsyyt&nav1=gfydjyt">使用指南</a></div>

<div id="upDownDiv1" style="<%= leftnav.equals("management1")?"DISPLAY:block":"DISPLAY:block"%>">
    <div class="mofonnavWarp">
    <div onfocus="this.blur()" class="<%= leftnav2.equals("management1_1")?"mofonnav_s":"mofonnav"%>"><a href="${contextPath }/mobile/softdown.jsp?nav=wsyyt&nav1=gfydjyt">下载软件及安装</a></div>
    <div onfocus="this.blur()" class="<%= leftnav2.equals("management1_2")?"mofonnav_s":"mofonnav"%>"><a href="${contextPath }/mobile/guide.jsp?nav=wsyyt&nav1=gfydjyt">软件操作说明</a></div>
    <div onfocus="this.blur()" class="<%= leftnav2.equals("management1_3")?"mofonnav_s":"mofonnav"%>"><a href="${contextPath }/mobile/recommend.jsp?nav=wsyyt&nav1=gfydjyt">推荐手机列表</a></div>
    <div onfocus="this.blur()" class="<%= leftnav2.equals("management1_4")?"mofonnav_s":"mofonnav"%>"><a href="${contextPath }/mobile/support.jsp?nav=wsyyt&nav1=gfydjyt">支持手机列表</a></div>
    </div>
</div>



<div class="<%= leftnav.equals("management2")?"nav_s white":"nav"%>" onFocus=blur() onclick="updown('2','2')"><a href="${contextPath }/mobile/systemIntro.jsp?nav=wsyyt&nav1=gfydjyt">系统介绍</a></div>

<div class="<%= leftnav.equals("management3")?"nav_s white":"nav"%>" onFocus=blur() onclick="updown('2','3')"><a href="${contextPath }/mobile/rates.jsp?nav=wsyyt&nav1=gfydjyt">资费说明</a></div>

<div class="<%= leftnav.equals("management4")?"nav_s white":"nav"%>" onFocus=blur() onclick="updown('2','4')"><a href="${contextPath }/financeMsgAction.do?method=getFinanceMessageList">客户咨询</a></div>

<div class="<%= leftnav.equals("management5")?"nav_s white":"nav"%>" onFocus=blur() onclick="updown('2','5')"><a href="${contextPath }/jgjQuesAction.do?method=getJgjQuestionList">常见问题</a></div>




<div class="leftbot"></div>
</div>
<p align="center"><a href="${contextPath }/bussinesshall/95575.html"><img src="../pic/mobile/phone.png"></a></p>
<div class="blank10"></div>
<p align="center"><a href="${contextPath }/mobile/phone.jsp">
<img src="../pic/mobile/huod/jgj.jpg" /></a></p>
<div class="blank10"></div>
<div class="rtit1"><span class="fright font_normal red mr5"></span>手机金管家软件获奖名单</div>
<div class="bg_ff ptb6 ribor3">
<span>
<jsp:include page="winners.jsp"></jsp:include>
</span>
</div>
