<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/assetManage/assetManage.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${ctx }/infoCenter/goldmoney/css/inner.css" media="all" />
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 金快线</div>
</div>
<div class="wrap_3c">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 <jsp:include page="${contextPath }/assetManage/assetInfo_index_lmenu.jsp?nav=gold" />
     <div class="blank5"></div>
  </div>
  <!--左侧sied结束-->
  <!--中侧sied开始-->
  <div class="w492 fleft mlr4">
  	 <table width="100%" align="center" class="mt10">
      <tr>
        <td class="ywfw_l">&nbsp;</td>
        <td class="ywfw_m bold">产品系列介绍 </td>
        <td class="ywfw_r">&nbsp;</td>
      </tr>
    </table>
    
    <p class="p20 lh25">广发证券金快线系列产品是经中国证监会同意的债券质押式报价回购创新产品。该产品是广发证券以足额债券质押在中国证券登记结算有限公司上海分公司作为担保限定与广发客户之间进行的一种特定债券回购。<br />
1. 证券投资帐户专享广发金快线系列产品； 2. 国内证券行业首个实现T+0资金到帐、T+1可取的回购创新产品；<br />
    </p>    	
   
    <div class="blank10"></div>   
      <div class="tableBar">
							<ul class="tab-menu">
								<li class="hover"><a href="###">产品报价</a><b></b></li>
								<li><a href="###">产品特点</a><b></b></li>
								<li><a href="###">参与指南</a><b></b></li>
								<li><a href="###">注意事项</a><b></b></li>
							</ul>
							<div class="tab-cont">
								<div class="cont hover">
									<table class="cpTable" cellpadding="0" cellspacing="0">
								<thead>
									<tr>
										<th class="cpmc" style="text-align: center;">
											产品名称
										</th>
										<th class="rq" style="text-align: center;">
											公布日期
										</th>
										<th class="kmgm" style="text-align: center;">
											可买规模
										</th>
										<th class="dqn" style="text-align: center;">
											到期年收益率
										</th>
										<th class="tqz" style="text-align: center;">
											提前终止年收益率
										</th>
										<th class="ls" style="text-align: center;">
											历史收益率
										</th>
									</tr>
								</thead>
								<tbody>
									<!-- 需要迭代 -->
									<c:choose>
										<c:when test="${empty goldMoneyList}">
											<td colspan="6">
												暂无记录
											</td>
											
										</c:when>
										<c:otherwise>
											<c:forEach items="${goldMoneyList}" var="goldMoney">
												<tr>
													<td>
														${goldMoney.sotname }
													</td>
													<td>
														<fmt:formatDate
															value="${goldMoney.goldMoneyHistory[0].publishdate }"
															type="date" />
													</td>
													<td>
														${goldMoney.goldMoneyHistory[0].buyscale }
													</td>
													<td>
														${goldMoney.goldMoneyHistory[0].termination }
														
													</td>
													<td>
														${goldMoney.goldMoneyHistory[0].terminationincome }
														
													</td>
													<td>
														<a
															href="/goldMoneyHistory.do?method=showHistory&pid=${goldMoney.pid }"
															class="more">查看</a>
													</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
								</div>
								<div class="cont">
								<table  class="cpTable" cellpadding="0" cellspacing="0">
								<thead>
									<tr>
										<th class="cpmc" colspan="2" style="text-align: center;">
											产品特点
										</th>
										
									</tr>
								</thead>
								<tr>
									<td>
										高度保障：
									</td>
									<td>
										足额债券质押，资金安全有充分保障；
									</td>
								</tr>
								<tr>
									<td>
										稳定回报：
									</td>
									<td>
										预期收益率高于同期银行存款利率，提高闲置资金利用率；
									</td>
								</tr>
								<tr>
									<td>
										随进随出：
									</td>
									<td>
										直接在证券保证金帐户买卖，资金T+0实时到帐、T+1可取；
									</td>
								</tr>
								<tr>
									<td>
										费用全免：
									</td>
									<td>
										所有交易暂不收取任何费用；
									</td>
								</tr>
								<tr>
									<td>
										较低门槛：
									</td>
									<td>
										单笔交易最低限额仅人民币1000元；
									</td>
								</tr>
							</table>
								</div>
								<div class="cont">
								<table class="cpTable" cellpadding="0" cellspacing="0">
								<thead>
									<tr>
										<th class="cpmc" style="text-align: center;">
											参考指南
										</th>
										
									</tr>
								</thead>
								<tr>
									<td style="text-align: left;">
										1.经审核合格的投资者签署相关协议并获开通权限后，可以参与金快线系列任一品种的交易；
									</td>
								</tr>
								<tr>
									<td style="text-align: left;">
										2.登陆广发证券网上交易客户端、网上营业厅或在营业部柜台进行委托交易；
									</td>
								</tr>
								<tr>
									<td style="text-align: left;">
										3.交易时段为每个交易日的上午9：30-11：30，下午13：00-15：10；
									</td>
								</tr>
								<tr>
									<td style="text-align: left;">
										4.每天定量挂牌，卖完即止；
									</td>
								</tr>
								<tr>
									<td style="text-align: left;">
										5.价格约定，时间优先，先到先得；
									</td>
								</tr>
								<tr>
									<td style="text-align: left;">
										6.当天卖出证券所得资金，须在T+1日才可买入金快线产品；
									</td>
								</tr>
								<tr>
									<td style="text-align: left;">
										7.当天卖出金快线产品，资金T+0实时到帐、T+1可取；
									</td>
								</tr>
								<tr>
									<td style="text-align: left;">
										8.当日发生大额购回情况，广发证券有权不再受理客户不再续做和提前终止的申请。大额购回定义详见客户协议文本。
									</td>
								</tr>
							</table>
								</div>
								<div class="cont">
								<table class="cpTable" cellpadding="0" cellspacing="0">
								<thead>
									<tr>
										<th class="cpmc" style="text-align: center;">
											注意事项
										</th>
										
									</tr>
								</thead>
								<tbody>
									<tr>
										<td style="text-align: left;">
											金快线01产品为非固定期限产品，每天运作，如客户未提出不再续做交易申请，本金自动续做；利息每天计提，隔日支付；客户也可在交易时段（交易日的9：30-11：30）随时提出不再续做申请，资金T＋0到帐、T+1可取。 
										</td>
									</tr>

									<tr>
										<td style="text-align: left;">
											金快线03~金快线273为固定期限产品，到期期限分别为3天、7天、14天、28天、42天、63天、91天、119天、154天、182天和273天，遇节假日顺延，本金利息到期一次自动到帐；客户也可在交易时段（每个交易日的11：30前）提出提前终止申请，提前终止只获得活期存款利息，资金T+0到帐、T+1可取。
										</td>
									</tr>
								</tbody>
							</table>
								</div>
							</div> <!-- tab-cont -->
						</div><!-- mbd -->
						
    <table width="100%" align="center" class="mt10">
      <tr>
        <td class="ywfw_l">&nbsp;</td>
        <td class="ywfw_m bold">风险提示：<br /></td>
        <td class="ywfw_r">&nbsp;</td>
      </tr>
    </table>
    <p class="p20 lh25">金快线产品作为一种债券质押式报价回购业务，为低风险投资产品，具有与股票、基金和债券等不同的风险收益特征，本网站上的宣传介绍内容仅供投资者参考，并非我公司金快线产品的法律文件。投资者做出投资决策前，应认真阅读《广发证券股份有限公司债券质押式报价回购风险揭示书》和《广发证券股份有限公司债券质押式报价回购客户协议》，并自行承担投资风险。本网站上的宣传介绍文字与前述法律文件不一致的，以前述法律文件为准。
    </p>
   
   
  </div>  
  
  <script type="text/javascript" src="../js/jquery-1.3.2.min.js"></script>	
<script type="text/javascript" src="../js/common.js"></script>	
<script type="text/javascript">
$("#pcont").pcont({snum:4, isH:false});
$(".tableBar").tabs({meth:"click"});

$("#picShow").picshow();
</script>
  <!--中侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w210 fright">
  <script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>
	<iframe target="_blank" id="leftlogin" name="leftlogin"  marginWidth="0" marginHeight="0" src="${contextPath }/commons/loginTemp.jsp"
						frameBorder="0" noresize width="100%" scrolling="no"></iframe>
	<jsp:include page="${contextPath}/assetManage/mmts.jsp" />
    <div class=" blank5"></div>
    <jsp:include page="lc3h.jsp" /> 
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />

</body>
</html>