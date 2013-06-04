<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/investorEdu/investorEdu.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>

<body class="body_bg">
<jsp:include page="${contextPath}/share/top.jsp?nav=tzzyd&nav1=school" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt;<a href="${contextPath }/investorEdu/investorSchool.html"> 投资者园地</a> &gt; 风险揭示书</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="investorRisk_lmenu.jsp" />
        <jsp:include page="/infoCenter/Search.jsp"/>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  <div class="left_tit2">风险揭示书</div> 
    <div class="blank10"></div>
    <p align="center" class="font14 bold mtb16">总体风险揭示书</p>
    <p class="lh21 p10">尊敬的客户： <br />
　　在进行证券交易时，可能会获得较高的投资收益，但同时也存在着较大的证券投资风险。为了使您更好地了解其中的风险，根据有关证券交易法律法规和证券交易所业务规则，特提供本风险提示书，请仔细详细阅读<br />
　　投资者从事证券投资存在如下风险：<br />
    </p><br />
    <div class="riskjs">
    	<p class="t1">由于我国宏观经济形势的变化以及周边国家、地区宏观经济环境和周边证券市场的变化，可能会引起国内证券市场的波动，使您存在亏损的可能，您将不得不承担由此造成的损失。</p>
        <p class="t2">有关证券市场的法律、法规及相关政策、规则发生变化，可能引起证券市场价格波动，使您存在亏损的可能，您将不得不承担由此造成的损失。</p>
      <p class="t3">由于上市公司所处行业整体经营形势的变化;上市公司经营管理等方面的因素,如经营决策重大失误、高级管理人员变更、重大诉讼等都可能引起该公司证券价格的波动；由于上市公司经营不善甚至于会导致该公司被停牌、摘牌，这些都使您存在亏损的可能。</p>
        <p class="t4">由于交易撮合及行情揭示是通过电子通讯技术和电脑技术来实现的，这些技术存在着被网络黑客和计算机病毒攻击的可能，由此可能给您带来损失。</p>
        <p class="t5">诸如地震、火灾、水灾、战争等不可抗力因素可能导致证券交易系统的瘫痪；证券营业部无法控制和不可预测的系统故障、设备故障、通讯故障、电力故障等也可能导致证券交易系统非正常运行甚至瘫痪，这些都会使您的交易委托无法成交或者无法全部成交，您将不得不承担由此导致的损失。</p>
      <p class="t6">其他风险：由于您密码失密、操作不当、投资决策失误等原因可能会使您发生亏损，该损失将由您自行承担；在您进行证券交易中他人给予您的保证获利或不会发生亏损的任何承诺都是没有根据的，类似的承诺不会减少您发生亏损的可能。</p>
    </div>
    <div class=" blank10"></div>
    <div class="risytit">特别提示</div>
    <p class="p15 lh21"> 　　本公司敬告投资者，应当根据自身的经济实力和心理承受能力认真制定证券投资策略，尤其是当您决定购买ST、ST类股票时，尤其应该清醒地认识到该类股票比其他股票蕴涵更大的风险。由此可见，证券市场是一个风险无时不在的市场。您在进行证券交易时存在赢利的可能，也存在亏损的风险。<br />
    　　本风险揭示书并不能揭示从事证券交易的全部风险及证券市场的全部情形。您务必对此有清醒的认识，认真考虑是否进行证券交易。市场有风险，入市需谨慎！</p>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="${contextPath}/share/bottom.jsp" />
</body>
</html>