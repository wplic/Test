<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:directive.page import="com.cssweb.assetManager.pojo.AssetUser"/>
<%
String fundAccount = null;
if(null!=request.getSession().getAttribute("assetUser")){
	AssetUser assetUser = (AssetUser)request.getSession().getAttribute("assetUser");
	fundAccount = assetUser.getFundAccount();
	if(fundAccount.equals("030800000480") || fundAccount.equals("30800000480"))
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
%>
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
	</head>
	<body>
		<jsp:include page="${contextPath}/commons/mstop.jsp" />
		<script src="${contextPath }/gyjj/js/effects.js"
			type="text/javascript" charset="UTF-8"></script>
		<div class="mod ptmain">
			<div
				style="background: url(&quot;/pic/branches/branchtit1.jpg&quot;) no-repeat scroll 0% 0% transparent; height: 25px; line-height: 25px; text-indent: 25px; font-size: 12px; color: rgb(0, 104, 166);">
				估值系统

			</div>
			<form id="searchForm" name="searchForm"
				action="${ctx }/valueSysAction.do?method=listValueSys" method="post">
				<div class="ptContent">
					<input type="hidden" id="pageNumber" name="pageNumber" value="1" />
					<table width="99%" border="0" align="center" cellpadding="0"
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
					<table width="100%" cellspacing="1" cellpadding="0" border="0"
						bgcolor="#666666" class="indextext2" id="doclist">
						<tbody>
							<tr align="center">
								<td bgcolor="#DDEAFD">
									日期
								</td>
								<td bgcolor="#BAEADE">
									科目代码
								</td>
								<td bgcolor="#DDEAFD">
									科目名称
								</td>
								<td bgcolor="#BAEADE">
									单位成本
								</td>
								<td bgcolor="#DDEAFD">
									行情标志
								</td>
								<td bgcolor="#BAEADE">
									数量
								</td>
								<td bgcolor="#DDEAFD">
									成本
								</td>
								<td bgcolor="#BAEADE">
									市值
								</td>
								<td bgcolor="#DDEAFD">
									估值增值
								</td>
								<td bgcolor="#BAEADE">
									成本市值比例
								</td>
								<td bgcolor="#DDEAFD">
									市值占净值比
								</td>
								<td bgcolor="#BAEADE">
									停牌信息
								</td>
								<td bgcolor="#DDEAFD">
									权益信息
								</td>
							</tr>
							<c:choose>
								<c:when test="${not empty list}">
									<c:forEach var="item" items="${list}">
										<tr align="center">
											<td bgcolor="#DDEAFD">
												${item.fdate2}
											</td>
											<td bgcolor="#BAEADE">
												${item.fkmbm}
											</td>
											<td bgcolor="#DDEAFD">
												${item.fkmmc}
											</td>
											<td bgcolor="#BAEADE">
												<f:formatNumber value="${item.fhqjg }" pattern="#,##0.0#" />
											</td>
											<td bgcolor="#DDEAFD">
												${item.fhqbz}
											</td>
											<td bgcolor="#BAEADE">
												<f:formatNumber value="${item.fzqsl }" pattern="#,##0.0#" />
											</td>
											<td bgcolor="#DDEAFD">
												<f:formatNumber value="${item.fzqcb }" pattern="#,##0.0#" />
											</td>
											<td bgcolor="#BAEADE">
												<f:formatNumber value="${item.fzqsz }" pattern="#,##0.0#" />
											</td>
											<td bgcolor="#DDEAFD">
												${item.fgz_zz}
											</td>
											<td bgcolor="#BAEADE">
												${item.fcb_jz_bl}
											</td>
											<td bgcolor="#DDEAFD">
												${item.fsz_jz_bl}
											</td>
											<td bgcolor="#BAEADE">
												<c:if test="${item.ftpxx  == ''}">--</c:if>
												<c:if test="${item.ftpxx != ''}">${item.ftpxx}</c:if>
											</td>
											<td bgcolor="#DDEAFD">
												<c:if test="${item.fqyxx == ''}">--</c:if>
												<c:if test="${item.fqyxx != ''}">${item.fqyxx}</c:if>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td row="6">
											暂无数据
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<c:out value="${linkStr}" escapeXml="false"></c:out>
				</div>
			</form>


			<div class="clearfloat"></div>
			<!--清除浮动-->
		</div>
		<div class="blank5"></div>
		<jsp:include page="/share/bottom.jsp" />
	</body>
</html>