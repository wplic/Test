<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:directive.page import="com.cssweb.assetManager.pojo.AssetUser"/>
<%--
String fundAccount = null;
if(null!=request.getSession().getAttribute("assetUser")){
	AssetUser assetUser = (AssetUser)request.getSession().getAttribute("assetUser");
	fundAccount = assetUser.getFundAccount();
	if(fundAccount.equals("324800020014") || fundAccount.equals("30800000480"))
	{

	}
	else
	{
		%>
		<script language="javascript">
			window.location="/commons/loginms.jsp";
		</script>
	<%
	}
}else{%>
		<script language="javascript">
			window.location="/commons/loginms.jsp";
		</script>
	<%}
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>广发证券</title>
		<link href="${contextPath }/css/style.css" rel="stylesheet"
			type="text/css" />
		<link href="${contextPath }/css/valueSys/valueSys.css"
			rel="stylesheet" type="text/css" />
		<script src="${contextPath }/financing/My97DatePicker/WdatePicker.js"
			type="text/javascript"></script>
		<script src="${ctx }/match/nxsy/mncg/js/page.js" type="text/javascript"></script>
	</head>
	<body>
		<jsp:include page="${contextPath}/commons/mstop.jsp" />

		<div class="mod ptmain">
			<div
				style="background: url(&quot;/pic/branches/branchtit1.jpg&quot;) no-repeat scroll 0% 0% transparent; height: 25px; line-height: 25px; text-indent: 25px; font-size: 12px; color: rgb(0, 104, 166);">
				每日净值查询

			</div>
			<form id="searchForm" name="searchForm"
				action="${ctx }/valueSys/web/YyxtAction.go?function=GetYyxtList" method="post">
				<div class="ptContent">
					<input type="hidden" id="pageNumber" name="pageNumber" value="1" />
					<table style="display: none;" width="99%" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td width="9%">
								按日期查询：
							</td>

							<td width="15%">

								<c:choose>
									<c:when test="${fdate!=null }">
										<input class="Wdate" name="fdate" id="fdate" value="${fdate }"
											type="text" onfocus="WdatePicker({maxDate:'%y-%M-%d'})">
									</c:when>
									<c:otherwise>
										<input class="Wdate" name="fdate" id="fdate" type="text"
											onfocus="WdatePicker({maxDate:'%y-%M-%d'})">
									</c:otherwise>
								</c:choose>

							</td>
							<td width="9%">
								科目代码：
							</td>
							<td width="15%">

								<c:choose>
									<c:when test="${fkmbm!=null }">
										<input name="fkmbm" id="fkmbm" value="${fkmbm }" type="text" />
									</c:when>
									<c:otherwise>
										<input name="fkmbm" id="fkmbm" type="text" />
									</c:otherwise>
								</c:choose>

							</td>
							<td width="9%">
								科目名称：
							</td>
							<td width="15%">

								<c:choose>
									<c:when test="${fkmmc!=null }">
										<input name="fkmmc" id="fkmmc" value="${fkmmc }" type="text" />
									</c:when>
									<c:otherwise>
										<input name="fkmmc" id="fkmmc" type="text" />
									</c:otherwise>
								</c:choose>

							</td>
							<td width="19%" align="left">
								<input type="submit" name="button" id="button" class="but_01"
									value="提交" />
							</td>
						</tr>
					</table>
					<div style="width:100%; overflow-x:scroll; border:0px solid;scrollbar-shadow-color: #FFFFFF; scrollbar-highlight-color: #FFFFFF; scrollbar-arrow-color: #FFFFFF; scrollbar-face-color: #59ADBB; scrollbar-track-color: #FFFFFF; scrollbar-3dlight-color: #59ADBB; scrollbar-darkshadow-color: #59ADBB;">
					<table width="150%" cellspacing="1" cellpadding="0" border="0"
						bgcolor="#666666" class="indextext2" id="doclist">
						<tbody>
							<tr align="center">
								<td bgcolor="#DDEAFD">
									日期
								</td>
								<td bgcolor="#DDEAFD">
									资产代码
								</td>
								<td bgcolor="#BAEADE">
									期初单位净值
								</td>
								<td bgcolor="#DDEAFD">
									今日单位净值
								</td>
								<td bgcolor="#BAEADE">
									累计派现金额
								</td>
								<td bgcolor="#DDEAFD">
									累计单位净值
								</td>
								<td bgcolor="#BAEADE">
									证券投资合计
								</td>
								<td bgcolor="#DDEAFD">
									其中股票投资
								</td>
								<td bgcolor="#BAEADE">
									其中债券投资
								</td>
								<td bgcolor="#DDEAFD">
									其中基金投资
								</td>
								<td bgcolor="#BAEADE">
									资产净值
								</td>
								<td bgcolor="#DDEAFD">
									可用资金
								</td>
								<td bgcolor="#BAEADE">
									实收资本
								</td>
								<td bgcolor="#DDEAFD">
									每日佣金
								</td>
								<td bgcolor="#BAEADE">
									每日管理费
								</td>
								<td bgcolor="#DDEAFD">
									当日增长率(%)
								</td>
								<td bgcolor="#BAEADE">
									本年增长率(%)
								</td>
								<td bgcolor="#DDEAFD">
									成立以来增长率(%)
								</td>
							</tr>
							<c:choose>
								<c:when test="${not empty data}">
									<c:forEach var="item" items="${data}">
										<tr align="center">
											<td bgcolor="#DDEAFD">
												${item.guzhi_date}
											</td>
											<td bgcolor="#DDEAFD">
												${item.cust_no}
											</td>
											<td bgcolor="#BAEADE">
												<f:formatNumber value="${item.begin_jingzhi }" pattern="#,##0.0000#" />
											</td>
											<td bgcolor="#DDEAFD">
												<f:formatNumber value="${item.today_jingzhi }" pattern="#,##0.0000#" />
											</td>
											<td bgcolor="#BAEADE">
												<f:formatNumber value="${item.paixian_cash }" pattern="#,##0.0#" />
											</td>
											<td bgcolor="#DDEAFD">
												<f:formatNumber value="${item.accum_jingzhi }" pattern="#,##0.0000#" />
											</td>
											<td bgcolor="#BAEADE">
												<f:formatNumber value="${item.invest_total }" pattern="#,##0.0#" />
											</td>
											<td bgcolor="#DDEAFD">
												<f:formatNumber value="${item.stock_invest }" pattern="#,##0.0#" />
											</td>
											<td bgcolor="#BAEADE">
												<f:formatNumber value="${item.zq_invest }" pattern="#,##0.0#" />
											</td>
											<td bgcolor="#DDEAFD">
												<f:formatNumber value="${item.fund_invest }" pattern="#,##0.0#" />
											</td>
											<td bgcolor="#BAEADE">
												<f:formatNumber value="${item.total_asset }" pattern="#,##0.0#" />
											</td>
											<td bgcolor="#DDEAFD">
												<f:formatNumber value="${item.useable_cash }" pattern="#,##0.0#" />
											</td>
											<td bgcolor="#BAEADE">
												<f:formatNumber value="${item.shishou_asset }" pattern="#,##0.0#" />
											</td>
											<td bgcolor="#DDEAFD">
												<f:formatNumber value="${item.preday_yongjin }" pattern="#,##0.0#" />
											</td>
											<td bgcolor="#BAEADE">
												<f:formatNumber value="${item.preday_guanli }" pattern="#,##0.0#" />
											</td>
											<td bgcolor="#DDEAFD">
												${item.today_ratio}
											</td>
											<td bgcolor="#BAEADE">
												${item.year_ratio}
											</td>
											<td bgcolor="#DDEAFD">
												${item.total_ratio}
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="19">
											暂无数据
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					</div>
					<div align="right"> <c:out value="${linkStr}" escapeXml="false"></c:out></div>
				</div>
			</form>


			<div class="clearfloat"></div>
			<!--清除浮动-->
		</div>
		<div class="blank5"></div>
		<jsp:include page="/share/bottom.jsp" />
	</body>
</html>