<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>问题解答</title>
	<link rel="stylesheet" type="text/css" href="${ctx }/infoCenter/goldmoney/css/inner.css" media="all" />
	<link href="${ctx}/css/basic.css" rel="stylesheet" type="text/css" />

<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/setTab.js"></script>
<link href="${ctx }/infoCenter/goldmoney/css/basic.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx }/infoCenter/goldmoney/js/topmenu.js"></script>
	
</head>
<body>
<jsp:include page="${contextPath}/share/top.jsp" />
	<div class="wrap">
	<div class="wjdc_box">
			<p class="wjdc">
				<a href="${ctx }/investorEdu/investorSurvey.html"><img
						src="${ctx }/pic/index/wzdc.jpg" />
				</a>
			</p>
		</div>
		<div class="pbd clearfix">
			<div class="pt-main-column">
				<div class="gmlocation">当前位置：<a href="/default.jsp">首页</a> > <a href="/goldMoney.do?method=showMainGoldPage">金快线</a> >  常见问题解答    </div>
				<div class="mod mod-cpxljs">
					<div class="mhd">
						<h3><a href="#">简要介绍</a></h3>
						<b></b>
					</div> <!-- mhd -->
					
					<div class="mbd">
					<table class="cpTable" cellpadding="0" cellspacing="0">
								<tr>
									<td valign="top" bgcolor="#FFFFFF"
										style="padding: 3px 0 3px 5px; text-align: left;">
										金快线是广发证券所运作的债券质押式报价回购业务的简称，指广发证券提供债券作为质物，并以根据标准券折算率计算出的标准券总额为产品额度（产品额度同时不超过上交所批准的总额度），向在广发证券指定交易的客户提供金快线系列产品，客户购买产品并获得相应稳定收益，产品具有债券质押式回购的特征。
										<br />
										1. 标准化：在交易所挂牌交易；
										<br />
										2. 高流动性：闲置资金可随进随出，当日买入当日起息，到期或提前购回,资金当日可用；
										<br />
										3. 较低门槛：单笔最低限额1000元；
										<br />
										4. 安全稳定：客户享有质押券质权，安全保障，收益稳定；
										<br />
										5. 无交易费：所有交易暂不收取任何费用。
									</td>
								</tr>
							</table>
									
					</div> <!-- mbd -->
					
					<div class="mft"><b></b></div>
				</div> <!-- mod-cpxljs -->
				
			
				
				<div class="mod mod-fxts">
					<div class="mhd">
						<h3><a href="#">常见问题及解答</a></h3>
						<b></b>
					</div>
						
					<div class="mbd">
					<table class="cpTable" cellpadding="0" cellspacing="0">					
					<tbody>
						<tr>
							<td style="text-align: left"><B>问：什么是金快线债券质押式报价回购（简称“金快线”）？</B></td>
						</tr>
						<tr>
							<td style="text-align: left">答：金快线是广发证券所运作的债券质押式报价回购业务的简称，指广发证券提供债券作为质物，并以根据标准券折算率计算出的标准券总额为融资额度，向在广发证券指定交易的客户融入资金，客户于回购到期时收回融出资金并获得相应收益的债券质押式回购。</td>
						</tr>
						
						<tr>
							<td style="text-align: left"><B>问：广发证券开展金快线是否通过了证监会和上海证券交易所的批准？</B></td>
						</tr>
						<tr>
							<td style="text-align: left">答：证监会于2011年11月17日发布了《关于对广发证券股份有限公司从事债券质押式报价回购业务试点方案的无异议函》（机构部部函[2011]574号），同意广发证券开展报价回购业务试点；上海证券交易所于2011年11月21日发布了《关于确认广发证券股份有限公司债券质押式报价回购交易权限的通知》（上证会字[2011]40号），确认了广发证券报价回购交易权限。</td>
						</tr>
						
						<tr>
							<td style="text-align: left"><B>问：金快线有什么特色？</B></td>
						</tr>
						<tr>
							<td style="text-align: left">答：（1）金快线为广发证券客户提供了全新的理财模式，客户可以通过交易所轻松实现低风险理财，方便灵活，稳定回报；<br />  （2）金快线提供了期限较为丰富的系列产品，其中1天期产品可以自动续作，其余期限产品可以提前购回，到期或提前购回资金T+0可用、T+1可取；<br />  （3）广发证券提供了足额债券做为质物，客户资金安全有充分保障；<br />  （4）客户单笔交易起点门槛低（1000元），无任何交易费用。</td>
						</tr>
						<tr>
							<td style="text-align: left"><B>问：金快线包括哪些系列产品？</B></td>
						</tr>
						<tr>
							<td style="text-align: left">答：金快线共包括12个期限的系列产品，分别为1天期、3天期、7天期、14天期、28天期、42天期、63天期、91天期、119天期、154天期、182天期和273天期，交易代码分别为205001、205003、205007、205008、205010、205042、205063、205030、205119、205154、205182、205273。</td>
						</tr>
						
						<tr>
							<td style="text-align: left"><B>问：金快线是挂牌上市的产品吗？</B></td>
						</tr>
						<tr>
							<td style="text-align: left">答：金快线产品在上交所挂牌上市，由中国证券结算公司提供结算，但只有广发证券客户可以参与。</td>
						</tr>
						
						<tr>
							<td style="text-align: left"><B>问：客户如何开立金快线业务的权限？</B></td>
						</tr>
						<tr>
							<td style="text-align: left">答：有业务需求的客户向开户营业部提出书面申请，营业部对客户进行业务培训和资质审查，审查通过后在营业部签署相关协议和风险揭示书，经报备后开通客户交易权限。一般签署协议完成后次一交易日即可参与交易。</td>
						</tr>
						
						<tr>
							<td style="text-align: left"><B>问：客户如何购买金快线？</B></td>
						</tr>
						<tr>
							<td style="text-align: left">答：客户可通过广发证券网上交易客户端、金管家手机证券或营业部柜台等购买金快线。</td>
						</tr>
						
						<tr>
							<td style="text-align: left"><B>问：1天期产品如何自动续作？</B></td>
						</tr>
						<tr>
							<td style="text-align: left">答：客户可选择买入1天期品种到期后是否将到期本金按到期当日公告的收益率继续买入1天期品种，客户连续续作的有效期为一年，即客户连续续作时间达到一年，系统将自动终止续作，需要继续续作的客户，需重新下初始委托申请买入。选择续作买入的客户，若到期日不再续作，客户可以提前向交易系统提交1天期不再续作申请，系统接受申请的时间截止到不再续作当日的11：30。对于一笔回购交易，客户不能提出部分不再续作。自动续作期间利息每天计提、隔日支付。除1天期产品外，其余期限产品到期后不能自动续作。</td>
						</tr>
						
						<tr>
							<td style="text-align: left"><B>问：7天期、14天期、28天期和91天期产品如何提前购回？</B></td>
						</tr>
						<tr>
							<td style="text-align: left">答：1天期品种不可提前购回。除1天期品种外，其余各期限产品均可在产品到期前提前购回，提前购回委托申请的截止时间为提前购回当日11:30。发生提前购回的，持有期收益按该笔回购成交日广发证券公布的提前购回年收益率进行计算。对于一笔回购交易，客户不能提出部分提前购回。</td>
						</tr>
						
						<tr>
							<td style="text-align: left"><B>问：卖出报价回购产品资金何时到账？</B></td>
						</tr>
						<tr>
							<td style="text-align: left">答：当天卖出报价回购产品，资金T＋0实时到帐可用，T+1日可取。</td>
						</tr>
						
						<tr>
							<td style="text-align: left"><B>问：为什么当日卖出证券资金和新质押式回购到期所得资金，T+1日才可买入本产品？</B></td>
						</tr>
						<tr>
							<td style="text-align: left">答：由于金快线为非担保交收，且交收时间为当日16:00，而卖出证券和新质押式回购到期均为担保交收，且交收时间晚于金快线业务，如果允许当日卖出证券资金和新质押式回购到期所得资金当日买入本产品，则在当日金快线结算时，会出现资金不足而结算部成功的情况。</td>
						</tr>
						
						<tr>
							<td style="text-align: left"><B>问：金快线产品交易时间与股票一样吗？</B></td>
						</tr>
						<tr>
							<td style="text-align: left">答：金快线的交易时间为每个交易日的9:30-11:30，13:00-15:10，在股票市场收市后延长了10分钟。</td>
						</tr>
						
						<tr>
							<td style="text-align: left"><B>问：金快线产品的天数是按照自然日还是交易日来计算?</B></td>
						</tr>
						<tr>
							<td style="text-align: left">答：产品期限按日历时间计算，算头不算尾，若到期日为非交易日，顺延至下一个交易日。</td>
						</tr>
						<tr>
							<td style="text-align: left"><B>问：申报数量如何确定？</B></td>
						</tr>
						<tr>
							<td style="text-align: left">答：最低申报数量为1手，超出部分以1手的整倍数增加（1手即1000元）。</td>
						</tr>
						
						<tr>
							<td style="text-align: left"><B>问：金快线的成交原则是什么？</B></td>
						</tr>
						<tr>
							<td style="text-align: left">答：价格约定，时间优先。</td>
						</tr>
						
						<tr>
							<td style="text-align: left"><B>问：金快线的价格如何确定？</B></td>
						</tr>
						<tr>
							<td style="text-align: left">答：金快线的申报价格为每百元资金到期年收益、提前购回价格为每百元资金提前购回年收益。到期年收益率和提前购回年收益率在每个交易日开市前由广发证券公布。</td>
						</tr>
						
						<tr>
							<td style="text-align: left"><B>问：广发证券通过什么渠道公布金快线价格？</B></td>
						</tr>
						<tr>
							<td style="text-align: left">答：每个交易日开市前通过广发证券网上交易客户端、金管家手机证券、广发证券官方网站金快线专栏进行公布</td>
						</tr>
						
						<tr>
							<td style="text-align: left"><B>问：金快线各期限产品可交易总量有限制吗？</B></td>
						</tr>
						<tr>
							<td style="text-align: left">答：金快线产品受总额度控制，每个交易日开市前广发证券通过官方网站金快线专栏公布当日各品种最大可交易量数据。</td>
						</tr>
						
						<tr>
							<td style="text-align: left"><B>问：如金快线某期限产品额度已用完，客户还可以委托吗？</B></td>
						</tr>
						<tr>
							<td style="text-align: left">答：如额度已用完，系统提示无额度，客户不能提交委托。</td>
						</tr>
						
						<tr>
							<td style="text-align: left"><B>问：为什么对于某个期限的金快线产品，先下单的客户由于额度已用完不能委托，后下单客户却可以？</B></td>
						</tr>
						<tr>
							<td style="text-align: left">答：在当天新增额度用完后，如有已购买产品客户发出“提前终止”指令，系统会相应增加金快线可用额度，此时如有客户下单，系统会有额度成交。这样就有可能出现先下单客户没有成交，后下单客户可能成交的现象。</td>
						</tr>
						
						<tr>
							<td style="text-align: left"><B>问：是否会出现赎回申请不被受理的情况？</B></td>
						</tr>
						<tr>
							<td style="text-align: left">答：1天期产品，在任一交易日内，若当日累计不再续做委托总金额超过上一交易日该品种未到期余额的30%时，认定发生大额赎回，此时广发证券将有权拒绝不再续作委托申请。<br />（2）其余期限产品：在任一交易日内，若任一回购品种的当日累计提前购回委托总金额超过上一交易日该品种未到期余额的30%，或单个投资者当日提前购回委托累计金额超过人民币3000万元且没有在前一交易日15:00之前与广发证券进行预约的，即认为发生大额赎回，此时广发证券有权拒绝提前购回委托申请。</td>
						</tr>
						
						<tr>
							<td style="text-align: left"><B>问：客户大额赎回如何进行提前预约？</B></td>
						</tr>
						<tr>
							<td style="text-align: left">答：客户如有大额赎回，可以通过交易系统提交赎回预约，也可以通过书面文件向营业部客户经理提出预约。</td>
						</tr>
						
						<tr>
							<td style="text-align: left"><B>问：广发证券对金快线融入资金如何投资？</B></td>
						</tr>
						<tr>
							<td style="text-align: left">答：金快线融入资金由具有丰富固定收益类投资经验的固定收益部运作，投资坚持稳健的策略，在监管部门允许的投资范围内，投资于信用级别较高、流动性较好的固定收益类金融工具。</td>
						</tr>
						
					</tbody>
				</table>
					</div> <!-- mbd -->
						
					<div class="mft"><b></b></div>
				</div>	<!-- mod -->
			</div><!-- pt-main -->
		    <!--左侧side开始-->
			<div class="pt-second-column">
				 <jsp:include page="${contextPath }/infoCenter/goldmoney/siteMenu.jsp" />
			</div> 
            <!--左侧side结束-->
		</div> <!-- 底部图标 -->
		<div class="clear"></div>
<div class="blank10"></div>
<table align="center" style="margin:0 auto;">
	<tbody>
	<tr>
		<td><a href="###"><img src="${ctx }/infoCenter/goldmoney/pic/botban1.jpg"></a></td>
		<td><a href="###"><img src="${ctx }/infoCenter/goldmoney/pic/botban2.jpg"></a></td>
		<td><a href="###"><img src="${ctx }/infoCenter/goldmoney/pic/botban3.jpg"></a></td>
		<td><a href="###"><img src="${ctx }/infoCenter/goldmoney/pic/botban4.jpg"></a></td>
		<td><a href="###"><img src="${ctx }/infoCenter/goldmoney/pic/botban5.jpg"></a></td>
	</tr>
	</tbody>
</table>
<div class="blank10"></div>
			<!--底部-->
			<jsp:include page="${ctx }/share/bottom.jsp" />
			<!--底部end-->
			
	</div>
	
	
	
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>	
<script type="text/javascript" src="js/common.js"></script>	
<script type="text/javascript">
$("#pcont").pcont({snum:4, isH:false});
$(".tableBar").tabs({meth:"click"});

$("#picShow").picshow();
</script>	
</body>
</html>