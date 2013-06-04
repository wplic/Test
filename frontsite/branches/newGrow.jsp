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
    <div class="left_tit007">“睿”组合新兴成长<br />
    </div>
    
       <div><img src="${contextPath }/pic/branches/newGrow-p-4.jpg" title="“睿”组合新兴成长" /></div>
    <div class="kline">
      <div class="qiebg">
      
      <div class="p10 lh22"><img src="${contextPath }/pic/branches/rzh1-1.jpg" />
        <p>　
       “睿”组合新兴成长投资示范组合是由广发证券投资顾问专家团队精心研究，为青睐新兴成长产业的中高端客户提供的专属投资组合彩信产品。由资深投资顾问在把握经济结构调整和产业升级发展趋势基础上，重点关注新兴产业发展中的投资机会，积极挖掘新兴产业中的优质上市公司，并兼顾传统产业中具备新成长动力的上市公司。为您全方位提供针对上述公司的组合持仓、操作计划、调研心得、时机选择、投资思考、财经点评等最新的个性化观点，力求助您分享经济成长中的机会，创造投资收益。
          <br />
        </p>
        <p>
        	<font color="#0000FF">投资目标：</font>专注新兴成长公司，通过精选标的和组合配置，在合理控制投资风险的基础上，追求稳健回报。<br />
            <font color="#0000FF">投资理念：</font>机遇总是留给有准备的人，风险和收益博弈间追求持续增长。<br />
            <font color="#0000FF">投资范围：</font>具有良好流动性的金融工具，包括国内依法发行上市的股票、债券及法律、法规或中国证监会允许投资的其他金融工具。资产配置范围为：股票0%～100%，债券0～100%。<br />
            <font color="#0000FF">初始组合规模：</font>人民币100万元<br />
            <font color="#0000FF">组合成立时间：</font>012年3月19日<br />
            <font color="#0000FF">组合发送时间：</font>每交易日早上9：00；如有午间操作计划，发送时间为中午12：45<br />
            <font color="#0000FF">组合定制要求：</font>账户资产不低于人民币10万元且佣金费率不低于2‰<br />
            <font color="#0000FF">组合收费标准：</font>按月收费，688元/月<br />
          </p>
      </div>
      
        <div class="p10 lh22"> <img src="${contextPath }/pic/branches/rzh1-2.jpg" />
		
		<h3 style="font-size: 18px;">紧跟经济，专注新兴</h3>
		<p>　
			投资顾问将紧跟经济脉搏和政策支持方向，积极把握经济结构调整和产业升级发展趋势，重点关注新兴产业发展中的投资机会，积极挖掘新兴产业中的优质上市公司，力求尽享政策支持红利，助您分享经济成长中的机会。
        </p>
        
        <h3 style="font-size: 18px;">团队支持，强强联合</h3>
		<p>　
			组合将由总部投资顾问团队和研发中小市值研究小组提供后台支持，将丰富的市场经验、深厚的专业背景和强大的研究实力进行有效结合，伸展视角，强强联合，主动寻求市场机会。
        </p>
        
        <h3 style="font-size: 18px;">深度把握，分享成长</h3>
		<p>　
			投资顾问通过“自上而下”和“自下而上”的周密研究分析，依托对公司的深度研究，及时的信息掌握，结合市场走向，提供专业、高品质的公司研究资讯，投资顾问看法和具体操作建议，分享公司成长带来的收益，同时也分享投资思路和操作心得体会，力求与客户一起成长。
        </p>
      </div>
      
      <!-- 投资经理 -->
       <div class="p10 lh22"> 
          <p>
            	<img src="/pic/branches/cdManager.jpg" align="left" style="margin-right: 4px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;陈达，资深投资顾问（S0260611010020），CFA Level 2 candidate，从事证券投资咨询工作5年，积累了较为丰富的实践经验，对国内资本市场具有全面、深刻的认识，擅长把握行业趋势性机会和上市公司基本面估值分析，曾担任投资快报，财经927，香港now财经等媒体特邀采访嘉宾。2010年初进入广发证券任专职分析师，主要从事股票投资策略及化工行业分析，参与总部投资顾问团队资讯产品制作，并荣获 “白金分析师”称号。
          </p><br/>
      </div>          
		<br /><br /> <br />
		<!-- 过往业绩表现 -->
      <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">过往业绩表现</div>  
      <div class="p10 lh22">
        <p>　　        
        	2010年在广发证券首届“股林高手”模拟炒股大赛中以52.83%的收益率位列专职分析师排名第三。2011年操作的金管家投顾4号模拟示范组合年收益率-11.44%，超越同期沪深300指数13.57%。2012年1月1日至3月13日，操作的“金管家股票投资示范组合（新兴成长型）”取得11.21%收益。
          <br />
        </p>
      </div>
		 <!-- 定制方法 -->
      <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">定制方法</div>  
      <div class="p10 lh22">
        <p>　　        
        	广发证券客户请亲临开户营业部柜台办理金管家E对壹彩信“睿”组合定制业务，定制后在T+2日可获得相关的组合资讯。
          <br />
        </p>
      </div>
      <!-- 重要声明 -->
      <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">重要声明</div>  
      <div class="p10 lh22">
        <p>　　        
        	本彩信产品中的信息均来源于公开资料，彩信的内容和意见仅供参考，投资者应自行承担投资风险，广发证券不以任何方式向投资者做出不受损失或者取得最低收益的承诺。该信息版权归广发证券所有，未经本公司事先书面许可，任何机构和个人不得以任何形式翻版、复制、引用或转载。否则，本公司将保留随时追究其法律责任的权利。
          <br />
        </p>
      </div>
      <!-- 广发证券总部投资顾问团队介绍 -->
      <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">广发证券总部投资顾问团队介绍</div>  
      <div class="p10 lh22">
        <p>　　        
        	广发证券早在2002年组建了总部专职分析师队伍，2010年证监会推出投资顾问业务，广发证券总部专职分析师队伍顺利过渡转型为投资顾问团队，并迅速全面展各项业务。现广发证券总部投资顾问团队成员11人，其中博士1人，硕士8人，全部通过证券投资咨询从业资格考试，其中9位具备注册投资顾问资格，2位具备北美注册财富管理师（CSWP）资格，1位具备特许金融分析师（CFA）资格。团队成员平均证券从业时间近10年，经验丰富。目前研究范围覆盖了股票、基金、债券、股指期货、融资融券等多个品种，触角广泛。广发证券总部投资顾问团队将会秉承广发证券“专业、专心、专为您”的服务精神，与客户和市场共同前行！
          <br />
        </p>
      </div>
      <!-- 广发证券发展研究中心团队介绍 -->
      <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">广发证券发展研究中心团队介绍</div>  
      <div class="p10 lh22">
        <p>　　        
        	广发证券发展研究中心团队全面覆盖宏观经济、市场策略、固定收益、金融工程、行业与上市公司、市场专题、公司发展战略等研究领域。重点研究逾800家上市公司，依托公司整体资源，深度挖掘上市公司投资价值。在房地产、汽车、机械、交通运输、零售、金融工程、建材、家电、电力设备新能源、电力、计算机/军工、建筑、钢铁、中小市值公司等领域研究优势显著。十三年的积累，打造出一支拥有九十余人的高素质研究团队。在第七届新财富最佳分析师评选中荣获进步最快研究机构第三名奖项。在第八届新财富最佳分析师评选活动中荣获进步最快研究机构第一名、最佳销售团队第九名奖项。率先在金融行业设立首家博士后工作站，十年耕耘，硕果累累。
        </p>
        <p style="text-indent: 27px;">
            2011年底成立中小市值研究小组，由行业资深分析师组成，团队专业知识丰富，研究能力突出，小组成员分别来自环保、电子、建材、化工、汽车和新能源等研究领域，集中研究七大新型战略产业相关上市公司，为客户寻找未来有巨大成长空间的优质中小市值投资标的。小组组长谢军，中科院研究生院硕士，研发中心总经理助理，负责节能减排、环保等领域研究。小组成员汤俊，武汉理工大学技术经济及管理硕士，负责新能源汽车及电池、消费类研究， 2010年、2011年汽车行业新财富排名分别位列第四和第二名。

          <br />
        </p>
      </div>
      <!-- 风险提示 -->
      <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">风险提示</div>  
      <div class="p10 lh22">
        <p>　　        
		投资有风险，组合投资顾问承诺以诚实信用，勤勉尽职的原则管理本组合，但不保证组合一定盈利，也不保证最低收益，投资顾问的过往业绩并不预示其未来表现，也不构成本组合业绩表现的保证。本资料仅作为宣传资料，不作为任何法律文件，投资者定制本产品时请仔细阅读《服务协议》等相关法律文件，谨慎进行投资决策。     <br />
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