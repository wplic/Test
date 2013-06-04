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
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - <a href="${contextPath }/goldMoney.do?method=showMainGold">金快线</a> - ${gm.sotname}历史收益率</div>
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
  	 <table width="100%" align="center" class="mt10" style="margin-bottom:10px;">
      <tr>
        <td class="ywfw_l">&nbsp;</td>
        <td class="ywfw_m bold">${gm.sotname}历史收益率 </td>
        <td class="ywfw_r">&nbsp;</td>
      </tr>
    </table> 
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
							<th class="cpmc" style="text-align: center;">产品名称</th>
							<th class="cpmc" style="text-align: center;">产品号码</th>
							<th class="rq" style="text-align: center;">公布日期</th>
							<th class="kmgm" style="text-align: center;">可买规模</th>
							<th class="dqn" style="text-align: center;">到期年收益率</th>
							<th class="tqz" style="text-align: center;">提前终止年收益率</th>
						</tr>    
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${empty historyList}">
						<tr>
									<td colspan="6">没有记录<br/></td>
								</tr>
							
						</c:when>
						<c:otherwise>
						<!-- 开始循环 -->
							<c:forEach items="${historyList}" var="h">
								<tr>
									<td>${gm.sotname}</td>
									<td>${h.gmpid}</td>
									<td> <fmt:formatDate value="${h.publishdate}" type="date" /></td>
									<td>${h.buyscale}</td>
									<td>${h.termination}</td>
									<td>${h.terminationincome}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
						
					</tbody>
									</table>
									<div class="gmpageBar">
				<form action="/goldMoneyHistory.do?method=showHistory" method="post" id="navigatorForm">
				<input type="hidden" name="pid" value="${pid}"/>  
					总共${totalPages }条，每页20条&nbsp;&nbsp;&nbsp;
				    <a href="/goldMoneyHistory.do?method=showHistory2&pageNumber=1&pid=${pid}">首页</a>   
				    <c:if test="${pageNumber>1}">  
				        <a href="/goldMoneyHistory.do?method=showHistory2&pageNumber=${pageNumber-1}&pid=${pid}">上一页</a>  
				    </c:if>   
				    跳转到第 <select name="pageNumber" onchange="gotoSelectedPage();">  
				    <c:forEach begin="1" end="${totalPages}" step="1" var="pageIndex">  
				        <c:choose>  
				            <c:when test="${pageIndex eq pageNumber}">  
				                <option value="${pageIndex}" selected="selected">${pageIndex}</option>  
				            </c:when>  
				            <c:otherwise>  
				                <option value="${pageIndex}">${pageIndex}</option>  
				            </c:otherwise>  
				        </c:choose>  
				    </c:forEach>  
				    </select>页   
				    <c:if test="${pageNumber<totalPages}">  
				        <a href="/goldMoneyHistory.do?method=showHistory2&pageNumber=${pageNumber+1}&pid=${pid}">下一页</a>  
				    </c:if>   
				    <a href="/goldMoneyHistory.do?method=showHistory2&pageNumber=${totalPages}&pid=${pid}">末页</a>  
				</form> 
				
			</div>
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
										5.价格约定，时间优先，不可撤单；
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
							</div>
						</div>
      <!-- mbd -->
   
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