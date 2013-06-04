<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
</head>
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=jgj&nav1=zzfwdypr" />
<jsp:include page="/share/pdLogin.jsp" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 网上营业厅 > 我的理财中心 &gt; <a href="${ctx }/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount">我的管家资讯</a></div> 
<div class="wrap920">

	<P><img src="${ctx }/pic/Subscribe/dylc.jpg"  /></P>
  <div class="dybox1" id="list1">
    
    <p align="center" class="font16 bold red p10">风险揭示与免责申明</p>
    <p class="p10 lh22">
    	
    
     尊敬的投资者：<br />
     1、本资讯服务产品仅为投资者提供市场信息、投资参考，投资者应自主进行投资决策，自行承担投资风险，广发证券不做出任何不受损失或者最低收益的承诺。
<br /> 2、本资讯产品中的信息或所表达的意见不构成如何证券买卖的出价或询价，也不构成任何买卖的要约，广发证券不就产品中的任何内容、不对任何投资作出任何形式的担保。
<br /> 3、广发证券将尽最大努力为投资者提供及时全面的参考信息，但不保证这些信息的准确性及完整性，不保证报告信息已做最新变更。金管家资讯产品做出的投资参考所依据的证券研究报告和投资分析意见等，可能存在不准确、不全面或者被误读的风险，投资者应自主进行判断和投资决策，并承担由此造成的风险。
<br /> 4、资讯产品提供的信息及投资参考，具有针对性和时效性，不能在任何市场环境下长期有效，投资者需事先知晓并自行进行投资决策。
<br /> 5、广发证券或关联机构可能会持有资讯产品中涉及的公司所发行的证券并进行交易，还可能为这些公司提供或争取提供承销等服务，各资讯产品之间可能存在意见不一致，投资者应谨慎对待、自主判断。
<br /> 6、广发证券会尽最大努力保证投资者定制的资讯产品能够及时收到，但不排除由于不可抗力或者其他广发证券无法控制的原因，使投资者未能及时或者未收到定制的资讯产品，投资者需自行承担由此可能产生的损失和风险。
<br /> 7、战争、自然灾害等不可抗力因素的出现，将会严重影响证券市场的运行，可能导致广发证券不能履行职责的风险。证券公司存在因停业、解散、撤销、破产，或者被中国证监会撤销相关业务许可、责令停业整顿等原因导致不能履行职责的风险。
<br /> 8、广发证券保留变更套餐内容的权利，并以适当方式进行公示。

      <br /> 
    </p>
    </div>
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
</body>
</html>