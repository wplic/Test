<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<style>
.cybnav{ background:#fff9f1; border:1px solid #f3cfa3; padding:19px;}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/investorEdu/investorEdu.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>

<body class="body_bg">
<jsp:include page="${contextPath}/share/top.jsp?nav=tzzyd&nav1=gmxx" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt;<a href="${contextPath }/investorEdu/investorSchool.html"> 投资者园地</a> &gt; <a href="${contextPath }/investorEdu/investorSchool.jsp"> 投资教育学院 </a> &gt; 证券基础知识</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="${contextPath}/investorEdu/investorStockSchool_lmenu.jsp?nav2=gzqhzs" />
        <jsp:include page="${contextPath}/infoCenter/Search.jsp"/>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  <div class="left_tit2">股指期货知识</div> 
  
  
    <div class="blank10"></div>
<table width="700" border="0" cellspacing="3" cellpadding="3" align="center">
  <tr>
    <td>
    	<div class="cybnav red"> 
    	<table border="0"  cellspacing="3" cellpadding="3" width="100%">
    			<tr>
    					<td width="50%"><a href="#basic01"><img  src="${contextPath}/pic/commons/list_02.gif"  border="0"/>1.什么是股指期货        </a></td>
    					<td><a href="#basic02"><img src="${contextPath}/pic/commons/list_02.gif"  border="0"/> 2.股指期货有什么特点     </a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
    				
    			</tr>
    			<tr>
    				<td><a href="#basic03"><img src="${contextPath}/pic/commons/list_02.gif"  border="0"/> 3.股指期货主要有什么功能         </a></td>
    				<td><a href="#basic04"><img src="${contextPath}/pic/commons/list_02.gif"  border="0"/> 4.股指期货投机交易的风险管理有哪些基本要求         </a></td>
    			</tr>
    			<tr>
    				<td><a href="#basic05"><img src="${contextPath}/pic/commons/list_02.gif"  border="0"/> 5.什么是股指期货交易中的开仓、平仓和持仓         </a></td>
    				<td><a href="#basic06"><img src="${contextPath}/pic/commons/list_02.gif"  border="0"/> 6.股指期货投资者的类型有哪些         </a></td>
    			</tr>
    			<tr>
    				<td><a href="#basic07"><img src="${contextPath}/pic/commons/list_02.gif"  border="0"/> 7.沪深300股指期货合约的合约月份有哪些         </a></td>
    				<td><a href="#basic08"><img src="${contextPath}/pic/commons/list_02.gif"  border="0"/> 8.沪深300股指期货合约的交易保证金如何确定         </a></td>
    			</tr>
    			<tr>
    				<td><a href="#basic09"><img src="${contextPath}/pic/commons/list_02.gif"  border="0"/> 9.沪深300股指期货交易指令的类型主要有哪些         </a></td>
    				<td><a href="#basic10"><img src="${contextPath}/pic/commons/list_02.gif"  border="0"/> 10.股指期货的交易流程是怎样的         </a></td>
    			</tr>
    			<tr>
    				<td><a href="#basic11"><img src="${contextPath}/pic/commons/list_02.gif"  border="0"/> 11.什么是股指期货IB         </a></td>
    				<td><a href="#basic12"><img src="${contextPath}/pic/commons/list_02.gif"  border="0"/> 12.股指期货投资者可能遇到的风险有哪些         </a></td>
    			</tr>
    			<tr>
    				<td><a href="#basic13"><img src="${contextPath}/pic/commons/list_02.gif"  border="0"/> 13.如何正确认识保证金交易的杠杆性风险         </a></td>
    				<td><a href="#basic14"><img src="${contextPath}/pic/commons/list_02.gif"  border="0"/> 14.投资者在交易中如何避免下单错误的风险         </a></td>
    			</tr>
    			<tr>
    				<td><a href="#basic15"><img src="${contextPath}/pic/commons/list_02.gif"  border="0"/> 15.什么是爆仓         </a></td>
    				<td><a href="#basic16"><img src="${contextPath}/pic/commons/list_02.gif"  border="0"/> 16.投资者如何有效管理资金以防止被强行平仓的风险         </a></td>
    			</tr>
    			<tr>
    				<td colspan="2"><a href="#basic17"><img src="${contextPath}/pic/commons/list_02.gif"  border="0"/> 17.哪些情况可能会导致被强行平仓         </a></td>
    			</tr>
    			
    		
    	</table>
    	
    	
        </div>
    </td>
  </tr>
 
</table>
<div class="blank10"></div>
<div class="kline">
      <div class="qiebg">
      <p id="basic01"> </p>　　
       <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">（一）什么是股指期货</div>
      <div class="p10 lh22">
     		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所谓股指期货，就是以某种股票指数为标的资产的标准化的期货合约。买卖双方报出的价格是一定时期后的股票指数价格水平。在合约到期后，股指期货通过现金结算差价的方式来进行交割。<br />
	 股指期货交易与股票交易相比，有很多明显的区别：<br />
	（1）股指期货合约有到期日，不能无限期持有。股票买入后正常情况下可以一直持有，但股指期货合约有确定的到期日。因此交易股指期货必须注意合约到期日，以决定是提前平仓了结持仓，还是等待合约到期进行现金交割。<br />
	（2）股指期货采用保证金交易，即在进行股指期货交易时，投资者不需支付合约价值的全额资金，只需支付一定比例的资金作为履约保证；而目前我国股票交易则需要支付股票价值的全部金额。由于股指期货是保证金交易，亏损额甚至可能超过投资本金，这一点和股票交易也不同。<br />
	（3）在交易方向上，股指期货交易可以卖空，既可以先买后卖，也可以先卖后买，因而股指期货交易是双向交易。而部分国家的股票市场没有卖空机制，股票只能先买后卖，不允许卖空，此时股票交易是单向交易。<br />
	（4）在结算方式上，股指期货交易采用当日无负债结算制度，交易所当日要对交易保证金进行结算，如果账户保证金余额不足，必须在规定的时间内补足，否则可能会被强行平仓；而股票交易采取全额交易，并不需要投资者追加资金，并且买入股票后在卖出以前，账面盈亏都是不结算的。<br />

		<br />
      </div>
      <p id="basic02"> </p>　　
      <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">（二）股指期货有什么特点 </div>
      <div class="p10 lh22">
      股指期货具有下列特点：<br />
    （1）跨期性。股指期货是交易双方通过对股票指数变动趋势的预测，约定在未来某一时间按照一定条件进行交易的合约。因此，股指期货的交易是建立在对未来预期的基础上，预期的准确与否直接决定了投资者的盈亏。<br />
    （2）杠杆性。股指期货交易不需要全额支付合约价值的资金，只需要支付一定比例的保证金就可以签订较大价值的合约。例如，假设股指期货交易的保证金为12%，投资者只需支付合约价值10%的资金就可以进行交易。这样，投资者就可以控制8倍于所投资金额的合约资产。当然，在收益可能成倍放大的同时，投资者可能承担的损失也是成倍放大的。<br />
    （3）联动性。股指期货的价格与其标的资产——股票指数的变动联系极为紧密。股票指数是股指期货的标的资产，对股指期货价格的变动具有很大影响。与此同时，股指期货是对未来价格的预期，因而对股票指数也有一定的反映。<br />
    （4）高风险性和风险的多样性。股指期货的杠杆性决定了它具有比股票市场更高的风险性。此外，股指期货还存在着一定的信用风险和结算风险、因市场缺乏交易对手而不能平仓导致的流动性风险等。<br />
      </div>
        <p id="basic03"></p>
       <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">（三）股指期货主要有什么功能
      </div>
      <div class="p10 lh22">
    股指期货的主要功能包括以下三个方面：<br />
	（1） 风险规避功能<br />
	股指期货的风险规避是通过套期保值来实现的，投资者可以通过在股票市场和股指期货市场反向操作达到规避风险的目的。股票市场的风险可分为非系统性风险和系统性风险两个部分，非系统性风险通常可以采取分散化投资的方式将这类风险的影响减低到最小程度，而系统性风险则难以通过分散投资的方法加以规避。股指期货具有做空机制，股指期货的引入，为市场提供了对冲风险的途径，担心股票市场会下跌的投资者可通过卖出股指期货合约对冲股票市场整体下跌的系统性风险，有利于减轻集体性抛售对股票市场造成的影响。<br />
	（2）价格发现功能<br />
	股指期货具有发现价格的功能，通过在公开、高效的期货市场中众多投资者的竞价，有利于形成更能反映股票真实价值的股票价格。期货市场之所以具有发现价格的功能，一方面在于股指期货交易的参与者众多，价格形成当中包含了来自各方的对价格预期的信息。另一方面在于，股指期货具有交易成本低、杠杆倍数高、指令执行速度快等优点，投资者更倾向于在收到市场新信息后，优先在期市调整持仓，也使得股指期货价格对信息的反应更快。<br />
	（3）资产配置功能<br />
	股指期货由于采用保证金交易制度，交易成本很低，因此被机构投资者广泛用来作为资产配置的手段。例如一个以债券为主要投资对象的机构投资者，认为近期股市可能出现大幅上涨，打算抓住这次投资机会，但由于投资于债券以外的品种有严格的比例限制，不可能将大部分资金投资于股市，此时该机构投资者可以利用很少的资金买入股指期货，就可以获得股市上涨的平均收益，提高资金总体的配置效率。<br />
      
          <br />
      
      </div>
        <p id="basic04"></p>
       <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">（四）股指期货投机交易的风险管理有哪些基本要求</div>
      <div class="p10 lh22">
      		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所谓投机，是指投资者根据自己对股指期货市场价格变动趋势的预测，通过“在看涨时买进、看跌时卖出”而获利的交易行为。投机者在股指期货交易中承担了套期保值者转移出去的风险，投机交易增强了市场的流动性。投机者在风险管理中应高度重视以下五点：<br />
			（1）准确预测股指期货价格的变动，把握趋势；<br />
			（2）根据自身的风险承受能力确定止损点并严格执行；<br />
			（3）对获利目标的期望应适可而止，切忌贪得无厌；<br />
			（4）尽可能选择近月合约交易，规避流动性风险；<br />
			（5）由于投机机会的稍纵即逝以及市场行情的千变万化，资金管理非常重要。<br />
			投机交易对知识、经验以及风险管理能力的要求都较高，因此一般投资者应谨慎行事。
      <br />
      </div>
      <p id="basic05"></p>
       <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">（五）什么是股指期货交易中的开仓、平仓和持仓
      </div>
      <div class="p10 lh22">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;开仓也叫建仓，是指投资者新买入或新卖出一定数量的股指期货合约。如果投资者将这份股指期货合约保留到最后交易日，他就必须通过现金交割来了结这笔期货交易。<br />
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;平仓，是指期货投资者买入或者卖出与其所持股指期货合约的品种、数量及交割月份相同但交易方向相反的股指期货合约，了结股指期货交易的行为。<br />
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;股指期货投资者在开仓之后尚没有平仓的合约，叫做未平仓合约，也叫持仓。开仓之后股指期货投资者有两种方式了结股指期货合约：或者择机平仓，或者持有至最后交易日并进行现金交割。
          <br />
      </div>
          <p id="basic06"></p>
       <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">（六）股指期货投资者的类型有哪些
      </div>
      <div class="p10 lh22">
    根据进入股指期货市场的目的不同，股指期货市场投资者可以分为三大类：套期保值者、套利者和投机者。<br />
   （1）套期保值者，是指通过在股指期货市场上买卖与现货价值相等但交易方向相反的期货合约，来规避现货价格波动风险的机构或个人。<br />
   （2）套利者，是指利用“股指期货市场和股票现货市场（期现套利）、不同的股指期货市场（跨市套利）、不同股指期货合约（跨商品套利）或者同种商品不同交割月份（跨期套利）”之间出现的价格不合理关系，通过同时买进卖出以赚取价差收益的机构或个人。<br />
   （3）投机者，是指那些专门在股指期货市场上买卖股指期货合约，即看涨时买进、看跌时卖出以获利的机构或个人。
          <br />
      </div>
          <p id="basic07"></p>
       <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">（七）沪深300股指期货合约的合约月份有哪些
      </div>
      <div class="p10 lh22">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;股指期货的合约月份是指股指期货合约到期交割结算的月份。在《沪深300股指期货合约》中，合约月份为当月、下月及随后的两个季月，共四个月份。比如在2006年12月1日，中金所可供交易的沪深300股指期货合约将有IF0612、IF0701、IF0703和IF0706四个月份的合约。“06”表示2006年，“12”表示12月份，“IF0612”表示2006年12月份到期交割结算的合约。IF0612合约到期交割结算后，IF0701就成为最近月份合约，同时IF0702合约挂牌。IF0701合约到期交割结算后，IF0702、IF0703就成为最近两个月份合约，同时IF0709合约挂牌。 <br />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;采用近月合约与季月合约相结合的方式，在半年左右的时间内共有四个合约同时交易，具有长短兼济、相对集中的效果。

          <br />
      </div>
      
         <p id="basic08"></p>
       <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">（八）沪深300股指期货合约的交易保证金如何确定
      </div>
      <div class="p10 lh22">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在《沪深300股指期货合约》中，沪深300股指期货合约最低交易保证金定为合约价值的12%。中金所有权根据市场风险情况进行调整。<br />
	   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;需要提醒的是，由于普通客户无法直接在中金所开设保证金账户，只有在符合规定的的期货公司开立保证金账户来进行交易和结算，相应的期货公司为了更严格地控制客户的风险，一般会在中金所规定的保证金比例基础上再上浮2—3个百分点，具体比例依客户开户的期货公司而定。

          <br />
      </div>
        <p id="basic09"></p>
       <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">（九）沪深300股指期货交易指令的类型主要有哪些
      </div>
      <div class="p10 lh22">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在《中国金融期货交易所交易细则》中，股指期货交易指令分为市价指令、限价指令及交易所规定的其他指令。<br />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;市价指令是指不限定价格的、按当时市场上可执行的最优报价成交的指令。市价指令的未成交部分自动撤销。<br />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;限价指令是指按限定价格或更优价格成交的指令。限价指令在买进时，必须在其限价或限价以下的价格成交；在卖出时，必须在其限价或限价以上的价格成交。限价指令当日有效，未成交的部分可以撤销。<br />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;市价指令只能和限价指令撮合成交，成交价格等于即时最优限价指令的限定价格。交易指令的报价只能在合约价格限制范围内，超过价格限制范围的报价视为无效。<br />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;客户在集合竞价阶段只能下达限价指令，不能下达市价指令；在连续交易阶段既可以下达限价指令，也可以下达市价指令。<br />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;股指期货交易指令的报价按照指数点进行，其价格必须是中金所规定的最小变动价位的整数倍。以沪深300指数为例，股票市场沪深300指数的报价可以精确到小数点后两位，比如1729.22点；但如果沪深300股指期货合约的最小变动价位定为0.2点，则其报价只允许精确到小数点后一位，而且必须是0.2的整数倍，比如1742.6点。


          <br />
      </div>
      <p id="basic10"></p>
       <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">（十）股指期货的交易流程是怎样的
      </div>
      <div class="p10 lh22">
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一个完整的股指期货交易流程包括开户、下单、结算、平仓或交割四个环节。具体为：<br />
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（1）开户：客户参与股指期货交易，需要与符合规定的期货公司签署风险揭示书和期货经纪合同，并开立期货账户。<br />
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（2）下单：指客户在每笔交易前向期货公司下达交易指令，说明拟买卖合约的种类、方向、数量、价格等的行为。<br />
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（3）结算：结算是指根据交易结果和中金所有关规定对会员或客户的交易保证金、盈亏、手续费及其它有关款项进行计算、划拨的业务活动。<br />
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（4）平仓或交割：平仓是指客户通过买入或者卖出与其所持有的股指期货合约的品种、数量相同但交易方向相反的合约，以此了结期货交易的行为。股指期货合约采用现金交割方式。股指期货合约最后交易日收市后，交易所以交割结算价为基准，划付持仓双方的盈亏，了结所有未平仓合约。
          <br />
      </div>
        <p id="basic11"></p>
       <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">（十一）什么是股指期货IB
      </div>
      <div class="p10 lh22">
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IB是英文Introducing Broker的缩写，指股指期货介绍经纪商。<br />
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作为股指期货介绍经纪商的证券公司，可以将投资者介绍给期货公司并为投资者提供期货知识的培训、向投资者出示风险说明书，协助期货公司与投资者签订期货经纪合同，为投资者开展期货交易提供设施方面的便利，协助期货公司向投资者发送追加保证金通知书等，但IB不得接受投资者的保证金，不得变相从事期货经纪业务，投资者仍然需要通过期货公司来进行股指期货的投资。<br />
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;目前，我国能够从事IB业务的规定是《证券公司为期货公司提供中间介绍业务试行办法》。通过券商的中间介绍业务，投资者将可以更加方便地参与股指期货交易并享受周到的服务，IB也可以充分发挥资源优势并取得稳定收入，期货公司则可以实现低成本扩张。

          <br />
      </div>
        <p id="basic12"></p>
       <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">（十二）股指期货投资者可能遇到的风险有哪些
      </div>
      <div class="p10 lh22">
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;股指期货风险类型较为复杂，常见的主要有以下几类： <br />
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（1）法律风险。股指期货投资者如果选择了不具有合法期货经纪业务资格的期货公司从事股指期货交易，投资者权益将无法得到法律保护；或者所选择的期货公司在交易过程中存在违法违规经营行为，将可能给投资者带来损失。<br />
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（2）市场风险。由于保证金交易具有杠杆性，当出现不利行情时，股价指数微小的变动就可能会使投资者权益遭受较大损失；价格波动剧烈的时候甚至会因为资金不足而被强行平仓，遭受重大损失，因此投资者进行股指期货交易会面临较大的价格风险。<br />
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（3）操作风险。和股票交易一样，行情系统、下单系统等可能出现技术故障，导致无法获得行情或无法下单；或者由于投资者在操作的过程中出现操作失误，都可能会造成损失。<br />
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（4）现金流风险。现金流风险实际上指的是当投资者无法及时筹措资金满足建立和维持股指期货持仓的保证金要求的风险。股指期货实行当日无负债结算制度，对资金管理要求非常高。如果投资者满仓操作，就可能会经常面临追加保证金的问题，如果没有在规定的时间内补足保证金，按规定将被强制平仓，可能给投资者带来重大损失。<br />
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（5）连带风险。为投资者进行结算的结算会员或同一结算会员下的其他投资者出现保证金不足、又未能在规定的时间内补足，或因其他原因导致中金所对该结算会员下的经纪账户强行平仓时，投资者的资产可能因被连带强行平仓而遭受损失。

          <br />
      </div>
        <p id="basic13"></p>
       <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">（十三）如何正确认识保证金交易的杠杆性风险
      </div>
      <div class="p10 lh22">
	　&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;股指期货交易采用保证金交易方式，这是与股票交易的一个重大差别，股指期货交易也因此比股票交易具有更大的风险性。<br />
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;假定保证金比率为10％，则我们投入5万元就可以进行一手合约面值为50万元的交易，如果期货价格上涨10％，对于多头来说，可以盈利5万元，收益率为100％；但对于空头来说，收益率为-100％，即投资者的保证金被全部亏掉，这就是保证金交易的杠杆性风险。当价格出现较大的不利变化时，如果不及时止损，投资者权益甚至可能出现负值。所以，从事股指期货交易要更加注意风险管理。
		 <br />
      </div>
        <p id="basic14"></p>
       <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">（十四）投资者在交易中如何避免下单错误的风险
      </div>
      <div class="p10 lh22">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;首先，要注意防止下单方向的错误。下单方向，也就是买卖方向。由于股指期货具有做空机制，开仓的时候所以无论下买开仓单还是下卖开仓单都可以成交。例如投资者预期价格要上涨，但开仓时错把买开仓单下成了卖开仓单，系统也会接受并成交，从而给投资者造成操作风险。所以对于投资者、尤其是没有从事过期货交易的投资者而言，首先要注意下单的方向。<br />
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;其次，要防范下单数量的错误。比如在《沪深300股指期货合约》中规定最小下单数量是1手，1手＝1张合约；而在现行的股票现货交易中，虽然成交的单位在统计时也有用“手”的概念的，但在实际下单时采用“股”的概念（“1手”等于100股）。因此，对股票投资者而言，在从事股指期货交易时要十分小心。<br />
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;最后，还要注明是开仓还是平仓。建立多头持仓应下买入开仓指令，平掉多头持仓应下卖出平仓指令；建立空头持仓应下卖出开仓指令，平掉空头持仓应下买入平仓指令。如果把平仓单下成了开仓单，则投资者还要再缴纳开仓合约的保证金，从而会增加资金管理的风险。
		 <br />
      </div>
        <p id="basic15"></p>
       <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">（十五）什么是爆仓
      </div>
      <div class="p10 lh22">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所谓爆仓，是指投资者保证金账户中的客户权益为负值。在市场行情发生较大变化时，如果投资者保证金账户中资金的绝大部分都被交易保证金所占用，而且交易方向又与市场走势相反时，由于保证金交易的杠杆效应，就很容易出现爆仓。<br />
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;爆仓的发生实际上是投资者资金链断裂的结果。为避免这种情况的发生，需要特别控制好头寸，合理地进行资金管理，切忌像股票交易中可能出现的满仓操作；并且与股票交易不同，投资者必须对股指期货行情进行及时跟踪。<br />
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如果爆仓导致了亏空且由投资者的原因引起，投资者需要将亏空补足，否则会面临法律追索。
		 <br />
      </div>
      
         <p id="basic16"></p>
       <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">（十六）投资者如何有效管理资金以防止被强行平仓的风险
      </div>
      <div class="p10 lh22">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;股指期货是保证金交易，价格的微幅变动都会引起投资者的保证金余额的变化。如果资金管理不善，可能会出现投资者账户中的资金不能满足追加保证金要求的情况，此时投资者持有的持仓就可能被强行平仓。有时即使大方向看对了，也可能因资金管理不善、在获取盈利之前被强行平仓而蒙受较大的损失。<br />
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;成熟市场的经验表明，在进行股指期货交易时切忌满仓操作，投入交易的资金一般不要过半，最好控制在三分之一以内，以便为行情波动时可能追加保证金留有余地。

		 <br />
      </div>
        <p id="basic17"></p>
       <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">（十七）哪些情况可能会导致被强行平仓
      </div>
      <div class="p10 lh22">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;强行平仓是指交易所按有关规定对会员、客户持仓实行平仓的一种强制措施。强行平仓制度的实行，能及时制止风险的扩大和蔓延。<br />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;《中国金融期货交易所风险控制管理办法五种情况下会出现》规定，会员、客户出现下列情形之一的，交易所对其持仓实行强行平仓：<br />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（1）结算会员结算准备金余额小于零，且未能在第一节结束前补足；<br />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（2）客户、从事自营业务的交易会员持仓超出持仓限额标准，且未能在第一节结束前平仓；<br />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（3）因违规、违约受到交易所强行平仓处罚；<br />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（4）根据交易所的紧急措施应予强行平仓；<br />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（5）交易所规定应当予以平仓的其他情形。<br />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;需要强行平仓的头寸先由会员自己执行，时限为开市后第一节交易时间。强行平仓的价格通过市场交易形成。若规定时限内会员未执行完毕，则由中金所强制执行。

		 <br />
      </div>
      
      
      </div>
    </div>

  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="${contextPath}/share/bottom.jsp" />
</body>
</html>
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 
