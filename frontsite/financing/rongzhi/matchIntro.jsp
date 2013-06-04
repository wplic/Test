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
<title>竞赛介绍-广发证劵_2012年广发证券“融智杯”融资融券仿真交易竞赛</title>
<link href="${contextPath }/css/community.css" rel="stylesheet" type="text/css" />
<link href="${contextPath }/css/financing/rongzhi/rongzhi.css" rel="stylesheet" type="text/css" />
</head>
<%
		if (request.getAttribute("loginErrorMessage") != null)
		{
			String loginErrorMessage =(String)	request.getAttribute("loginErrorMessage");
				%><script type="text/javascript">
				
						alert('<%=loginErrorMessage%>');
				</script> <%
		}
 %>
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
					<div class="columnOut">
						<div class="columnTitle">
							<h3>竞赛介绍</h3>
							<span><b>首页</b>><b>2012年广发证券“融智杯”融资融券仿真交易竞赛</b>><strong>竞赛介绍</strong>
							</span>
						</div>
						 <div class="columnMain system">
						 <P></P>
						 <h3>2012年“融智杯”融资融券仿真交易竞赛介绍</h3>
    <p>融资融券业务开展两年多以来，业务规模发展迅速，客户参与热情高涨。但融资融券作为一项专业性较强的创新业务，对于许多客户来说，如何利用好这具有杠杆效应及做空功能的工具，还是较为陌生。</p>
 <p>为了强化客户对融资融券业务的认知，提高客户融资融券实际操作技能，进一步深化融资融券投资者教育工作，广发证券特面向公司内部的融资融券客户及符合融资融券开户条件的客户，举办2012年“融智杯”仿真交易竞赛。为客户提供一个优越的仿真交易环境，让准融资融券客户能提前体验公司融资融券交易系统、消除对融资融券业务的陌生感；让融资融券客户在进一步熟悉融资融券交易系统操作、提高实操技能的同时，能运用融资融券交易策略来实现风险对冲、提升盈利能力，成为专业的融资融券客户。</p>
 <p>为鼓励客户参与本次竞赛，本次仿真交易竞赛除了以“累计收益率”传统指标对参赛客户进行排名并给予相应的奖励以外，还将结合“T+0”交易指标、“ETF”交易指标等对精于运用日内交易策略、与ETF配合的对冲交易策略的客户进行排名并对优胜者给予奖励，以激发客户使用融资融券交易策略的热情。</p>
 <p class="matchAward" >竞赛详情：</p>
 <p style="text-indent:0;">(一)	报名时间：<font style="color:#f00;">2012年6月11日至2012年6月27日</font><br/>
(二)	竞赛时间：<font style="color:#f00;">2012年7月02日至2012年9月28日。</font><br/>
(三)	竞赛排名：每日公布上一交易日收盘后排名数据至竞赛结束。<br/>
(四)	竞赛奖励：广发证券2012年“融智杯”仿真交易竞赛客户组奖励设置及奖励规则如下：</p>
<p class="matchNoTextIndent" ><span class="matchAward" >1.	收益先锋大奖：</span>按竞赛期间，客户仿真信用账户的累计收益率进行排名，产生一等奖1名、二等奖5名、三等奖20名。<br/>
(1) 累计收益率＝（期末净资产－期初净资产）÷期初净资产，按累计收益率由高到低进行排名，排名最高的为第一名，以此类推。<br/>
(2) 一等奖奖品：价值约5000元的奖品；<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;二等奖奖品：价值约3000元的奖品；<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;三等奖奖品：价值约1000元的奖品。</p>
<p class="matchNoTextIndent" ><span class="matchAward" >2.	ETF达人奖：</span>按竞赛期间，客户仿真信用账户ETF成交量及收益率进行排名。<br/>
(1)	ETF指标排名得分＝信用账户ETF成交量占比得分*30%+信用账户收益率排名得分*70%
<p>☆ ETF交易量占比得分=单客户ETF成交量/所有客户ETF总成交量的排名值；</p>
<p>☆ 信用账户收益率排名得分=单客户信用账户收益率在所有客户中的排名值</p>
<P class="matchNoTextIndent">(2)	奖品：前十名可获得价值约2000元的奖品。</p> </p>
<p class="matchNoTextIndent" ><span class="matchAward" >3.	“T+0”达人奖：</span>按竞赛期间，客户仿真信用账户“T+0”操作成交量及账户收益率进行排名。</p>
<p class="matchNoTextIndent">(1) “T+0”指标得分＝“T+0”成交量占比得分*30%+信用账户收益率排名得分*70%</p>
<p>☆ “T+0”成交量占比得分=单客户“T+0”成交量/所有客户“T+0”总成交量的排名值；</p>
<p>☆ 信用账户收益率排名得分=单客户信用账户收益率在所有客户中的排名值</p>
<p class="matchNoTextIndent">(2) 本次仿真交易竞赛定义的“T+0”交易有以下构成：</p>
<p>☆ 融券卖出A+买券还券A</p>
<p>☆ 融券卖出A+直接还券A</p>
<p>☆ 融资买入A+卖券还款 （偿还A对应的资金负债）</p>
<p>☆ 融资买入A+融券卖出A（锁定A证券的盈亏）</p>
<p>☆ 普通买入A+融券卖出A（锁定A证券的盈亏）</p>
<p style="text-indent:0;">(3) 奖品：前十名可获得价值约2000元的奖品。</p>
<p class="matchNoTextIndent" ><span class="matchAward" >4.	合理化建议奖：</span>竞赛期间，参赛客户可根据操作体验，在仿真竞赛客户端向我司提出关于系统优化等合理化建议，经我司采纳后，每位客户可获得价值约500元的奖品。</p>
<p style="text-indent:0;">(五)	奖励规则</p>
<p style="text-indent:0;">1.	在竞赛期间，至少有六笔及以上的成功的融资融券交易。<br/>
2.	在参赛期间，信用账户每月至少有两笔成功的交易流水。<br/>
3.	在竞赛期间，上述各项奖项排名将公布在广发网上，只取客户编号的前后三位数，不会透露客户真实姓名、身份证号等重要信息。<br/>
4.	所得奖励均需扣减个人所得税。<br/>
5.	收益先锋大奖”、“T+0达人奖”“ETF达人奖”三项奖励分开计算，每人只有一个获奖名额，只取奖励最高的一项。</p>
<p style="text-indent:0;">(六)	奖励结果公布</p>
<p>我司将通过“竞赛榜单”的方式，每日公布上一交易日客户仿真交易排名情况至竞赛结束。竞赛榜单仅显示客户对应的营业部名称、昵称及部分客户编号，以便客户识别，不涉及客户的其它个人信息。</p>
<p>我司将在竞赛结束后的一个月内在广发网上公布客户最终的获奖情况，并在结果公布的两周内，通过客户报名时留存的联系电话通知获奖客户。</p>
<p>关于本次“融智杯”融资融券仿真交易竞赛详情，客户可咨询所在营业部。广发证券融资融券业务部对本次“融智杯”融资融券仿真交易竞赛保留最终解释权。</p>

        
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
