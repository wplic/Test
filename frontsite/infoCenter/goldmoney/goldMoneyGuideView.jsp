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
	<title>参与指南</title>
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
			<div class="location">当前位置：<a href="/default.jsp">首页</a> > <a href="/goldMoney.do?method=showMainGoldPage">金快线</a>  > 参与指南  </div>
				<div class="mod mod-cpxljs">
					<div class="mhd">
						<h3><a href="#">参与指南</a></h3>
						<b></b>
					</div> <!-- mhd -->
					
					<div class="mbd">
						<table class="cpTable" cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<td style="text-align:left;">1.经审核合格的投资者签署相关协议并获开通权限后，可以参与金快线系列任一品种的交易；</td>
						</tr>
						<tr>
							<td style="text-align:left;">2.登陆广发证券网上交易客户端、金管家手机证券或在营业部柜台进行委托交易；</td>
						</tr>
						<tr>
							<td style="text-align:left;">3.交易时段为每个交易日的上午9：30-11：30，下午13：00-15：10；</td>
						</tr>
						<tr>
							<td style="text-align:left;">4.每天定量挂牌，卖完即止；</td>
						</tr>
						<tr>
							<td style="text-align:left;">5.价格约定，时间优先，先到先得；</td>
						</tr>
						<tr>
							<td style="text-align:left;">6.当天卖出证券所得资金，须在T+1日才可买入金快线产品；</td>
						</tr>
						<tr>
							<td style="text-align:left;">7.当天卖出金快线产品，资金T+0实时到帐、T+1可取；</td>
						</tr>
						<tr>
							<td style="text-align:left;">8.当日发生大额购回情况，广发证券有权不再受理客户不再续做和提前终止的申请。大额购回定义详见客户协议文本。</td>
						</tr>
					</tbody>
				</table>					
					</div> <!-- mbd -->
					
					<div class="mft"><b></b></div>
				</div> <!-- mod-cpxljs -->
				
			
				
				<div class="mod mod-fxts">
					<div class="mhd">
						<h3><a href="#">参与流程</a></h3>
						<b></b>
					</div>
						
					<div class="mbd">
					<table class="cpTable" cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<td><img height="550px" src="${ctx }/infoCenter/goldmoney/pic/gfGoldGuide.jpg"/></td>
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