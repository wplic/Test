<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page	import="com.cssweb.video.service.TvideoProgramService"%>
<%@page	import="com.cssweb.video.pojo.TvideoProgram"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.text.SimpleDateFormat"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
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
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="${ctx }/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a> &gt; <a href="${ctx }/bussinesshall/iptv/iptv.jsp?nav=wsyyt&nav1=iptvsp">金管家财富频道</a> &gt;  收视指南</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
    <div class="iptvside_mid">
        <jsp:include page="iptv_lmenu.jsp?nav=wsyyt&nav1=iptvsp&nav2=cszn" />
    </div>
    <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
  
  <div class="w706" fright>
	<div class="barCf">收视指南</div>
    <ul class="cfTab">
    	<li class="curr" id="tagList1" onmouseover="SwitchNews('List', 1, 4,'curr','')"><a href="#">交易客户收看指南</a></li>
        <li id="tagList2" onmouseover="SwitchNews('List', 2, 4,'curr','')"><a href="#">体验客户收看指南</a></li>
        <li id="tagList3" onmouseover="SwitchNews('List', 3, 4,'curr','')"><a href="#">常见问题</a></li>
        <li id="tagList4" onmouseover="SwitchNews('List', 4, 4,'curr','')"><a href="#">联系我们</a></li>
    </ul>
    
  <div id="List1">
      <p class="bold znbarTxt">一、在广发网（www.gf.com.cn）首页注册</p>
      <p><img src="${ctx }/pic/lm1a1.jpg" /></p>
      <p class="znbarTxt">页面将自动弹出“客户身份认证”窗口</p>
      <p><img src="${ctx }/pic/lm1a2.jpg" /></p>
      <p class="znbarTxt">设置个人信息</p>
      <p><img src="${ctx }/pic/lm1a3.jpg" /></p>
      <p class="znbarTxt"><span class="red">提醒：</span>设置成功后，网页将自动为您登陆，请您记住设置的个人信息，以供下次登陆使用。若密码遗失，请重新注册。</p>
      
      <br />
      <p class="bold znbarTxt">二、在广发网（www.gf.com.cn）首页登录</p>
      <p><img src="${ctx }/pic/lm1a4.jpg" /></p>
      
      <br />
      <p class="bold znbarTxt">三、进入财富频道</p>
      <p class="znbarTxt">方式一</p>
      <p><img src="${ctx }/pic/lm1a5.jpg" /></p>
      <p class="znbarTxt">方式二</p>
      <p><img src="${ctx }/pic/lm1a6.jpg" /></p> 
      
      <br />
      <p class="bold znbarTxt">四、收看节目 </p>
      <p class="znbarTxt">进入财富频道页面后便可收看视频直播与点播.</p>
      <p><img src="${ctx }/pic/lm1a7.jpg" /></p>
           
    </div>
    
    
    <div id="List2" style="display:none">
      <p class="bold znbarTxt">一、在广发网（www.gf.com.cn）首页注册</p>
      <p class="znbarTxt">第一步：进入体验申请</p>
      <p><img src="${ctx }/pic/lm2a1.jpg" /></p>
      <p class="znbarTxt">第二步：请按提示填写以下表格</p>
      <p><img src="${ctx }/pic/lm2a2.jpg" /></p>
      
      
      <br />
      <p class="bold znbarTxt">二、在广发网（www.gf.com.cn）首页登录</p>
      <p><img src="${ctx }/pic/lm2a3.jpg" /></p>
      
      <br />
      <p class="bold znbarTxt">三、进入财富频道</p>
      <p class="znbarTxt">方式一</p>
      <p><img src="${ctx }/pic/lm2a4.jpg" /></p>
      <p class="znbarTxt">方式二</p>
      <p><img src="${ctx }/pic/lm2a5.jpg" /></p> 
      
      <br />
      <p class="bold znbarTxt">四、收看节目 </p>
      <p class="znbarTxt">进入财富频道页面后便可收看视频直播与点播.</p>
      <p><img src="${ctx }/pic/lm2a6.jpg" /></p>
           
    </div>
    
    
    
    <div id="List3" style="display:none">

      
      <p class="lh22">当您进入视频直播后若无法收看节目，请下载安装广发财富频道视频插件<br /> 
<span class="red">下载地址：</span><a href="${ctx }/front/softInfo.do?method=getSoftListByCategoryId&tabtagsId=4&category_id=400" target="_blank">${ctx }/front/softInfo.do?method=getSoftListByCategoryId&tabtagsId=4&category_id=400 </a>
<br /><br />
<span class="red">安装说明：</span>请下载该插件，安装前用winrar解压缩，然后运行解压缩包中的gftv_setup.exe，可安装于电脑任何位置，安装完毕后即可观看广发财富频道直播节目。
<br /><br />
winrar下载地址：<a href="http://winrar.softonic.cn/" target="_blank">http://winrar.softonic.cn/</a> </p>
           
    </div>
    
    <div id="List4" style="display:none">

      
      <p class="lh22">当您无法正常收看节目请第一时间致电您的客户经理或与当地营业部联系。
<br />
全国统一客户服务热线：95575 </p>
           
    </div>
    
</div>
   <!--右侧sied结束--> 
    <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />

</body>
</html>