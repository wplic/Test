<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>睿组合3号_广发证券</title>
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
    <div class="left_tit007">“睿”组合3号<br />
    </div>
    
       <div><img src="${contextPath }/pic/branches/rzh3-p-3.jpg" title="“睿”组合3号" /></div>
    <div class="kline">
      <div class="qiebg">
      
      <div class="p10 lh22"><img src="${contextPath }/pic/branches/rzh1-1.jpg" />
        <p>　　
        
    “睿”组合蓝筹优选投资示范组合是由广发证券投资顾问专家团队精心研究，为稳健型客户提供的专属投资组合产品。2012年以来国内宏观经济继续探底，微观企业盈利也受到冲击，蓝筹股无论从估值、业绩稳定性而言都较中小板、创业板更具投资价值。组合投资标的以低估值蓝筹为主要方向，以中期配置为主要投资策略，力争在保持组合的流动性、稳定性的基础上，为客户实现保值增值的目标。
          <br />
        </p>
        <p>
        	<font color="#0000FF">投资目标：</font>自上而下配置，灵活把握仓位，严格控制风险，追求绝对回报。<br />
            <font color="#0000FF">投资理念：</font>逻辑，专注，审慎，从容。<br />
            <font color="#0000FF">投资范围：</font>具有良好流动性的金融工具，包括国内依法发行上市的股票、债券及法律、法规或中国证监会允许投资的其他金融工具。资产配置范围为：股票0%～100%，债券0～100%。<br />
            <font color="#0000FF">初始组合规模：</font>人民币100万元<br />
            <font color="#0000FF">组合成立时间：</font>2012年1月1日<br />
            <font color="#0000FF">组合发送时间：</font>每交易日早上9：00；如有午间操作计划，发送时间为中午12：45前<br />
            <font color="#0000FF">组合定制要求：</font>：账户资产不低于10万元且佣金率不低于1.5%。<br />
            <font color="#0000FF">组合收费标准：</font>按月收费，500元/月<br />
          </p>
      </div>
      
        <div class="p10 lh22"> <img src="${contextPath }/pic/branches/rzh1-2.jpg" />
		
		<h3 style="font-size: 18px;">淘金蓝筹，分享盛宴</h3>
		<p>　
			截至2012年5月21日，以沪深300为代表的蓝筹股静态市盈率不足13倍，处于历史底部，投资价值凸显；相对于创业板上市公司，蓝筹股在经济下行周期表现出更强的抗风险能力，业绩稳定性更佳；制度层面为“蓝筹复兴”铺路。
        </p>
        
        <h3 style="font-size: 18px;">流动性充足，冲击成本小</h3>
		<p>　
			组合以蓝筹股为主要投资方向，所投资品种具备良好的流动性，尤其适合资金规模较大的稳健型投资者复制，减少由于投资标的流动性不足所造成的冲击成本。
        </p>
        
        <h3 style="font-size: 18px;">注重配置，收益稳定</h3>
		<p>　
			组合以中线配置为主，灵活把握交易性投资机会。实证研究表明，资产配置在投资组合收益贡献决定 因素中占比超过90%，而证券选择和择时以及其他因素占比不超过10%，以中线配置为主的蓝筹优选组合将获取更为稳定的回报。
        </p>
      </div>
      <!-- 投资经理1 -->
       <div class="p10 lh22"> 
          <img src="/pic/branches/rzh2-1.jpg" />
          <p><br/>
            	<img src="/pic/branches/zfManager.jpg" align="left" style="margin-right: 4px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;郑峰:资深投资顾问（S0260611010019），CFAlevel3 candidate。长期在广发证券从事投资研究工作，广发证券总部投资顾问投资策略小组成员，主要研究方向为市场策略、有色金属、采掘、建材、房地产，此前曾先后担任债券、B股及股指期货的研究工作，对大类资产的各个领域都有较为系统的研究。具备较强的宏观分析、大类资产配置、组合管理的理论功底，曾担任金管家价值精选型、资源优选型股票投资示范组合投资顾问，任职以来组合平均收益率跑赢同期业绩比较基准。
         <br /> </p>
      </div>  
		<br /><br /> <br />
      <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">定制方法</div>  
      <div class="p10 lh22">
        <p>　　
        广发证券客户请亲临开户营业部柜台办理金管家E对壹彩信“睿”组合定制业务，定制后在T+2日可获得相关的组合资讯。
          <br />
        </p>
      </div>
      <!-- 重要申明 -->
      <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">重要申明</div>  
      <div class="p10 lh22">
        <p>　　
        本彩信产品中的信息均来源于公开资料，彩信的内容和意见仅供参考，投资者应自行承担投资风险，广发证券不以任何方式向投资者做出不受损失或者取得最低收益的承诺。该信息版权归广发证券所有，未经本公司事先书面许可，任何机构和个人不得以任何形式翻版、复制、引用或转载。否则，本公司将保留随时追究其法律责任的权利。          <br />
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