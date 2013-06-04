
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@include file="/commons/taglibs.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>广发证券</title>
		<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
	</head>

	<script type="text/javascript">
	function setParentFrame(){
		if(parent.document.getElementById("cwbbFrame") != null){
			parent.document.getElementById("cwbbFrame").height=document.body.scrollHeight; 
		}
		
		if(parent.parent.document.getElementById("f10Frame") != null){
			parent.parent.document.getElementById("f10Frame").height=parent.document.body.scrollHeight; 
		}
	}
</script>
	<body onload="javascript:setParentFrame();">

		<table width="792" bgcolor="#DCDCDC" border="0" cellspacing="1"
			cellpadding="0">
			<tr bgcolor="#F2F2F2">
				<td width="160" valign="top">
					<table width="100%" bgcolor="#DCDCDC" border="0" cellspacing="1"
						cellpadding="0">
						<tr bgcolor="#FFFFFF">
							<td height="24">
								<b>时间</b>
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								其中：应付关联公司款
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								国内票证结算
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								国际票证结算
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								应付股利
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								其他流动负债
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								其他应付款
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								预提费用
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								预计负债
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								递延收益
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								流动负债合计
							</td>
						</tr>
						<tr bgcolor="#FFFFE8">
							<td height="24">
								<b>长期负债</b>
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								长期借款
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								应付债券
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								长期应付款
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								专项应付款
							</td>
						</tr>
						<tr bgcolor="#FFFFE8">
							<td height="24">
								<b>递延税项</b>
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								负债合计
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								少数股东权益
							</td>
						</tr>
						<tr bgcolor="#FFFFE8">
							<td height="24">
								<b>股东权益</b>
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								资本公积
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								盈余公积
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								其中：法定公益金
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								未分配利润
							</td>
						</tr>
						<tr bgcolor="#FFFFE8">
							<td height="24">
								<b>流动资产</b>
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								货币资金
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								应收票据
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								应收股利
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								应收利息
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								应收账款
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								其他应收款
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								期货保证金
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								存货
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								其他流动资产
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								待摊费用
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								流动资产合计
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								无形资产
							</td>
						</tr>
						<tr bgcolor="#FFFFE8">
							<td height="24">
								<b>长期投资</b>
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								在建工程
							</td>
						</tr>
						<tr bgcolor="#FFFFE8">
							<td height="24">
								<b>固定资产</b>
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								固定资产
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								固定资产清理
							</td>
						</tr>
						<tr bgcolor="#FFFFE8">
							<td height="24">
								<b>无形资产及其他资产</b>
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								其中：应收关联公司款
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								长期待摊费用
							</td>
						</tr>
						<tr bgcolor="#FFFFE8">
							<td height="24">
								<b>递延税项</b>
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								 资产总计
							</td>
						</tr>
						<tr bgcolor="#FFFFE8">
							<td height="24">
								<b>流动负债</b>
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								 短期借款
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								应付票据
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								应付账款
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								其中：现金股利
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								 应收融资租赁款
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								应付利息
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								 累积未弥补子公司亏损
							</td>
						</tr>
						
					</table>
				</td>

				<td valign="top" width="630">
					<div style="width: 630px; overflow-x:scroll;">
						<div style="width:${divWidth};">
							<c:forEach var="assetIndebte" items="${assetIndebteList}">
								<table width="${tableWidth}" bgcolor="#DCDCDC" border="0" cellspacing="1"
									cellpadding="0" align="left">
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<b><fmt:formatDate value="${assetIndebte.deadLine }"
												pattern="yyyy-MM-dd" /></b>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.yfglgsk }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.gnpzjs }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.yfglgsk }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.yfgl }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.qtldfz }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.qtyfk }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.ytfy }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.ytfz }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.diysy }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.ldfzhj }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFE8">
										<td height="24">
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.cqjk }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.yfzq }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.cqyfk }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.zxyfk }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFE8">
										<td height="24">
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.fzhj }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.ssgdqy }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFE8">
										<td height="24">
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.zbgj }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.yygj }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.gyj }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.wfplr }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFE8">
										<td height="24">
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.currencyFund }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.yspj }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.ysgl }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.yslx }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.yszk }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.qtysk }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.qhbzj }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.ch }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.qtldzc }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.dtfy }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.ldzchj }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.wxzc }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFE8">
										<td height="24">
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.cqgqtz }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFE8">
										<td height="24">
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.zjgc }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.gdzcql }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFE8">
										<td height="24">
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.ysglgsk }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.cqdtfy }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFE8">
										<td height="24">
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.zczj }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFE8">
										<td height="24">
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.dqjk }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.yfpj }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.yingfzk }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.xjgl }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.ysrzzlk }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.yflx }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${assetIndebte.ljwnbzgsks }" pattern="#,#00.00#"/>
										</td>
									</tr>
								</table>
							</c:forEach>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>
