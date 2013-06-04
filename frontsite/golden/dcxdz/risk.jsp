<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page	import="com.cssweb.subscribe.pojo.TcsswebFwcpysl"%>
<%@page	import="com.cssweb.subscribe.service.TcsswebFwcpyslService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>

<%
	String strCx ="";
	String strDx ="";
	String flag = (String)request.getAttribute("flag");
	if(flag!=null&&flag.length()>0){
		strCx = (String)request.getAttribute("checkbox_cx");
		strDx = (String)request.getAttribute("checkbox_dx");
		if((strCx==null||strCx.length()==0)&&(strDx==null||strDx.length()==0)){
%>
		<script type="text/javascript">
			var url = "${contextPath }/golden/dcxdz/custom.jsp";
			document.location.href=url;
		</script>
<%
		}
	}
	else{
		String cxstr[] = request.getParameterValues("checkbox_cx");
		String strBegindate="";
		if(cxstr!=null)
		{
			for(int i = 0 ; i< cxstr.length;i++){
				//out.println(i+"="+cxstr[i]);
				strCx +=cxstr[i]+",";
			}
		}
		String dxstr[] = request.getParameterValues("checkbox_dx");
		if(dxstr!=null)
		{
			for(int i = 0 ; i< dxstr.length;i++){
				//out.println(i+"="+dxstr[i]);
				strDx +=dxstr[i]+",";
			}
		}
	}
ServletContext st = this.getServletConfig().getServletContext();
ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
TcsswebFwcpyslService tcsswebFwcpyslService = (TcsswebFwcpyslService)ctx.getBean("tcsswebFwcpyslService");
List listsj=null;
TsystemWebuser tsystemWebuser=null;
String mobile = "";
String begindate="";
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
if(request.getSession().getAttribute("tsystemWebuser")!=null)
{
	tsystemWebuser=(TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
	mobile = tsystemWebuser.getMobile();
	if (tsystemWebuser.getUserType().endsWith("2")) {
%>
	<script type="text/javascript">
		alert(" 您是体验用户申请请您成为交易客户！");
		var url = "https://119.145.72.232/ECMMS/www/comjsp/ecmms/custorder/onlineorder/OnlineCustOrder.do";
		document.location.href=url;
	</script>
<%
	}
	begindate = (String)request.getSession().getAttribute("begindate");
	listsj=tcsswebFwcpyslService.getDhFwcpyslByAccount(tsystemWebuser.getUserName());
}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx }/js/csswebutf.js"></script>
<script type="text/javascript" src="${ctx }/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="${ctx }/js/login2.js"></script>
<script type="text/javascript">
//检测是否为数字
function forcheck(ss){
	var type="^[0-9]*[1-9][0-9]*$";
	var re = new RegExp(type);
	if(ss.match(re)==null){
        return false;
	}
	return true;
}
function dateadd(startdate,addmonth){
//startdate:开始时间yyyy-mm-dd.   间隔的月
var year=startdate.split("-")[0];
var month=startdate.split("-")[1];
var day=startdate.split("-")[2];
var add=parseInt(addmonth);
//这段主要是把月和日中的像"01"这样的改成"1"
if(month.substr(0,1)==0)
	month=month.substr(1,1);
if(day.substr(0,1)==0)
	day=day.substr(1,1);
//字符转换成数字
year=parseInt(year);
month=parseInt(month);
day=parseInt(day);
//计算新的年和月
var newmonth=month+add;  //直接把起始的月和间隔相加
year+=parseInt(newmonth/12);  //总月除以12，商加在起始年上,就是终点的年
if(newmonth>=12){            //大于12就说明是新的一年
	if(newmonth%12==0){  //这里很有意思,举个例子吧:2011-2-23在10个月后的日期是2011-12-23，就是为了这种情况
		year=year-1;
		month=12;
	}
	else
		month=parseInt(newmonth%12);
}
else
	month+=add;
//计算day
if( month==2 && day>=28) {  //新日期是2月28日以后的情况
if(year%4==0 && year%100!=0)  //闰年
        day=29;
else
        day=28;     //平年
}
else{          //新日期是除了2月,日是30日以后的情况
  if(day>=30){
     switch(month){
     case 1:
     case 3:
     case 5:
     case 7:
     case 8:
     case 10:
     case 12:
     day=31;break;
     case 4:
     case 6:
     case 9:
     case 11:
     day=30;break;
     }
   } 
}
var enddate=year+"-"+month+"-"+day;  //构造yyyy-mm-dd的格式
return enddate;
}
function formatday(startdate){
	//startdate:开始时间yyyy-mm-dd.   间隔的月
	var year=startdate.split("-")[0];
	var month=startdate.split("-")[1];
	var day=startdate.split("-")[2];
	if(month.length==1)
		month="0"+month;
	if(day.length==1)
		day="0"+day;
	var enddate= year+""+month+""+day;
	return enddate;
}
function changeMobile(){
	var mobile = document.getElementById("mobileQT").value;
	if(forcheck(mobile)==false){
		alert("只能输入数字");
		return;
	}
	if( mobile != null || mobile!="" ){
		document.getElementById("radioQT").value = mobile
	}
}
function changeMonth(){
	var month = document.getElementById("month").value;
	if(forcheck(month)==false){
		alert("只能输入数字");
		return;
	}
	if(month == ''){
		document.getElementById("strbeginDate").value="";
		document.getElementById("strendDate").value="";
	}
	else{
		var begindate1 = "<%=begindate%>";
		var strbegin = begindate1.split("-")[0] + "年" +begindate1.split("-")[1]+"月"+begindate1.split("-")[2]+"日"; 
		document.getElementById("strbeginDate").value=strbegin;
		var enddate = dateadd(begindate1,month);
		var strend = enddate.split("-")[0] + "年" +enddate.split("-")[1]+"月"+ enddate.split("-")[2]+"日"; 
		document.getElementById("strendDate").value = strend;
		//设置隐藏域值
		document.getElementById("begindate").value = begindate1.split("-")[0]+begindate1.split("-")[1]+begindate1.split("-")[2];
		document.getElementById("enddate").value = formatday(enddate);
	}
}
function checkLoginTo()
{
	var checkradio=GetRadioValue("radio");
	var radioValue="";
	var ActiveNic;
	//判断是否已使用控件
	var isActive = document.getElementById("isActive").value;			
	if(isActive =="1"){
		//获取密码
		document.getElementById("password").value =document.getElementById("Tiyun").GetPassword();
		//获取mac地址
		document.getElementById("mac").value =document.getElementById("Tiyun").GetActiveNIC();
		document.getElementById("Tiyun").Clearpassword();
	}
	if((checkradio==null||checkradio == "") )
	{
		alert("您还没输入定制手机号码");
		return;
	}
	if(checkradio.length!=11){
		alert("手机号码长度错误，请重新输入");
		return;
	}
	radioValue=checkradio;
	var month = document.getElementById("month").value;
	if(month==null || month==""){
		alert("请输入协议有效期!");
		return ;
	}
	var passwd = document.getElementById("password").value;
	if(passwd==null || passwd==""){
		alert("请输入交易密码!");
		return ;
	}
	/*  产品推介人编号允许为空
	var tjrNo = document.getElementById("tjrNo").value;
	if(tjrNo==null || tjrNo==""){
		alert("请输入产品推介人编号!");
		return ;
	}*/
	document.getElementById("mobile").value = radioValue;
	document.loginForm.submit();
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
</script>
</head>
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=jgj&nav1=dcxdz" />
<form name="loginForm" action="${ctx }/tcsswebDcxdzAction.do?method=saveTcsswebDcxdzList" method="post" id="loginForm">
<input type="hidden" value="<%=strDx%>" name="checkbox_dx" />
<input type="hidden" value="<%=strCx%>" name="checkbox_cx" />
<input type="hidden" name="isActive" id="isActive" value="0" />
<input type="hidden" name="mac" id="mac"/>
<div class="main">
  <div class="dqwz">当前位置：首页 > 我的理财中心 > 金管家彩短信定制</div>
  <div class="left_tit2"><span class="dqwz">金管家彩短信定制</span></div>
  <div class="blank10"></div>
    <div class="kline">
      <div class="qiebg">
       <div class="p10 lh22">
         <table width="100%" border="1" cellpadding="0" cellspacing="0" class="tab_cj">
    <tr>
      <td height="30" align="center" class="red2 font14 bold"> 广发证券金管家E对壹短信、彩信定制服务协议 </td>
    </tr>
    <tr>
      <td>
      <div style="height:300px;overflow:auto; padding:15px">
     甲方：广发证券股份有限公司<br />
     乙方：投资者<br />
     甲乙双方就乙方向甲方申请定制手机短信、彩信资讯服务，本着自愿、诚实信用、互惠互利的原则，特签订本服务协议。<br />
      <strong class="bold">一、服务内容与定制说明</strong><br />
      广发证券金管家E对壹短信、彩信服务，是广发证券基于客户的个性化需求，集合公司各类资讯产品精华的手机资讯服务，包括短信和彩信两大类产品。短信产品以与客户账户及相关的投资信息为主，包括账户交易类信息、持仓个股类信息、提示预警类信息、国内外财经类信息、投资建议类信息。彩信产品是汇集总部投资顾问的投顾观点、操作策略、宏观数据、市场点评、机构观点、精选最新研究报告等信息，包括E对壹彩信精选版、E对壹彩信宏观策略版、E对壹彩信行业公司版资讯信息。具体内容以甲方公布的“金管家”E对壹短信、彩信产品定制产品列表为准。<br />
      定制类信息以客户按需定制、有偿使用为原则，甲方根据乙方定制的短信、彩信产品内容和期限通过手机短信、彩信的方式发送给乙方指定的手机号码，自乙方成功定制之日起两个工作日后向乙方提供定制短信、彩信服务。<br />
      <strong class="bold">二、甲方的权利与义务：</strong><br />
      1.甲方有向乙方履行告知定制收费及公布收费标准的义务；<br />
	  2.甲方有按甲方公布的定制收费标准向乙方收取服务费的权利；<br />
      3.甲方有调整短信、彩信内容的权利；<br />
	  4.甲方有权在必要时修改服务条款，服务条款一旦发生变动，将会通过一定的方式通知或告知乙方。如果乙方对更改后的服务条款无异议，则视为接受服务条款的变动。<br />
      <strong class="bold">三、乙方的权利和义务：</strong><br />
     1.	乙方已经在甲方开立资金账户和证券账户；<br />
     2.	乙方有按甲方公布的定制收费标准向甲方支付服务费的义务；<br />
     3.	乙方有根据自身需求选择定制的产品的权利；<br />
     4.	乙方履行付款义务后，乙方有权接收定制的短信、彩信； <br />
     5.	乙方对甲方提供的短信、彩信资讯服务有建议权； <br />
     6.	乙方有按甲方公布的方式变更接收定制短信、彩信手机号码的权利； <br />
     7.	乙方提供的接收短信、彩信的手机号码必须是甲方短信发送系统支持的手机类型。若定制彩信，接收手机需支持彩信功能；如果乙方提供的手机号码不是乙方本人的号码，由此造成的后果由乙方承担；<br />
     8.	乙方在使用甲方提供的手机短信、彩信服务时必须保证：<br />
      (1)	符合中华人民共和国有关法律、法规之要求；<br />
      (2)	不得将甲方发出的短信、彩信以任何形式用于任何非法目的；<br />
      (3)	定制短信服务仅适用于申请人指定的资讯信息，属于个人信息接收范畴，不得将服务用于任何未经授权的商业使用，不得有从事再销售服务的行为；<br />
     如果发生以上情形，甲方保留向乙方追究责任的权利。<br />
      <strong class="bold">四、甲乙双方约定按以下方式办理短信、彩信服务：</strong><br />
     乙方可通过甲方提供的柜台、广发网、手机证券等方式办理定制、变更或撤销短信、彩信服务。乙方可选用的办理方式及其业务功能以甲方已开通的办理方式及其业务功能为限。无论选用何种业务办理方式，乙方均应遵守甲方的相关业务规定。乙方通过甲方网上交易、广发网、手机证券等办理业务的，业务有关的所有信息均以甲方电脑系统记录为准。<br />
      <strong class="bold">五、甲乙双方约定按以下方式收付短信、彩信服务资费：</strong><br />
      1．乙方同意甲方通过在在其资金账户直接按月扣款的方式收取短信、彩信定制服务费。乙方成功定制短信、彩信服务当天，甲方即从乙方保证金账户上按照服务对应的收费标准扣收当月服务费用，乙方须保证证券保证金账户有足额资金支付。<br />
      2．若乙方在扣款日因账户余额不足导致未能缴纳定制服务费，甲方通过手机短信方式通知乙方欠费，乙方应在随后四个工作日内补足资金，若乙方未按时补足资金导致甲方扣款失败的，则视作乙方主动提前终止本协议，甲方有权自下一发送日起终止乙方定制服务。<br />
      <strong class="bold">六、其它约定事项</strong><br />
      1.  乙方应确保所预留的手机号码能有效获取短、彩信，甲方根据乙方预留的手机号码向乙方提供服务或者发出通知的，均应视为有效到达乙方。<br />
      2.乙方在协议有效期内退定服务，甲方将视作为乙方提前终止协议。甲方在乙方提前终止协议前已扣取当月费用的，甲方将向乙方继续提供原所定制短、彩信服务直至乙方所支付月度服务费用所覆盖的时间结束为止。<br />
      3. 本协议到期之日的前五个工作日，甲方将通过手机短消息方式通知乙方。如果乙方在本协议到期时仍未办理定制服务的续定手续，视为默认取消服务。<br />
      4. 甲方向乙方所提供的短信、彩信服务内容仅供乙方在进行证券投资时的信息参考，不构成对乙方的直接投资建议。甲方将力求产品所述内容及观点的客观公正，但不保证这些信息内容的准确性及完整性，不保证报告信息已做最新变更。乙方据此投资，投资风险自行承担，甲方不做出任何不受损失或者最低收益的承诺。<br />
      5. 甲方将会尽最大努力使乙方能够及时收到短信、彩信内容，但不排除由于不可抗力（包括洪水、地震及其它自然灾害、战争、骚乱、火灾、政府征用、没收、法律变化、突发停电或其它突发事件、银行清算系统故障、证券交易所非正常暂停或停止交易等），或者第三方（运营商）通信网络出现故障造成的产品（服务）延误或丢失等其他甲方无法控制的原因，导致乙方未能及时或者未收到定制的短信、彩信产品，或者短信、彩信内容乱码、断缺、内容表意不清、不完整等情况，乙方需自行承担由此可能产生的损失和风险，甲方不承担任何责任。乙方在发现短信、彩信内容缺失或短信、彩信接收不正常时应及时与甲方联系或致电全国金管家专线95575。<br />
      6. 乙方在此确认已认真阅读并完全理解了以上服务条款，同时明白点击“同意”并完成定制后，上述服务条款即构成广发证券与客户之间合法有效、有法律约束力的合同。<br />
      7. 客户应妥善保管通过广发网及手机证券等方式进行短彩信定制时录入的交易密码，客户输入交易密码的所有操作视同客户本人行为，客户承担由此产生的一切法律后果。<br />
      <strong class="bold">七、本协议未尽事宜，由甲乙双方友好协商确定；经双方协商未达成一致意见的，双方任何一方可以到本协议签订地的仲裁机关申请仲裁。</strong> <br />
      <strong class="bold">八、申明：</strong><br />
       乙方已充分了解短、彩信服务产品的功能、内容、特征、资费标准与方式等，对使用该产品可能存在的风险有充分的认识，并愿意承担相应的风险。<br />
      </div>
      </td>
    </tr>
  </table>
  <div class="blank10"></div>
  <br />
<p class="p10" align="center"><input name="" onclick="Effect.openwin('msgview')" class="dybtn1" type="button" value="同意" />&nbsp;&nbsp;<input name="" onclick="location.href='custom.jsp'" class="dybtn1" type="button" value="返回上一步" />　</p>
    </div>
<br />
    </div>
    </div>
  <!--右侧sied结束--> 
</div>

<div class="winfixsms" id="msgview" style="display:none">
<iframe src="" style="width:345px;height:0;top:0px;left:0px;position:absolute;visibility:inherit;z-index:-1;" frameborder=0></iframe>
	<div class="popTit" onmousedown="Effect.Mdrag('msgview',event)" ><em><a href="#" onclick="Effect.openwin('msgview')"><img src="/pic/Subscribe/dot4.jpg" /></a></em>填写定制信息</div>
	<div class="popCon2" >
	请输入您的手机号码，方便您及时准确收到您定制的彩短信服务产品。<br /><br />
	<span height="26">定制手机号码：</span>
     <table width="90%" border="0" cellspacing="0" cellpadding="0">
      <tr>
		<td width="35%" align="right">您的服务联系电话：</td>
		<td width="5%"><input type="radio" name="radio" id="radioFW" value="<%=mobile %>" /></td>
		<td width="60%"> <%=mobile %></td>
  	</tr>
  <%if(listsj!=null&&listsj.size()>0){ 
	for(int i=0;i<listsj.size();i++ ){
		TcsswebFwcpysl tsj=(TcsswebFwcpysl)listsj.get(i);
  %>
  <tr>
	<td width="35%" align="right"><%=i==0?"您最近变更的联系电话:":"" %></td>
	<td width="5%"><input type ="radio" value="<%=tsj.getLxdh().toString() %>" name="radio"></input></td>
	<td width="60%"> <%=tsj.getLxdh() %></td>
  </tr>
	<%}
	}%>
	<tr>
		<td width="35%" align="right">使用其它电话：</td>
		<td width="5%"><input type="radio" name="radio" id="radioQT"/></td>
		<td width="60%"><input type="text" name="mobileQT" id="mobileQT" style="width:100px" onchange="changeMobile()" maxlength="11"/></td>
  	</tr>
  </table>
  <table width="90%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="26" width="35%" align="right">协议有效期为</td>
    <td width="5%">&nbsp;</td>
    <td width="60%">
      <input type="text" name="month" id="month" style="width:50px" onchange="changeMonth()" maxlength="2"/>
      月</td>
    </tr>
   <tr>
    <td height="26" width="35%" align="right">有效期为</td>
    <td width="5%">&nbsp;</td>
    <td width="60%">
    	<input type="text" name="strbeginDate" id="strbeginDate" value="" style="width:100px" readonly="readonly"/>至
    	<input type="text" name="strendDate" id="strendDate" value="" style="width:100px" readonly="readonly"/></td>
    	<input type="hidden" name="mobile" id="mobile"/>
    	<input type="hidden" name="begindate" id="begindate"/>
    	<input type="hidden" name="enddate" id="enddate"/>
	</tr>
	<!-- 2012-7-18添加：产品推介人编号 -->
	 <tr>
    <td height="26" width="35%" align="right">产品推介人编号</td>
    <td width="5%">&nbsp;</td>
    <td width="60%">
    	<input type="text" name="tjrNo" id="tjrNo" style="width:100px"/>
    	
    	</td>
    	
	</tr>
	<!-- end -->
	<tr>
         <td height="26" width="35%" align="right"> 交易密码： </td>
         <td width="5%">&nbsp;</td>
    	<td width="60%">
	    	<span id="Spanpwd" style="display:none">
	    	<input type="password" name="password" id="password" maxlength="6"/>
	    	</span><span id="passwdId"></span>
	    	<!-- <span id="Spanpwd" style="display:none;">
                  <input type="password" name="pwd" id="pwd" maxlength="6"/>
                </span>
                <span id="passwdId"></span> -->
    	</td>
       </tr>
	</table>
</div>
<div class="popBot">
    <!-- <input name="" type="button" value="确认" onclick="checkLoginTo();" class="popBtn1" />&nbsp;&nbsp;<input name="" type="button" value="取消" onclick="Effect.openwin('msgview')" class="popBtn1" />-->
    <input name="" type="button" value="确认" onclick="checkLoginTo();" class="popBtn1" />&nbsp;&nbsp;<input name="" type="button" value="取消" onclick="Effect.openwin('msgview')" class="popBtn1" />　　
</div>
</div>
<div id="winmask" style="display:none"></div> <!-- 遮罩层 --> 
</form>
</body>
<%
	String message = (String)request.getAttribute("message");
	if(message!=null&&message.length()>0){
%>
	<script type="text/javascript">
		Effect.openwin('msgview');
		alert('<%=message%>');
	</script>
<%} %>
<jsp:include page="/commons/bottom.jsp" />


</html>