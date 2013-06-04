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
<%

//申请定阅
String inputValue ="";
	if(request.getParameter("inputValue")!=null&&!request.getParameter("inputValue").equals("")){
	inputValue=request.getParameter("inputValue");
	}
System.out.println("                   /Subscribe/dylc.jsp=inputValueinputValue= "+inputValue);
//体验定阅
if(inputValue!=null&&!inputValue.equals("")){
}else{
%>
		<script type="text/javascript">	
		   document.location.href="${contextPath}/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount";
		</script>
<%
}
%>

<%
Boolean tip=true;
if(request.getParameter("xkxx")!=null&&!request.getParameter("xkxx").equals("")&&request.getParameter("xkxx").equals("1"))
{
 tip=false;
}
String packageId="8";
String packageName="基础服务资讯"; 
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
		 if(listsl!=null&&listsl.size()>0&&tip==true)
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
		}
	}
String inputValueName="";
if(inputValue!=null&&!inputValue.equals("") )
		{
		 if(inputValue.equals("8"))
		 inputValueName="基础服务资讯";
		 else if(inputValue.equals("9"))
		 inputValueName="乐享套餐";
		 else if(inputValue.equals("10"))
		 inputValueName="优享套餐";
		 else if(inputValue.equals("11"))
		 inputValueName="尊享套餐";
		}
%>
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=jgj&nav1=zzfwdypr" />
<jsp:include page="/share/pdLogin.jsp" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 网上营业厅 > 我的理财中心 &gt; <a href="${ctx }/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount">我的管家资讯</a></div>
<div class="wrap920">
  <div id="con_term_1" id="list1" class="lh21">
  <div style="padding:50px 100px;">
  <img src="${ctx }/pic/xu0608/tips1.gif"/>
  <br/><br/>
<div style="text-align:center;"><span class="bold" >风险揭示与免责申明</span></div>
<p class="p10 lh22">
<br/>1、本资讯服务产品仅为投资者提供市场信息、投资参考，投资者应自主进行投资决策，自行承担投资风险，广发证券不做出任何不受损失或者最低收益的承诺。
<br/>2、本资讯产品中的信息或所表达的意见不构成如何证券买卖的出价或询价，也不构成任何买卖的要约，广发证券不就产品中的任何内容、不对任何投资作出任何形式的担保。
<br/>3、广发证券将尽最大努力为投资者提供及时全面的参考信息，但不保证这些信息的准确性及完整性，不保证报告信息已做最新变更。金管家资讯产品做出的投资参考所依据的证券研究报告和投资分析意见等，可能存在不准确、不全面或者被误读的风险，投资者应自主进行判断和投资决策，并承担由此造成的风险。
<br/>4、资讯产品提供的信息及投资参考，具有针对性和时效性，不能在任何市场环境下长期有效，投资者需事先知晓并自行进行投资决策。
<br/>5、广发证券或关联机构可能会持有资讯产品中涉及的公司所发行的证券并进行交易，还可能为这些公司提供或争取提供承销等服务，各资讯产品之间可能存在意见不一致，投资者应谨慎对待、自主判断。
<br/>6、广发证券会尽最大努力保证投资者定制的资讯产品能够及时收到，但不排除由于不可抗力或者其他广发证券无法控制的原因，使投资者未能及时或者未收到定制的资讯产品，投资者需自行承担由此可能产生的损失和风险。
<br/>7、战争、自然灾害等不可抗力因素的出现，将会严重影响证券市场的运行，可能导致广发证券不能履行职责的风险。证券公司存在因停业、解散、撤销、破产，或者被中国证监会撤销相关业务许可、责令停业整顿等原因导致不能履行职责的风险。
<br/>8、广发证券保留变更套餐内容的权利，并以适当方式进行公示。<br/>	
</p>    
     <p class="p10" align="center">
		<input name="xyb" onclick="setTab('term',2,5)" type="button" value="我已阅读，并同意上述条款" style="background:url(/pic/Subscribe/popBtn2.gif) no-repeat; width:158px; height:26px; text-align:center; line-height:26px; font-size:12px; color:#000; border:0; cursor:pointer"/>
		<input name="dyqx" class="dybtn1" type="button" value="取消" onclick="checkLogin1();"/>
	</p>
    </div>
   </div>
    
    
    <div id="con_term_2" id="list1" class="lh21" style="display:none">
  <div style="padding:50px 100px;">
  <img src="${ctx }/pic/xu0608/tips2.gif"/>
  <br/><br/>
    <p align="center" class="font16 bold red p10">确定联系方式</p>
     尊敬的<%=tsystemWebuser!=null&&tsystemWebuser.getServiceName()!=null?tsystemWebuser.getServiceName():"" %>: <br/>
			您目前的套餐为<%=packageName %>，
			<%
			if(inputValue!=null&&!inputValue.equals("")&&inputValue.equals("8") ){
			out.print("希望退定该套餐");
			}else{
				if(Integer.valueOf(packageId)>Integer.valueOf(inputValue.trim()))
				out.print("希望变更为"+inputValueName+"资讯套餐产品");
				else
				out.print("恭喜您成功预定了"+inputValueName+"资讯产品");
			}
			 %>
			
			 ，为了让我们的客服人员能及时与您联系并确认订单，请复查您的联系方式是：
			<br/>
			<%if(sj!=null&&!sj.equals("")){ %>
			<table width="100%">
			   <tr>
			    <td width="35%" align="right">您已登记的服务联系电话:</td>
			    <td width="5%"><input type ="radio" value="<%=sj %>" name="dysjhm" onclick="rnmddhhm(this.value);"></input></td>
			    <td width="60%"><%=sj %></td>
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
			     <td width="35%" align="right"><%=i==0?"您最近变更的联系电话:":"" %></td>
			    <td width="5%"><input type ="radio" value=" <%=tsj.getLxdh() %>" name="dysjhm" onclick="rnmddhhm(this.value);"></input></td>
			    <td width="60%"> <%=tsj.getLxdh() %></td>
			   </tr>
			
			  
			<%}%>
			  </table>
			 <%}%>
			<table width="100%">
			<tr>
			     <td width="35%" align="right">您的电话已变更，需输入新的联系电话: </td>
			    <td width="5%"><input type ="radio" value="0" name="dysjhm" onclick="rnmddhhm(this.value);"></td>
			    <td width="60%">
			   
	<div id="lxdh1" id="lxdh1" style="display:none">
	   <input type="text" name="lxdh" id="lxdh" class="intotext" maxlength="11" onkeyup="value=value.replace(/[^0-9]/g,'')"/>
    </div>	
			    </td>
			   </tr>
			</table>  
     <p class="p10" align="center">
		<input name="xyb" onclick="setTab('term',3,5)" type="button" value="下一步" class="popBtn1"/>
		<input name="dyqx" class="dybtn1" type="button" value="取消" onclick="checkLogin1();"/>
		<input name="xyb" onclick="setTab('term',1,5)" type="button" value="上一步" class="popBtn1" />
	</p>
    </div>
    </div>
    <div id="con_term_3" id="list1" class="lh21" style="display:none">
   <div style="padding:50px 100px;">
  <img src="${ctx }/pic/xu0608/tips3.gif"/>
  <br/><br/>
    <p align="center" class="font16 bold red p10">确认预受理订单</p>
     <div class="p15 lh22">
		   您的预受理订单为：<br/>
			您目前的套餐为<%=packageName %>，
			<%
			if(inputValue!=null&&!inputValue.equals("")&&inputValue.equals("8") ){
			out.print("希望退定该套餐");
			}else{
				if(Integer.valueOf(packageId)>Integer.valueOf(inputValue.trim()))
				out.print("希望变更为"+inputValueName);
				else
				out.print("希望升级为"+inputValueName);
			}
			 %>
			。<br/>
			请保持您的手机畅通，我们的工作人员将在24小时内与您联系，确认您的预受理订单。<br/>
			<br/>
	</div>	
     <p class="p10" align="center">
		<input name="xyb" onclick="checkLoginTo();" type="button" value="确定" class="popBtn1"/>
		<input name="dyqx" class="dybtn1" type="button" value="取消" onclick="checkLogin1();"/>
		<input name="xyb" onclick="setTab('term',2,5)" type="button" value="上一步" class="popBtn1"/>
	</p>
    </div></div>
<form name="loginForm" action="${ctx }/tcsswebFwtcdyAtion.do?method=saveTcsswebProFwcptdList" method="post" id="loginForm">
   <input type="hidden" name="inputValue" value="<%=inputValue %>"/>
   <div id="lightsjzq" class="white_content">

    	<div class="top"><span><a href="#" onclick = "document.getElementById('lightsjzq').style.display='none';"><img src="../pic/mobile/zxpop4.gif" /></a></span></div>
        <div class="con">
       	  <div style=" width:440px; margin:0 auto">
       	  <p style=" height:20px"> 
       	  预订单受理成功，我们会在最快的时间帮您完成订单，为了方便了解订单进度,请点击
		  <span class="red">
		  <a href='/tcsswebFwcpyslAtion.do?method=getTcsswebFwcpyslListByAccount' target='_blank'>套餐定制情况</a>
		  </span>
		  查询，了解订单的进度情况。
       	  </p>
            </div>
        </div>
        <div class="bottom">
            <input type="button" class="popBtn1" name="button" id="button" onclick="checkLoginTo();" value="我知道了"  />
        </div>
  </div>
</form> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>


<script type="text/javascript">
function checkLoginTo()
{
	 var lxdh = document.getElementById("lxdh").value ;
     if (lxdh ==""){
			alert("手机号码不能为空");
			return;
		}
        var loginForm=document.getElementById("loginForm");
        var parameter = document.createElement('input');
			parameter.type = "hidden";
			parameter.name = "lxdh";
			parameter.value =lxdh;
			loginForm.appendChild(parameter);
	   loginForm.submit();
}
     function checkLogin1(){
         var url=${ctx }"/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount";
	     document.location.href=url;
     }
     
function setTab(name,cursel,n){
 for(i=1;i<=n;i++){
 if(cursel==3)
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

function rnmddhhm(dhhm){
 if(dhhm==0){
 document.getElementById("lxdh").value='';
 document.getElementById("lxdh1").style.display = "block";
 }else{
 document.getElementById("lxdh1").style.display = "none";
 document.getElementById("lxdh").value=dhhm;
 }
}
</script>
<jsp:include page="/share/bottom.jsp" />
</body>
</html>