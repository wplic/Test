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
    <div class="left_tit007">E对壹彩信“睿”组合多空趋势<br />
    </div>
    
       <div><img src="${contextPath }/pic/branches/rzh5-p-5.jpg"  /></div>
    <div class="kline">
      <div class="qiebg">
      
      <div class="p10 lh22"><img src="${contextPath }/pic/branches/rzh1-1.jpg" />
        <p>　　
      “睿”组合多空趋势投资示范组合是由广发证券深圳首席投资顾问何平任组合投资顾问。本组合为“股票+融资融券”类型，在行情趋势上涨时组合可以融资做多，当行情趋势下跌时组合可以融券做空或卖空对冲持仓股票的下跌风险，实现牛市加码投资和熊市卖空赚钱或对冲风险的功能优势。本组合为大盘趋势型投资风格，根据大盘趋势动态调节组合仓位比例，防范风险。组合示范操作包括大势研判、个股选择、买卖时点、昨日操作回顾、今日操作计划、仓位控制、止损止盈控制、研报精粹、股票池等投资操作建议，助您把握市场脉络，捕捉市场机会。
       <br />
        </p>
        <p>
        	<font color="#0000FF">投资目标：</font>根据大盘趋势，通过融资和融券的双向运用，实现资产增值和对冲风险。<br />
            <font color="#0000FF">投资理念：</font>大盘重势，个股重质，仓位控制，灵活配置。<br />
            <font color="#0000FF">投资范围：</font>沪深A股股票及融资融券标的券。<br />
            <font color="#0000FF">初始组合规模：</font>人民币100万元<br />
            <font color="#0000FF">融资融券保证金比例：</font>100%<br />
            <font color="#0000FF">证券折算率：</font>统一为70%<br />
            <font color="#0000FF">组合成立时间：</font>2012年6月1日<br />
            <font color="#0000FF">组合收费标准：</font>按月收费，500元/月"盘前版"每交易日早上8：30发送；如有午间操作计划，"午间版"发送时间为当日中午12：45前发送。<br />
           <font color="#0000FF">组合收费标准：</font>按月收费，500元/月<br />
          </p>
      </div>
      
        <div class="p10 lh22"> <img src="${contextPath }/pic/branches/rzh1-2.jpg" />
		
		<h3 style="font-size: 18px;">专业指导 资讯丰富</h3>
		<p>　
			组合投资顾问何平有证券行业十六年的证券投资咨询经验，立足基本面和技术面分析，长期跟踪市场热点和宏观政策导向，善于把握大盘趋势和风险管理。不仅仅给客户提供投资组合示范操作参考建议，还增设了“研报精粹”、“股票池”资讯栏目和周报荐股跟踪服务，供主动型投资者参考。
        </p>
        
        <h3 style="font-size: 18px;">双向操作 建议明确</h3>
		<p>　
			在行情趋势上涨时组合可以融资做多，当行情趋势下跌时组合可以适当融券做空或卖空对冲持仓股票的下跌风险。本组合根据大势研判，认真选股，明确提出买卖操作示范建议，并提示仓位控制和止损止盈风险防范建议。
		 </p>
        
        <h3 style="font-size: 18px;">专业建议，及时发送</h3>
		<p>　
			投资顾问将提供专业、高品质的投资建议，每个交易日开盘前，您可及时通过手机享受到我们快捷、专属的手机彩信理财资讯服务。
        </p>
      </div>
      <!-- 投资经理1 -->
       <div class="p10 lh22"> 
          <img src="/pic/branches/rzh2-1.jpg"/>
          <p style="height: 180px;"><br/>
            	<img width="119" height="169" src="/pic/branches/hpManager.jpg" align="left" style="margin-right: 4px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;何平，广发证券深圳分公司首席投资顾问（S0260611020193），投资经济硕士，1986年从事军工弹道研究，1996年研究生毕业后从事证券投资资讯工作，立足基本面和技术面分析，长期跟踪市场热点和宏观政策导向，善于把握大盘趋势和风险管理，领悟证券投资相对论的精髓，总结出“433”趋势投资攻防战术，有丰富的证券投资分析实践经验。曾担任中央电视二台、深圳电视台、澳亚卫视、广州广播电视台、交易日及深圳交易所全景网等影视媒体财经节目嘉宾。
          </p>
      </div> 
      
         
		<br />
      <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">定制方法</div>  
      <div class="p10 lh22">
        <p>　　
       广发证券客户请亲临开户营业部柜台办理金管家“睿”组合定制业务，定制后在T+2日可获得相关的组合资讯。
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
     投资有风险，组合投资顾问承诺以诚实信用，勤勉尽职的原则管理本组合，但不保证组合一定盈利，也不保证最低收益，投资顾问的过往业绩并不预示其未来表现，也不构成本组合业绩表现的保证。本资料仅作为宣传资料，不作为任何法律文件，投资者定制本产品时请仔细阅读《服务协议》等相关法律文件，谨慎进行投资决策。（封底内容）
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