<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%request.setCharacterEncoding("UTF-8");%>
<%@page import="java.util.List"%>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	if(request.getParameter("nav1")!=null&&!request.getParameter("nav1").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav1"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
	if(request.getParameter("nav")!=null&&!request.getParameter("nav").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
	if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav2"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
	if(request.getParameter("menu")!=null&&!request.getParameter("menu").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("menu"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
	if(request.getParameter("menu2")!=null&&!request.getParameter("menu2").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("menu2"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
	if(request.getParameter("menu3")!=null&&!request.getParameter("menu3").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("menu3"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
		List list = (List)request.getAttribute("list");
		Integer curPage = (Integer)request.getAttribute("curPage");	
		//SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		List  jjlxList =	(List)request.getAttribute("jjlxList");
		List  jjlxlxList =	(List)request.getAttribute("jjlxlxList");
		List  jjlxzdList =	(List)request.getAttribute("jjlxzdList");
		
		String fundName22 = (String)request.getAttribute("fundName");
		String fundType22 = (String)request.getAttribute("fundType");
 %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${contextPath}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.boderight-bottom{
font-size:14px;
border-bottom:solid 1px #666666;
border-right:solid 1px #666666; text-align:center;
}

.boderleft-top{
font-size:14px;
border-top:solid 1px #666666;
border-left:solid 1px #666666;
text-align:center;
letter-spacing:3px;line-height:26px;
}

.fontsize{
font-size:14px;
font-weight:bold;
margin-left:3em;
}
.fontsizesec{
font-size:14px;
font-weight:bold;
}
.fontsizemore{
font-size:19px;
font-weight:bold;
}
.line {
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: dotted;
	border-left-style: none;
	border-bottom-color: #666666;
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;	
}
.gepnorm{
font-size:14px;
letter-spacing:3px;text-align:justify;line-height:26px;
}
.gep{
font-size:14px;
letter-spacing:3px;text-align:justify;text-indent:3em; line-height:26px;
}
.michange{
font-size:14px;
margin-left:3em;
}
.lastmichange{
font-size:14px;
letter-spacing:3px;text-align:justify;line-height:26px;margin-left:375px; margin-top:50px;
}
.tp{
	font-size: 14px;
}
</style>
</head>
<SCRIPT LANGUAGE="JavaScript">
     function checkLogin22(){
	   var fundCode=document.getElementById("fundCode").value;
	   var gsmc=document.getElementById("gsmc").value;
	   var fundName=document.getElementById("fundName").value;  
       var fundType=document.getElementById("fundType").value;
	   var urls="${ctx}/jjylbAction.do?method=getJjylbInfoAll&nav=zxzx";
	   if(fundCode!="")
	   {
	    urls=urls+"&fundCode="+fundCode;
	   }
	   if(gsmc!="")
	   {
	    urls=urls+"&gsmc="+gsmc;
	   }
	   if(fundName!="")
	   {
	    urls=urls+"&fundName="+fundName;
	   }
	   if(fundType!="")
	   {
	    urls=urls+"&fundType="+fundType;
	   }
	   document.location.href =urls;
    }
</SCRIPT> 
<body class="">
<jsp:include page="${contextPath}/share/top.jsp?nav=zxzx&nav1=jj&nav2=hor1" />
<div class="body_bg">
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index"> 首页 </a>  &gt; 广发认购基金一览</div>
</div>
<form action="${contextPath }/jjylbAction.do?method=getJjylbInfoAll&nav=zxzx" id="r2Form" name="r2Form" method="post">
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="${contextPath}/infoCenter/fund_lmenu.jsp?menu1=hor1&menu2=board1&menu3=showrisk" />
  </div>
 <div class="iptvside_bot"></div>
  <div class="blank5"></div>
  
  <div class="blank5"></div>
  
  
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  <div class="left_tit007">基金风险揭示书</div>
    <div class="blank5"></div>
<div style=" padding-left:10px; width:704px; font-size:14px;"><p align="center" class="fontsizemore"><strong>证券投资基金投资人权益须知 </strong></p>
<br/><br/>
<p><span class="gepnorm">尊敬的基金投资人： </span><br />
  <span class="gepnorm" style="margin-left:3em">基金投资在获取收益的同时存在投资风险。为了保护您的合法权益，请在投资基金前认真阅读以下内容： </span></p>
<p class="gep"><strong style="font-weight:bold; font-size:14px;">一、基金的基本知识  </strong><br />
    <strong class="fontsize">(一)什么是基金 </strong><br />
    <span class="michange">证券投资基金(简称基金)是指通过发售基金份额，将众多投资者的资金集中起来，形成独立财产，由基金托管人托管，基金管理人管理，以投资组合的方法进行证券投资的一种利益共享、风险共担的集合投资方式。</span> <br />
  <strong class="fontsize">(二)基金与股票、债券、储蓄存款等其它金融工具的区别 </strong></p>
<table width="688" style="font-size: 14px;" height="350" border="0" cellpadding="0" cellspacing="0" class="boderight-bottom">
  <tr>
    <td width="90" bgcolor="#CCCCCC" class="boderleft-top"><p align="center"><strong>&nbsp;</strong></p></td>
    <td width="188" bgcolor="#CCCCCC" class="boderleft-top"><p align="center" ><strong class="fontsizesec">基金 </strong></p></td>
    <td width="127" bgcolor="#CCCCCC" class="boderleft-top"><p align="center" ><strong class="fontsizesec">股票 </strong></p></td>
    <td width="135" bgcolor="#CCCCCC" class="boderleft-top"><p align="center"><strong class="fontsizesec">债券 </strong></p></td>
    <td width="147" bgcolor="#CCCCCC" class="boderleft-top"><p align="center" ><strong class="fontsizesec">银行储蓄存款 </strong></p></td>
  </tr>
  <tr>
    <td width="90" height="86" class="boderleft-top" ><p class="tp">反映的经济关系不同</p> </td>
    <td width="188" class="boderleft-top"><p class="tp">信托关系，是一种受益凭证，投资者购买基金份额后成为基金受益人，基金管理人只是替投资者管理资金，并不承担投资损失风险 </p></td>
    <td width="127" class="boderleft-top"><p class="tp">所有权关系，是一种所有权凭证，投资者购买后成为公司股东 </p></td>
    <td width="135" class="boderleft-top"><p class="tp">债权债务关系，是一种债权凭证，投资者购买后成为该公司债权人 </p></td>
    <td width="147" class="boderleft-top"><p class="tp">表现为银行的负债，是一种信用凭证，银行对存款者负有法定的保本付息责任 </p></td>
  </tr>
  <tr>
    <td width="90" height="54" class="boderleft-top"><p class="tp">所筹资金的投向不同 </p></td>
    <td width="188" class="boderleft-top"><p class="tp">间接投资工具，主要投向股票、债券等有价证券 </p></td>
    <td width="127" class="boderleft-top"><p class="tp">直接投资工具，主要投向实业领域 </p></td>
    <td width="135" class="boderleft-top"><p class="tp">直接投资工具，主要投向实业领域 </p></td>
    <td width="147" class="boderleft-top"><p class="tp">间接投资工具，银行负责资金用途和投向 </p></td>
  </tr>
  <tr>
    <td width="90" height="68" class="boderleft-top"><p class="tp">投资收益与风险大小不同 </p></td>
    <td width="188" class="boderleft-top"><p class="tp">投资于众多有价证券，能有效分散风险，风险相对适中，收益相对稳健 </p></td>
    <td width="127" class="boderleft-top"><p class="tp">价格波动性大，高风险、高收益 </p></td>
    <td width="135" class="boderleft-top"><p class="tp">价格波动较股票小，低风险、低收益 </p></td>
    <td width="147" class="boderleft-top"><p class="tp">银行存款利率相对固定，损失本金的可能性很小，投资比较安全 </p></td>
  </tr>
  <tr>
    <td width="90" height="39" class="boderleft-top"><p class="tp">收益来源 </p></td>
    <td width="188" class="boderleft-top"><p class="tp">利息收入、股利收入、资本利得 </p></td>
    <td width="127" class="boderleft-top"><p class="tp">股利收入、资本利得 </p></td>
    <td width="135" class="boderleft-top"><p class="tp">利息收入、资本利得 </p></td>
    <td width="147" class="boderleft-top"><p class="tp">利息收入 </p></td>
  </tr>
  <tr>
    <td width="90" class="boderleft-top"><p class="tp">投资渠道 </p></td>
    <td width="188" class="boderleft-top"><p class="tp">基金管理公司及银行、证券公司等代销机构 </p></td>
    <td width="127" class="boderleft-top"><p class="tp">证券公司 </p></td>
    <td width="135" class="boderleft-top"><p class="tp">债券发行机构、证券公司及银行等代销机构 </p></td>
    <td width="147" class="boderleft-top"><p class="tp">银行、信用社、邮政储蓄银行 </p></td>
  </tr>
</table>
<p class="gep"><strong style="font-weight:bold; font-size:14px;">(三)基金的分类 </strong><br />
  <span class="michange">1、依据运作方式的不同，可分为封闭式基金与开放式基金。 </span><br />
  <span class="michange">封闭式基金是指基金份额在基金合同期限内固定不变，基金份额可以在依法设立的证券交易所交易，但基金份额持有人不得申请赎回的一种基金运作方式。</span> <br />
  <span class="michange">开放式基金是指基金份额不固定，基金份额可以在基金合同约定的时间和场所进行申购和赎回的一种基金运作方式。 </span><br />
  <span class="michange">2、依据投资对象的不同，可分为股票基金、债券基金、货币市场基金、混合基金</span> <br />
  <span class="michange">根据《证券投资基金运作管理办法》对基金类别的分类标准,60%以上的基金资产投资于股票的为股票基金；80%以上的基金资产投资于债券的为债券基金；仅投资于货币市场工具的为货币市场基金；投资于股票、债券和货币市场工具，但股票投资和债券投资的比例不符合股票基金、债券基金规定的为混合基金。这些基金类别按收益和风险由高到低的排列顺序为：股票基金、混合基金、债券基金、货币市场基金，即股票基金的风险和收益最高，货币市场基金的风险和收益最低。</span> <br />
  <span class="michange">3、特殊类型基金 </span><br />
  <span class="michange">(1)系列基金。又被称为伞型基金，是指多个基金共用一个基金合同,子基金独立运作,子基金之间可以进行相互转换的一种基金结构形式。</span> <br />
  <span class="michange">(2)保本基金。是指通过采用投资组合保险技术,保证投资者的投资目标是在锁定下跌风险的同时力争有机会获得潜在的高回报。</span> <br />
  <span class="michange">(3)交易型开放式指数基金(ETF)与上市开放式基金(LOF)。交易型开放式指数基金,通常又被称为交易所交易基金(Exchange  Traded Funds,简称“ETF”),是一种在交易所上市交易的、基金份额可变的一种开放式基金。上市开放式基金<strong>(</strong>Listed Open-ended Funds,简称“LOF”)是一种既可以在场外市场进行基金份额申购赎回，又可以在交易所(场内市场)进行基金份额交易、申购或赎回的开放式基金。 </span><br />
  <span class="michange">(4)QDII基金。是一种以境外证券市场为主要投资区域的证券投资基金，投资者可以用人民币或美元等外汇进行认购和申购，在承担境外市场相应投资风险的同时获取相应的投资收益。QDII基金与普通证券投资基金的最大区别在于投资范围不同。 </span><br />
  <strong class="fontsize">(四)基金评级 </strong><br />
  <span class="michange">基金评级是依据一定标准对基金产品进行分析从而做出优劣评价。投资人在投资基金时，可以适当参考基金评级结果，但切不可把基金评级作为选择基金的唯一依据。此外，基金评级是对基金管理人过往的业绩表现做出评价，并不代表基金未来长期业绩的表现。</span> <br />
  <span class="michange">本公司(行)将根据销售适用性原则，对基金管理人进行审慎调查，并对基金产品进行风险评价。</span> <br />
  <strong class="fontsize">(五)基金费用 </strong><br />
  <span class="michange">基金费用一般包括两大类：一类是在基金销售过程中发生的由基金投资人自己承担的费用，主要包括认购费、申购费、赎回费和基金转换费。这些费用一般直接在投资人认购、申购、赎回或转换时收取。其中申购费可在投资人购买基金时收取，即前端申购费；也可在投资人卖出基金时收取，即后端申购费，其费率一般按持有期限递减。另一类是在基金管理过程中发生的费用，主要包括基金管理费、基金托管费、信息披露费等，这些费用由基金承担。对于不收取申购、赎回费的货币市场基金和部分债券基金，还可按不高于2.5‰的比例从基金资产中计提一定的销售服务费。</span> <br />
  <strong class="fontsize">二、基金份额持有人的权利 </strong><br />
  <span class="michange">根据《证券投资基金法》第70条的规定，基金份额持有人享有下列权利：</span> <br />
  <span class="michange">(一)分享基金财产收益； </span><br />
  <span class="michange">(二)参与分配清算后的剩余基金财产；</span> <br />
  <span class="michange">(三)依法转让或申请赎回其持有的基金份额；</span> <br />
  <span class="michange">(四)按照规定要求召开基金份额持有人大会； </span><br />
  <span class="michange">(五)对基金份额持有人大会审议事项行使表决权；</span> <br />
  <span class="michange">(六)查阅或者复制公开披露的基金信息资料；</span> <br />
  <span class="michange">(七)对基金管理人、基金托管人、基金份额发售机构损害其合法权益的行为依法提起诉讼；</span> <br />
  <span class="michange">(八)基金合同约定的其它权利。 </span><br />
  <strong class="fontsize">三、基金投资风险提示</strong> <br />
  <span class="michange">(一)证券投资基金是一种长期投资工具，其主要功能是分散投资，降低投资单一证券所带来的个别风险。基金不同于银行储蓄和债券等能够提供固定收益预期的金融工具，投资人购买基金，既可能按其持有份额分享基金投资所产生的收益，也可能承担基金投资所带来的损失。</span> <br />
  <span class="michange">(二)基金在投资运作过程中可能面临各种风险，既包括市场风险，也包括基金自身的管理风险、技术风险和合规风险等。巨额赎回风险是开放式基金所特有的一种风险，即当单个交易日基金的净赎回申请超过基金总份额的百分之十时，投资人将可能无法及时赎回持有的全部基金份额。</span> <br />
  <span class="michange">(三)基金投资人应当充分了解基金定期定额投资和零存整取等储蓄方式的区别。定期定额投资是引导投资人进行长期投资、平均投资成本的一种简单易行的投资方式，但并不能规避基金投资所固有的风险，不能保证投资人获得收益，也不是替代储蓄的等效理财方式。 </span><br />
  <span class="michange">(四)基金管理人承诺以诚实守信、勤勉尽责的原则管理和运用基金资产，但不保证旗下基金一定盈利，也不保证最低收益。旗下基金的过往业绩及其净值高低并不预示其未来业绩表现。基金管理人提醒投资人基金投资的“买者自负”原则，在做出投资决策后，基金运营状况与基金净值变化引致的投资风险，由投资人自行负担。 </span><br />
  <span class="michange">(五)本公司(行)将对基金投资人的风险承受能力进行调查和评价，并根据基金投资人的风险承受能力推荐相应的基金品种，但我公司(行)所做的推荐仅供投资人参考，投资人应根据自身风险承受能力选择基金产品并自行承担投资基金的风险。</span> <br />
  <strong class="fontsize">四、服务内容和收费方式 </strong><br />
  <span class="michange">我公司向基金投资人提供以下服务： </span><br />
  <span class="michange">(一)对基金投资人的风险承受能力进行调查和评价。</span> <br />
  <span class="michange">(二)基金销售业务，包括基金(资金)账户开户、基金申(认)购、基金赎回、基金转换、定额定投、修改基金分红方式等。我公司根据每只基金的发行公告及基金管理公司发布的其它相关公告收取相应的申(认)购、赎回费和转换费。 </span><br />
  <span class="michange">(三)基金网上交易服务。 </span><br />
  <span class="michange">(四)基金投资咨询服务。 </span><br />
  <span class="michange">(五)电话咨询、电话自助交易服务。</span> <br />
  <span class="michange">(六)基金知识普及和风险教育。 </span></p>
<p class="gep" ><strong style="font-weight:bold; font-size:14px;">五、基金交易业务流程 </strong><br />
  <span class="michange">基金投资人可按照如下流程在我公司办理基金投资的相关业务： </span><br />
  <span class="michange">1、资金账户开立。投资人持有效身份证明文件到我公司所属营业部办理资金账户开户业务。</span> <br />
  <span class="michange">2、开放式基金账户开立。投资人持有效身份证明文件到我公司所属营业部办理开放式基金账户开户业务。已在我司开立过至少一个基金账户并在与我司签署的《开放式基金账户开立申请协议书》中选择第六条第(1)款即开通乙方代销的所有开放式基金账户的投资者，可以通过我司网上交易系统自助申请开立其他基金公司的账户及修改基金账户资料。 </span><br />
  <span class="michange">3、开放式基金申(认)购、赎回。投资人办理开放式基金申(认)购申请时，需在资金账户中存入足够的现金，填写基金认购申请表进行基金的申(认)购。投资人办理开放式基金赎回申请时，应确保开立的资金账户正常，填写赎回申请进行基金赎回。投资人除了亲自到我公司营业网点办理外，还可通过我公司网上交易、自助终端委托、手机委托、电话银行等方式办理开放式基金申(认)购、赎回业务。 </span><br />
  <span class="michange">4、开放式基金的转换、分红方式设置。投资人可通过我公司营业部柜台、网上交易、自助终端委托等方式办理基金转换、分红方式设置业务。 </span><br />
  <span class="michange">5、开放式基金转托管。投资人可持有效身份证明文件到我公司所属营业部办理开放式基金转托管业务。 </span><br />
  <strong class="michange">六、投诉处理和联系方式 </strong><br />
  <span class="michange">(一)基金投资人可以通过拨打我公司客户服务中心电话或以书信、传真、电子邮件等方式，对营业网点所提供的服务提出建议或投诉。对于工作日受理的投诉，原则上当日回复，不能当日回复的，在3个工作日内回复。对于非工作日受理的投诉，原则上在顺延的第一个工作日回复，不能及时回复的，在3个工作日内回复。 </span><br />
  <span class="michange">公司全国统一投诉电话：95575和020-87555888，地址：广州市天河区大都会广场18层(邮编：510075) </span><br />
  <span class="michange">(二)基金投资人也可通过书信、传真、电子邮件等方式，向中国证监会和中国证券业协会投诉。联系方式如下： </span><br />
  <span class="michange">中国证监会：网址：www.csrc.gov.cn，联系电话：010-66210166，地址：北京市西城区金融大街19号富凯大厦A座 邮编：100033 。 </span><br />
  <span class="michange">中国证券业协会：网址：<a href="http://www.sac.net.cn/">www.sac.net.cn</a>，电子邮箱：huizhang@sac.net.cn，地址：北京金融街富凯大厦B座二层，邮编：100140，传真：010-66575896，电话：010-58352888(中国证券投资者呼叫中心)、<a href="http://www.sipf.com/">www.sipf.com</a>(中国证券投资者保护网)。</span> <br />
  <span class="michange">(三)因基金合同而产生的或与基金合同有关的一切争议，如经协商或调解不能解决的，基金投资人可提交中国国际经济贸易仲裁委员会根据当时有效的仲裁规则进行仲裁。仲裁地点为基金合同约定的地点。仲裁裁决是终局的，对各方当事人均有约束力。 </span><br />
  <span class="michange">投资者在投资基金前应认真阅读《基金合同》、《招募说明书》等基金法律文件，选择与自身风险承受能力相适应的基金。我公司和基金管理人承诺投资人利益优先，以诚实信用、勤勉尽责的态度为投资人提供服务，但不能保证基金一定盈利，也不能保证基金的最低收益。投资人可登录中国证监会网站(www.csrc.gov.cn)或中国证券业协会网站(www.sac.net.cn)查询基金销售机构名录，核实我公司基金销售资格。 </span></p>
<p class="lastmichange">基金销售机构名称：广发证券股份有限公司 <br />
  网址：www.gf.com.cn<br />
  客户服务中心电话：95575<br />
  地址：广州市天河区大都会广场18层 <br />
  邮编：510075</p>
</div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
</form>  
<jsp:include page="${contextPath}/share/bottom.jsp" />
</div>
</body>
</html>