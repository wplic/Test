<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:directive.page import="com.css.cms.document.Document"/>
<jsp:directive.page import="com.css.cms.document.DocumentManager"/>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.common.util.CsswebServiceUtil"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.Map"/>
<%
request.setCharacterEncoding("UTF-8");
%>
<%@page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${contextPath}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />

<script language="JavaScript" type="text/JavaScript">
var size=14;            //字体大小
function fontZoom(fontsize){    //设置字体
    size=fontsize;
    document.getElementById('ShowContent').style.fontSize=size+'px';
    document.getElementById('zhong').className='red';
    document.getElementById('da').className='';
    document.getElementById('xiao').className='';
}
function fontMax(){    //字体放大
    
    size=16
    document.getElementById('ShowContent').style.fontSize=size+'px';
    document.getElementById('zhong').className='';
    document.getElementById('da').className='red';
    document.getElementById('xiao').className='';
}
function fontMin(){    //字体缩小
    size=12;
    document.getElementById('ShowContent').style.fontSize=size+'px';
    document.getElementById('zhong').className='';
    document.getElementById('da').className='';
    document.getElementById('xiao').className='red';
}
</SCRIPT>

<style>
.mainContent font {
	font-size: 20px; 
	color: red; 
	font-weight: bold;
	line-height: 50px;
}
.mainContent h3 {
	font-weight: bold;
	font-size: 15px;
	line-height: 30px;
}
</style>

</head>
<body>
<!-- 头部 -->
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz"></div>
  <div class="blank5"></div>
  <div class="bg_f5 p8">
	<div class="tlbg3">
        	<p style="font-size: 25px;" class="textTitle1" align="center">
        	防范非法证券活动之“五要五不要”
        	</p>    
   <div class="newstextArea">
   <p class="newstextAreatop"></p>
   <div class="mainContent" style="word-wrap:break-word;">
   			<font>一、投资者防范非法证券活动之“五要”</font>
			<h3>1．要学习相关法律法规</h3>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;要学习证券法律法规和规章政策，提高识别非法证券活动的能力，学会运用法律武器维护合法权益。通过学习法律法规，提高法律意识和风险防范意识，不参与任何非法证券活动，才能真正保护自己。</p>
			<h3>2．要学习证券投资知识</h3>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;“股市有风险,入市需谨慎”，投资在深沪两个交易所上市的股票尚且如此，对于缺乏证券基本知识的投资者而言，贸然进入非上市股份投资领域，更容易上当受骗。证券市场作为虚拟经济的代表，其市场和产品的复杂程度，远远超出普通老百姓的知识范畴。只有不断的学习和积累，掌握基本的证券投资知识，才有可能成为一名合格的投资者,理性管理个人财富。</p>
			<h3>3．要保持理性投资心态</h3>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;要警惕不法分子采用诱惑性极强的虚假宣传编织成的陷阱，切勿幻想“一夜暴富”。在投资之前,一定要对企业状况进行印证和深入了解,切莫因贪利导致心急浮躁，要清楚地认识到投资理财是一门科学，投资回报有其自身规律的特性，市场中不会出现“天上掉馅饼”的好事，冷静分析，审慎对待，始终保持理性头脑。</p>
			<h3>4．要征询专业人士意见</h3>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一些中介机构或个人通常从劳动市场招聘业务员，经过“专业”、“系统”的培训，抓住投资者对证券市场了解不深入，相关法律法规不熟悉，急于赚钱或弥补亏损的心理，劝诱投资者，加之中介机构的业务员为了个人提成，一般都会极力蛊惑投资者。对于普通投资者而言，在投资之前，应向证券投资专业人士咨询，取得相对权威和专业的解释，再据此作出投资决策，切勿轻信他人谎言。</p>
			<h3>5．要抵制非法证券活动</h3>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在学习相关法律法规和证券知识的基础上，要通过研读案例，学会识别非法证券活动，对发现的非法证券活动自觉抵制、及时举报。要通过合法的机构或渠道进行证券投资，彻底铲除非法证券活动的市场基础。</p>
			<font>二、投资者防范非法证券活动之“五不要”</font>
			<h3>1．不要抱有“一夜暴富”幻想</h3>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;近年来，资本市场的发展使投资者对股票投资回报的期望不断提高,于是部分投资者心存暴富幻想，这种心理易被非法机构和不法中介利用，导致被骗的下场。因此，要防范非法证券活动，必须摒弃“一夜暴富”的幻想和投机取巧的心理，以理性科学的心态投资股票。</p>
			<h3>2．不要轻信传言或者谣言</h3>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;合法的原始股投资门槛一般很高，而且风险较大。对于“年底保证上市”、“到期回购”的承诺，投资者要格外小心，天底下从来就没有免费的午餐。因此，坚决不要轻信中介机构、销售人员的“粉饰”推销，不要相信他们散布的不实传言，如遇疑似现象，应保持谨慎，要先征询有关部门和专业人士，不要轻易相信，更不要参与其中。</p>
			<h3>3．不要相信电话网络蛊惑宣传</h3>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;为逃避打击和监管，从事非法证券活动的机构或个人往往采取电话、网络等“钓鱼式”传销手段，与投资者取得联系。电话名单通过非正式渠道购买，不仅有投资者个人电话号码，而且有姓名和住址等个人信息，不法分子以此为沟通切入点，极易获取投资者的信任。网络的开放性和隐蔽性，更是不法分子善用之道，普通投资者很难分辨其真伪。因此，投资者要对这种渠道的陌生电话做到提前防范，眼见为实，不要被其夸张宣传所蛊惑。</p>
			<h3>4．不要被表面现象所迷惑</h3>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;中介机构表面现象。非法证券活动经营者有的根本未经工商登记注册，假借公司名义，租用居民楼等场所进行“钓鱼式”传销活动，甚至有一些还租用高级写字楼，外表冠冕堂皇，迷惑性极强。还有股份公司虚构数据，出具虚假财务报表，粉饰其经营业绩，甚至有的公司借其他公司办公场所“指鹿为马”，专供投资者参观，试图用这些表面现象迷惑投资者。当投资者遭遇此类情况时，应保持求真态度，多向相关机构咨询确认，询问公司的来龙去脉，千万不要被虚有其表的公司所蒙骗。</p>
			<h3>5．不要轻易向他人汇款</h3>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一切非法证券活动的最终目的，是攫取投资者的合法所得，获取其非法所得，为此，他们会不惜代价（打折、优惠、签订回购协议），采取各种推销手段（频繁催款、制造紧压感），催使投资者尽快将足量资金打入其控制的银行账户。投资者一旦付款，不法分子会立即变换嘴脸，变“被动”为“主动”，投资者追回款项的难度极大，只能后悔莫及。因此，在推销、投资项目介绍等所有环节，投资者判断的错误都可以挽回，但是在汇款环节，必须慎之又慎，避免经济损失。</p>
                           <br />
                           <table width="92%"  border="0" align="center" cellpadding="0" cellspacing="0">
					 <tr>
                      <td height="48" align="center" style="padding:10px 15px; "><input type="submit" name="Submit2" value="关闭窗口" class="button4" onClick="javascript:window.opener=null;window.close();"/></td>
                     </tr>
		          </table>
			</div>
</div>
</div></div></div>
<div class="blank5"></div>
<!-- 末尾 -->
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>