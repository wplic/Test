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
    <div class="left_tit007">“睿”组合2号<br />
    </div>
    
       <div><img src="${contextPath }/pic/branches/rzh2-p-2.jpg" title="“睿”组合2号" /></div>
    <div class="kline">
      <div class="qiebg">
      
      <div class="p10 lh22"><img src="${contextPath }/pic/branches/rzh1-1.jpg" />
        <p>　　
        
     “睿”组合2号短线进取组合是由广发证券两位资深投资顾问罗利长、陈旸联手合作，发挥各自多年积累的经验优势，为中短线交易型客户提供的专属投资组合彩信产品。为您全方位示范选股、选时、仓位比例、止损控制等模拟投资操作，以短线进取的操作方式，力求助您把握市场脉络、捕捉市场热点。
          <br />
        </p>
        <p>
        	<font color="#0000FF">投资目标：</font>捕捉市场热点，合理控制风险，灵活操作组合仓位，追求投资绝对回报。<br />
            <font color="#0000FF">投资理念：</font>积极进取，从容果断，止损风控，耐心收获。<br />
            <font color="#0000FF">投资范围：</font>具有良好流动性的金融工具，包括国内依法发行上市的股票、债券及法律、法规或中国证监会允许投资的其他金融工具。资产配置范围为：股票0%～100%，债券0～100%。<br />
            <font color="#0000FF">初始组合规模：</font>人民币100万元<br />
            <font color="#0000FF">组合成立时间：</font>2012年2月1日<br />
            <font color="#0000FF">组合发送时间：</font>每交易日早上9：00；如有午间操作计划，发送时间为中午12：45<br />
            <font color="#0000FF">组合定制要求：</font>定制客户佣金率不低于1.5‰<br />
            <font color="#0000FF">组合收费标准：</font>按月收费，500元/月<br />
          </p>
      </div>
      
        <div class="p10 lh22"> <img src="${contextPath }/pic/branches/rzh1-2.jpg" />
		
		<h3 style="font-size: 18px;">选股选时，强强联手</h3>
		<p>　
			两位拥有20年证券从业经历的资深投资顾问强强联手，基本面分析和技术分析紧密结合，主动寻找市场投资机会，追求绝对收益。
        </p>
        
        <h3 style="font-size: 18px;">短线灵活，紧贴市场</h3>
		<p>　
			投资顾问在充分研究分析基础上，选择预期短期机会大、技术形态好的投资品种，提供具体品种买卖价位、买卖时机、仓位比例、止损风险控制等专业投资建议，动态跟踪，时效性强，实战参考价值大。
        </p>
        
        <h3 style="font-size: 18px;">专业建议，及时发送</h3>
		<p>　
			投资顾问将提供专业、高品质的投资建议，您可及时通过手机享受到我们快捷、专属的理财服务。
        </p>
      </div>
      <!-- 投资经理1 -->
       <div class="p10 lh22"> 
          <img src="/pic/branches/rzh2-1.jpg" />
          <p><br/>
            	<img src="/pic/branches/llzManager.jpg" align="left" style="margin-right: 4px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;罗利长先生，武汉大学管理学院国际金融专业硕士研究生毕业，资深投资顾问（S0260200010113），证券从业经历20年，历任广发证券经纪业务总部分析师、《广发投资内参》主编、金管家账户投资经理等职务，现任广发证券珠海分公司首席投资顾问。长期担任《珠海特区报》、《珠江晚报》特约撰稿人，《上海证券报》“股金在线”特约投资顾问。擅长基本研究分析，对市场信息与公司研究信息十分敏锐。2006年获聘为《上海证券报》中国证券网首席特约分析师，2009年获聘为北京师范大学珠海分校商业银行研究所客座研究员。曾获上证报中国证券网2007年度“TOP股金在线十大短线王”、2008年度金牌分析师等荣誉称号。2011年获广发证券20年荣誉员工称号。
          </p>
      </div> 
      <!-- 投资经理2 -->
       <div class="p10 lh22"> 
          <p>
            	<img src="/pic/branches/ccManager.jpg" align="left" style="margin-right: 4px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;陈旸先生，资深投资顾问（S0260200010015），证券从业经历20年，首批获得证券分析师执业资格，广发证券首批优秀分析师、首批“广发服务之星”。历任广发证券湖北、福建业务总部区域专职分析师，现任广发证券福建区域中心首席投资顾问。长期担任“中证在线”专家，为《中国证券报》、《上海证券报》、《证券时报》及主流财经网站特约撰稿人。历经市场多次牛熊转换，具有丰富的投资咨询经验和深厚的技术分析功底，擅长市场趋势研究与投资行为分析，市场洞察力敏锐，对市场热点和领涨品种有独到见解。
          </p><br/>
      </div> 
         
		<br />
      <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">定制方法</div>  
      <div class="p10 lh22">
        <p>　　
        
        	广发证券客户请亲临开户营业部柜台办理金管家E对壹彩信“睿”组合2号定制业务，定制后在T+2日可获得相关的组合资讯。
          <br />
        </p>
      </div>
      <!-- 风险提示 -->
      <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">风险提示</div>  
      <div class="p10 lh22">
        <p>　　
        
		投资有风险，组合投资顾问承诺以诚实信用，勤勉尽职的原则管理本组合，但不保证组合一定盈利，也不保证最低收益，投资顾问的过往业绩并不预示其未来表现，也不构成本组合业绩表现的保证。本资料仅作为宣传资料，不作为任何法律文件，投资者定制本产品时请仔细阅读《服务协议》等相关法律文件，谨慎进行投资决策。          <br />
        </p>
      </div>
      
      <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">重要申明</div>  
      <div class="p10 lh22">
        <p>　　
        
本彩信产品中的信息均来源于公开资料，彩信的内容和意见仅供参考，投资者应自行承担投资风险，广发证券不以任何方式向投资者做出不受损失或者取得最低收益的承诺。该信息版权归广发证券所有，未经本公司事先书面许可，任何机构和个人不得以任何形式翻版、复制、引用或转载。否则，本公司将保留随时追究其法律责任的权利。        <br />
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