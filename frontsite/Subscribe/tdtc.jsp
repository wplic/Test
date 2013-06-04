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
<%@page	import="com.cssweb.subscribe.pojo.TcsswebFwcpysl"%>
<%@page	import="com.cssweb.subscribe.service.TcsswebFwcpcxService"%>
<%@page	import="com.cssweb.subscribe.service.TcsswebFwcpyslService"%>
<%@page	import="com.cssweb.client.service.CrmWebuserService"%>
<%@page	import="com.cssweb.client.pojo.CrmWebuser"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
</head>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
 String branchCode="";
String packageId="8";
String packageName="基础服务资讯"; 
String levelsName="";//服务身体等级名字
List userlist=null;
ServletContext st = this.getServletConfig().getServletContext();
ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
DictionaryService dictionaryService = (DictionaryService)ctx.getBean("dictionaryService");
TcsswebFwcpcxService tcsswebFwcpcxService = (TcsswebFwcpcxService)ctx.getBean("tcsswebFwcpcxService");
TcsswebFwcpyslService tcsswebFwcpyslService = (TcsswebFwcpyslService)ctx.getBean("tcsswebFwcpyslService");
CrmWebuserService crmWebuserService = (CrmWebuserService)ctx.getBean("crmWebuserService");
String sj="";
List listsj=null;
String sjurl="/Subscribe/zzdy.jsp";
TsystemWebuser tsystemWebuser=null;
	if(request.getSession().getAttribute("tsystemWebuser")!=null)
	{
	tsystemWebuser=(TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
	branchCode=tsystemWebuser.getBranchCode();
	if(tsystemWebuser.getLevel()!=null && !tsystemWebuser.getLevel().equals(""))
	 {
	    Dictionary dict = dictionaryService.getDictionaryByParentKeyCodeAndDesc("fwzl",tsystemWebuser.getLevel());
	    levelsName = dict == null ? "" : dict.getKeyName();
	 }
	 if (tsystemWebuser.getUserType().endsWith("2")) {
	        levelsName = "体验";
	        userlist=tcsswebFwcpcxService.getTcsswebFwcpcxListByAccount(tsystemWebuser.getServiceName() );
	 }else{
	 List crmsj=crmWebuserService.getCrmWebusersjByClientId(tsystemWebuser.getUserName());
		 if(crmsj!=null)
		 {
		 if (crmsj != null && crmsj.size()>0) {
				for (int i=0; i < crmsj.size(); i++) {
					CrmWebuser sjc = (CrmWebuser)crmsj.get(i);
					if(sjc.getSj()!=null&&!sjc.getSj().equals(""))
					sj=sjc.getSj();
					}
		  }
		 }
	 listsj=tcsswebFwcpyslService.getDhFwcpyslByAccount(tsystemWebuser.getUserName());
	 userlist=tcsswebFwcpcxService.getTcsswebFwcpcxListByAccount(tsystemWebuser.getUserName());
	 
	 List listsl=tcsswebFwcpyslService.getFwcpyslByAccount(tsystemWebuser.getUserName());
		 if(listsl!=null&&listsl.size()>0 )
		 {
		   %>
			  <script type="text/javascript">
			        alert(" 您目前尚有未处理的订单，我们将尽快与您联系，请耐心等待，谢谢。您也可联系您的开户营业部。");
			        var url = "/tcsswebFwcpyslAtion.do?method=getTcsswebFwcpyslListByAccount";
				  	document.location.href=url;
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
	
	 if(Integer.parseInt(packageId)==8 ){ 
	 %>
	  <script type="text/javascript">
	         alert(" 您还没升级套餐！");
	        var url = "/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount";
		  	document.location.href=url;
	       </script>
	 <%
	}
%>
<body class="body_bg" <%=true?"onload=Effect.openwin('msgview');":"" %>>
<jsp:include page="/share/top.jsp?nav=jgj&nav1=zzfwdypr" />
<jsp:include page="/share/pdLogin.jsp" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 网上营业厅 > 我的理财中心 &gt; <a href="${ctx }/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount">我的管家资讯</a></div>
<div class="blank10"></div>
</div>
<div class="wrap920">
  <!--左侧sied开始-->
  <div class="side281 fleft">
  
  		<div class="ltit1">
        	<h5>个人信息</h5>
      		<div class="content lh21">
            	<p>尊敬的<%=tsystemWebuser!=null&&tsystemWebuser.getServiceName()!=null?tsystemWebuser.getServiceName():"" %>，您好：</p>
                <p>您目前的级别属于<span class="red"><%=levelsName %></span>用户，您目前享受的套餐为 <span class="red"><%=packageName %></span>.
               
          <p align="right" class="p50">
          <%if(sqlInjectValidate.boolenanbranchCode(branchCode)){ %>
			<%if(!packageId.equals("11")){ %>
			<a href="${ctx }/Subscribe/zzdy2.jsp"><img src="${ctx }/pic/Subscribe/btn_sj.jpg" /></a>
			<%}if(!packageId.equals("8")){ %>
			<a href="${ctx }/Subscribe/tdtc.jsp"><img src="/pic/xu0608/btn_td.gif" /></a>
			<%} }%>
		 </p>
          <img src="${ctx }/pic/Subscribe/jgj.jpg" class="fleft" />
          <ul style="margin-top:25px">
                <li>·<a href="${ctx }/golden/index.jsp" target="_blank">金管家服务介绍</a></li>
                <li>·<a href="${ctx }/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount">进入我的管家资讯</a></li>
               <%if(sqlInjectValidate.boolenanbranchCode(branchCode)){ %>
                <li>·<a href="${ctx }/tcsswebFwcpyslAtion.do?method=getTcsswebFwcpyslListByAccount">套餐定制情况查询</a></li>
               <%} %>
            </ul>
            <div class="clear"></div>
            </div>
        </div>
        
        <div class="blank10"></div>
    <div class="ltit1">
  <h5><span class="red"><%=packageName %></span>特色介绍</h5>
      		<div class="content lh21" style="min-height:200px; _height:200px">
      		  <p>
      		  <%
      		  if(packageId.equals("8"))
				 out.print("快捷便利的交易通道，及时全面的市场资讯，温馨的亲情关怀，专业的呼叫服务，您可以在广发证券安心、放心、舒心地进行投资理财。");
				 else if(packageId.equals("9"))
				 out.print("广发证券金管家大众资讯套餐，为您提供实用快捷的资讯服务，涵盖大势解盘、热点板块、个股推荐、当日重要新闻点评、周边市场表现、最新重点研发报告推荐、研究机构最新评级等内容。盘中播报让您实时了解投资顾问第一手资讯，助您畅享投资乐趣。");
				 else if(packageId.equals("10"))
				 out.print("广发证券金管家高级资讯套餐，公司首席投资顾问为您点评最新市场策略，公司总部投资顾问为您点评权威研究机构的重要报告、基金公司市场观点，是您投资理财不可或缺的利器，助您把握财富未来。");
				 else if(packageId.equals("11"))
				 out.print(" 广发证券金管家顶级资讯套餐，荟集公司总部顶级分析师及投资顾问团队研究成果，提供最及时、最权威的研究报告，享受基金经理般的研究支持，助您尊享财富人生。");
      		   %>
      		  
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
     <p><img src="/pic/xu0608/tips.gif" /></p>
 <div class="blank10"></div>  
 <form name="loginForm" action="${ctx }/Subscribe/dylc.jsp" method="post" id="loginForm">
 </form>
  </div>
  <!--右侧sied结束-->
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
<script src="${ctx }/js/csswebutf.js"></script>
<div class="winfix" id="msgview" style="display:none">
<iframe src="" style="width:345px;height:0;top:0px;left:0px;position:absolute;visibility:inherit;z-index:-1;" frameborder=0></iframe>
	<div class="popTit" onmousedown="Effect.Mdrag('msgview',event)" ><em><a href="#" onclick="Effect.openwin('msgview')"><img src="/pic/Subscribe/dot4.jpg" /></a></em></div>
    <div id="con_term_1">
    <div class="popCon">
    	
     <div class="p15 lh22">
       尊敬的<%=tsystemWebuser!=null&&tsystemWebuser.getServiceName()!=null?tsystemWebuser.getServiceName():"" %>：
<br/>您目前定制了<span class="red"><%=packageName %></span>，您还可以选择变更为其他级别的资讯套餐，或退定目前的资讯套餐。我们将根据您变更后的套餐为您提供资讯服务，选择不需要任何套餐，我们将提供最基本的资讯服务.
        
      <%if(Integer.parseInt(packageId)>10){ %>
       <p>
       &nbsp;&nbsp;&nbsp; 
       <input type ="radio" value="10" name="inputValue"/> 
       优享套餐          <span class="red"><a href="${ctx }/golden/goldenCjh.jsp" target="_blank">查看详细</a></span> </p>
         <%} %>
         
        <%if(Integer.parseInt(packageId)>9 ){ %>
        <p>
        <span style="">
        &nbsp;&nbsp;&nbsp; <input type ="radio" value="9" name="inputValue"/></span>
          乐享套餐          <span class="red"><a href="${ctx }/golden/goldenLx.jsp" target="_blank">查看详细</a></span>
         <%} %>
        <p>
        <span style="">
        &nbsp;&nbsp;&nbsp; <input type ="radio" value="8" name="inputValue"/></span>
         不需要任何套餐。
        </p>
        
     </div>
   </div>
   
	  <div class="popBot">
	    	<input name="xyb" onclick="checkLoginTo()" type="button" value="确定" class="popBtn1" />
	    	<input name="qx" onclick="Effect.openwin('msgview');" type="button" value="取消" class="popBtn1" />
	    </div>
    
  
    </div>
   <iframe id="checktipsifra" name="checktipsifra" marginheight="0" marginwidth="0" frameborder="0" scrolling="no" width="0" height="0"></iframe> 
</div>
<div id="winmask" style="display:none"></div> <!-- 遮罩层 --> 
<script type="text/javascript">
 function checkLogin(ipvalue){
	   var loginForm=document.getElementById("loginForm");
	    var parameter = document.createElement('input');
			parameter.type = "hidden";
			parameter.name = "inputValue";
			parameter.value =ipvalue;
			loginForm.appendChild(parameter);
	   loginForm.submit();
     }
function checkLoginTo()
{
        var inputValuez=GetRadioValue("inputValue");
        if(inputValuez==null||inputValuez == "")
		   {
		     alert("您还没请选择产品");
		     return;
		   }
		var ipvalue= inputValuez;
        var loginForm=document.getElementById("loginForm");
	    var parameter = document.createElement('input');
			parameter.type = "hidden";
			parameter.name = "inputValue";
			parameter.value =ipvalue;
			loginForm.appendChild(parameter);
	   loginForm.submit();
}
function GetRadioValue(RadioName){
    var obj;   
    obj=document.getElementsByName(RadioName);
    if(obj!=null){
        var i;
        for(i=0;i<obj.length;i++){
            if(obj[i].checked){
                return obj[i].value;           
            }
        }
    }
    return null;
}
function rnmddhhm(dhhm){
 document.getElementById("lxdh").value=dhhm;
}
</script>
</body>
</html>