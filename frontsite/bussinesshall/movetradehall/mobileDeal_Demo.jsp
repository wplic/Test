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
<jsp:include page="/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a>  &gt; <a href="${ctx }/bussinesshall/movetradehall/mobileDeal.jsp?nav=wsyyt&nav1=gfydjyt">金管家手机证券</a>&gt;操作指南</div>
  <div class="blank5"></div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="mobileDeal_lmenu.jsp?nav2=czzn" />
		<table width="93%" class="mt10" align="center">
          <tr>
            <td class="right_tit1">金管家手机证券公告</td>
          </tr>
        </table>
<jsp:include page="newsListNotify.jsp">
            <jsp:param name="catName" value="金管家手机证券公告" />
            <jsp:param name="whichCat" value="wsyyt_ydjyt_ydjytgg"/>
            <jsp:param name="state" value="1"/>
            <jsp:param name="showSize" value="5"/>
    </jsp:include>
		
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
    <div class="left_tit2">操作演示</div>
    
    <div id="demoCont" class="demostep1">启动软件输入账号及密码即可登陆，成功后登陆后选择［系统］→［添加营业部］→［选择全国］→选择［营业部客户］即可进行交易</div>
    
    <div id="demoCont" class="demostep2">打开“金管家手机频道”软件，选择［移动梦网GPRS］或者［连接互联网］登陆“金管家手机频道”服务器。委托。</div>
    
    <div><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="706" height="496">
    <param name="movie" value="/pic/wsyyt/mobileDeal_sk/wsyyt_demo.swf" />
    <param name="WMode" value="Opaque" />
    <param name="quality" value="high" />
    <embed src="/pic/wsyyt/mobileDeal_sk/wsyyt_demo.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="706" height="496"></embed>
  </object></div>
   
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />

</body>
</html>