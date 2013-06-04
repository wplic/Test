<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script>
<!--
function setTab(name,cursel,n){
for(i=1;i<=n;i++){
  var menu=document.getElementById(name+i);
  var con=document.getElementById("con_"+name+"_"+i);
  menu.className=i==cursel?"ltext":"ltext";
  con.style.display=i==cursel?"block":"none";
}
}
//-->
</script>
</head>

<body class="body_bg">
<jsp:include page="/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a>  &gt; <a href="${ctx }/bussinesshall/movetradehall/mobileDeal.jsp?nav=wsyyt&nav1=gfydjyt">金管家手机证券</a>&gt; 业务开通流程 </div>
  <div class="blank5"></div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="${contextPath}/bussinesshall/movetradehall/mobileDeal_lmenu.jsp" />
      <table width="93%" class="mt10" align="center">
          <tr>
            <td class="right_tit1">金管家手机证券公告</td>
          </tr>
        </table>
<jsp:include page="${contextPath}/bussinesshall/movetradehall/newsListNotify.jsp?nav2=ywktlc">
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
  <div class="left_tit2">业务开通流程</div>
  <div class="blank10"></div>
  <div id="processCont">
  
 
  <p class="rtext"><a href="#">阅读风险协议书</a></p>
  <p class="ltext" style="padding-top:85px" id="one1" onmouseover="setTab('one',1,4)"><a href="#" >开通GPRS上网</a></p>
  <p class="ltext" style="margin-top:67px" id="one2" onmouseover="setTab('one',2,4)"><a href="#" ><a href="#">办理合理的上网套餐</a></p>
  <p class="ltext" style="margin-top:150px" id="one3" onmouseover="setTab('one',3,4)"><a href="#">注册</a></p>
  <p class="ltext" style="margin-top:72px" id="one4" onmouseover="setTab('one',4,4)"><a href="#">访问WAP网站</a></p>
  
  
  <div id="con_one_1" class="processMoblie">首先请确定您的是否手机支持GPRS，如果支持请马上带本人身份证到当地移动营业厅办理开通GPRS上网功能（也可以直接拨打10086开通），如果疑问请电话咨询10086。</div>
  <div id="con_one_2" class="processMoblie" style="display:none;">广发移动交易厅软件是免费的，您所要支付的是上网流量费，请根据您的上网频道选择最经济的上网流量月套餐，具体事宜请垂询10086。</div>
  <div id="con_one_3" class="processMoblie" style="display:none;">目前有三种注册方式：WAP网站注册、短信注册和网站注册。查看详情
点击“查看详情”跳转到注册页面。
</div>
  <div id="con_one_4" class="processMoblie" style="display:none;"><img src="/pic/wsyyt/mobileDeal_sk/moblie_movie.gif"/></div>
  </div>
</div>
  
  
   <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />

</body>
</html>