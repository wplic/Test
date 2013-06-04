<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwtcdy"%>
<%@page import="com.cssweb.subscribe.service.TcsswebFwtcdyService"%>
<%@page import="com.cssweb.subscribe.service.TcsswebFwtcdySfclService"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwtcdySfcl"%>
<%@page import="com.cssweb.subscribe.service.TcsswebFwcpdyService"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwcpdy"%>
<%@page import="java.text.DecimalFormat"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<%
    DecimalFormat df = new DecimalFormat("0.0###");
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
    TcsswebFwtcdySfclService tcsswebFwtcdySfclService = (TcsswebFwtcdySfclService)ctx.getBean("tcsswebFwtcdySfclService");
    
   List sfcllist=null;
    
    TsystemWebuser tsystemWebuser=null;
	if(request.getSession().getAttribute("tsystemWebuser")!=null)
	tsystemWebuser=(TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
	if(tsystemWebuser!=null) {
	     if(tsystemWebuser.getBranchCode()!=null && !tsystemWebuser.getBranchCode().equals(""))
	     {
	         String branchCode="";
	         if((tsystemWebuser.getBranchCode().substring(0,1)).equals("0") )
	         branchCode=tsystemWebuser.getBranchCode().substring(1,tsystemWebuser.getBranchCode().length());
	         else if ((tsystemWebuser.getBranchCode().substring(0,2)).equals("00") )
	         branchCode=tsystemWebuser.getBranchCode().substring(2,tsystemWebuser.getBranchCode().length());
	         else
	         branchCode=tsystemWebuser.getBranchCode();
	         
	         sfcllist=tcsswebFwtcdySfclService.getTcsswebFwtcdySfclList(branchCode);
	     }
	 }
	 if(sfcllist!=null&&sfcllist.size()>0){
	  //说明取到对应营业部　数据
	 }else{
    sfcllist=tcsswebFwtcdySfclService.getTcsswebFwtcdySfclList("1");
    }
 %>
</head>
<body style=" background:#fff url(/pic/Subscribe/jgjBg.jpg) repeat-x top">
<div class="w929">
	<div class="jgjTop">
    	<p align="right" class="p10"><a href="#"><img src="/pic/Subscribe/logo.jpg" /></a></p>
      	<div class="jgjTxt">
      	<p>
      	<!--  为了更好的满足客户个性化的投资需求，广发证券秉承“以客户为中心”的服务理念，在整合公司资源，不断开发新产品、新服务，完善金管家服务产品体系的前提下，倾力打造了三大金管家服务产品套餐——<span class="font_cs">乐享、优享、尊享套餐</span>。</p>
 <p>在满足客户基本投资交易需求的基础上，金管家服务产品套餐凭借广发证券强大的理财顾问、投资顾问团队，配合丰富的产品体系，辅之以无微不至的亲情服务、增值服务，致力于打造成为客户的投资利器。
 -->
 广发证券金管家资讯是荟集众多国内外市场资讯，涵盖股票、债券、融资融券、股指期货、基金理财等业务产品，整合公司研发中心、资产管理以及投资顾问等业务资源，经由分析师、投资顾问专家团队精工细作，倾力打造的金管家资讯产品服务。
 金管家资讯套餐包括<span class="font_cs">乐享套餐、优享套餐、尊享套餐</span>三大产品，金管家资讯套餐为您轻松理财保驾护航
      	</p>
       </div>
    </div>
    
    <div class="jgjContTop"></div>
  <div class="jgjCont">
   	<!--  
   	<h3>套餐优势</h3>
    <div class="p15 lh22">
        <span class="bold">资源整合，服务打包</span>：三大套餐整合了金管家交易、团队、资讯、亲情、增值五星服务资源，为客户提供一揽子全方位的服务产品。<br />
        <span class="bold">需求导向，量身定制</span>：三大套餐以客户定制为起点，以客户需求为导向，给予客户更多的选择权和自主权，从而更好满足客户的各异需求。<br />
<span class="bold">信息反馈，不断优化</span>：针对客户的选择，有利于广发证券更好地获取客户的需求，了解客户对于服务、产品的反馈，从而改进原有产品，开发新型服务，不断优化产品体系。<br />
    	<span class="bold">差异服务，差异收费</span>：推出金管家服务产品套餐定制服务，能够更好地利用有限资源，提升服务效率与质量。
     </div>
     -->
    
     <h3>套餐级别</h3>
     <div class="p15 lh22">
        金管家根据您的投资需求与投资规模，为您量身定制了三大资讯套餐，供您选择。
        <p><img src="/pic/Subscribe/banL1.jpg" /></p>
        <p>
       广发证券金管家大众资讯套餐，为您提供实用快捷的资讯服务，涵盖大势解盘、热点板块、个股推荐、当日重要新闻点评、周边市场表现、最新重点研发报告推荐、研究机构最新评级等内容。盘中播报让您实时了解投资顾问第一手资讯，助您畅享投资乐趣。
        </p>
       <p><img src="/pic/Subscribe/banL2.jpg" /></p>
        <p>
         
        广发证券金管家高级资讯套餐，公司首席投资顾问为您点评最新市场策略，公司总部投资顾问为您点评权威研究机构的重要报告、基金公司市场观点，是您投资理财不可或缺的利器，助您把握财富未来。
        </p>
        <p><img src="/pic/Subscribe/banL3.jpg" /></p>
        <p>
         
      广发证券金管家顶级资讯套餐，荟集公司总部顶级分析师及投资顾问团队研究成果，提供最及时、最权威的研究报告，享受基金经理般的研究支持，助您尊享财富人生。
      </p>
     </div>
    <h3>服务内容</h3>
      <div class="p15 lh22">
        <table border="0" cellspacing="0" cellpadding="0" width="100%" class="tcTab">
          <tr class="bold">
            <td width="77" nowrap="nowrap" bgcolor="#f5e4d3"><p align="center">类别 </p></td>
            <td width="340" colspan="1" nowrap="nowrap" bgcolor="#f5e4d3"><p align="center">服务内容 </p></td>
            <td width="76" nowrap="nowrap" bgcolor="#f5e4d3"><p align="center">乐享套餐 </p></td>
            <td width="76" nowrap="nowrap" bgcolor="#f5e4d3"><p align="center">优享套餐 </p></td>
            <td width="76" nowrap="nowrap" bgcolor="#f5e4d3"><p align="center">尊享套餐 </p></td>
          </tr>
          <tr>
            <td width="126" nowrap="nowrap" rowspan="8" class="bold"><p align="center">新闻资讯类 </p></td>
            <td width="214" nowrap="nowrap"><p align="left">国内财经 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          <tr>
            <td width="214" nowrap="nowrap"><p align="left">国际财经 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          <tr>
            <td width="214" nowrap="nowrap"><p align="left">港澳台财经 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          
          <tr>
            <td width="214" nowrap="nowrap"><p align="left">行业动态 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          <tr>
            <td width="214" nowrap="nowrap"><p align="left">环球市场 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          <tr>
            <td width="214" nowrap="nowrap"><p align="left">财经时评 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          
          <tr>
            <td width="214" nowrap="nowrap"><p align="left">沪市特别提示 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          <tr>
            <td width="214" nowrap="nowrap"><p align="left">深市特别提示 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          <tr>
            <td width="126" nowrap="nowrap" rowspan="2" class="bold"><p align="center">市场速递类 </p></td>
            <td width="214" nowrap="nowrap"><p align="left">金管家投资速递 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          <tr>
            <td width="214" nowrap="nowrap"><p align="left">金管家盘中播报 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          
          <tr>
            <td width="126" nowrap="nowrap" class="bold"><p align="center">研究内参类 </p></td>
            <td width="214" nowrap="nowrap"><p align="left">金管家内参 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="left">　 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          <tr>
            <td width="126" nowrap="nowrap" rowspan="5" class="bold"><p align="center">产品策略类 </p></td>
            <td width="214" nowrap="nowrap"><p align="left">金管家A股策略报告 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="left">　 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          <tr>
            <td width="214" nowrap="nowrap"><p align="left">金管家基金投资策略 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          <tr>
            <td width="214" nowrap="nowrap"><p align="left">金管家低风险投资策略 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          <tr>
            <td width="214" nowrap="nowrap"><p align="left">金管家衍生品投资策略 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          <tr>
            <td width="214" nowrap="nowrap"><p align="left">金管家专题报告 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">　 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          <!--  
          <tr>
            <td width="126" nowrap="nowrap" rowspan="4"><p align="center">核心库类 </p></td>
            <td width="214" nowrap="nowrap"><p align="left">金管家核心股票库 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="left">　 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          <tr>
            <td width="214" nowrap="nowrap"><p align="left">金管家核心基金库 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          <tr>
            <td width="214" nowrap="nowrap"><p align="left">金管家定投基金库 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          <tr>
            <td width="214" nowrap="nowrap"><p align="left">金管家重点债券库 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          -->
          <tr>
            <td width="126" nowrap="nowrap" rowspan="11" class="bold"><p align="center">研究报告类 </p></td>
            <td width="214" nowrap="nowrap"><p>广发证券晨会纪要 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="left">　 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="left">　 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          <tr>
            <td width="214" nowrap="nowrap"><p>广发期货报告 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="left">　 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          <tr>
            <td width="214" nowrap="nowrap"><p>广发研究报告目录 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          <tr>
            <td width="214" nowrap="nowrap"><p>广发研究报告摘要 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">　 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          <tr>
            <td width="214" nowrap="nowrap"><p>广发研究报告 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">　 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">　 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          <tr>
            <td width="214" nowrap="nowrap"><p align="left">第三方研究报告目录 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          <tr>
            <td width="214" nowrap="nowrap"><p align="left">第三方研究报告摘要 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="left">　 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          <tr>
            <td width="214" nowrap="nowrap"><p align="left">第三方研究报告 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="left">　 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">　 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          <tr>
            <td width="214" nowrap="nowrap"><p align="left">基金看市目录 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          <tr>
            <td width="214" nowrap="nowrap"><p align="left">基金看市摘要 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="left">　 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          <tr>
            <td width="214" nowrap="nowrap"><p align="left">基金看市 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="left">　 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">　 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          <tr>
            <td width="126" nowrap="nowrap" class="bold"><p align="center">财富频道 </p></td>
            <td width="214" nowrap="nowrap"><p>金管家财富频道 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="left">　 </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
            <td width="76" nowrap="nowrap" class="red2"><p align="center">★ </p></td>
          </tr>
          
        </table>
        <p class="p10 red">注：广发证券有权根据最新服务产品体系调整套餐内容。部分服务可能会根据开户营业部进行调整。</p>
      </div>
      
       <!-- <h3>定制流程</h3>
     <div>
     <p><img src="/pic/xu0608/dztips.gif" /></p>
     </div>
     -->
     <h3>收费标准</h3>
     <div class="p15 lh22">
     <p>金管家资讯套餐是依据中国证监会的相关规定，以差异化佣金费率作为定价标准。金管家将根据您的投资规模以及定制的套餐级别来确定您的交易佣金费率，详情请垂询开户营业部或拨打金管家专线95575。</p>
     </div>
     
 <%if(tsystemWebuser!=null) {}else{%>
 <a href="https://119.145.72.232/ECMMS/www/comjsp/ecmms/custorder/onlineorder/OnlineCustOrder.do">
      <h3>预约开户</h3></a>
    <%} %>
     </div>
    <div class="jgjContBot"></div>
</div>
<p align="center" class="p10"><a href="#" onClick="javascript:window.opener=null;window.close();"> <img src="/pic/Subscribe/btnClose.gif"/></a></p>
</body>
</html>