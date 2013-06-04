
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
	<body style="background-color: #ffffff;" bottommargin="0"
		leftmargin="0" marginheight="0" marginwidth="0" rightmargin="0"
		topmargin="0" onload="javascript:setParentFrame();">
		<table width="792" bgcolor="#DCDCDC" border="0" cellspacing="1"
			cellpadding="0">
			<tr bgcolor="#F2F2F2">
				<td width="320" valign="top">
					<table width="100%" bgcolor="#DCDCDC" border="0" cellspacing="1"
						cellpadding="0">
						<tr bgcolor="#FFFFFF">
							<td height="24">
								<b>时间</b>
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								计提的资产减值准备
							</td>
						</tr>
						<tr bgcolor="#FFFFE8">
							<td height="24">
								<b>经营活动产生的现金流量</b>
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								销售商品、提供劳务收到的现金
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								收到的租金
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								收到的税费返还
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								其中：增值税销项税额、退回增值税款
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								除增值税外其他返还税费
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								 收到其他与经营活动有关现金
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								（经营）现金流入小计
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								购买商品、接受劳务支付的现金
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								经营租赁所付现金
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								支付给职工以及为职工支付的现金
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								支付的各项税费
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								支付的增值税款
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								支付的所得税款
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								除增值税、所得税以外其他税费
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								经营活动产生的现金流量净额
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								（经营）现金流出小计
							</td>
						</tr>
						<tr bgcolor="#FFFFE8">
							<td height="24">
								<b>投资活动产生的现金流量</b>s
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								分得股利或利润收到的现金
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								取得债券利息收入收到的现金
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								处置固定资产、无形资产和其他长期资产收回的现金净额
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								购建固定资产、无形资产、其他长期资产所支付的现金
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								（投资）现金流入小计
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								其中：购买子公司支付的现金
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								权益性投资所付现金
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								债权性投资所付现金
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								资产置换产生的现金流出净额
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								<b>投资活动产生的现金流量净额</b>
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								（投资）现金流出小计
							</td>
						</tr>
						<tr bgcolor="#FFFFE8">
							<td height="24">
								<b>筹资活动产生的现金流量</b>
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								筹资活动产生的现金流量
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								 其中：吸收权益性投资所收到的现金
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								（筹资）现金流入小计
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								 其中：发行债券所收到的现金
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								筹资费用所支付的现金
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								其中：分配股利或利润所付现金
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								其中：子公司支付的少数股东的股利
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								其中：偿付利息所付现金
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								融资租赁所付现金
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								 减少注册资本所付现金
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								其中：子公司依法减资支付给少数股东的现金
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								（筹资）现金流出小计
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								筹资活动产生的现金流量净额
							</td>
						</tr>
						<tr bgcolor="#FFFFE8">
							<td height="24">
								<b>汇率变动对现金的影响</b>
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="24">
								 汇率变动对现金的影响
							</td>
						</tr>
						<tr bgcolor="#FFFFE8">
							<td height="24">
								<b>现金及等价物净增加额</b>
							</td>
						</tr>
						<tr bgcolor="#F2F2F2">
							<td height="24">
								 现金及现金等价物净增加额
							</td>
						</tr>
					</table>
				</td>
				<td valign="top" width="470">
					<div style="width: 470px; overflow-x: scroll;">
						<div style="width: ${divWidth};">
							<c:forEach var="cashFlow" items="${cashFlowList}">
								<table width="${tableWidth}" bgcolor="#DCDCDC" border="0"
									cellspacing="1" cellpadding="0" align="left">
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<b><fmt:formatDate value="${cashFlow.jzrq }"
												pattern="yyyy-MM-dd"/></b>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.jtzcjzzb }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFE8">
										<td height="24">
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.xssptglwsddxj }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.receiveHire }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.sddsffh }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.zzsxxsethzzsk }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.czzswqtfhsf }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.sdqtyjyhdygxj }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.jyxjlrxj }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.gmspjslwzfexj }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.jyzlsfxj }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.zfgzgyjwzgzfdxj }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.zfdgxsf }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.zfzzsk }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.zfsdsk }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.czzssdswqtsf }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.jyhdcsdxjllje }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.jyxjlcxj }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFE8">
										<td height="24">
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.fdglhlrsdexj }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.qdzqlxsrsdexj }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.czgdwxqtcqzcshexjje }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.gjgdwxqtzcszfdxj }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.tzxjlrxj }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.gmzgszfxj }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.qyxtzsfxj }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.zqxtzsfxj }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.zxzhcsxjlcje }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.tzhdcsdxjllje }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.tzxjlcxj }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFE8">
										<td height="24">
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.czhdcsdxjllje }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.xsqyxtzssddxj }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.czxjlrxj }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.fxzqsssexj }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.czfyszfdxj }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.fpgllrsfxj }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.zgszfgl }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.chlxsfxj }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.rzzlsfxj }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.jszczbsfxj }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.zgsjzzfxj }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.czxjlcxj }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.czhdcsdxjllje }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFE8">
										<td height="24">
										</td>
									</tr>
									<tr bgcolor="#FFFFFF">
										<td height="24">
											<fmt:formatNumber value="${cashFlow.hlbddxjdyx }"
												pattern="#,#00.00#"/>
										</td>
									</tr>
									<tr bgcolor="#FFFFE8">
										<td height="24">
										</td>
									</tr>
									<tr bgcolor="#F2F2F2">
										<td height="24">
										<fmt:formatNumber value="${cashFlow.xjjxjdjwjzje }"
												pattern="#,#00.00#"/>
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
