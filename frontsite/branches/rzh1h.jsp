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
    <div class="left_tit007">“睿”组合1号<br />
    </div>
    
       <div><img src="${contextPath }/pic/branches/rzh1-p-2.jpg" title="“睿”组合1号" /></div>
    <div class="kline">
      <div class="qiebg">
      
      <div class="p10 lh22"><img src="${contextPath }/pic/branches/rzh1-1.jpg" />
        <p>　　
        
     “睿”组合1号是由广发证券投资顾问专家团队精心研究，为中高端客户提供的专属投资组合彩信产品。由资深投资顾问为您全方位提供组合持仓、操作计划、调研心得、时机选择、投资思考、财经点评等最新的个性化观点，力求助您创造投资绝对收益。
          <br />
        </p>
        <p>
        	<font color="#0000FF">投资目标：</font>自上而下配置，灵活把握仓位，严格控制风险，追求绝对回报。<br />
            <font color="#0000FF">投资理念：</font>先抬头看路，再低头拉车；宁静方能致远。<br />
            <font color="#0000FF">投资范围：</font>具有良好流动性的金融工具，包括国内依法发行上市的股票、债券及法律、法规或中国证监会允许投资的其他金融工具。资产配置范围为：股票0%～100%，债券0～100%。<br />
            <font color="#0000FF">初始组合规模：</font>人民币100万元<br />
            <font color="#0000FF">组合成立时间：</font>2011年11月21日<br />
            <font color="#0000FF">组合发送时间：</font>每交易日早上8：30；如有午间操作计划，发送时间为中午12：45前<br />
            <font color="#0000FF">组合定制要求：</font>账户资产不低于人民币30万元且佣金费率不低于2‰<br />
            <font color="#0000FF">组合收费标准：</font>按月收费，500元/月<br />
          </p>
      </div>
      
        <div class="p10 lh22"> <img src="${contextPath }/pic/branches/rzh1-2.jpg" />
		
		<h3 style="font-size: 18px;">专业建议，及时发送</h3>
		<p>　
			投资顾问将提供专业、高品质的投资建议，您可及时通过手机享受到我们快捷、专属的理财服务。
        </p>
        
        <h3 style="font-size: 18px;">精心指导，紧贴市场</h3>
		<p>　
			投资顾问对市场进行周密研究分析，紧贴市场走向，投资思路清晰，提供具体品种的买卖时点、价格和配置比例建议，跟随和复制程度较高。
        </p>
        
        <h3 style="font-size: 18px;">灵活配置，追求回报</h3>
		<p>　
			投资顾问通过资产配置和严格仓位控制，无论在牛市还是熊市，我们力求助您创造投资绝对收益。
        </p>
      </div>
      <!-- 投资经理 -->
       <div class="p10 lh22"> 
          <img src="/pic/branches/rzh1-3.jpg" />
          <p><br/>
            	<img src="/pic/branches/zfManager.jpg" align="left" style="margin-right: 4px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;郑峰，广发证券投资顾问（S0260611010019），金融学硕士，CFA level3 candidate。长期在广发证券从事投资研究工作，投资策略小组成员，主要研究方向为市场策略、有色金属、采掘、建材、房地产，此前曾先后担任债券、B股及股指期货的研究工作，对大类资产的各个领域都有较为系统的研究。具备较强的宏观分析、大类资产配置、组合管理的理论功底，投资风格倾向于自上而下的行业配置，此前先后担任金管家价值精选型和资源优选型股票投资示范组合投资顾问。
          </p><br/><br/>
      </div> 
         
        <div class="p10 lh22">
        <h2 style="font-size: 18px;">过往业绩表现</h2>
		<p>　
				2009年7月至8月代为操作《金管家股票投资示范组合（1号）》接任日组合收益率为7.1%，期间组合最高收益率为19.36%，区间收益率接近12%。
        </p>
        <p>　
				2010年任《金管家股票投资示范组合——价值精选型》投资顾问一期（1.1-6.30）：在市场单边下跌的情况下，通过仓位控制，优化行业配置，精选个股，一度实现正收益，最终超越比较基准约13个百分点。 二期（7.1-12.31）：期间组合最高收益率达47.16%,最终超越同期沪深300指数10个百分点。
        </p>
        <p>　
				2011年任《金管家股票投资示范组合——价值精选型》投资顾问在市场单边下跌的情况下，获得全部股票型基金的平均收益。
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
      <!-- 重要声明 -->
        <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">重要申明</div>  
      <div class="p10 lh22">
        <p>　　
        
       	本彩信产品中的信息均来源于公开资料，彩信的内容和意见仅供参考，投资者应自行承担投资风险，广发证券不以任何方式向投资者做出不受损失或者取得最低收益的承诺。该信息版权归广发证券所有，未经本公司事先书面许可，任何机构和个人不得以任何形式翻版、复制、引用或转载。否则，本公司将保留随时追究其法律责任的权利。
        <br />
        </p>
      </div>
      <!-- 风险提示 -->
      <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">风险提示</div>  
      <div class="p10 lh22">
        <p>　　
        
        	投资有风险，投资经理承诺以诚实信用，勤勉尽职的原则管理本组合，但不保证组合一定盈利，也不保证最低收益，投资经理的过往业绩并不预示其未来表现，也不构成本组合业绩表现的保证。本资料仅作为宣传资料，不作为任何法律文件，投资者定制本产品时请仔细阅读《服务协议》等相关法律文件，谨慎进行投资决策。
          <br />
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