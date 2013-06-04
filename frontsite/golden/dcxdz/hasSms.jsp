<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:directive.page import="java.util.*"/>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page	import="com.cssweb.subscribe.service.TcsswebDcxdzService"%>
<%@page	import="com.cssweb.subscribe.pojo.TcsswebDcxdetail"%>
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx }/js/jquery.js"></script>
<script type="text/javascript" src="${ctx }/js/csswebutf.js"></script>
<script type="text/javascript" src="${ctx }/js/JniDecrypt.js"></script>
<script type="text/javascript">
function orderlist(obj1,obj2){
	var obj = document.getElementById(obj1);
	if(obj!=null){
		if(obj.checked){
			var cxobj = document.getElementsByName(obj2);
			if(cxobj!=null){
				var i;
		        for(i=0;i<cxobj.length;i++){
		        	cxobj[i].checked=true;
		        }
			}
		}else{
			var cxobj = document.getElementsByName(obj2);
			if(cxobj!=null){
				var i;
		        for(i=0;i<cxobj.length;i++){
		        	cxobj[i].checked=false;
		        }
			}
		}
	}	
}
function checkOrder()
{
	var checkbox_dx=GetRadioValue("checkbox_dx");
	var checkbox_cx=GetRadioValue("checkbox_cx");
	if((checkbox_dx==null||checkbox_dx == "") && (checkbox_cx==null||checkbox_cx == ""))
	{
		alert("您还没请选择退定项目");
		return false;
	}
	else
		Effect.openwin('msgview2');
}
function checkLoginTo()
{
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
	var passwd = document.getElementById("password").value;
	if(passwd==null || passwd==""){
		alert("请输入交易密码!");
		return ;
	}
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
<%
String account="";
String branchno="";
ServletContext st = this.getServletConfig().getServletContext();
ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
TcsswebDcxdzService dcxService = (TcsswebDcxdzService)ctx.getBean("tcsswebDcxdzService");
TsystemWebuser tsystemWebuser=null;
if(request.getSession().getAttribute("tsystemWebuser")!=null){
	tsystemWebuser=(TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
	if (tsystemWebuser.getUserType().endsWith("2")) {
%>
	<script type="text/javascript">
		alert(" 您是体验用户申请请您成为交易客户！");
		var url = "https://119.145.72.232/ECMMS/www/comjsp/ecmms/custorder/onlineorder/OnlineCustOrder.do";
		document.location.href=url;
	</script>
<%
	}
	account = tsystemWebuser.getUserName();
	branchno = tsystemWebuser.getBranchCode();
}
else{
	%>
	<script type="text/javascript">
		var url = "/share/login.jsp";
		document.location.href=url;
	</script>
<%
}
List list = null;
Map map = new HashMap();
list = dcxService.getSmsItem(account,branchno);
map = dcxService.getSmsDetail(account,branchno);
%>
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=jgj&nav1=dcxdz" />
<form name="loginForm" action="${ctx }/tcsswebDcxdzAction.do?method=saveTcsswebDcxtd" method="post" id="loginForm">
<input type="hidden" name="isActive" id="isActive" value="0">
<input type="hidden" name="mac" id="mac">
<div class="main">
  <div class="dqwz">当前位置：首页 > 我的理财中心 > 金管家彩短信定制</div>
  <div class="left_tit2"> 已有彩短信定制情况 </div>
  <div class="kline">
    <div class="qiebg">
      <div class="p10 lh22">
        <table width="100%" border="1" cellpadding="0" cellspacing="0" class="tab_cj">
    <tr>
      <td colspan="6" height="30"><div align="center" class="red2 font14 bold">金管家E对壹彩信</div></td>
    </tr>
    <tr>
      <td width="208"><p align="center">定制项目 </p></td>
      <td width="321"><p align="center">彩信提示内容</p></td>
      <td width="52"><p align="center">元 / 月 </p></td>
      <td width="100"><p align="center">登记日期 </p></td>
      <td width="100"><p align="center">到期日期 </p></td>
      <td width="109" align="center"><input type="checkbox" name="checkboxCx" id="checkboxCx" onclick="orderlist('checkboxCx','checkbox_cx');"/>
        <label for="checkbox" style="color:#0000FF">退定</label></td>
    </tr>
    <% 
    String str = null;
    String fate = "";
    String bdate="";
    String edate="";
    if(list!=null&&list.size()>0){
    	Iterator<TcsswebDcxdetail> ite = list.iterator();
    	while(ite.hasNext()){
			TcsswebDcxdetail item = ite.next();
			str = item.getItemid();
			if(item.getProducttype()==6&& map!=null && map.get(str)!=null){
				TcsswebDcxdetail detail = (TcsswebDcxdetail)map.get(str);
				bdate = detail.getBdate();
				edate = detail.getEdate();
				if(!detail.getSerialno().contains("客户已做短信取消")){
	%>
	<tr>
      <td><p align="left"><%=item.getProductname() %></p></td>
      <td><p align="left"><%=item.getProductremark() %></p></td>
      <td><p align="center"><%=detail.getProductfate() %></p></td>
      <td><p align="center"><%if(bdate!=null){out.println(bdate);} else {out.println("");} %></p></td>
      <td><p align="center"><%if(edate!=null){out.println(edate);} else {out.println("");} %></p></td>
      <td align="center"><input type="checkbox" name="checkbox_cx" value="<%=item.getItemid() %>"/>
        <label for="checkbox1" style="color:#0000FF">退定</label></td>
    </tr>
	<%
				}
			}
		}
    }
    %>
  </table>
  <div class="blank10"></div>
  <table cellspacing="0" border="1" class="tab_cj" cellpadding="0">
  <tr>
    <td width="100%" colspan="7" height="30"><p align="center" class="red2 font14 bold">金管家E对壹短信服务 </p></td>
  </tr>
  <tr>
    <td width="90"><p align="center">信息类型 </p></td>
    <td width="118"><p align="center">定制项目 </p></td>
    <td width="321"><p align="center">短信提示内容 </p></td>
    <td width="52"><p align="center">元 / 月 </p></td>
    <td width="100"><p align="center">登记日期 </p></td>
      <td width="100"><p align="center">到期日期 </p></td>
    <td width="109" align="center"><input type="checkbox" name="checkboxDx" id="checkboxDx" onclick="orderlist('checkboxDx','checkbox_dx');"/>
      <label for="checkboxDx" style="color:#0000FF">退定</label></td>
    </tr>
     <% 
    if(list!=null&&list.size()>0){
    	Iterator<TcsswebDcxdetail> ite = list.iterator();
    	while(ite.hasNext()){
			TcsswebDcxdetail itemdx = ite.next();
			str = itemdx.getItemid();
			if(itemdx.getProducttype()!=6&& map!=null && map.get(str)!=null){
				TcsswebDcxdetail detail = (TcsswebDcxdetail)map.get(str);
				bdate = detail.getBdate();
				edate = detail.getEdate();
				if(!detail.getSerialno().contains("客户已做短信取消")){
	%>
	<tr>
		<td><p align="center"><%=itemdx.getItemname() %> </p></td>
		<td><p align="left"><%=itemdx.getProductname() %></p></td>
	    <td><p align="left"><%=itemdx.getProductremark() %> </p></td>
	    <td><p align="center"><%=detail.getProductfate() %> </p></td>
	    <td><p align="center"><%if(bdate!=null){out.println(bdate);} else {out.println("");} %></p></td>
      	<td><p align="center"><%if(edate!=null){out.println(edate);} else {out.println("");} %></p></td>
	    <td align="center"><input type="checkbox" name="checkbox_dx" value="<%=itemdx.getItemid() %>"/>
	      <label for="checkbox23" style="color:#0000FF">退定</label></td>
    </tr>
	<%
				}
			}
		}
    }
    %>
</table>
<br />
<p class="p10" align="center">
	<input name="" class="dybtn1" type="button" value="退定服务" onclick="checkOrder();" />
</p>
    </div>
<br />
    </div>
    </div>
  <!--右侧sied结束--> 
</div>

<div class="winfix" id="msgview2" style="display:none">
<iframe src="" style="width:345px;height:0;top:0px;left:0px;position:absolute;visibility:inherit;z-index:-1;" frameborder=0></iframe>
	<div class="popTit" onmousedown="Effect.Mdrag('msgview2',event)" ><em><a href="#" onclick="Effect.openwin('msgview2')"><img src="/pic/Subscribe/dot4.jpg" /></a></em>请输入密码</div>
	<div class="popCon" >
	请输入您的交易密码。<br /><br />
     <table width="90%" border="0" cellspacing="0" cellpadding="0">
       <tr>
         <td height="26"> 交易密码： </td>
         <td><span id="Spanpwd" style="display:none">
	    	<input type="password" name="password" id="password" maxlength="6"/>
	    	</span><span id="passwdId"></span>
	    </td>
       </tr>
</table>
</div>
<div class="popBot">
    <input name="" type="button" value="确认" onclick="checkLoginTo();" class="popBtn1" />&nbsp;&nbsp;<input name="" type="button" value="取消" onclick="Effect.openwin('msgview2')" class="popBtn1" />　　
</div>
</div>
<div id="winmask" style="display:none"></div> <!-- 遮罩层 -->
<script type="text/javascript" language="javascript">
	ShowLoginDiv();
</script>
</form>
</body>
<jsp:include page="/commons/bottom.jsp" />


</html>