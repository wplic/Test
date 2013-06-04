<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />

</head>

<body class="body_bg">
<jsp:include page="${ctx}/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a>  &gt; <a href="${ctx }/bussinesshall/movetradehall/mobileDeal.jsp?nav=wsyyt&nav1=gfydjyt">金管家手机证券</a> &gt;手机证券 </div>
  <div class="blank5"></div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	   <jsp:include page="${ctx}/bussinesshall/movetradehall/mobileDeal_lmenu.jsp" />
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
    <div class="left_tit2">手机证券 - 业务办理</div>
    <div id="mobileSecu">
    <p class="title"><span class="tt2"><i>业务办理</i></span></p>
    <div class="textArea">
    <p>1.开通GPRS功能（拨打10086即时开通）。</p>
    <p>2.下载“手机证券”手机客户端（移动定制机型已经预装程序，无需下载，未预装的终端请发送8到10658068，访问系统返回的Wap Push地址，即可下载安装）。</p>
    <p>3.启动“手机证券”，根据系统提示，确定认购后即可开通行情、交易、资讯服务。</p>
    <p>4.完成在线交易，须选择指定广发证券，具体情况请拨打客服热线。客户服务电话： 移动客服电话： 10086 掌上网客服电话：010-59282957/ </p>
    </div>
    </div>
   
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="${ctx}/share/bottom.jsp" />

</body>
</html>