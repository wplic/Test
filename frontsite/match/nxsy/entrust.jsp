<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:include page="${ctx }/match/nxsy/login_ok.jsp"></jsp:include>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<link href="${ctx }/match/nxsy/mncg/skin/default/css/global.css"
	rel="stylesheet" type="text/css">
<link href="${ctx }/match/nxsy/mncg/skin/default/css/font.css"
	rel="stylesheet" type="text/css">
<script src="${ctx }/match/nxsy/mncg/js/jquery-1.3.2.js"
	type="text/javascript"></script>
<script src="${ctx }/match/nxsy/mncg/js/page.js" type="text/javascript"></script>
</head>
<script language="javascript">
	function cancel(entrust_no)
	{
		if(!confirm("确定撤单?")){
			 return;
		};
		window.location.href="/nxsyCancelAction.do?method=cancel&entrust_no=" + entrust_no + "&jp=entrust";
	}
	function refresh()
	{
		document.forms.searchForm.submit();
	}
</script>
<body>
<form name="searchForm" id="searchForm"
	action="/nxsyQueryAction.do?method=listEntrust" method="post"><script>
		  	var errorMsg="${errorMsg}";
		  	if(errorMsg!=""){
		  		alert(errorMsg);
		  	}
		</script> <input type="hidden" id="pageNumber" name="pageNumber" value="1" />
<div align="center">
<div class="wrap" style="width:99%">

<div class="alignleft w1">
<div class="tb_wrap">
<div class="tb_header">
<div>
<table cellspacing="0" cellpadding="0" class="title line1">
	<tbody>
		<tr class="deliver_his_search">
			<td class="b">实时委托查询</td>

			<td>排序:
				<select id="select_order" name="select_order">
				<option value="" selected="selected">==请选择==</option>
				<option value="stock_code">股票代码</option>
				<option value="entrust_bs">转换方向</option>
			</select></td>
			</td>
			<td>股票代码： <select id="stock_code" name="stock_code">
				<option value="" selected="selected">==请选择==</option>
				<option value="1001">1001 看涨份额</option>
				<option value="1002">1002 看跌份额</option>
			</select></td>
			<td>委托方向: <select id="entrust_bs" name="entrust_bs">
				<option value="" selected="selected">==请选择==</option>
				<option value="1">转入</option>
				<option value="2">转出</option>
				<option value="3">撤单</option>
			</select> </select></td>


			<td><input type="submit" class="but_01" value="查询" id="button1"
				name="button1"></td>
		</tr>
	</tbody>
</table>
</div>
</div>
<!-- end header -->
<div class="tb_body">
<div class="tb_content yichu" id="contentBox" style="height:auto;">
<table class="content">
	<tbody>
		<tr>
			<th></th>
			<th>流水号</th>
			<th>证券代码</th>
			<th>证券名称</th>
			<th>委托日期</th>
			<th>委托时间</th>
			<th>转换比例</th>
			<th>委托数量</th>
			<th>成交数量</th>
			<th>委托类型</th>
			<th>委托状态</th>
			<th>委托方向</th>
		</tr>
		<c:choose>
			<c:when test="${not empty page.data}">
				<c:forEach var="item" items="${page.data}">

					<tr align="center" class="odd blue">
						<td><c:if
							test="${item.entrust_status == 2 or item.entrust_status == 7}">
							<a onclick="cancel(${item.entrust_no})" style="cursor:pointer;">撤单</a>
						</c:if></td>
						<td align="center">&nbsp; <c:out value="${item.entrust_no}" /></td>
						<td align="center">&nbsp; <c:out value="${item.stock_code}" /></td>
						<td align="center">&nbsp; <c:out value="${fn:replace(item.stock_name, '股份', '份额')}" /></td>
						<td align="center">&nbsp; <c:out value="${item.init_date2}" /></td>
						<td align="center">&nbsp; <c:out value="${item.curr_time2}" /></td>
						<td align="center">&nbsp; <c:out
							value="${item.entrust_price}" /></td>
						<td align="center">&nbsp; <c:out
							value="${item.entrust_amount}" /></td>
						<td align="center">&nbsp; <c:out
							value="${item.business_amount}" /></td>
						<td align="center">&nbsp; <c:if
							test="${item.entrust_type == 0}"> 转换 </c:if> <c:if
							test="${item.entrust_type == 2}"> 撤单</c:if></td>
						<td align="center">&nbsp; <c:if
							test="${item.entrust_status == 2}"> 已报 </c:if> <c:if
							test="${item.entrust_status == 5}"> 部撤 </c:if> <c:if
							test="${item.entrust_status == 6}"> 已撤</c:if> <c:if
							test="${item.entrust_status == 7}"> 部成</c:if> <c:if
							test="${item.entrust_status == 8}"> 已成</c:if> <c:if
							test="${item.entrust_status == 9}"> 废单</c:if></td>
						<td align="center">&nbsp; <c:if
							test="${item.entrust_bs == 1}"> 转入 </c:if> <c:if
							test="${item.entrust_bs == 2}"> 转出</c:if></td>
					</tr>
				</c:forEach>
				<tr height="11" bgcolor="#FFFFFF">
					<td colspan="10"></td>
				</tr>
				<tr height="25">
					<td colspan="12" align="right" bgcolor="#FFFFFF"><c:out
						value="${linkStr}" escapeXml="false"></c:out> &nbsp;&nbsp; 跳到 <input
						type=text name=jump id=jump size=3 style="text-align:center"
						value='${page.currentPage}'> 页&nbsp; <img border="0"
						src="${ctxPath }/match/nxsy/mncg/skin/default/pic/button020.gif"
						width="26" height="24" style="cursor:pointer;"
						onclick="javascript:checkPage(${page.totalPages});"></td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="12" bgcolor="#FFFFFF">暂无数据</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>
</div>
</div>
<!-- end tb_body -->
<div class="tb_footer">
<div></div>
</div>
<!-- end tb_footer -->
<div class="clear"></div>
</div>
</div>

</div>
</div>
<!-- end center --></form>
<script type="text/javascript">
		$("#stock_code option[value='${data.stock_code}']").attr("selected", true);
		$("#entrust_bs option[value='${data.entrust_bs}']").attr("selected", true);
		$("#select_order option[value='${data.select_order}']").attr("selected", true);
	</script>

</body>
</html>
