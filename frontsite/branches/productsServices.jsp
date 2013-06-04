<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
</style>
</head>

<body class="body_bg">
<jsp:include page="${contextPath }/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt; <a  href="${contextPath }/branches/index.jsp?nav=grgf">分支机构</a> &gt; 产品与服务</div>
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
	                <td width="190" align="center"><a href="${contextPath }/bussinesshall/movetradehall/financingCenter.html"><img src="/pic/branches/cp-01.jpg"/></a></td>
	                <td>
	                  <p class="tblue"><a href="${contextPath }/bussinesshall/movetradehall/financingCenter.html">金管家投资宝典</a></p>
	                  <p>公司顶尖分析师团队倾力打造的系列资讯产品，包括速递系列、内参系列以及策略系列共11个资讯，还涵盖基金、衍生品以及低风险三大品种的资讯产品，为客户投资决策提供权威、专业以及全方位的资讯服务。</p>
	                </td>
	              </tr>
	          </table>
				<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="mt40">
	              <tr>
	                <td width="190" align="center"><a href="${contextPath }/branches/goldManager.html"><img src="/pic/branches/cp-02.jpg"/></a></td>
	                <td><p class="tblue"><a href="${contextPath }/branches/goldManager.html">金管家VIP服务系统</a></p>
	                  <p>为VIP客户开辟独立的快速交易系统， VIP客户享有专用交易席位和丰富的资讯内容、个性化的咨询指导，从而满足VIP客户投资交易的安全、快捷和增值服务需求。</p></td>
	              </tr>
	            </table>
	      		<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="mt40">
	              <tr>
	                <td width="190" align="center"><a href="${contextPath }/branches/ggpteOne.html"><img src="/pic/branches/cp-03.jpg"/></a></td>
	                <td><p class="tblue"><a href="${contextPath }/branches/ggpteOne.html">金管家e对壹短信定制</a></p>
	                  <p>基于客户个性化需求，集合公司各类资讯产品的精华，由总部统一管理和推送的短信服务系统，为客户量身定制个性化的短信资讯套餐。</p></td>
	              </tr>
	            </table>
	      		<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="mt40">
	              <tr>
	                <td width="190" align="center"><a href="${contextPath }/bussinesshall/iptv/iptv.html"><img src="/pic/branches/cp-04.jpg"/></a></td>
	                <td><p class="tblue"><a href="${contextPath }/bussinesshall/iptv/iptv.html">金管家财富频道</a></p>
	                  <p>汇集公司顶级分析师智慧，整合公司强大的信息资源，为客户打造专享的财经证券节目，只需登录广发网站或营业厅即可收看。随时随地为客户联通一线前沿的权威专家，给予最具实战价值的操作指导</p></td>
	              </tr>
	            </table>
	      		<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="mt40">
	              <tr>
	                <td width="190" align="center"><a href="${contextPath }/mobile/index.jsp"><img src="/pic/branches/cp-05.jpg"/></a></td>
	                <td><p class="tblue"><a href="${contextPath }/mobile/index.jsp">金管家手机证券</a></p>
	                  <p>是公司前期推出的“广发移动交易厅”的全面升级版本，支持电信运营商3G网络的同时，加强了操作的方便性，使得功能更全面、性能更稳定，为客户提供最及时丰富的资讯和行情服务，让客户可以随时随地进行证券交易，把握转瞬即逝的投资良机。</p></td>
	              </tr>
	            </table>
	      		<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="mt40">
	              <tr>
	                <td width="190" align="center"><a href="${contextPath }/bussinesshall/95575.html"><img src="/pic/branches/cp-06.jpg"/></a></td>
	                <td><p class="tblue"><a href="${contextPath }/bussinesshall/95575.html">金管家专线95575</a></p>
	                  <p>不论身处何地，只需一个电话，专业的客服团队、一流的理财服务就在客户身边，给客户最便捷和贴心的帮助，为客户排忧解难，助客户运筹帷幄！</p></td>
	              </tr>
	            </table>
	            <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="mt40">
	              <tr>
	                <td width="190" align="center"><a href="${contextPath }/investorEdu/investorSchool.html"><img src="/pic/branches/cp-07.jpg"/></a></td>
	                <td><p class="tblue"><a href="${contextPath }/investorEdu/investorSchool.html">投资者教育园地</a></p>
	                  <p>客观揭示市场风险、普及证券基础知识是公司投资者教育一如既往、常抓不懈的的工作宗旨，分布全国各地223个营业网点的投资者教育园地是加强公司与投资者之间沟通交流的重要窗口，股民学校、股市沙龙、专题讲座等投资者教育活动是引导客户树立正确投资理念的重要渠道。</p></td>
	              </tr>
	            </table>
			<div style="height:30px"></div>
	    </div>
</div>
<jsp:include page="${contextPath }/share/bottom.jsp" />

</body>
</html>