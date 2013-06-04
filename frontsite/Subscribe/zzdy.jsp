<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwtcdy"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwcpcx"%>
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page	import="com.cssweb.common.dictionary.service.DictionaryService"%>
<%@page	import="com.cssweb.common.dictionary.pojo.Dictionary"%>
<%@page import="com.cssweb.subscribe.service.TcsswebTipsService"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebTips"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />

</head>
<%
String packageId="8";
String packageName="基础服务资讯"; 
String levelsName="";//服务身体等级名字
ServletContext st = this.getServletConfig().getServletContext();
ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
DictionaryService dictionaryService = (DictionaryService)ctx.getBean("dictionaryService");
TcsswebTipsService tcsswebTipsService = (TcsswebTipsService)ctx.getBean("tcsswebTipsService");
TsystemWebuser tsystemWebuser=null;
Boolean tips=true;
	if(request.getSession().getAttribute("tsystemWebuser")!=null)
	{
	tsystemWebuser=(TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
	if(tsystemWebuser.getLevel()!=null && !tsystemWebuser.getLevel().equals(""))
	 {
	    Dictionary dict = dictionaryService.getDictionaryByParentKeyCodeAndDesc("fwzl",tsystemWebuser.getLevel());
	    levelsName = dict == null ? "" : dict.getKeyName();
	 }
	 if (tsystemWebuser.getUserType().endsWith("2")) {
	        levelsName = "体验";
	 }
	 
	 List listtp=null;
		 if(tsystemWebuser.getUserType()!=null&&tsystemWebuser.getUserType().equals("2")){
		   listtp=tcsswebTipsService.getAllTcsswebTipsByAccount(tsystemWebuser.getServiceName());
		 }else{
		      listtp=tcsswebTipsService.getAllTcsswebTipsByAccount(tsystemWebuser.getUserName());
		  }
		  if(listtp!=null&&listtp.size()>0)
				{
				tips=false;
				}
	
	}
	
%>
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=jgj&nav1=zzfwdypr" />
<jsp:include page="/share/pdLogin.jsp" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 网上营业厅 > 我的理财中心 &gt; <a href="${ctx }/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount">我的管家资讯</a></div><!--  
<jsp:include page="/bussinesshall/movetradehall/financing_submenu.jsp">
		<jsp:param name="nav3" value="zzdysy" />
	</jsp:include>
   -->
  <div class="blank10"></div>
</div>
<div class="wrap920">
  <!--左侧sied开始-->
  <div class="side281 fleft">
  
  		<div class="ltit1">
        	<h5>个人信息</h5>
      		<div class="content lh21">
            	<p>尊敬的<%=tsystemWebuser!=null&&tsystemWebuser.getServiceName()!=null?tsystemWebuser.getServiceName():"" %>，您好：</p>
                <p>您目前的级别属于<span class="red"><%=levelsName %></span>用户，您目前享受的套餐为 <span class="red"><%=packageName %></span>.体验期为一个月。
                <br />您可以进入我的管家资讯进行体验</p>
          <img src="/pic/Subscribe/jgj.jpg" class="fleft" />
          <ul style="margin-top:25px">
                <li>·<a href="${ctx }/golden/index.jsp" target="_blank">金管家服务介绍</a></li>
                <li>·<a href="${ctx }/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount">进入我的管家资讯</a></li>
           </ul>
            <div class="clear"></div>
            </div>
        </div>
        
        <div class="blank10"></div>
    <div class="ltit1">
  <h5><span class="red">基础服务套餐</span>特色介绍</h5>
      		<div class="content lh21">
      		  <p>快捷便利的交易通道，及时全面的市场资讯，温馨的亲情关怀，专业的呼叫服务，您可以在广发证券安心、放心、舒心地进行投资理财。</p>
      		  <br /><br /><br />
        </div>
        </div>
        
        
        
        <div class="blank10"></div>
    
        
        
        
  </div>
  <!--左侧sied结束-->
  
  
  
  
  <!--右侧sied开始-->
  <div class="side626 fright">
  		<p><img src="${ctx }/pic/golden/ban_kh.jpg" width="609" height="74" /></p>
        <div class="blank10"></div>
      <div class="dyTit1">为什么要升级我的套餐？</div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="ggtab">
          <tr>
            <td class="lh22"><p>定制更高级别的服务产品套餐，您可以获得：<br />
              1、更资深的高级理财顾问频度更高的一对一服务，让您获得更贴心、更具价值的团队服务；<br />
              2、更全面、更核心的金管家资讯产品，让您运筹帷幄，决胜千里；<br />
              3、金管家最新、更具特色的产品将优先配置到高级别的套餐之中，没有最好，只有更好，金管家将不断研发出更能满足客户需求的新型产品，补充道套餐之中。<br />
              <cite class="blue3">乐享套餐：</cite>金管家大众服务套餐，专人的跟踪服务，多元化的产品投资策略，简洁而又快捷。<br />
              <cite class="blue3">优享套餐：</cite>金管家高级服务套餐，资深理财顾问服务，总部投资顾问团队的产品支持，让您尽情体验优质服务。<br />
              <cite class="blue3">尊享套餐：</cite>金管家顶级服务套餐，最顶级的理财顾问服务，最详尽的资讯产品体系，最及时的研究报告，让您享受最尊贵的投资体验。 </p></td>
          </tr>
        </table>
        <div class="blank10"></div>    
    <div class="dyTit1">如何升级我的套餐产品?（定制方法）</div>
     <table width="100%" border="0" cellspacing="0" cellpadding="0" class="ggtab">
      <tr>
        <td class="lh22"><p>金管家服务产品套餐的推出，金管家客户除了通过提升客户级别之外，更可以通过提升佣金水平来升级服务产品套餐：<br />
          1、提升您的佣金水平：您可以通过自助定制方式，提交定制申请，系统将自动为您定制套餐以及设置佣金水平；</p>
        <p>2、提升您的客户等级：您可以通过注入资金的方式，向开户营业部提交提升客户等级需求，您的级别提升以后，您可以根据套餐定价规则获取更高级别的套餐。具体注入资金要求，请咨询您的开户营业部。</p></td>
      </tr>
    </table>   
    

	<p class="p10" align="center">
	
	
	<a href="https://119.145.72.232/ECMMS/www/comjsp/ecmms/custorder/onlineorder/OnlineCustOrder.do">
	<input name="" class="dybtn1" type="button" value="我要预约开户" />　</a></p>

        
  </div>
  <!--右侧sied结束-->
  
  
  <div class="clearfloat"></div><!--清除浮动--> 

  
 
</div>
<jsp:include page="/share/bottom.jsp" />
<script src="${ctx }/js/setTab.js"></script>
<script src="${ctx }/js/setImg.js"></script>
<script src="${ctx }/js/csswebutf.js"></script>
<div class="winfix" id="msgview" style="display:none">
<iframe src="" style="width:345px;height:0;top:0px;left:0px;position:absolute;visibility:inherit;z-index:-1;" frameborder=0></iframe>
	<div class="popTit" onmousedown="Effect.Mdrag('msgview',event)" ><em><a href="#" onclick="Effect.openwin('msgview')"><img src="/pic/Subscribe/dot4.jpg" /></a></em>提示</div>
    <div class="popCon">
    	
    尊敬的金管家客户：<br />
    　　为了向您提供更全面、更精细的理财服务，广发证券金管家从2011年5月隆重推出金管家服务产品套餐（乐享套餐、优享套餐、尊享套餐）。您可以根据您的需求选择服务产品套餐。敬请关注。<br />
　　金管家服务产品套餐的推出，将使客户有机会获得金管家更高级别、更有价值的投资理财服务。具体套餐介绍、定制规则和方法请见网站金管家套餐定制模块。
为了答谢客户对金管家一直以来的支持，广发证券将根据您的级别为您自动配备相应的服务套餐。您也可以根据套餐定价规则，选择更高级别的服务套餐。<br />
　　感谢您的支持，让金管家与您共创美好未来。<br />
　　金管家，您的五星专属财富管家！

    </div>
    <div class="popBot">
    	<input name="" onclick="Effect.openwin('msgview');checktipsTo();" type="button" value="我知道了" class="popBtn1" />
    	<input id="checktips" name="checktips" type="checkbox" value="1"/>下次不再提示
    	<iframe id="checktipsifra" name="checktipsifra" marginheight="0" marginwidth="0" frameborder="0" scrolling="no" width="0" height="0"></iframe> 
    	
    </div>
</div>
<div id="winmask" style="display:none"></div> <!-- 遮罩层 --> 
<script type="text/javascript">
	function checktipsTo()
	{
	 alert(document.getElementById("checktips").checked);
	 if(document.getElementById("checktips").checked){
	   var url = "${ctx }/Subscribe/tips.jsp";
	   document.getElementById("checktipsifra").src = url; 
	 }
	}
</script>
</body>
</html>