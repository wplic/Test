<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>
<link rel="stylesheet" type="text/css" href="${contextPath }/css/infoCenter/aip/jjdt.css" media="all" />
<script src="${ctx }/financing/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript"	src="${ctx }/commons/js/commons.js"></script>
<script src="${ctx }/match/nxsy/mncg/js/jquery-1.3.2.js" type="text/javascript"></script>
<style type="text/css" >

#stk_div_list {width:170px; color:#00f; font:Arial, Helvetica, sans-serif; font-size:12px; position:absolute;display:none;height:auto;z-index:1000;background:#fff;padding:0;border:1px solid #C62121; }
#stk_div_list td{ height:20px; padding: 0 4px 0 4px;text-align:center;white-space:nowrap;}
#stk_div_list .onover{ background:#F7C370;cursor:pointer;}
#stk_div_list .onout{ background:#fff;cursor:pointer;}

</style>
<script type="text/javascript">
	
	function checkform() {
		var strMsg = "";
		strMsg += checkValid("stock_code", "基金名称", "NotEmpty");
		strMsg += checkValid("money", "定投金额", "NotEmpty");
		strMsg += checkValid("money", "定投金额", "NumberFloat");
		strMsg += checkValid("begin_date", "定投开始日", "NotEmpty");
		strMsg += checkValid("end_date", "定投结束日", "NotEmpty");
		strMsg += checkValid("fee_rate_buy", "申购费率", "NotEmpty");
		strMsg += checkValid("fee_rate_sell", "赎回费率", "NotEmpty");
		strMsg += checkValid("fee_rate_buy", "申购费率", "NumberFloat");
		strMsg += checkValid("fee_rate_sell", "赎回费率", "NumberFloat");
		strMsg += checkValid("fee_type", "购买方式", "NotEmpty");
		strMsg += checkValid("abonus_type", "分红方式", "NotEmpty");
		if (strMsg != "") {
			alert(strMsg);
			return;
		}
		document.getElementById("aipForm").submit();
	}
	function setRadio2(radioName, value) {
		var radio_oj = document.getElementsByName(radioName);
		for ( var i = 0; i < radio_oj.length; i++) //循环
		{
			if (radio_oj[i].value == value) //比较值
			{
				radio_oj[i].checked = true; //修改选中状态
				break; //停止循环
			}
		}
	}
</script>
</head>
<body class="">
	<jsp:include page="${contextPath}/share/top.jsp" />
	<div ><jsp:include flush="true" page="${contextPath}/infoCenter/fund_ajax2.jsp"/></div>
	<div class="body_bg">
		<div class="main">
			<div class="dqwz">
				当前位置：<a href="${contextPath }/index.jsp?nav=index"> 首页 </a> &gt;<a
					href="${contextPath }/infoCenter/fund.jsp?nav=zxzx&nav1=jj&nav2=ggxl">
					基金</a> &gt; 基金定投计算器
			</div>
		</div>
		<div class="wrap_2left">
			<!--左侧sied开始-->
			<div class="w210 fleft ptb9">
				<div class="iptvside_top"></div>
				<div class="iptvside_mid">
					<jsp:include page="${contextPath}/infoCenter/fund_lmenu.jsp?menu1=hor1&menu2=board1&menu3=aipcalc" />
					<jsp:include page="/infoCenter/Search.jsp" />
				</div>
				<div class="iptvside_bot"></div>
				<div class="blank5"></div>
				<p align="center">
					<a href="${contextPath }/fundFilterAction.do?method=getFilterList"><img
						src="${contextPath}/pic/infoCenter/ban_jjsx.jpg" /> </a>
				</p>
				<div class="blank5"></div>
				<p align="center">
					<a href="#"><img
						src="${contextPath}/pic/infoCenter/ban_jjwj.jpg" /> </a>
				</p>
			</div>
			<!--左侧sied结束-->

			<!--右侧sied开始-->
			<div class="w706 fright">
				<div class="left_tit007">基金定投计算器</div>
				<div class="blank5"></div>
				<div class="schemebody">
					<form name="aipForm" id="aipForm"
						action="/fundAIPAction.do?method=list" method="post">
						<div class="calculator">
							<div class="space6"></div>
							<div class="calform">
								<table>
									<tbody>
										<tr>
										<td class="colright"><span class="red">*</span>基金代码：</td>
            							<td class="colleft"><input type="text" value="${param2.stock_code }" name="stock_code" id="stock_code"   class="searchinput1" autocomplete="OFF" onkeydown="startinginitData(event);" onkeyup="sendStockMsg(this.value,event)" onfocus="initCtrl('stock_code','stk_div_list');if(this.value=='代码/简称') this.value='';" onBlur="if(this.value=='') this.value='代码/简称';"/>
										<div id="stk_div_list"></div></td>
											<td class="colright"><span class="red">*</span>每期定投金额：</td>
											<td class="colleft"><input type="text"
												style="width:60px;" id="money" name="money"
												value="${param2.money }">&nbsp;元 
											</td>

										</tr>
										<tr>
											<td class="colright"><span class="red">*</span>定投开始日：</td>
											<td class="colleft"><input class="Wdate"
												onClick="WdatePicker()" type="text" name="begin_date"
												id="begin_date" style="width:135px;" id="txtsdate"
												value="${param2.begin_date}">
											</td>

											<td class="colright">定投结束日：</td>
											<td class="colleft"><input class="Wdate"
												onClick="WdatePicker()" type="text" name="end_date"
												id="end_date" style="width:135px;" id="txtedate"
												value="${param2.end_date}">
											</td>
											<!-- 
											<td class="colright">定投赎回日：</td>
											<td class="colleft"><input class="Wdate"
												onClick="WdatePicker()" type="text" name="txtshdate"
												style="width:135px;" id="txtshdate" readonly="readonly">
											</td>
											-->
										</tr>
										<!-- 
										<tr>
											<td class="colright"><span class="red">*</span>定投周期：</td>
											<td class="colleft">每 <input type="text" value="1"
												style="width:40px; vertical-align:middle;" id="txtround">&nbsp;<select
													style="width:50px; vertical-align:middle;" id="ddlround"><option>周</option>
														<option selected="">月</option>
												</select>
											</td>
											<td class="colright">定投日：</td>
											<td class="colleft"><select style="width:70px;"
												id="ddldtr" disabled>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
													<option value="13">13</option>
													<option value="14">14</option>
													<option value="15">15</option>
													<option value="16">16</option>
													<option value="17">17</option>
													<option value="18">18</option>
													<option value="19">19</option>
													<option value="20">20</option>
													<option value="21">21</option>
													<option value="22">22</option>
													<option value="23">23</option>
													<option value="24">24</option>
													<option value="25">25</option>
													<option value="26">26</option>
													<option value="27">27</option>
													<option value="28">28</option>
											</select>
											</td>
										</tr>
										 -->
										<tr>
											<td class="colright">申购费率：</td>
											<td class="colleft"><input type="text"
												style="width:60px;" id="fee_rate_buy" name="fee_rate_buy"
												value="${param2.fee_rate_buy }">&nbsp;% 
											</td>
											<td class="colright">赎回费率：</td>
											<td class="colleft"><input type="text"
												style="width:60px;" id="fee_rate_sell" name="fee_rate_sell"
												value="${param2.fee_rate_sell }">&nbsp;% 
											</td>

										</tr>

										<tr>
											<td class="colright"><span class="red">*</span>分红方式：</td>
											<td class="colleft"><input type="radio" value="0"
												name="abonus_type">&nbsp;现金分红&nbsp;&nbsp;<input
													type="radio" value="1" name="abonus_type">&nbsp;红利再投

												
											</td>
											<script type="text/javascript">
												setRadio2("abonus_type",
														"${param2.abonus_type}");
											</script>
											<td class="colright">购买方式：</td>
											<td class="colleft"><input type="radio" value="0"
												name="fee_type">&nbsp;前端收费&nbsp;&nbsp;<input
													type="radio" value="1" name="fee_type">&nbsp;后端收费 
											</td>
											<script type="text/javascript">
												setRadio2("fee_type",
														"${param2.fee_type}");
											</script>
										</tr>
										<!-- 
										<tr>
											<td></td>
											<td class="colleft"><input type="checkbox" id="chkfirst">开始日为首次扣款日


											
											</td>
											<td></td>
											<td></td>
										</tr>
										 -->
										<tr>
											<td class="colleft" colspan="3"><input type="button"
												class="btncal" value="计 算" id="btnCal"
												onclick="checkform();">
											</td>
										</tr>
										<tr>
											<td colspan="4"><hr>
											</td>
										</tr>

									</tbody>
								</table>
							</div>
							<div class="space6"></div>
							<div class="aipResult">
								<h1>定投明细</h1>
								<div id="aipDetail">
									<jsp:include page="aipDetail.jsp"></jsp:include>
								</div>
								<h1>赎回汇总</h1>
								<div id="redemptionTotal">
									<jsp:include page="redemptionTotal.jsp"></jsp:include>
								</div>
								<h1>收益汇总</h1>
								<div id="incomeTotal">
									<jsp:include page="incomeTotal.jsp"></jsp:include>
								</div>
								<h1>分红拆分明细</h1>
								<div id="dividendDetail">
									<jsp:include page="dividendDetail.jsp"></jsp:include>
								</div>
							</div>
							<div class="space6"></div>
						</div>
					</form>
				</div>
			</div>
			<!--右侧sied结束-->
			<div class="clearfloat"></div>
			<!--清除浮动-->
		</div>
		<script src="/js/setTab.js"></script>
		<jsp:include page="${contextPath}/share/bottom.jsp" />
	</div>
</body>
</html>