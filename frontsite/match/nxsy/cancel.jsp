<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<jsp:include page="${ctx }/match/nxsy/login_ok.jsp"></jsp:include>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
<link href="${ctx }/match/nxsy/mncg/skin/default/css/global.css"
	rel="stylesheet" type="text/css">
<link href="${ctx }/match/nxsy/mncg/skin/default/css/font.css"
	rel="stylesheet" type="text/css">
<script src="${ctx }/match/nxsy/mncg/js/jquery-1.3.2.js"
	type="text/javascript"></script>
<script src="${ctx }/match/nxsy/mncg/js/page.js" type="text/javascript"></script>
<script language="javascript">
	var JQ = jQuery.noConflict();
</script>
</head>
<script language="javascript">
	var errorMsgSum="";
	var check=0;
	function cancel(entrust_no)
	{
		var urlEt = "/nxsyCancelAction.do?method=cancelbySelected&entrust_no=" + entrust_no;
		JQ.ajax({
			type : "post",
			url : urlEt,
			success : function(msg) {
				errorMsgSum=errorMsgSum+msg;
			},
			error : function(msg) {
				alert('数据加载出错！');
			}
		});
		//window.location.href="/nxsyCancelAction.do?method=cancelbySelected&entrust_no=" + entrust_no;
	}
	//用于删除当前用户下的所有数据
	function doDropByClientid(){
		var counter = 0;
		var form = document.getElementById('searchForm');
		for (var i=0;i<form.elements.length;i++){
			var e = form.elements[i];
			if (e.name != 'chkAll'&&e.disabled==false&&e.type=='checkbox'){
				counter = counter + 1;
			}
		}
		if(counter == 0)
		{
			alert("没有需要撤单的记录");
			return;
		}
		if(confirm("确定撤单?")){
			var urlEt = "/nxsyCancelAction.do?method=cancelbyClientid";
			JQ.ajax({
				type : "post",
				url : urlEt,
				success : function(msg) {
					errorMsgSum=errorMsgSum+msg;
				},
				error : function(msg) {
					alert('数据加载出错！');
				}
			});
			if(errorMsgSum!=""){
				window.alert(errorMsgSum);
				location.reload();
			}else{
				window.alert("撤单成功");
				location.reload();
			}
		}

	}
	//用于选择删除数据
	function doDeleteBySelected(form){
		var counter = 0;
		if(confirm("确定撤单?")){
			for (var i=0;i<form.elements.length;i++){
				var e = form.elements[i];
				if (e.name != 'chkAll'&&e.disabled==false&& e.checked==true && e.type=='checkbox'){
					counter = counter + 1;
					cancel(e.value);
				}
			}
			if(counter == 0)
			{
				alert("请选择需要撤单的记录");
				return;
			}
			if(errorMsgSum!=""){
				window.alert(errorMsgSum);
				location.reload();
			}else{
				window.alert("撤单成功");
				location.reload();
			}
		}
	}

	function refresh()
	{
		document.forms.searchForm.submit();
	}
	function unselectall(form){
		if(form.chkAll.checked){
				form.chkAll.checked = form.chkAll.checked&0;
		}
	}
	function CheckAll(form){
		for (var i=0;i<form.elements.length;i++){
			var e = form.elements[i];
			if (e.Name != 'chkAll'&&e.disabled==false)
				e.checked = form.chkAll.checked;
		}
	}
</script>
<body>
<form name="searchForm" id="searchForm"
	action="/nxsyCancelAction.do?method=listCancel" method="post"><script>
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
		<tr>
			<td class="b">撤单<a class="refresh" href="javascript:refresh()"></a>
			</td>
			<td class="b"><input id="cancelSelected" type="button"
				onclick="doDeleteBySelected(this.form)" value="撤销所选" /></td>
			<td class="b"><input id="cancelAll" type="button"
				onclick="doDropByClientid()" value="撤销全部" /></td>
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
			<th>全选 <input name='chkAll' type='checkbox' id='chkAll'
				onclick='CheckAll(this.form)' value='checkbox' /></th>
			<th>流水号</th>
			<th>证券代码</th>
			<th>证券名称</th>
			<th>委托时间</th>
			<th>转换比例</th>
			<th>委托数量</th>
			<th>成交数量</th>
			<th>委托状态</th>
			<th>委托方向</th>
		</tr>
		<c:choose>
			<c:when test="${not empty page.data}">
				<c:forEach var="item" items="${page.data}">
					<tr align="center" class="odd blue">
						<td><input type="checkbox" onclick='unselectall(this.form)'
							id="cb${item.entrust_no}" name="cb${item.entrust_no}"
							value="${item.entrust_no}"></td>
						<td align="center">&nbsp; <c:out value="${item.entrust_no}" /></td>
						<td align="center">&nbsp; <c:out value="${item.stock_code}" /></td>
						<td align="center">&nbsp; <c:out value="${fn:replace(item.stock_name, '股份', '份额')}" /></td>
						<td align="center">&nbsp; <c:out value="${item.curr_time}" /></td>
						<td align="center">&nbsp; <c:out
							value="${item.entrust_price}" /></td>
						<td align="center">&nbsp; <c:out
							value="${item.entrust_amount}" /></td>
						<td align="center">&nbsp; <c:out
							value="${item.business_amount}" /></td>
						<td align="center">&nbsp; <c:if
							test="${item.entrust_status == 2}"> 已报 </c:if> <c:if
							test="${item.entrust_status == 7}"> 部成</c:if></td>
						<td align="center">&nbsp; <c:if
							test="${item.entrust_bs == 1}"> 转入 </c:if> <c:if
							test="${item.entrust_bs == 2}"> 转出</c:if></td>
					</tr>
				</c:forEach>
				<tr height="10" bgcolor="#FFFFFF">
					<td colspan="10"></td>
				</tr>
				<tr height="25">
					<td colspan="10" align="right" bgcolor="#FFFFFF"><c:out
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
					<td colspan="10" bgcolor="#FFFFFF">暂无数据</td>
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

</body>
</html>
