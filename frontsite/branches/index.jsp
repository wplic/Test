<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/branches/branches.css" rel="stylesheet" type="text/css" />
<style>
.fzjgbox{ width:920px; margin:0 auto; background:#ffffff}
.fzjgbox .content{ background:#ffffff; border:0px solid #d5d5d7; margin:6px;}
.fzjgbox .cpfw_bg1{ background:url(pic/cpfw_bg1.jpg) repeat-x; height:249px}
.fzjgbox p{ font-size:12px; padding:0px; margin:0px; line-height:22px; color:#4d4c4a; padding-left:5px}
.fzjgbox p.tblue{ color:#143d75; font-weight:bold; font-size:14px}
.mt40{ margin-top:40px}
body,ul,li{ margin:0px; padding:0px}
</style>
</head>

<body class="body_bg">
<jsp:include page="${contextPath }/share/top.jsp?nav=grgf&nav1=jjywjs" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt; <a href="${contextPath }/branches/index.jsp?nav=grgf">分支机构</a>  &gt; 经纪业务介绍</div>
  <p align="center"><img src="/pic/branches/banner1.jpg" title="广发证券经纪业务介绍" /></p>
  <div class="blank10"></div>
  <div class="branchtit1">一、我们为您提供</div>
   <ul style=" margin:10px;line-height:21px;list-style:none;">
	  <li><span  style=" font-family:'宋体'">·</span>代理国内流通A股、B股、国债、企业债券等买卖</li>
	  <li><span  style=" font-family:'宋体'">·</span>代理国债、企业债的还本付息业务</li>
	  <li><span  style=" font-family:'宋体'">·</span>代理上市公司办理投资者的分红派息业务</li>
	  <li><span  style=" font-family:'宋体'">·</span>未上市证券的代保管、鉴证业务</li>
	  <li><span  style=" font-family:'宋体'">·</span>代理上海、深圳证券登记公司办理登记开户业务</li>
	  <li><span  style=" font-family:'宋体'">·</span>代理开放式基金销售业务</li>
	  <li><span  style=" font-family:'宋体'">·</span>代理国债回购业务</li>
	  <li><span  style=" font-family:'宋体'">·</span>代办股份转让业务</li>
	  <li><span  style=" font-family:'宋体'">·</span>期货IB代理业务</li>
	</ul>  
  <div class="branchtit1">二、我们的优势</div>
  <div class="branchtit1">1、重视投资者教育，正确引导客户</div>
  <p class="branchp1" style="text-indent:0px;">
  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公司率先在国内旗帜鲜明地倡导客户理性投资。<br />
  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2000年推出的“理性投资北京行、深沪行”等系列活动，开创了中国券商组织客户走访上市公司、倡导客户理性投资的先河。<br />
  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2002年推出CRM系统（客户关系管理系统）、IP/TV视频广播系统，逐步实施区域集中交易，建立公司统一的资讯服务平台。<br />
  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2003年推出管理型账户计划，对VIP客户进行资产配置规划建议指导。<br />
  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2007年成立投资者教育工作组，建立投资者教育园地，多层次、全方位地开展投资者教育活动。<br />
  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2008年启用全国统一客服热线95575，完善了公司金管家客户服务体系。<br />
  </p>
  <div class="branchtit1">服务热诚 产品创新领先</div>
  <p class="branchp1" style="text-indent:0px;">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;从2005年起，公司培养和建立了一支具专业素质和职业道德的客户服务团队，不仅在公司遍布全国的营业网点开展业务,更与国内15家主流银行建立了合作关系，在3000多个银行网点驻点服务。<br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公司推出的金管家客户服务体系，不仅满足客户日常投资交易咨询服务的基本需求，还为高端客户提供VIP交易通道，推送个性化的资产配置建议和金管家投资示范组合等服务。</p>
  <div class="branchtit1">营业网点广布，数量全国前列</div>
  <p class="branchp1">截至2009年<span class="red bold">8</span>月，公司共拥有证券营业部<span class="red bold">173</span>家，证券服务部<span class="red bold">16</span>家，营业网点已经遍布珠江三角洲、长江三角洲、渤海湾、华南、东北、华北等经济发达地区，战略布局日趋完善，经纪业务体系已经形成了相当规模，列居国内券商前三。</p>
  <div class="branchtit1">三、我们的业绩</div>
  <p class="branchp1">经纪业务系统服务客户近300万，托管客户资产超过2000亿元。2008年共完成总成交量26180.4亿元，其中完成股票基金的总成交量为21966.58亿元，在各大券商中排名第六。</p>
  <div>
  	<table width="90%" border="1">
  		<tr align="center">
  			<td width="15%" class="info_th01">年份</td>
  			<td width="45%" class="info_th01">市场排名</td>
  			<td width="20%" class="info_th01">证券交易总额(亿元)</td>
  			<td width="20%" class="info_th01">股票基金交易额(亿元)</td>
  		</tr>
  		<tr>
  			<td align="center" class="p10">2003</td>
  			<td class="p10">交易总额在沪深两个交易所分别排名第四和第八位</td>
  			<td class="p10">5172</td>
  			<td class="p10">1903</td>
  		</tr>
  		<tr>
  			<td align="center" class="p10">2004</td>
  			<td class="p10">交易总额全国排名第七</td>
  			<td class="p10">4764</td>
  			<td class="p10">2506</td>
  		</tr>
  		<tr>
  			<td align="center" class="p10">2005</td>
  			<td class="p10">交易总额在沪深两个交易所分别排名第五和第十位</td>
  			<td class="p10">2925</td>
  			<td class="p10">2029</td>
  		</tr>
  		<tr>
  			<td align="center" class="p10">2006</td>
  			<td class="p10">交易总额全国排名第四位</td>
  			<td class="p10">10507</td>
  			<td class="p10">8960</td>
  		</tr>
  		<tr>
  			<td align="center" class="p10">2007</td>
  			<td class="p10">交易总额全国排名第六位</td>
  			<td class="p10">44569</td>
  			<td class="p10">39887</td>
  		</tr>
  		<tr>
  			<td align="center" class="p10">2008</td>
  			<td class="p10">交易总额全国排名第八位，股票基金交易总额全国排名第六位</td>
  			<td class="p10">26180</td>
  			<td class="p10">21966</td>
  		</tr>
  	</table>
  </div>
  <p class="branchp1">数据来源：wind</p>
  <div class="branchtit1">四、我们的产品及服务Products and Services</div>
	<div class="fzjgbox">
		<div class="content">
	    	<div class="cpfw_bg1">
	        	<div style="height:30px"></div>
	            <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
	              <tr>
	                <td width="76%"><img src="/pic/branches/cpfw_txt.gif" width="539" height="137" /></td>
	                <td width="24%" align="right"><img src="/pic/branches/p-jgj.jpg" width="137" height="157" /></td>
	              </tr>
	            </table>
	          
	      </div>
	      <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
	              <tr>
	                <td width="190" align="center"><img src="/pic/branches/cp-01.jpg"/></td>
	                <td>
	                  <p class="tblue">金管家投资宝典</p>
	                  <p>公司顶尖分析师团队倾力打造的系列资讯产品，包括速递系列、内参系列以及策略系列共11个资讯，还涵盖基金、衍生品以及低风险三大品种的资讯产品，为客户投资决策提供权威、专业以及全方位的资讯服务。</p>
	                </td>
	              </tr>
	          </table>
				<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="mt40">
	              <tr>
	                <td width="190" align="center"><img src="/pic/branches/cp-02.jpg"/></td>
	                <td><p class="tblue">金管家VIP服务系统</p>
	                  <p>为VIP客户开辟独立的快速交易系统， VIP客户享有专用交易席位和丰富的资讯内容、个性化的咨询指导，从而满足VIP客户投资交易的安全、快捷和增值服务需求。</p></td>
	              </tr>
	            </table>
	      		<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="mt40">
	              <tr>
	                <td width="190" align="center"><img src="/pic/branches/cp-03.jpg"/></td>
	                <td><p class="tblue">金管家e对壹短信定制</p>
	                  <p>基于客户个性化需求，集合公司各类资讯产品的精华，由总部统一管理和推送的短信服务系统，为客户量身定制个性化的短信资讯套餐。</p></td>
	              </tr>
	            </table>
	      		<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="mt40">
	              <tr>
	                <td width="190" align="center"><img src="/pic/branches/cp-04.jpg"/></td>
	                <td><p class="tblue">金管家财富频道</p>
	                  <p>汇集公司顶级分析师智慧，整合公司强大的信息资源，为客户打造专享的财经证券节目，只需登录广发网站或营业厅即可收看。随时随地为客户联通一线前沿的权威专家，给予最具实战价值的操作指导</p></td>
	              </tr>
	            </table>
	      		<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="mt40">
	              <tr>
	                <td width="190" align="center"><img src="/pic/branches/cp-05.jpg"/></td>
	                <td><p class="tblue">金管家手机证券</p>
	                  <p>是公司前期推出的“广发移动交易厅”的全面升级版本，支持电信运营商3G网络的同时，加强了操作的方便性，使得功能更全面、性能更稳定，为客户提供最及时丰富的资讯和行情服务，让客户可以随时随地进行证券交易，把握转瞬即逝的投资良机。</p></td>
	              </tr>
	            </table>
	      		<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="mt40">
	              <tr>
	                <td width="190" align="center"><img src="/pic/branches/cp-06.jpg"/></td>
	                <td><p class="tblue">金管家专线95575</p>
	                  <p>不论身处何地，只需一个电话，专业的客服团队、一流的理财服务就在客户身边，给客户最便捷和贴心的帮助，为客户排忧解难，助客户运筹帷幄！</p></td>
	              </tr>
	            </table>
	            <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="mt40">
	              <tr>
	                <td width="190" align="center"><img src="/pic/branches/cp-07.jpg"/></td>
	                <td><p class="tblue">投资者教育园地</p>
	                  <p>客观揭示市场风险、普及证券基础知识是公司投资者教育一如既往、常抓不懈的的工作宗旨，分布全国各地223个营业网点的投资者教育园地是加强公司与投资者之间沟通交流的重要窗口，股民学校、股市沙龙、专题讲座等投资者教育活动是引导客户树立正确投资理念的重要渠道。</p></td>
	              </tr>
	            </table>
			<div style="height:30px"></div>
	    </div>
	</div>
</div>
</body>
<jsp:include page="${contextPath }/share/bottom.jsp" />
</html>