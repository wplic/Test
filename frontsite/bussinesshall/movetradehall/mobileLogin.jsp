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
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a>  &gt; <a href="${ctx }/bussinesshall/movetradehall/mobileDeal.jsp?nav=wsyyt&nav1=gfydjyt">金管家手机证券</a>&gt;用户注册</div>
  <div class="blank5"></div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="mobileDeal_lmenu.jsp" />
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
  		<div class="left_tit2">用户注册</div>
        <div class=" blank5"></div>
		<ul class="motab1">
        	<li class="active red" id="tagtabs1" onclick="SwitchNews('tabs', 1, 3,'active red','')"><a href="#">广发网站注册</a></li>
            <li id="tagtabs2" onclick="SwitchNews('tabs', 2, 3,'active red','')"><a href="#">Wap网站注册</a></li>
            <li id="tagtabs3" onclick="SwitchNews('tabs', 3, 3,'active red','')"><a href="#">手机短信注册</a></li>
        </ul>
        <div class="blank10"></div>
     <!--网站注册开始-->
    <div class="wzzc" id="tabs1">
<p class="tit1">广发网站注册</p>
            <div class="zxnr">
              <p align="left"><span class="bold font_43">尊敬的证券投资者：</span> <br /><br />
                “金管家手机证券”是互联网和移动通讯技术完美结合的结果。其移动证券交易系统是基于互联网和无线移动通讯网的网上交易系统。虽然我们采用了目前最先进的网络安全措施，但仍存在网上交易委托特别具有的风险。为了使您更好地了解其中的风险，根据有关证券交易法律法规和证券交易所业务规则，特提供本风险提示书，请认真详细阅读。投资者使用“金管家手机证券”主要存在如下风险：<br />
  <br />
                1、由于互联网和无线移动通讯网是开放性的公众网络，“金管家手机证券” 移动证券交易系统除具有其他委托方式所具有的风险外，还具有特别的风险。 <br />
                （1）由于互联网和无线移动通讯网数据传输等原因，交易指令可能会出现中断、停顿、延迟、数据错误等情况； <br />
                （2）投资者密码泄露或投资者身份可能被仿冒；<br />
                （3）由于互联网和无线移动通讯网上存在黑客恶意攻击的可能性，互联网和无线移动通讯网络设备可能会出现故障及其他不可预测的因素，行情信息及其他证券信息可能会出现错误或延迟； <br />
                （4）投资者的手机、软件系统及与网上交易系统可能不相匹配，无法下达委托或委托失败； <br />
                （5）如投资者不具备一定网上交易经验和对手机功能不熟悉，可能因操作不当造成委托失败或委托失误。（此处采用滚动条，显示所有内容） </p>
              <br /><p align="left" class="red">本人郑重声明： <br />
                本人已仔细阅读了上述风险揭示书和《网上交易委托协议书》，并完全了解使用“金管家手机证券” 所要承担的风险，同意协议中本人作为甲方所应享有的权利和承担的义务。本人申请开通“金管家手机证券”业务，并愿意独立承担上述风险 </p>
            </div>
            <div align="center">
            	<input type="submit" name="button" id="button" value="同　意" class="but_03" />
            	<input type="submit" name="button" id="button" value="不同意" class="but_03" />
            </div>
            <br />
      </div>
     <!--网站注册结束--> 
     
     <!--Wap网站注册开始--> 
      <div  id="tabs2" style=" display:none">
      		<table width="690" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td class="wrp_logbox1">
                	<p><span class="bold">访问wap网站注册</span><br /><br />
                	  打开手机浏览器，<br />输入网址： http://wap.gf.com.cn,<br /><br />
                  选择“用户名注册”，进入注册用户页面，在方法一中输入手机号码、附加码。点击下一步。<br /><br />
                如果输入正确，系统提示注册成功，并在大约十分钟内会收到短信，告知您的登录用户名和校验码。</p></td>
                <td>&nbsp;</td>
                <td class="wrp_logbox2"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="281" height="453">
                  <param name="movie" value="/pic/wsyyt/mobileDeal/wapLogin.swf" />
                  <param name="quality" value="high" />
                  <embed src="/pic/wsyyt/mobileDeal/wapLogin.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="281" height="453"></embed>
                </object></td>
              </tr>
            </table>

    </div>
      <!--Wap网站注册结束--> 
      
      <!--手机短信注册开始--> 
      <div id="tabs3" style=" display:none">
      		<div>
      		<table width="690" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td class="wrp_logbox1">
                	<p><span class="bold">发送短信方式注册</span><br /><br />
                	  上行短信注册 (移动手机推荐使用) <br />
                	  请编辑短信内容DB <br />
                	  移动和电信用户发送至95575 <br />
                	  联通用户发送至10655089888828 <br /><br />
                  短信发送成功后，您会收到一条短信，告知您用户名和密码。<br /><br />
               	  </p></td>
                <td>&nbsp;</td>
                <td class="wrp_logbox2"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="281" height="453">
                  <param name="movie" value="/pic/wsyyt/mobileDeal/smsLogin.swf" />
                  <param name="quality" value="high" />
                  <embed src="/pic/wsyyt/mobileDeal/smsLogin.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="281" height="453"></embed>
                </object></td>
              </tr>
            </table>

    </div>
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