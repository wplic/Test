
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
						<tr bgcolor="#FFFFE8">
							<td height="24">
								<b>主营业务收入</b>
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								减：主营业务成本
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								主营业务税金及附加
							</td>
						</tr>
						<tr bgcolor="#FFFFE8">
							<td height="24">
								<b>主营业务利润</b>
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								营业费用
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								管理费用
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								财务费用
							</td>
						</tr>
						<tr bgcolor="#FFFFE8">
							<td height="24">
								<b>营业利润</b>
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								营业利润
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								加：投资收益
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								汇兑损益
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								营业外收入
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								以前年度损益调整
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								减：营业外支出
							</td>
						</tr>
						<tr bgcolor="#FFFFE8">
							<td height="24">
								<b>利润总额</b>
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								利润总额
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								减：所得税
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								少数股东损益
							</td>
						</tr>
						<tr bgcolor="#FFFFE8">
							<td height="24">
								<b>净利润</b>
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								净利润
							</td>
						</tr>
					</table>
				</td>

				<td valign="top" width="630">
					<div style="width: 630px; overflow-x:scroll;">
						<div style="width:${divWidth};">
							<c:forEach var="profitAssign" items="${profitAssignList}">
								<table width="${tableWidth}" bgcolor="#DCDCDC" border="0" cellspacing="1"
									cellpadding="0" align="left">
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<b><fmt:formatDate value="${profitAssign.deadline }"
												pattern="yyyy-MM-dd" /></b>
										</td>
									</tr>
									<tr bgcolor="#FFFFE8">
										<td height="24">
											&nbsp;
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${profitAssign.tradeCost}" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${profitAssign.tradeScotAnnex}" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFE8">
										<td height="24">
											&nbsp;
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${profitAssign.tradeScotAnnex }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${profitAssign.managerCost }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${profitAssign.financialCost }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFE8">
										<td height="24">
											&nbsp;
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${profitAssign.tradeProfitAssign }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${profitAssign.dlyqyhhyqyrtzsy }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${profitAssign.transferIncome }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${profitAssign.tradeOutIncome }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${profitAssign.yqndsytz }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${profitAssign.tradeOutCost }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFE8">
										<td height="24">
											&nbsp;
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${profitAssign.profitTotal }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${profitAssign.incometax }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${profitAssign.ssgdsy }" pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFE8">
										<td height="24">
											&nbsp;
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${profitAssign.incomeProfit }" pattern="#,#00.00#"/>
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
