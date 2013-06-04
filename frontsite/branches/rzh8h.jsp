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
.boderlt{
border-top:solid #6699FF 1px;
border-left:solid #6699FF 1px;
}
.boderb{
border-bottom:solid #6699FF 1px;
border-right:solid #6699FF 1px;
}
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
    <div class="left_tit007">金管家“睿”组合系列价值优选投资示范组合<br />
    </div>
    
       <div><img src="${contextPath }/pic/branches/rzh8-p-8.jpg"  /></div>
    <div class="kline">
      <div class="qiebg">
      
      <div class="p10 lh22"><img src="${contextPath }/pic/branches/rzh1-1.jpg" />
        <p>　　
      “睿”组合系列之价值优选投资示范组合是由广发证券投资顾问专家团队倾精英力量为青睐价值成长的中高端客户量身打造的专属投资组合彩信产品。该组合由资深投顾在把握经济结构调整和产业升级发展趋势的基础上，重点关注结构升级中的投资机会，深入挖掘具有长期投资价值的优质上市公司，并兼顾传统产业中具备新成长动力的上市公司。为您全方位提供组合持仓、操作计划、调研心得、时机选择、投资思考、财经点评等最新信息和个性化观点，助您演绎财富增值传奇。<br />
        </p>
        <p>
        	<font color="#0000FF">投资目标:</font>专注价值成长型公司，通过精选标的和优化配置，在合理控制投资风险的基础上，追求持续稳健回报。<br />
            <font color="#0000FF">投资理念:</font>回归价值投资,优选个股机会。 <br />
            <font color="#0000FF">投资范围:</font>具有良好流动性的金融工具，包括国内依法发行上市的股票、债券及法律、法规或中国证监会允许投资的其他金融工具。资产配置范围为：股票0%～100%，债券0%～100%。<br />
            <font color="#0000FF">初始组合规模:</font>人民币100万元<br />
            <font color="#0000FF">组合成立时间:</font>2013年1月15日<br />
            <font color="#0000FF">组合发送时间:</font>每交易日早上9：00<br />
            <font color="#0000FF">组合定制要求:</font>佣金费率不低于1.5‰<br />
            <font color="#0000FF">组合收费标准:</font>按月收费，500元/月<br />
          </p>
      </div>
      
        <div class="p10 lh22"> <img src="${contextPath }/pic/branches/rzh1-2.jpg" />
		<h3 style="font-size: 18px; margin-top: 10px;">挖掘价值，优选成长</h3>
		<p>　
		资深顾问团队将紧密跟踪经济脉搏和政策支持方向，积极把握经济结构调整和产业升级发展趋势，重点关注结构升级中的投资机会，积极挖掘具有长期投资价值的优质上市公司，并兼顾传统产业中具备新成长动力的上市公司。
        </p>
        
        <h3 style="font-size: 18px;">强强联合，演绎传奇</h3>
		<p>　
		组合由资深投顾执掌，总部投顾团队和研发支持团队提供支持，丰富的市场经验、深厚的专业背景和强大的研究实力，强强联合，全方位挖掘价值成长机会，为您演绎财富增值。
		 </p>
        
        <h3 style="font-size: 18px;">深度把握，分享成长</h3>
		<p>　
		资深顾问团队通过“自上而下”和“自下而上”的周密研究分析，依托对公司的深度研究，及时的信息掌握，结合市场走向，提供专业、高品质的公司研究资讯，投资顾问看法和具体操作建议，分享公司成长带来的收益，同时也分享投资思路和操作心得体会，力求与客户一起成长。
        </p>
        
      </div>
      <!-- 投资经理1 -->
       <div class="p10 lh22"> 
          <img src="/pic/branches/rzh2-1.jpg"/>
          <p style="height: 240px; margin-top: 10px;">
            	<img width="165" height="240" src="/pic/branches/rzh8-manger.jpg" align="left" style="margin-right: 4px;"/><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;文赋，资深投资顾问（S0260611050006），从事证券投资咨询工作5年，曾在研究机构从事计算机行业研究员工作。2011年初进入广发证券任专职投资顾问，主要从事股票投资策略及TMT行业分析，参与总部投资顾问团队资讯产品制作。
          </p>
      </div > 
       <div class="p10 lh22">
        <h2 style="font-size: 18px;">过往业绩表现</h2>
		<p>　
				2012年7月17日至12月24日，负责的“融资融券配对交易”在未使用杠杆的情况下获得9.21%的绝对收益。
        </p>
      	</div>
		<br />
     
      
	    <div class="p10 lh22"> <img src="${contextPath }/pic/branches/rzh8-2.jpg" />
			<p>　
			广发证券早在2002年组建了经纪业务总部分析师队伍，2010年证监会推出投资顾问业务，广发证券经纪业务总部分析师队伍顺利过渡转型为投资顾问团队，并迅速全面展各项业务。现广发证券总部投资顾问团队成员11人，其中博士1人，硕士8人，全部通过证券投资咨询从业资格考试，其中9位具备注册投资顾问资格，2位具备北美注册财富管理师（CSWP）资格，1位具备特许金融分析师（CFA）资格。团队成员平均证券从业时间近10年，经验丰富。目前研究范围覆盖了股票、基金、债券、股指期货、融资融券等多个品种，触角广泛。广发证券总部投资顾问团队将会秉承广发证券“专业、专心、专为您”的服务精神，与客户和市场共同前行！
			 </p>
	      </div>
      
       <div class="p10 lh22"> <img src="${contextPath }/pic/branches/rzh8-1.jpg" />
			<p>　
			广发证券发展研究中心团队全面覆盖宏观经济、市场策略、固定收益、金融工程、行业与上市公司等研究领域，重点研究逾800家上市公司，依托公司整体资源，深度挖掘上市公司投资价值。十三年的积累，打造出一支拥有近百人的高素质研究团队。在对外部机构研究服务中，屡创佳绩，广发证券发展研究中心在第七届新财富最佳分析师评选中荣获进步最快研究机构第三名奖项，在第八届新财富最佳分析师评选活动中荣获进步最快研究机构第一名。在第九届新财富最佳分析师评选活动中有九个行业上榜入围，在第十届新财富最佳分析师评选活动中荣获本地最佳研究团队第四名，十四个行业上榜入围。广发证券为提升零售客户专业服务水平，秉持“专业、专心、专为您”的服务理念，从发展研究中心行业组抽调数名行业资深分析师组建“睿”组合价值优选研究支持团队，旨在加强公司对内研究服务。目前支持团队共有6位成员，分别是：
			 </p>
	      </div>
      
       <div class="p10 lh22">
    
				       <table width="575" border="0" cellpadding="0" style="text-align: center; vertical-align: middle;" cellspacing="0" class="boderb">
						  <tr>
						    <td width="158" valign="top" class="boderlt"><p align="center"><strong>团队成员 </strong></p></td>
						    <td width="227" valign="top" class="boderlt"><p align="center"><strong>个人简介 </strong></p></td>
						    <td width="189" valign="top" class="boderlt"><p align="center"><strong>负责内部跟踪领域 </strong></p></td>
						  </tr>
						  <tr>
						    <td width="158" bgcolor="#CCCCFF" class="boderlt"><p align="center" style="vertical-align: middle;"><strong>谢  军 </strong></p></td>
						    <td width="227"  bgcolor="#CCCCFF" class="boderlt"><p>广发研发中心总经理助理 <br />
						      7年行业研究经验 <br />
						    中科院研究生院硕士 </p></td>
						    <td width="189"  bgcolor="#CCCCFF" class="boderlt"><p>宏观、策略、金融工程<br />债券、银行、非银行金融<br />公用事业、环保、煤炭</p></td>
						  </tr>
						  <tr>
						    <td width="158"  class="boderlt"><p align="center"><strong>徐博卷 </strong></p></td>
						    <td width="227"  class="boderlt"><p>5年行业研究经验 <br />
						    北京大学电子学硕士 </p></td>
						    <td width="189" valign="top" class="boderlt"><p>计算机、通信  <br />
						    电子、文化传媒  </p></td>
						  </tr>
						  <tr>
						    <td width="158" bgcolor="#CCCCFF" class="boderlt"><p align="center"><strong>张海波 </strong></p></td>
						    <td width="227"  bgcolor="#CCCCFF" class="boderlt"><p>5年行业研究经验 <br />
						    厦门大学金融学硕士 </p></td>
						    <td width="189" valign="top" bgcolor="#CCCCFF" class="boderlt"><p>宏观策略、食品、<br />零售、纺织、农业等大消费跟踪  </p></td>
						  </tr>
						  <tr>
						    <td width="158"   class="boderlt"><p align="center"><strong>汤  俊 </strong></p></td>
						    <td width="227"   class="boderlt"><p>5年行业研究经验 <br />
						    武汉理工大学管理学硕士 </p></td>
						    <td width="189"   class="boderlt"><p>汽车、交通、机械  <br />
						    电力设备、新能源  </p></td>
						  </tr>
						  <tr>
						    <td width="158"   bgcolor="#CCCCFF" class="boderlt"><p align="center"><strong>程振江 </strong></p></td>
						    <td width="227"   bgcolor="#CCCCFF" class="boderlt"><p>3年研发行业研究经验 <br />
						    清华大学材料学博士 </p></td>
						    <td width="189"   bgcolor="#CCCCFF" class="boderlt"><p>建筑建材、房地产  <br />
						    有色、钢铁、轻工  </p></td>
						  </tr>
						  <tr>
						    <td width="158"   class="boderlt"><p align="center"><strong>蔡红辉 </strong></p></td>
						    <td width="227"   class="boderlt"><p>2年研发行业研究经验 <br />
						    浙江大学经济学硕士 </p></td>
						    <td width="189"   class="boderlt"><p>基础化工、生物医药  <br />
						    食品饮料、农林牧渔  </p></td>
						  </tr>
				</table>
          </div>
        <div class="p10 lh22"> 
			<p>　
			广发证券发展研究中心自2012年5月28日（2012年5月为今年股指的最高点）建立中小市值投资组合，至年底组合累计涨幅达41.19%，同期中证500指数累计跌幅为11.01%，组合累计超额收益为52.21%。
			 </p>
			 <br/>
         <img src="/pic/branches/rzh8-stock.jpg" width="600px;"/>
	      </div>
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