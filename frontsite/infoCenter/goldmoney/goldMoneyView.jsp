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
	<base href="<%=basePath%>">
<meta name="keyword" content="金快线,广发证券金快线,报价回购,债券质押" />
<meta name="discription" content="金快线,广发证券金快线,报价回购,债券质押" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>金快线</title>
	<link rel="stylesheet" type="text/css" href="${ctx }/infoCenter/goldmoney/css/inner.css" media="all" />
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
					<div class="location">当前位置：<a href="/default.jsp">首页</a> > <a href="/goldMoney.do?method=showMainGoldPage">金快线</a>  > ${goldMoney.sotname } </div>
				<c:choose>
			<c:when test="${empty goldMoney}">
			
			</c:when>
			<c:otherwise>
				<div class="mod mod-cpxljs">
					<div class="mhd">
						<h3><a href="#">产品报价</a></h3>
						<b></b>
					</div> <!-- mhd -->
					
					<div class="tableBar">
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
								<tr>
									<td>${goldMoney.sotname }</td>
									<td><fmt:formatDate value="${goldMoney.goldMoneyHistory[0].publishdate }" type="date" /></td>
									<td>${goldMoney.goldMoneyHistory[0].buyscale }</td>
									<td>${goldMoney.goldMoneyHistory[0].termination }</td>
									<td>${goldMoney.goldMoneyHistory[0].terminationincome }</td>
									<td><a href="/goldMoneyHistory.do?method=showHistory&pid=${goldMoney.pid}" class="more">查看</a></td>
								</tr>               
							</tbody>
						</table>
											
					</div> <!-- mbd -->
					
					<div class="mft"><b></b></div>
				</div> <!-- mod-cpxljs -->
				</c:otherwise>
		</c:choose>
			
				
				<div class="mod mod-fxts">
				<c:choose>
				<c:when test="${empty goldMoney}">
					<div class="mhd">
						<h3><a href="#">金快线介绍</a></h3>
						<b></b>
					</div>
						
					<div class="mbd">
					<img width="700px" src="${ctx }/infoCenter/goldmoney/pic/1704.jpg"/>
						<p style="line-height:26px;">&nbsp;&nbsp;&nbsp;&nbsp;金快线产品作为一种债券质押式报价回购业务，为低风险投资产品，具有与股票、基金和债券等不同的风险收益特征，本网站上的宣传介绍内容仅供投资者参考，并非我公司金快线产品的法律文件。投资者做出投资决策前，应认真阅读《广发证券股份有限公司债券质押式报价回购风险揭示书》和《广发证券股份有限公司债券质押式报价回购客户协议》，并自行承担投资风险。本网站上的宣传介绍文字与前述法律文件不一致的，以前述法律文件为准。
						</p>
					</div>
					</c:when>
				<c:otherwise>
				<div class="mhd">
						<h3><a href="#">${goldMoney.sotname}</a></h3>
						<b></b>
					</div>
						
					<div class="cont">
					<table cellpadding="0" cellspacing="0" class=cpTable>
							  <tr>
								<th scope="row">名称</th>
								<td>${goldMoney.fullname}</td>
							  </tr>
							  <tr>
								<th scope="row">交易代码</th>
								<td>${goldMoney.pid}（上海证券交易所）</td>
							  </tr>
							  <tr>
								<th scope="row">币种</th>
								<td>${goldMoney.moneytype}</td>
							  </tr>
							  <tr>
								<th scope="row">本金及收益</th>
								<td>${goldMoney.profit}</td>
							  </tr>
							  <tr>
								<th scope="row">产品限期</th>
								<td>${goldMoney.deadline}</td>
							  </tr>
							  
							  <tr>
								<th scope="row">交易起点</th>
								<td>${goldMoney.tradepoint}</td>
							  </tr>
							  <tr>
								<th scope="row">挂牌日</th>
								<td><fmt:formatDate value="${goldMoney.listingDate}" type="date"/></td>
							  </tr>
							  <tr>
								<th scope="row">计划规模</th>
								<td>${goldMoney.programsize}</td>
							  </tr>
							  <tr>
								<th scope="row">计息基础</th>
								<td>${goldMoney.interestinfo}</td>
							  </tr>
							  <tr>
								<th scope="row">付息日及收益支付</th>
								<td>${goldMoney.payinterest}</td>
							  </tr>
							  <tr>
								<th scope="row">购买方式</th>
								<td>${goldMoney.purchasemethod}</td>
							  </tr>
							  <tr>
								<th scope="row">节假日</th>
								<td>${goleMoney.holidayinfo}</td>
							  </tr>
							  <tr>
								<th scope="row">交易日</th>
								<td>${goldMoney.tradingday}</td>
							  </tr>
							  <tr>
								<th scope="row">交易时段</th>
								<td>${goldMoney.transactiontime}</td>
							  </tr>
							  <tr>
								<th scope="row">交易场所</th>
								<td>${goldMoney.transactionplace}</td>
							  </tr>
							  <tr>
								<th scope="row">清算交收机构</th>
								<td>${goldMoney.liquidation}</td>
							  </tr>
							  <tr>
								<th scope="row">质押债券托管机构</th>
								<td>${goldMoney.thepledge}</td>
							  </tr>
							</table>
					</div>
					</c:otherwise>
			</c:choose>
				 <!-- mbd -->
						
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