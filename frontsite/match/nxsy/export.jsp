<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<html>
	<head>
		<script src="${ctx }/js/branchcomp/My97DatePicker/WdatePicker.js"	type="text/javascript"></script>
		<script src="${ctx }/js/My97DatePicker/WdatePicker.js"	type="text/javascript"></script>
		
		<title>牛熊宝通用数据导出</title>
	</head>
	<script>
		function doExp(exp_id)
		{
			if(exp_id == "")
			{
				alert("没有需要导出的报表");
				return;
			}
			document.getElementById("exp_id").value = exp_id;
			document.getElementById("form1").submit();
		}
	</script>
	<style type="text/css">
		.title {
			background-color: #B1D3EC;
			color: #FFFFFF;
			font-size: 14px;
			height: 30px;
			line-height: 30px;
			overflow: auto;
			padding: 0 20px;
			text-align: left;
		}
		
		.header {
			color: #000000;
			display: inline;
			font-weight: bold;
		}
		
		.r_title {
			background: none repeat scroll 0 0 #F5F6F8;
			cursor: pointer;
			margin-top: 10px;
			width: 100%;
			font-weight: bold;
			color: red;
			padding: 10px 0;
			height: 25px;
		}
		
		.td1 {
			background: none repeat scroll 0 0 #F8F8F8;
			padding-left: 10px;
			width: 90px;
		}
		
		.td2 {
			background: none repeat scroll 0 0 #FFFFFF;
			color: #CCCCCC;
			padding-right: 5px;
			text-align: right;
		}
		
		.inpt {
			background: url("../assets/input-bg.png") repeat-x scroll 0 0 #FFFFFF;
			border: 1px solid #D6D6D6;
			height: 25px;
			line-height: 25px;
			padding-left: 8px;
			width: 86px;
			z-index: 2;
		}
		
		.button {
			background-color: #FF9900;
			color: #FFFFFF;
			height: 30px;
			float: left;
		    height: 30px;
		    margin: 0 5px 0 0;
		    text-decoration: none;
		}
</style>
	<body>
		
		<div class="r_title"
			style="background: #ffffff; cursor: default; height: 90px;">
			<div class="title">
				<span class="header">导出条件</span>
			</div>
			<form id="form1" name="form1" action="${contextPath}/nxsy/web/NxsyExcelFrontAction.go?function=CommonExp"  method="post">
				<input type="hidden" name="exp_id" id = "exp_id" value="" /> 
				<table style="margin-left:30px;margin-top:8px;">
					<tr>
						<td class="colright">
							统计日期：
						</td>
						<td class="colleft">
							<input class="Wdate" onClick="WdatePicker()" type="text"
								name="init_date" id="init_date" style="width: 135px;" value="${param2.init_date}">
						</td>
						<td class="colright">
							开始日期：
						</td>
						<td class="colleft">
							<input class="Wdate" onClick="WdatePicker()" type="text"
								name="begin_date" id="begin_date" style="width: 135px;" value="${param2.begin_date}">
						</td>
						<td class="colright">
							结束日期：
						</td>
						<td class="colleft">
							<input class="Wdate" onClick="WdatePicker()" type="text"
								name="end_date" id="end_date" style="width: 135px;" value="${param2.end_date}">
						</td>
					</tr>
					<tr>
						<td class="colright">
							客户编号：
						</td>
						<td class="colleft">
							<input type="text" name="client_id"  style="width: 135px;" id="client_id" value="${param2.client_id}"/>
						</td>
						<td class="colright">
							客户昵称：
						</td>
						<td class="colleft">
							<input type="text" name="nick_name"  style="width: 135px;" id="nick_name" value="${param2.nick_name}"/>
						</td>
					</tr>
				</table>
			</form>

		</div>
		<table width="100%">
		<tbody>
			<c:choose>
				<c:when test="${not empty lst}">
					<c:forEach var="item" items="${lst}">
						<tr class="r_title" style="background: #fff8e1; cursor: default;">							
							<td style="width:200px;">		
									<input style="margin-left: 20px;" onclick="doExp('${item.exp_id}')" type="button"
										class="button" value="导出${item.exp_name }" />
							</td>
							<td>
									<span >描述：${item.param_desc }</span>
								
							</td>
							</div>
						</tr>
						
					</c:forEach>
					
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="2" bgcolor="#FFFFFF">暂无数据</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
		</table>

	</body>
</html>
