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
    <div class="left_tit007">E对壹彩信广发研发核心资讯<br />
    </div>
    
       <div><img src="${contextPath }/pic/branches/hxzx-p-1.jpg"  /></div>
    <div class="kline">
      <div class="qiebg">
      
      <div class="p10 lh22"><img src="${contextPath }/pic/branches/hxzx_1.jpg" />
        <p>　　
      广发研发核心资讯内容涵盖广发证券发展研究中心对热点行业、事件的专业解读，研发中心最具价值的股票推荐，对大类资产以及行业的配置建议以及明星分析师的策略观点，同时吸收借鉴其他券商的优秀研究成果和观点。我们为您准备的不仅仅是资讯，更不是信息的大杂烩，而是对核心资讯所进行的专业解读，为您揭示资讯背后的内涵，以期为您增加投资成功的概率，产品蕴含了分析推理的逻辑，为您展示研究分析的方法与思路，以期为您提升投资方法有所裨益。<br />
        </p>
        <p>
        	<font color="#0000FF">产品成立时间:</font>2013年1月17日<br />
            <font color="#0000FF">产品发送时间:</font>每交易日早上9：00 <br />
             <font color="#0000FF">产品收费标准:</font>按月收费，彩信版80元/月，短信版30元/月<br />
          </p>
      </div>
      
        <div class="p10 lh22"> <img src="${contextPath }/pic/branches/hxzx_2.jpg" />
		<h3 style="font-size: 18px; margin-top: 10px;">热点行业与事件解读</h3>
		<p>　
		身处信息爆炸时代，没有人有能力阅读所有资讯，也难以辨别哪些信息最具价值，而应对海量信息的良药是获取一份有价值的、精挑细选的资讯。本团队基于广发证券发展研究中心以及部分其他优秀券商研究中心对热点行业与事件的解读，经过精挑细选和专业判断，将最具价值的投资资讯第一时间传递于您。
        </p>
        
        <h3 style="font-size: 18px;">核心股票介绍与推荐</h3>
		<p>　
		随着市场中上市股票数量的不断增加，挑选优质个股的难度在不断提高，同时对股票买卖时点有着更高的要求，投资机会可能稍逊即逝。本团队基于广发证券发展研究中心宏观、策略最新观点以及各行业推荐股票池，同时借鉴吸收其他券商优秀研究报告,经过分级评价，以期将最具有投资价值的标的推荐于您。
		 </p>
        
        <h3 style="font-size: 18px;">大类资产/行业配置建议</h3>
		<p>　
		研究表明，投资收益的获取大部分取决于资产配置，既包括债券、股票、黄金等大类的资产配置，同时也包含股票市场的行业配置。本团队基于上述缘由，借助广发证券发展研究中心宏观、策略、行业比较和债券等研究的优势，向您送上最新的资产配置建议，助力您的财富成长。
        </p>
        
        <h3 style="font-size: 18px;">研发明星分析师观点</h3>
		<p>　
		广发证券发展研究中心是市场最具影响力研究团队，拥有近二十个团队荣登新财富、水晶球和金牛奖榜单，上述明星行业的观点常常为市场投资机构所重点关注。本团队基于广发证券发展研究中心的团队影响力优势，向您奉上明星行业的最新投资观点，与您共享机构投资级别的专业服务。
        </p>
      </div>
      <!-- 投资经理1 -->
       <div class="p10 lh22"> 
          <img src="/pic/branches/hxzx_3.jpg"/><br/>
            <div style="font-size: 18px; margin-top: 10px;">1、	信息敏锐、核心挖掘——广发研发核心资讯主编</div>
          <p style="height: 180px;">
            	<img width="149" height="169" src="/pic/branches/hxzx_im.jpg" align="left" style="margin-right: 4px;"/><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;章丹群：广发证券客户服务部高级投资顾问（S0260611010007）。管理学硕士，近20年证券从业经历，首批取得投资咨询执业资格，曾在广发证券经纪业务管理总部和发展研究中心从事投资咨询和基金研究工作，长期担任中央电视台、证券时报、中国证券报、上海证券报等财经媒体的评论员，具备较强的理论功底和投资分析能力，对证券投资和资讯分析有自己独特和深刻的认识。基于广发证券发展研究中心丰富的研究成果，力争为投资者精选最核心、最有价值、最通俗的资讯。
          </p>
          <p style="height: 180px;">
          <code style="font-size: 18px;">2、	最具影响力的研究支持——广发证券发展研究中心</code><br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;广发证券发展研究中心团队全面覆盖宏观经济、市场策略、固定收益、金融工程、行业与上市公司、市场专题、公司发展战略等研究领域，重点研究逾800家上市公司，依托公司整体资源，深度挖掘上市公司投资价值。十三年的积累，打造出一支拥有近百人的高素质研究团队。广发证券发展研究中心在对外部机构研究服务中屡创佳绩，在第七届新财富最佳分析师评选中荣获进步最快研究机构第三名奖项，在第八届新财富最佳分析师评选活动中荣获进步最快研究机构第一名，在第九届新财富最佳分析师评选活动中有九个行业上榜入围，在第十届新财富最佳分析师评选活动中荣获本地最佳研究团队第四名，十四个行业上榜入围。
广发证券为提升对零售客户的专业服务水平，秉持“专业、专心、专为您”的服务理念，从发展研究中心行业组抽调数名行业资深分析师组建核心资讯研究支持团队，旨在加强公司对内研究服务。目前支持团队共有6位成员，分别是：
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
						    <td width="189"  bgcolor="#CCCCFF" class="boderlt"><p>银行、非银行金融  <br />
						    公用事业、环保、煤炭  </p></td>
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
						    <td width="189" valign="top" bgcolor="#CCCCFF" class="boderlt"><p>宏观、策略、金融工程、 <br />
						    债券 零售、纺织服装、食品饮料  </p></td>
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
        <h2 style="font-size: 18px;">辉煌历史业绩</h2>
		<p>　
				广发证券发展研究中心自2012年5月28日（2012年5月为今年股指的最高点）建立中小市值投资组合，至2012年底组合累计涨跌幅达41.19%。同期中证500指数累计涨跌幅为-11.01%，与中证500指数比较组合累计超额收益为52.21%。
        </p>
       <br/>
         <img src="/pic/branches/hxzx_stock.jpg" width="600px;"/>
      	</div>
          
      
         
		<br />
      <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">定制方法</div>  
      <div class="p10 lh22">
        <p>　　
       广发证券客户可通过营业部柜台、网上交易、广发网、手机证券、金管家专线95575等方式办理开通、变更或撤销金管家E对壹短信定制业务，定制后在T+2日可获得相关的手机信息资讯。
          <br />
        </p>
      </div>
      <!-- 重要申明  -->
      <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">重要申明 </div>  
      <div class="p10 lh22">
        <p>　　
     本产品中的信息均来源于公开资料，产品的内容和意见仅供参考，产品过往业绩不代表客户实际收益率，不预示其未来表现，也不构成本产品业绩表现的保证，投资者应自行承担投资风险，广发证券不以任何方式向投资者做出不受损失或者取得最低收益的承诺。该信息版权归广发证券所有，未经本公司事先书面许可，任何机构和个人不得以任何形式翻版、复制、引用或转载。否则，本公司将保留随时追究其法律责任的权利。
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