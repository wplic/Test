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
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a>  &gt; <a href="${ctx }/bussinesshall/movetradehall/mobileDeal.jsp?nav=wsyyt&nav1=gfydjyt">金管家手机证券</a>&gt; 软件下载 </div>
  <div class="blank5"></div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="mobileDeal_lmenu.jsp?nav2=rjxzs" />
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
  		<div class="left_tit2">软件下载</div>
        <div class=" blank5"></div>
		<ul class="motab1">
            <li id="tagtabs1" class="active red" onclick="SwitchNews('tabs', 1, 2,'active red','')"><a href="#">Wap网站下载</a></li>
            <li id="tagtabs2" onclick="SwitchNews('tabs', 2, 2,'active red','')"><a href="#">下载到电脑</a></li>
        </ul>
        <div class="blank10"></div>
     
     
     <!--Wap网站注册开始--> 
      <div  id="tabs1">
      		<table width="690" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td class="wrp_logbox1">
                	<p><span class="bold">访问wap网站下载</span><br /><br />
                	  打开手机浏览器，<br />输入网址： http://wap.gf.com.cn,<br /><br />
                	  选择“软件下载”，选择“新一代广发移动交易厅”，然后选择您的手机品牌、型号，最后确认下载。<br /><br />
                如果输入正确，系统提示注册成功，并在大约十分钟内会收到短信，告知您的登录用户名和校验码。</p></td>
                <td>&nbsp;</td>
                <td class="wrp_logbox2"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="281" height="453">
                  <param name="movie" value="/pic/wsyyt/mobileDeal/wapDownload.swf" />
                  <param name="quality" value="high" />
                  <embed src="/pic/wsyyt/mobileDeal/wapDownload.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="281" height="453"></embed>
                </object></td>
              </tr>
            </table>

    </div>
      <!--Wap网站注册结束--> 
      
      <!--手机短信注册开始--> 
      <div id="tabs2" style=" display:none">
      		
      		<table width="690" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td class="wrp_logbox3">
                <br /><br />
                	<p><span class="bold">电脑下载</span><br /><br />
                	  点击“下载到电脑”，下载后，再通过数据线、红外、蓝牙传送到手机上进行安装。</p>
                      <br /><br /><br />
                      <p><a href="${contextPath }/bussinesshall/softDownload.html"><img src="/pic/wsyyt/mobileDeal/but_down.gif"/></a></p>
                      </td>
              </tr>
            </table>

   
      </div>
      <!--手机短信注册结束--> 
      
</div>
  
   <!--右侧sied结束--> 
    <div class="clearfloat"></div><!--清除浮动--> 
</div>
<script src="/js/setTab.js"></script>
<jsp:include page="/share/bottom.jsp" />

</body>
</html>