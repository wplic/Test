<%@ page contentType="text/html; charset=utf-8" language="java"%>
<jsp:directive.page
	import="com.cssweb.common.web.filter.SqlInjectValidate" />
<jsp:directive.page import="java.util.*" />
<jsp:directive.page import="java.text.SimpleDateFormat" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>竞赛规则-广发证劵_2012年广发证券“融智杯”融资融券仿真交易竞赛</title>
<link href="${contextPath }/css/community.css" rel="stylesheet" type="text/css" />
<link href="${contextPath }/css/financing/rongzhi/rongzhi.css" rel="stylesheet" type="text/css" />
<script src="${contextPath }/gyjj/js/swfobject_source.js"
	type=text/javascript></script>
<script src="${contextPath }/gyjj/js/prototype.js"
	type="text/javascript" charset="UTF-8"></script>
<script src="${contextPath }/gyjj/js/validation_cn.js"
	type="text/javascript" charset="UTF-8"></script>
<script src="${contextPath }/gyjj/js/effects.js" type="text/javascript"
	charset="UTF-8"></script>
</head>
<%
	SqlInjectValidate sqlInjectValidate = SqlInjectValidate
			.getSqlInjectValidate();
	if (request.getParameter("nav1") != null
			&& !request.getParameter("nav1").equals("")) {
		if (sqlInjectValidate.vakidateSqlStringForLength(
				request.getParameter("nav1"), 10)) {
			response.sendRedirect(request.getContextPath()
					+ "/commons/error2.jsp");
			return;
		}
	}
	if (request.getParameter("nav") != null
			&& !request.getParameter("nav").equals("")) {
		if (sqlInjectValidate.vakidateSqlStringForLength(
				request.getParameter("nav"), 10)) {
			response.sendRedirect(request.getContextPath()
					+ "/commons/error2.jsp");
			return;
		}
	}
%>
<body>
	<jsp:include page="/share/top.jsp" />
	<!-- header end -->
	<div id="subbanner">
		<img src="${contextPath }/pic/financing/rongzhi/rongzhi_banner.jpg" />
	</div>
	<div class="subMainconter">
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="layout">
			<tr>
				<th valign="top" class="wrapleft">
					<div class="navLeft">
						<h3>
							<img src="${contextPath }/images/rongzhi/rongzhi_btn.jpg" style="margin-left: 10px;" />
						</h3>
						<jsp:include page="sideMenu.jsp" />
					</div></th>
				<td valign="top" class="wrapright">
					<div class="columnOut system">
						<div class="columnTitle">
							<h3>竞赛规则</h3>
							<span><b>首页</b>><b>2012年广发证券“融智杯”融资融券仿真交易竞赛</b>><strong>竞赛规则</strong>
							</span>
						</div>
						<h3>“融智杯”融资融券仿真交易竞赛规则</h3>
<h2>(一)	账户设置</h2>
<p>1.	每名成功报名参赛者将配置一个仿真信用账户，客户使用12位的客户编号进行登录。</p>
<p>2.	登录密码888888，信用交易密码888888，客户第一次登录后，请及时修改密码。</p>
<p>3.	每个仿真信用账户配置100万元的初始现金，融资、融券额度各200万。</p>
<h2>(二)	交易时间</h2>
<p>1.	上午9：30-11:30；下午1:00-3:00。</p>
<p>2.	交易时间内不接受挂单，非交易时间不接受委托。</p>
<h2>(三)	交易指令</h2>
<p>本次仿真信用账户可接受客户进行普通交易委托及融资融券交易委托，具体交易指令如下：</p>
<p>1.	普通交易指令：普通买入、普通卖出。</p>
<p>2.	融资融券交易指令：融资买入、融券卖出、卖券还款、买券还券、直接还款、直接还券。</p>
<h2>(四)	交易行情</h2>
<p>为了真实反映参赛者水平，本次竞赛全程采用融资融券仿真交易模拟客户端，行情与市场同步。若发生分红、送股、配股、增发等权益事项，根据真实环境的处理方式进行处理。</p>
<p>交易客户端下载路径：广发网――融资融券――软件下载――融资融券仿真交易客户端</p>
<h2>(五)	交易品种</h2>
<p>1.	信用账户内普通交易的证券须在广发证券规定的担保品名单内</p>
<p>2.	信用账户内融资融券交易的证券须在广发证券规定的标的证券名单内</p>
<p>3.	担保证券名单、标的证券名单、折算率、保证金比例以仿真环境中的规定为主。均可以仿真客户端查询。</p>
<p>4.	融券交易数量配置：每只融券标的证券配备200万股的初始数量，每日可用数以仿真清算后的数据为准。</p>
<h2>(六)	交易费用</h2>
<p>本次仿真交易竞赛手续费统一设置为0.30%，融资利率及融券费率统一设置为9.10%，过户费、印花税等各种交易规费按正常计算。</p>
<h2>(七)	强制平仓</h2>
<p>当信用账户维持担保比例在T日低于130%时，请于T日减少负债使维持担保比例不少于150%，否则账户将于T+1日被实施强制平仓。</p>
<h2>(八)	注意事项</h2>
<p>1.	本次模拟环境不配置三方存管账户转账功能；不接受担保品划转指令。</p>
<p>2.	本次仿真竟赛仅为客户提供一个虚拟的融资融券交易环境，不产生真实盈亏，我司也不会对参赛的客户收取任何费用。</p>
	
        
        </div>
						<div class="columnButtom">
							<img src="${contextPath }/gyjj/images/columnButtom.jpg" />
						</div>
					</div></td>
			</tr>
		</table>
	</div>
	<div class="clear"></div>
	<jsp:include page="${ctx }/share/bottom.jsp" />
</body>
</html>
