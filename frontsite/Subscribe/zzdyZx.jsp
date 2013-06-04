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
<%@page	import="com.cssweb.subscribe.pojo.TcsswebFwcpcx"%>
<%@page	import="com.cssweb.subscribe.pojo.TcsswebFwcpysl"%>
<%@page	import="com.cssweb.subscribe.service.TcsswebFwcpcxService"%>
<%@page	import="com.cssweb.subscribe.service.TcsswebFwcpyslService"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
</head>
<%
Boolean tip=true;
if(request.getParameter("xkxx")!=null&&!request.getParameter("xkxx").equals("")&&request.getParameter("xkxx").equals("1"))
{
 tip=false;
}
String packageId="8";
String packageName="尊享套餐"; 
String levelsName="";//服务身体等级名字
List userlist=null;
String sjurl="/Subscribe/zzdy.jsp";
ServletContext st = this.getServletConfig().getServletContext();
ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
DictionaryService dictionaryService = (DictionaryService)ctx.getBean("dictionaryService");
TcsswebFwcpcxService tcsswebFwcpcxService = (TcsswebFwcpcxService)ctx.getBean("tcsswebFwcpcxService");
TcsswebFwcpyslService tcsswebFwcpyslService = (TcsswebFwcpyslService)ctx.getBean("tcsswebFwcpyslService");
TsystemWebuser tsystemWebuser=null;
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
	        userlist=tcsswebFwcpcxService.getTcsswebFwcpcxListByAccount(tsystemWebuser.getServiceName() );
	 }else{
	 userlist=tcsswebFwcpcxService.getTcsswebFwcpcxListByAccount(tsystemWebuser.getUserName());
	 List listsl=tcsswebFwcpyslService.getFwcpyslByAccount(tsystemWebuser.getUserName());
		 if(listsl!=null&&listsl.size()>0&&tip==true )
		 {
		   %>
			  <script type="text/javascript">
			        alert(" 您目前尚有未处理的订单，我们将尽快与您联系，请耐心等待，谢谢。您也可联系您的开户营业部。");
			        var url = "/tcsswebFwcpyslAtion.do?method=getTcsswebFwcpyslListByAccount";
				  	document.location.href=url;
			       </script>
			 <%
		 }
		 if(listsl==null&&tip==true){
		%>
			  <script type="text/javascript">
			        alert("对不起，您定制的套餐已经为最高等级了，无法在进行升级！");
			   </script>
					 <%
		}
	 }
		if(userlist!=null&&userlist.size()>0)
		{
		 TcsswebFwcpcx tcsswebFwcpcx=(TcsswebFwcpcx)userlist.get(0);
		 packageId=String.valueOf(tcsswebFwcpcx.getProductId());
		 if(packageId.equals("8"))
		 packageName="基础服务资讯";
		 else if(packageId.equals("9"))
		 packageName="乐享套餐";
		 else if(packageId.equals("10"))
		 packageName="优享套餐";
		 else if(packageId.equals("11"))
		 packageName="尊享套餐";
		 
		 if(packageId.equals("8"))
	    sjurl="/Subscribe/zzdy2.jsp";
	    if(packageId.equals("9"))
	    sjurl="/Subscribe/zzdyLx.jsp";
	    else if(packageId.equals("10"))
	     sjurl="/Subscribe/zzdyYx.jsp";
	    else if(packageId.equals("11"))
	     sjurl="/Subscribe/zzdyZx.jsp";
		}
	}


%>
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=jgj&nav1=zzfwdypr" />
<jsp:include page="/share/pdLogin.jsp" />

<div class="main">
 <div class="dqwz">当前位置：首页 > 网上营业厅 > 我的理财中心 &gt; <a href="${ctx }/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount">我的管家资讯</a></div>  
<div class="wrap920">
  <!--左侧sied开始-->
  <div class="side281 fleft">
  
  		<div class="ltit1">
        	<h5>个人信息</h5>
      		<div class="content lh21">
            	<p>尊敬的<%=tsystemWebuser!=null&&tsystemWebuser.getServiceName()!=null?tsystemWebuser.getServiceName():"" %>，您好：</p>
                <p>您目前的级别属于<span class="red"><%=levelsName %></span>用户，您目前享受的套餐为 <span class="red"><%=packageName %></span>.</p>
         <p align="right" class="p50">
			<!-- 
			<a href="${ctx }/Subscribe/tdtclc.jsp"><img src="${ctx }/pic/Subscribe/btn_td.jpg" /></a>
			-->
			
			<a href="${ctx }<%=sjurl %>"><img src="${ctx }/pic/Subscribe/btn_sj.jpg" /></a>
			<a href="${ctx }/Subscribe/tdtc.jsp"><img src="/pic/xu0608/btn_td.gif" /></a>
			
			</p>
          <img src="/pic/Subscribe/jgj.jpg" class="fleft" />
          <ul style="margin-top:25px">
               <li>·<a href="${ctx }/golden/index.jsp" target="_blank">金管家服务介绍</a></li>
                <li>·<a href="${ctx }/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount">进入我的管家资讯</a></li>
            <li>·<a href="${ctx }/tcsswebFwcpyslAtion.do?method=getTcsswebFwcpyslListByAccount">套餐定制情况查询</a></li>
            </ul>
            <div class="clear"></div>
            </div>
        </div>
        
        <div class="blank10"></div>
    <div class="ltit1">
  <h5><span class="red">优享</span>特色介绍</h5>
      		<div class="content lh21" style="min-height:200px; _height:200px">
            <p align="center"><img src="${ctx }/pic/Subscribe/banL3.jpg" /></p>
            <p>
            
             广发证券金管家顶级资讯套餐，荟集公司总部顶级分析师及投资顾问团队研究成果，提供最及时、最权威的研究报告，享受基金经理般的研究支持，助您尊享财富人生。
            </p>
	    </div>
        </div>
        <div class="blank10"></div>
  </div>
  <!--左侧sied结束-->
  
  <!--右侧sied开始-->
  <div class="side626 fright">
        
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



        
  </div>
  <!--右侧sied结束-->
  
  
  <div class="clearfloat"></div><!--清除浮动--> 

  
 
</div>
<jsp:include page="/commons/bottom.jsp" />
</body>
</html>