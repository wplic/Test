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
<%
Boolean tip=true;
if(request.getParameter("xkxx")!=null&&!request.getParameter("xkxx").equals("")&&request.getParameter("xkxx").equals("1"))
{
 tip=false;
}
String packageId="8";
String packageName="优享套餐"; 
String levelsName="";//服务身体等级名字
List userlist=null;
String sjurl="/Subscribe/zzdy.jsp";
ServletContext st = this.getServletConfig().getServletContext();
ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
DictionaryService dictionaryService = (DictionaryService)ctx.getBean("dictionaryService");
TcsswebFwcpcxService tcsswebFwcpcxService = (TcsswebFwcpcxService)ctx.getBean("tcsswebFwcpcxService");
TcsswebFwcpyslService tcsswebFwcpyslService = (TcsswebFwcpyslService)ctx.getBean("tcsswebFwcpyslService");
CrmWebuserService crmWebuserService = (CrmWebuserService)ctx.getBean("crmWebuserService");
String sj="";
List listsj=null;
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
	        %>
			  <script type="text/javascript">
			        alert(" 您是体验用户申请请您成为交易客户！");
			        var url = "https://119.145.72.232/ECMMS/www/comjsp/ecmms/custorder/onlineorder/OnlineCustOrder.do";
				  	document.location.href=url;
			       </script>
			 <%
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
</head>

<body class="body_bg" <%=tip==true?"onload=Effect.openwin('msgview');":"" %>>
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
			<%if(!packageId.equals("11")){ %>
			<a href="${ctx }/Subscribe/zzdy2.jsp"><img src="${ctx }/pic/Subscribe/btn_sj.jpg" /></a>
			<%}if(!packageId.equals("8")){ %>
			<a href="${ctx }/Subscribe/tdtc.jsp"><img src="/pic/xu0608/btn_td.gif" /></a>
			<%} %>
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
            <p align="center"><img src="${ctx }/pic/Subscribe/banL2.jpg" /></p>
            <p>
            广发证券金管家高级资讯套餐，公司首席投资顾问为您点评最新市场策略，公司总部投资顾问为您点评权威研究机构的重要报告、基金公司市场观点，是您投资理财不可或缺的利器，助您把握财富未来。
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

<form name="loginForm" action="${ctx }/tcsswebFwtcdyAtion.do?method=saveTcsswebProFwcptdList" method="post" id="loginForm">
 </form>
  </div>
  <!--右侧sied结束-->
  
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<script src="${ctx }/js/csswebutf.js"></script>
<div class="winfix" id="msgview" style="display:none">
<iframe src="" style="width:345px;height:0;top:0px;left:0px;position:absolute;visibility:inherit;z-index:-1;" frameborder=0></iframe>
	<div class="popTit" onmousedown="Effect.Mdrag('msgview',event)" ><em><a href="#" onclick="Effect.openwin('msgview')"><img src="/pic/Subscribe/dot4.jpg" /></a></em>提示</div>
    <div id="con_term_1">
    <div class="popCon">
    	
    <div class="p15 lh22">
       尊敬的<%=tsystemWebuser!=null&&tsystemWebuser.getServiceName()!=null?tsystemWebuser.getServiceName():"" %>：
您目前享受的是 <span class="red"><%=packageName %></span>套餐，您还可以通过升级享受下列更高级别资讯套餐。
        <%if(Integer.parseInt(packageId)<=8 ){ %>
        <p>
        <span style="">
        <input type ="radio" value="9" name="inputValue"/></span>
        <img src="/pic/Subscribe/banL1.jpg" /></p>
        <p>
        广发证券金管家大众资讯套餐，为您提供实用快捷的资讯服务，涵盖大势解盘、热点板块、个股推荐、当日重要新闻点评、周边市场表现、最新重点研发报告推荐、研究机构最新评级等内容。盘中播报让您实时了解投资顾问第一手资讯，助您畅享投资乐趣。
        </p>
         <%} %>
        <%if(Integer.parseInt(packageId)<=9){ %>
       <p><input type ="radio" value="10" name="inputValue"/><img src="/pic/Subscribe/banL2.jpg" /></p>
        <p>
        广发证券金管家高级资讯套餐，公司首席投资顾问为您点评最新市场策略，公司总部投资顾问为您点评权威研究机构的重要报告、基金公司市场观点，是您投资理财不可或缺的利器，助您把握财富未来。
        </p>
         <%} %>
        <%if(Integer.parseInt(packageId)<=10){ %>
        <p><input type ="radio" value="11" name="inputValue"/><img src="/pic/Subscribe/banL3.jpg" /></p>
        <p>
      广发证券金管家顶级资讯套餐，荟集公司总部顶级分析师及投资顾问团队研究成果，提供最及时、最权威的研究报告，享受基金经理般的研究支持，助您尊享财富人生。
      </p>
      <%} %>
     </div>
   </div>
   
    <div class="popBot">
    	<input name="xyb" onclick="setTab('term',2,5)" type="button" value="下一步" class="popBtn1" />
    	<input name="qx" onclick="Effect.openwin('msgview');" type="button" value="取消" class="popBtn1" />
    </div>
    
  
    </div>
<div id="con_term_2" style="display:none">
    <div class="popCon">
    <div class="p15 lh22">  
	<div style="text-align:center;"><span class="bold" >风险揭示与免责申明</span></div>
<br/>1、本资讯服务产品仅为投资者提供市场信息、投资参考，投资者应自主进行投资决策，自行承担投资风险，广发证券不做出任何不受损失或者最低收益的承诺。
<br/>2、本资讯产品中的信息或所表达的意见不构成如何证券买卖的出价或询价，也不构成任何买卖的要约，广发证券不就产品中的任何内容、不对任何投资作出任何形式的担保。
<br/>3、广发证券将尽最大努力为投资者提供及时全面的参考信息，但不保证这些信息的准确性及完整性，不保证报告信息已做最新变更。金管家资讯产品做出的投资参考所依据的证券研究报告和投资分析意见等，可能存在不准确、不全面或者被误读的风险，投资者应自主进行判断和投资决策，并承担由此造成的风险。
<br/>4、资讯产品提供的信息及投资参考，具有针对性和时效性，不能在任何市场环境下长期有效，投资者需事先知晓并自行进行投资决策。
<br/>5、广发证券或关联机构可能会持有资讯产品中涉及的公司所发行的证券并进行交易，还可能为这些公司提供或争取提供承销等服务，各资讯产品之间可能存在意见不一致，投资者应谨慎对待、自主判断。
<br/>6、广发证券会尽最大努力保证投资者定制的资讯产品能够及时收到，但不排除由于不可抗力或者其他广发证券无法控制的原因，使投资者未能及时或者未收到定制的资讯产品，投资者需自行承担由此可能产生的损失和风险。
<br/>7、战争、自然灾害等不可抗力因素的出现，将会严重影响证券市场的运行，可能导致广发证券不能履行职责的风险。证券公司存在因停业、解散、撤销、破产，或者被中国证监会撤销相关业务许可、责令停业整顿等原因导致不能履行职责的风险。
<br/>8、广发证券保留变更套餐内容的权利，并以适当方式进行公示。<br/>		
		 </div> 
		 </div>
		   <div class="popBot">
		    	<input name="xyb" onclick="setTab('term',3,5)" type="button" value="我已阅读，并同意上述条款" style="background:url(/pic/Subscribe/popBtn2.gif) no-repeat; width:158px; height:26px; text-align:center; line-height:26px; font-size:12px; color:#000; border:0; cursor:pointer" />
		    	<input name="qx" onclick="Effect.openwin('msgview');" type="button" value="取消" class="popBtn1" />
		    	<input name="xyb" onclick="setTab('term',1,5)" type="button" value="上一步" class="popBtn1" />
		    </div>
   
   
   </div>
   
   <div id="con_term_3" style="display:none">
    <div class="popCon">
  <div class="p15 lh22">
		   尊敬的<%=tsystemWebuser!=null&&tsystemWebuser.getServiceName()!=null?tsystemWebuser.getServiceName():"" %><br/>
			恭喜您成功预定了<font id="Disp1"></font> 资讯套餐产品，
			为了让我们的客服人员能及时与您联系并确认订单，请确认您的联系方式是：
			<br/>
			<%if(sj!=null&&!sj.equals("")){ %>
			<table width="100%">
			   <tr>
			    <td width="35%">您的服务联系电话:</td>
			    <td width="5%"></td>
			    <td><input type ="radio" value="<%=sj %>" name="dysjhm" onclick="rnmddhhm(this.value);"><%=sj %></input></td>
			   </tr>
			</table>   
			
			<%} %>
			<%if(listsj!=null&&listsj.size()>0){ 
			%>
			<table width="100%">
			<%
			for(int i=0;i<listsj.size();i++ ){
			 TcsswebFwcpysl tsj=(TcsswebFwcpysl)listsj.get(i);
			%>
			
			   <tr>
			     <td width="35%"><%=i==0?"您最近输入的联系电话:":"" %></td>
			    <td width="5%"></td>
			    <td><input type ="radio" value=" <%=tsj.getLxdh() %>" name="dysjhm" onclick="rnmddhhm(this.value);"> <%=tsj.getLxdh() %></input></td>
			   </tr>
			
			  
			<%}%>
			  </table>
			 <%}%>
		使用其他联系电话:
		<input type="text" name="lxdh" id="lxdh" class="intotext" maxlength="11" onkeyup="value=value.replace(/[^0-9]/g,'')"/>
		    </div>
		</div>
		   <div class="popBot">
		    	<input name="xyb" onclick="setTab('term',4,5)" type="button" value="下一步" class="popBtn1" />
		    	<input name="qx" onclick="Effect.openwin('msgview');" type="button" value="取消" class="popBtn1" />
		    	<input name="xyb" onclick="setTab('term',2,5)" type="button" value="上一步" class="popBtn1" />
		    </div>
   
   
    </div>
    <div id="con_term_4" style="display:none">
    <div class="popCon">
   <div class="p15 lh22">
		   您的预受理订单为:<br/>
			您目前的套餐为<%=packageName %>，希望升级为<font id="Disp"></font>
			<script type="text/javascript">
			function GetRadioValuexstc(){
			var invp=GetRadioValue("inputValue");
			if(invp=="8"){ 
			document.getElementById('Disp').innerHTML='基础服务资讯';
			document.getElementById('Disp1').innerHTML='基础服务资讯'; 
			document.getElementById('Disp2').innerHTML="<a href='/tcsswebFwcpyslAtion.do?method=getTcsswebFwcpyslListByAccount' target='_blank'>套餐定制情况查询</a>"; 
			}else if(invp=="9"){
			document.getElementById('Disp').innerHTML='乐享套餐'; 
			document.getElementById('Disp1').innerHTML='乐享套餐'; 
			document.getElementById('Disp2').innerHTML="<a href='/tcsswebFwcpyslAtion.do?method=getTcsswebFwcpyslListByAccount' target='_blank'>套餐定制情况查询</a>";
			}else if(invp=="10"){
			document.getElementById('Disp').innerHTML='优享套餐'; 
			document.getElementById('Disp1').innerHTML='优享套餐';
			document.getElementById('Disp2').innerHTML="<a href='/tcsswebFwcpyslAtion.do?method=getTcsswebFwcpyslListByAccount' target='_blank'>套餐定制情况查询</a>";
			}else if(invp=="11"){
			document.getElementById('Disp').innerHTML='尊享套餐';
			document.getElementById('Disp1').innerHTML='尊享套餐'; 
			document.getElementById('Disp2').innerHTML="<a href='/tcsswebFwcpyslAtion.do?method=getTcsswebFwcpyslListByAccount' target='_blank'>套餐定制情况查询</a>";
			}
			}
			</script>
			.<br/>
			请保持您的手机畅通，方便我们的工作人员联系您,以便更快捷的受理订单。<br/>
	</div>	
	</div>
		<div class="popBot">
    	<input name="xyb" onclick="setTab('term',5,5)" type="button" value="下一步" class="popBtn1" />
    	<input name="qx" onclick="Effect.openwin('msgview');" type="button" value="取消" class="popBtn1" />
    	<input name="xyb" onclick="setTab('term',3,5)" type="button" value="上一步" class="popBtn1" />
    
    </div>
   </div>
   <div id="con_term_5" style="display:none">
    <div class="popCon">
   <div class="p15 lh22">
		  预订单受理成功，我们会在最快的时间帮您完成订单，为了方便了解订单进度，请点击
		  <span class="red"><font id="Disp2"></font></span>
		  ，了解订单的进度情况<br/>
	</div>
	</div>	  
		  <div class="popBot">
		  <input name="xyb" onclick="checkLoginTo();" type="button" value="确定" class="popBtn1" />
		  <input name="xyb" onclick="setTab('term',4,5)" type="button" value="上一步" class="popBtn1" />
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
		GetRadioValuexstc();
	//alert(ipvalue);
	 var lxdh = document.getElementById("lxdh").value ;
     if (lxdh == ""){
			alert("手机号码不能为空");
			return;
		}
		
        var loginForm=document.getElementById("loginForm");
        var parameter = document.createElement('input');
			parameter.type = "hidden";
			parameter.name = "lxdh";
			parameter.value =lxdh;
			loginForm.appendChild(parameter);
			
	    var parameter = document.createElement('input');
			parameter.type = "hidden";
			parameter.name = "inputValue";
			parameter.value =ipvalue;
			loginForm.appendChild(parameter);
	   loginForm.submit();
}
function setTab(name,cursel,n){
 for(i=1;i<=n;i++){
   if(cursel==2)
   {
     var inputValuez=GetRadioValue("inputValue");
     if(inputValuez==null||inputValuez == "")
     {
       alert("请选择产品");
       break;
     }else{
     GetRadioValuexstc();
     }
   }
   
   if(cursel==4)
   {
     var lxdh = document.getElementById("lxdh").value ;
     if (lxdh == ""){
			alert("手机号码不能为空");
			document.getElementById("lxdh").focus();
			 break;
		}
   }
  var menu=document.getElementById(name+i);
  var con=document.getElementById("con_"+name+"_"+i);
  con.style.display=i==cursel?"block":"none";
 }
}
function GetRadioValueInputValue(inputValues){
    var obj;   
    obj=document.getElementsByName("inputValue");
    if(obj!=null){
        var i;
        for(i=0;i<obj.length;i++){
            if(obj[i].value==inputValues)
            {
            obj[i].checked=true;
            break;
            }
        }
    }
    setTab('term',2,5);
    Effect.openwin('msgview');
    
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