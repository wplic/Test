<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:include page="${ctx }/match/nxsy/login_ok.jsp"></jsp:include>
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
<script type="text/javascript"
	src="${ctx }/match/nxsy/mncg/js/commons.js"></script>
<script src="${ctx }/match/nxsy/mncg/js/page.js" type="text/javascript"></script>
<script language="javascript">
	var JQ = jQuery.noConflict();
	function radio_click(stock_code, entrust_no, remain_amount, entrust_price) {
		JQ("#stock_code").val(stock_code);
		JQ("#entrust_no").val(entrust_no);
		JQ("#entrust_price").val(entrust_price);
		JQ("#entrust_amount").val(remain_amount);
	}
	//当下拉框的股票名称发生变化
	function change_stock() {
		var stock_code = JQ("#stock_code").val();
		if(stock_code == "")
		{
			return;
		}
		refreshT(stock_code,'1',0);
	}
	
	function funct()
	{
		alert("hello");
	}
	
	//查看委托价格是否合法
	function checkPrice()
	{
		var entrust_price = JQ("#entrust_price").val();
		if(entrust_price == "")
		{
			return;
		}
		var min_entrust_price = JQ("#min_entrust_price").val();
		var max_entrust_price = JQ("#max_entrust_price").val();
		if(isNaN(entrust_price))
		{
			alert("委托价格必须为数字！");
			JQ("#entrust_price").val(max_entrust_price);
			return false;
		}
		if(entrust_price > max_entrust_price || entrust_price < min_entrust_price)
		{
			alert("委托价格不在允许范围内！");
			JQ("#entrust_price").val(max_entrust_price);
			return false;
		}
		return true;
	}
	function toPage(page) {
		document.getElementById("pageNumber").value=page;		
		var stock_code = JQ("#stock_code").val();
		if(stock_code == "")
		{
			alert("请选择股票代码！");
			return;
		}
		refreshT(stock_code,'1',page);
	}
	function refresh_wt(type)
	{
		var stock_code = JQ("#stock_code").val();
		if(type =='0')
		{
			if(stock_code == "")
			{
				alert("请选择股票代码！");
				return;
			}
		}
		else
		{
			stock_code = '0';	
		}
		refreshT(stock_code,'1',0);
	}
	function checkPage(totalPages)
	{
		//var totalPages = ${page.totalPages};
	    if(document.getElementById("jump").value > totalPages) {
	      	alert("您输入的页码超出范围，请重新输入！");
	        document.getElementById("jump").focus();
	        return false;
		} 
	    else if(document.getElementById("jump").value < 1) {
	     	alert("您输入的页码超出范围，请重新输入！");
	        document.getElementById("jump").focus();
	        return false;
	 	} 
	    else 
	    {
	    	toPage(document.getElementById("jump").value);
	    }
	}
	function doreset()
	{
		var entrust_no = JQ("#entrust_no").val();
		JQ("#stock_code").val("");
		JQ("#entrust_price").val("");
		JQ("#entrust_amount").val("");
		JQ("#max_amount").text("0");
		JQ("#entrust_no").val("");
		JQ("#price_scope").text("--");
		JQ("input:radio[name='sradio'][value='" + entrust_no + "']").attr("checked",false);
	}
	//提交表单
	function dosubmit()
	{
		
		var strMsg = "";
		strMsg += checkValid("stock_code", "股票名称", "NotEmpty");
		strMsg += checkValid("entrust_price", "委托价格", "NotEmpty");
		strMsg += checkValid("entrust_amount", "委托数量", "NotEmpty");
		strMsg += checkValid("client_id", "客户编号", "NotEmpty");
		strMsg += checkValid("entrust_price", "委托价格", "NumberFloat");
		strMsg += checkValid("entrust_amount", "委托数量", "Numeric");
		if(strMsg != "")
		{
			alert(strMsg);
			return;
		}
		//查看委托价格是否合法
		var entrust_price = JQ("#entrust_price").val();
		var min_entrust_price = JQ("#min_entrust_price").val();
		var max_entrust_price = JQ("#max_entrust_price").val();
		if(entrust_price > max_entrust_price || entrust_price < min_entrust_price)
		{
			alert("委托价格不在允许范围内！");
			return;
		}
		var max_amount = JQ("#canuse_balance2").val();
		//查看委托数量是否合法
		var entrust_amount = JQ("#entrust_amount").val();
		if((entrust_amount % 1000) != 0 && entrust_amount != max_amount)
		{
			alert("委托数量必须为1000的整数倍!");
			return;
		}
		
		if(Number(entrust_amount) > Number(max_amount))
		{
			alert("超过了最大允许委托数量!");
			return;
		}
		if(!confirm("确定卖出?")){
			 return;
		};
		JQ("#sellForm").submit();
		
	}
</script>
</head>
<body>
	<script>
	  	var errorMsg="${errorMsg}";
	  	if(errorMsg!=""){
	  		alert(errorMsg);
	  	}
	</script>
	<!-- 现金 -->
	<input type="hidden" name="canuse_balance" id="canuse_balance"
		value="${data.canuse_balance}" />
	<div align="center">
		<div class="wrap" style="width:99%">
			<form name="sellForm" id="sellForm"
				action="/nxsyBSAction.do?method=sell" method="post">
				<div class="alignleft " style="width: 29%">
					<div class="tb_wrap">
						<div class="tb_header">
							<div>
								<table cellspacing="0" cellpadding="0" class="title line1">
									<tbody>
										<tr>
											<td class="b">委托卖出</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- end header -->
						<div class="tb_body">
							<div class="tb_content">

								<div class="alignleft " id="stockBox">
									<table class="bs">
										<tbody>
											<tr>
												<td class="lbg">客户编号：</td>
												<td>
													<div id="dclient_id">${data.client_id }</div>
												</td>
												<input type="hidden" name="client_id" id="client_id" value="${data.client_id }"/>
											</tr>
											<tr>
												<td class="lbg">证券代码：</td>
												<td><select id="stock_code" name="stock_code"
													onchange="change_stock();">
														<option value="">-请选择-</option>
														<option value="1001">看涨股份</option>
														<option value="1002">看跌股份</option>
												</select>
												</td>
											</tr>
											<tr>
												<td class="lbg">委托号：</td>
												<td><input type="text" tabindex="2" size="11"
													id="entrust_no" name="entrust_no" readonly="true">
												</td>
											</tr>
											<tr>
												<td class="lbg">委托价格：</td>
												<td><input type="text" tabindex="2" size="8"
													id="entrust_price" name="entrust_price"
													onblur="checkPrice();""> 元 <font color='red'>
														<div id="price_scope" name="price_scopt"
															class="alignright textright"></div>
												</font></td>
											</tr>
											<!--tr>
											<td class="lbg">可用余额：</td>
											<td><div id="fundavl">${data.canuse_balance}元</div>
											</td>
										</tr-->
											<tr>
												<td class="lbg">最大可卖：</td>
												<td>
													<div id="max_amount" class="alignleft textleft"></div>
													<div class="alignleft textleft">股</div>
												</td>
											</tr>
											<tr>
												<td class="lbg">卖出数量：</td>
												<td><input type="text" tabindex="3" size="11"
													id="entrust_amount" name="entrust_amount"><span
													id="unit2">股</span>
												</td>
											</tr>
											<tr>
												<td height="36" align="center" colspan="2"><input
													type="button" value="重&nbsp;&nbsp;置" class="button4"
													onClick="doreset()">&nbsp;&nbsp;&nbsp;&nbsp; <input
													type="button" value="卖&nbsp;&nbsp;出" class="button4"
													onClick="dosubmit()"></td>

											</tr>
										</tbody>
									</table>
								</div>
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
			</form>
			<div class="alignleft wtrade">
				<div class="tb_wrap">
					<div class="tb_header">
						<div>
							<table cellspacing="0" cellpadding="0" class="title line1">
								<tbody>
									<tr>
										<td class="b">委托交易卖出<a class="refresh"
											href="javascript:void(0)" onclick="refresh_wt('0')"></a></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- end header -->
					<div class="tb_body">
						<div class="tb_content yichu" id="bsEntrust">
							<jsp:include page="stock/bsEntrust.jsp"></jsp:include>
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
			<div class="alignleft w1">
				<div class="tb_wrap">
					<div class="tb_header">
						<div>
							<table cellspacing="0" cellpadding="0" class="title line1">
								<tbody>
									<tr>
										<td class="b">我的持仓<a class="refresh"
											href="javascript:void(0)" onclick="refreshH()"></a></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- end header -->
					<div class="tb_body">
						<div class="tb_content yichu" id="contentBox">
							<jsp:include page="stock/stockHold.jsp"></jsp:include>
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
	<!-- end center -->
	<script>
		refreshH();
		refresh_wt('1');
	</script>

</body>
</html>