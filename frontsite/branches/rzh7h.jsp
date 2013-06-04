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
    <div class="left_tit007">E对壹彩信“睿”组合趋势避险<br />
    </div>
    
       <div><img src="${contextPath }/pic/branches/rzh7-p-7.jpg"  /></div>
    <div class="kline">
      <div class="qiebg">
      
      <div class="p10 lh22"><img src="${contextPath }/pic/branches/rzh1-1.jpg" />
        <p>　　
      睿”组合趋势避险投资示范组合是由广发证券资深投资顾问蔚民、赵非联手合作，为广大投资者提供的一款趋势投资组合彩信产品。组合着眼于趋势投资，即在对市场趋势进行充分研判的情况下，运用控制组合仓位、调整产品结构、改变交易频率等主动策略规避市场风险，把握绝对收益。组合重点关注沪深300成分股，投资策略以中线行情为操作周期，个股以短、中线波段操作为主，辅以融券、债券等金融工具规避波段风险。<br />
        </p>
        <p>
        	<font color="#0000FF">投资目标：</font>顺应市场趋势，灵活配置资产，合理控制风险，追求绝对收益。<br />
            <font color="#0000FF">投资范围：</font>具有良好流动性的金融工具，包括国内依法发行上市的股票、基金、债券及法律、法规或中国证监会允许投资的其他金融工具。本组合大类资产的投资比例范围是：股票、基金占组合资产的0%～100%；债券占组合资产的0%～100%；融券占组合资产的0%～30%。 <br />
             <font color="#0000FF">选股原则：</font>为了提倡正确的价值投资理念，组合将致力于挖掘基于市场及未来趋势的企业价值。选择股票将大部分来源于广发证券系统内各季度报告、月度组合、研究报告，以及广发投资内参中的股票。同时，为了反应市场变化，组合也会根据其他研究报告或者通过技术分析筛选出一部分股票进行投资。风险控制方面采用量化投资策略中动态风险控制策略，对个股设定每日动态止损价并严格执行。力争通过适度提前把握市场热点，精选个股，控制风险，提高组合的投资收益率。 <br />
            <font color="#0000FF">初始组合规模：</font>人民币100万元<br />
           <font color="#0000FF">组合成立时间：</font>2012年9月3日<br />
            <font color="#0000FF">组合发送时间：</font>每交易日早上9：15；如有午间操作计划，发送时间为中午12：45。 <br />
            <font color="#0000FF">组合定制要求：</font>定制客户佣金费率不低于1.5‰。<br />
           <font color="#0000FF">组合收费标准：</font>按月收费，500元/月。<br />
          </p>
      </div>
      
        <div class="p10 lh22"> <img src="${contextPath }/pic/branches/rzh1-2.jpg" />
		
		<h3 style="font-size: 18px;">趋势投资，灵活配置</h3>
		<p>　
			组合秉承趋势投资的理念，对市场趋势进行认真研判后选择合理的买入卖出时机，顺应市场展开操作。通过不同市场趋势下选择不同的投资品种组合，在不同市场环境下有效规避市场风险。
        </p>
        
        <h3 style="font-size: 18px;">积极进取，稳健防御</h3>
		<p>　
			在市场上升趋势中提升组合仓位，精选弹性较大个股，充分把握市场机会，在市场下行趋势中降低组合仓位，配置低风险品种，进行融券交易，追求绝对收益。
		 </p>
        
        <h3 style="font-size: 18px;">关注市场，规避风险</h3>
		<p>　
			组合采用量化投资策略中的动态风险控制策略，在不同的市场环境下，及时调整组合操作策略，根据市场趋势每日设定动态止损价，并严格执行，有效规避非理性市场波动带来的系统性风险冲击。
        </p>
      </div>
      <!-- 投资经理1 -->
       <div class="p10 lh22"> 
          <img src="/pic/branches/rzh2-1.jpg"/>
          <p style="height: 180px;"><br/>
            	<img width="119" height="169" src="/pic/branches/adv1.jpg" align="left" style="margin-right: 4px;"/><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;蔚民，资深投资顾问（S0260611010163），证券从业经历16年，广发证券首批优秀分析师，现任广发证券股份有限公司北京阜成门南大街证券营业部总经理助理。长期致力于多种投资工具投资实战方法研究及资金数据分析，擅长对市场趋势的把握与低风险产品的组合投资，对ETF投资与套利、股指期货与现货投资套利、债券质押式回购及分级基金套利机会挖掘等交易有系统化深入的研究。
          </p>
          <p style="height: 180px;"><br/>
            	<img width="119" height="169" src="/pic/branches/adv2.jpg" align="left" style="margin-right: 4px;"/><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;赵非，投资顾问（S0260611110018），证券从业6年，现任广发证券股份有限公司北京阜成门南大街证券营业部专职投资顾问，金管家投资顾问服务小组负责人。善于解读宏观经济政策、挖掘主题投资机会和通过财务分析甄选行业成长个股。目前担任营业部金管家中短线示范组合投资顾问，自成立以来累计收益远超同期业绩比较基准。
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