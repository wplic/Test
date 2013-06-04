<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/branches/branches.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.tab_cj{ border:1px solid #ece9d8;}
</style>
</head>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	if(request.getParameter("nav1")!=null&&!request.getParameter("nav1").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav1"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
	if(request.getParameter("nav")!=null&&!request.getParameter("nav").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
	if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav2"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
%>
<body >
<jsp:include page="${contextPath }/share/top.jsp" />
<div class="body_bg">
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt; <a  href="${contextPath }/branches/index.jsp?nav=grgf">分支机构</a> &gt; 产品与服务</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="productsServices_lmenu.jsp" />
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
    <div class="left_tit007">睿组合双向策略<br />
    </div>
    
       <div><img src="${contextPath }/pic/branches/rzh4-p-4.jpg" title="“睿”组合2号" /></div>
    <div class="kline">
      <div class="qiebg">
      
      <div class="p10 lh22"><img src="${contextPath }/pic/branches/rzh1-1.jpg" />
        <p>　　
      “睿”组合双向策略投资示范组合是由广发证券资深投资顾问季星宇、宋峰联手合作，为价值投资取向的投资者提供的专属投资组合彩信产品。组合一方面以财务数据精选价值被低估的优质个股，另一方面提供新股申购完整策略，力争提供固定收益品种最佳配置方案。本组合还引入了融券做空机制，通过先融券卖出股票，待股价下跌后买券还券，实现做空获利，多空双向使得大盘无论涨跌均有获利机会，尤其适合以保值增值为目标的高净值客户。
       <br />
        </p>
        <p>
        	<font color="#0000FF">投资目标：</font>在风险尽量小的前提下追求收益的最大化，力争实现长年正收益之复利效应。<br />
            <font color="#0000FF">投资格言：</font>操守如山，策略若水，有所为，有所不为。<br />
            <font color="#0000FF">投资范围：</font>权益类品种主要为股票，仓位比例30%～100%，单只个股比例最
大不超过30%；固定收益类品种主要包括货币基金、债券逆回购、广发证券金快线等，仓位比例0%～70%。（融券、债券逆回购及广发证券金快线业务请详询当地营业部或致电金管家专线95575。）
<br />
            <font color="#0000FF">初始组合规模：</font>人民币100万元<br />
            <font color="#0000FF">组合成立时间：</font>2012年4月18日<br />
            <font color="#0000FF">组合发送时间：</font>每交易日早上9：00；如有午间操作计划，发送时间为中午12：45<br />
            <font color="#0000FF">组合定制要求：</font>定制客户佣金费率不低于1.5‰<br />
            <font color="#0000FF">组合收费标准：</font>按月收费，500元/月<br />
          </p>
      </div>
      
        <div class="p10 lh22"> <img src="${contextPath }/pic/branches/rzh1-2.jpg" />
		
		<h3 style="font-size: 18px;">注重风险，稳健增值</h3>
		<p>　
			组合以追求资产稳健增值为目标，注重风险控制，崇尚“先立于不败之地，再不失敌之败也”。组合参考了当前国际流行的CPPI、TIPP策略来保持净值稳健增长，致力追求长年正收益之复利效应。组合还对金融市场主要固定收益品种进行监控，并依据固定收益品种的流动性、收益率等指标力争提供动态的最佳配置方案。
        </p>
        
        <h3 style="font-size: 18px;">价值投资，轻松省心</h3>
		<p>　
			组合通过财务数据精选价值被低估的非周期优势企业，不追涨概念炒作型股票，操作频率较低。采取左半边交易策略，即在下跌中逐步买入，待涨至高估时卖出，投资相对省时省心。让投资成为生活的一部分，心态健康，心情轻松愉快。
			 </p>
        
        <h3 style="font-size: 18px;">涨跌皆宜，双向获利</h3>
		<p>　
			组合除了常规的买卖股票外，还通过融券卖出做空，即有做多又有做空，多空双向交易使得大盘无论涨跌均有获利机会。
        </p>
        <h3 style="font-size: 18px;">新股申购策略，优化资金布局</h3>
		<p>　
			组合特提供“新股申购完整策略”，对3日内所有新股提前预估发行价并评估风险，以帮助投资者优化资金布局，提高资金收益率。
        </p>
      </div>
      <!-- 投资经理1 -->
       <div class="p10 lh22"> 
          <img src="/pic/branches/rzh2-1.jpg" />
          <p style="height: 180px;"><br/>
            	<img src="/pic/branches/jxyManager.jpg" align="left" style="margin-right: 4px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;季星宇，资深投资顾问（S0260611020054），证券从业经历15年，广发证券首批优秀分析师，现任广发证券肇庆区域中心首席投资顾问。长期致力于股票投资实战方法研究及资金数据分析 ，擅长对各类型公司进行估值分析及风险控制，对价值投资和技术分析均有深厚的理论功底，“筹码假集中现象”理论、“分层（平行线）分析法”原创者。另精通CPPI策略，熟悉各类固定收益产品及金融衍生产品的套利交易。上海证券报投资理财丛书《股民学校中级教程》作者之一。
          </p>
      </div> 
      <!-- 投资经理2 -->
       <div class="p10 lh22"> 
          <p style="margin-top: 10px;height: 169px;">
            	<img src="/pic/branches/sfManager.jpg" align="left" style="margin-right: 4px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;宋峰，浙江大学技术经济及管理硕士，证券从业5年（S0260611010069），曾为知名证券投资咨询公司高级研究员，现为广发证券浙江分公司专职投资顾问、首席融资融券顾问。善于解读宏观策略、挖掘主题机会和通过财务分析优选行业成长个股，对融资融券多空对冲、配对交易等策略有深入研究。
          </p>
      </div> 
         
		<br />
      <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">定制方法</div>  
      <div class="p10 lh22">
        <p>　　
        广发证券客户请亲临开户营业部柜台办理金管家E对壹彩信“睿”组合定制业务，定制后在T+2日可获得相关的组合资讯。
          <br />
        </p>
      </div>
      <!-- 重要申明  -->
      <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">重要申明 </div>  
      <div class="p10 lh22">
        <p>　　
        本彩信产品中的信息均来源于公开资料，彩信的内容和意见仅供参考，投资者应自行承担投资风险，广发证券不以任何方式向投资者做出不受损失或者取得最低收益的承诺。该信息版权归广发证券所有，未经本公司事先书面许可，任何机构和个人不得以任何形式翻版、复制、引用或转载。否则，本公司将保留随时追究其法律责任的权利。
    </p>
      </div>
      
      <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">风险提示</div>  
      <div class="p10 lh22">
        <p>　　
       投资有风险，组合投资顾问承诺以诚实信用，勤勉尽职的原则管理本组合，但不保证组合一定盈利，也不保证最低收益，投资顾问的过往业绩并不预示其未来表现，也不构成本组合业绩表现的保证。本资料仅作为宣传资料，不作为任何法律文件，投资者定制本产品时请仔细阅读《服务协议》等相关法律文件，谨慎进行投资决策。
      </p>
      </div>
    </div>
    </div>
    
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="${contextPath }/share/bottom.jsp" />
</div>
</body>
</html>