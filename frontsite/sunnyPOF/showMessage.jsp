<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:directive.page import="com.css.cms.document.Document" />
<jsp:directive.page import="com.css.cms.document.DocumentManager" />
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper" />
<jsp:directive.page
	import="org.springframework.context.ApplicationContext" />
<jsp:directive.page
	import="org.springframework.web.context.support.WebApplicationContextUtils" />
<jsp:directive.page import="com.cssweb.common.util.CsswebServiceUtil" />
<jsp:directive.page import="java.util.List" />
<jsp:directive.page import="java.util.Map" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@page contentType="text/html;charset=UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>广发证券</title>
		<link href="${contextPath}/css/global.css" rel="stylesheet"
			type="text/css" />
		<link href="${contextPath}/css/style.css" rel="stylesheet"
			type="text/css" />

		<script language="JavaScript" type="text/JavaScript">
	var size = 14; //字体大小
	function fontZoom(fontsize) { //设置字体
		size = fontsize;
		document.getElementById('ShowContent').style.fontSize = size + 'px';
		document.getElementById('zhong').className = 'red';
		document.getElementById('da').className = '';
		document.getElementById('xiao').className = '';
	}
	function fontMax() { //字体放大

		size = 16
		document.getElementById('ShowContent').style.fontSize = size + 'px';
		document.getElementById('zhong').className = '';
		document.getElementById('da').className = 'red';
		document.getElementById('xiao').className = '';
	}
	function fontMin() { //字体缩小
		size = 12;
		document.getElementById('ShowContent').style.fontSize = size + 'px';
		document.getElementById('zhong').className = '';
		document.getElementById('da').className = '';
		document.getElementById('xiao').className = 'red';
	}
</SCRIPT>


	</head>
	<body>
		<!-- 头部 -->
		<jsp:include page="/commons/mstop.jsp" />
		<div class="main">
			<div class="dqwz"></div>
			<div class="blank5"></div>
			<div class="bg_f5 p8">
				<div class="tlbg3">
					<p class="textTitle1" align="center">
						提示
					</p>
					<div class="newstextArea">
						<p class="newstextAreatop"></p>
						<div style="word-wrap: break-word;">
							<br />
							<table width="92%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr align="left">
									<td>
									尊贵的客户:
									<p>在继续浏览本网站前，请您仔细阅读本重要提示，并将页面滚动至本页结尾并点击“同意”或“不同意”键，根据您的具体情况选择继续浏览还是放弃。点击“同意” 键，视为您已经阅读并愿意遵守本提示内容。</p>
									<p>本网站所载的各种信息和数据等仅供参考，并不构成广告或销售要约，或买入任何证券、基金或其它投资工具的建议。本网站所载的资料效用具有时效性：于刊载当日相对恰当充分，您在阅读时资料的准确性或完整性有可能已发生变化。本网站刊登的所有资料可予以更改或修订而毋须事前通知，广发证券并不承诺定期更新本网站内容。广发证券并不对第三方所提供之有关资料的准确性、及时性或完整性作出任何保证，公司或其股东及雇员概不对于本网站内第三方所提供之资料的任何错误或遗漏负任何法律责任。如果您需要获取更加准确与详实的产品信息，您应仔细审阅相关金融产品的法律文件等以了解其指定的信息披露渠道，或寻求专业的投资顾问的建议。</p>
									<p>您持有的金融产品净值可能会有较大的波动，并可能在短时间內大幅下跌，可能会造成你的部分或全部投资金额损失。您应确保有关投资的金融产品适合您的需要。如有疑问，请咨询按中国法律、法规注册的专业投资顾问的意见，並确认有关投资产品适合並符合您的投资目标。</p>
									<p>金融产品的价格及其收益存在涨跌变动，而过往的产品业绩数据并不预示其未来的表现，您不应依赖本网站所提供的数据或信息做出投资决策，否则将由您自行承担所有风险。</p>
									</td>
								</tr>
								<tr>
									<td height="48" align="center" style="padding: 10px 15px;">
										<input type="button" name="button1" value="同意"
											class="button4"
											onClick="javascript:window.location='/sunnyCustAction.do?method=showHoldShare';" />
										<input type="button" name="button2" value="不同意"
											class="button4"
											onClick="javascript:window.location='/sunnyCustAction.do?method=logout';" />
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="blank5"></div>
			<!-- 末尾 -->
			<jsp:include page="/commons/msbottom.jsp" />
	</body>
</html>