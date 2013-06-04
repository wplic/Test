<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/prototype.js"></script>
<script type="text/javascript" src="${ctx}/js/jsUtils.js"></script>
</head>
<%
		if (request.getAttribute("loginErrorMessage") != null)
		{
			String loginErrorMessage =(String)	request.getAttribute("loginErrorMessage");
				%><script type="text/javascript">
				
						alert('<%=loginErrorMessage%>');
				</script> <%
		}
 %>
<body>
<script type="text/javascript">
function checkIsValid(){
    var serviceName=document.getElementById("serviceName").value;
	if(serviceName==""||serviceName.length == 0)
	{
		alert("请输入用户名");
		return false;
	}
	
	var str=serviceName;
	
	if(str.charCodeAt(0)>128||str.charCodeAt(0)<65){
	alert("合法的用户名应该以英文字母开头");
	document.getElementById("serviceName").value="";
	document.getElementById("serviceName").focus();
	return false;
	}
	if(/^[a-zA-Z][a-zA-Z0-9_]{2,15}$/.test(str)==false){
	alert("用户名由英文字母或数字,下划线组成,长度在3-16之间!");
	document.getElementById("serviceName").value="";
	document.getElementById("serviceName").focus();
	return false;
	}
	
	
	var url  = '${ctx}/webUser.do';  	
	var paras = 'method=checkName&serviceName='+serviceName;  		
	new Ajax.Request(url, {method:'post',postBody: paras,asynchronous: false,				 
				  onSuccess: function(response) {		             
								if(response.responseText.trim()=='false'){
									alert('该服务名已经被注册！'); 
									document.getElementById("serviceName").value="";
									document.getElementById("serviceName").focus();
								}else{
									alert('恭喜你该服务名可以注册');
								}
						}, 
				onFailure: function() {alert('服务名注册验证失败！');}    
				}
				
			); 
}
function check(){
			       var serviceName=document.getElementById("serviceName").value;
					if(serviceName.charCodeAt(0)>128||serviceName.charCodeAt(0)<65){
					alert("合法的用户名应该以英文字母开头");
					document.getElementById("serviceName").value="";
					return false;
					}
					if(/^[a-zA-Z][a-zA-Z0-9_]{2,15}$/.test(serviceName)==false){
					alert("用户名由英文字母或数字,下划线组成,长度在3-16之间!");
					document.getElementById("serviceName").value="";
					return false;
					}
					 var password=document.getElementById("password").value;
				if(/^([A-Z]|[a-z]|[\d])*$/.test(password)==false||password.length<6||password.length>12){
				alert("密码为 6-12 位字母或数字");
				document.getElementById("password").value="";
				document.getElementById("password").focus();
				return false;
				}
				//新密码和旧密码是否相同
				var repeatPassword=document.getElementById("repeatPassword").value;
				if(password!=repeatPassword){
				alert("两次输入密码不相同");
				document.getElementById("repeatPassword").value="";
				document.getElementById("repeatPassword").focus();
				return false;
				}
				var realName = document.getElementById("realName").value;
				if (realName == ""){
					alert("真实姓名不能为空");
					document.getElementById("realName").focus();
					return false;
				}
				if (realName.length > 30){
					alert("真实姓名长度不能超过30位");
					document.getElementById("realName").value="";
				    document.getElementById("realName").focus();
					return false;
				}
	           var cardId = document.getElementById("card").value ;
				if (cardId.length == 0 || cardId.length > 18 || cardId.length < 15){
					alert("身份证输入不正确");
					document.getElementById("card").value="";
				    document.getElementById("card").focus();
					return false;
				}
				//判断email是否为正确地址
				var email=document.getElementById("email").value;
				if(email.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) != -1){
				}else{
				alert("email地址不正确");
				document.getElementById("email").value="";
				document.getElementById("email").focus();
				return false;
				}
				var mobile = document.getElementById("mobile").value ;
				if (mobile == ""){
					alert("手机号码不能为空");
					document.getElementById("mobile").focus();
					return false;
				}
				if (mobile.length!=11){
					alert("手机号码输入不正确");
					document.getElementById("mobile").value="";
				    document.getElementById("mobile").focus();
					return false;
				}
				var phone = document.getElementById("phone").value ;
				if (phone == ""){
					alert("固定电话不能为空");
					document.getElementById("phone").focus();
					return false;
				}
				if (phone.length>12){
					alert("固定电话输入不正确");
					document.getElementById("phone").value="";
				    document.getElementById("phone").focus();
					return false;
				}
				var birthday = document.getElementById("birthday").value ;
				if (birthday==""){
					alert("出生日期不能为空");
					document.getElementById("birthday").focus();
					return false;
				}
				var province = document.getElementById("province").value ;
				if (province==""){
					alert("省份不能为空");
					document.getElementById("province").focus();
					return false;
				}
				if (province.length>10){
					alert("省份输入过长");
					document.getElementById("province").value="";
				    document.getElementById("province").focus();
					return false;
				}
				var city = document.getElementById("city").value ;
				if (city ==""){
					alert("城市电话不能为空");
					document.getElementById("city").focus();
					return false;
				}
				if (city.length>10){
					alert("城市入过长");
					document.getElementById("city").value="";
				    document.getElementById("city").focus();
					return false;
				}
				var address = document.getElementById("address").value ;
				if (address==""){
					alert("地址不能为空");
					document.getElementById("address").focus();
					return false;
				}
				if (address.length>50){
					alert("地址输入过长");
					document.getElementById("address").value="";
				    document.getElementById("address").focus();
					return false;
				}
				var post =document.getElementById("post").value; 
				if (post == ""){
							alert("邮编不能为空");
							document.getElementById("post").focus();
							return false;
						}
				if (post.length!=6){
					alert("邮编有误");
						document.getElementById("post").value="";
					    document.getElementById("post").focus();
						return false;
				}
				
				
		       
}	

function gobuck(){
	window.location.href = "/default.html";
}
</script>
<div id="moblieCont">
  <div class="pagett1 clearboth"><img src="/pic/infoCenter/f10/ggjs_01.gif"/>当前位置： <a href="/default.html">首页 </a>> 用户注册</div>
  <div class="pagett1 clearboth"><b>体验用户申请</b></div>
  <table width="100%" class="moblietd">
    <tr>
      <td class="title" style=" padding:5px">说明：请填写您的真实信息，我们收到您的体验申请以后，将根据您填写的信息，为您提供帮助或者 &nbsp;&nbsp;与您取得联系！</td>
    </tr>
  </table>
  <form name="editLoginFrom" action="${ctx}/webUser.do?method=applyServiceName" method="post" onsubmit="return check();">
  <table width="100%" class="moblietd mt10 ">
  <tr>
    <td width="18%" class="title">用户名：</td>
    <td width="45%"><input type="text" name="serviceName" id="serviceName" onblur="checkIsValid()" autoComplete="Off"/>
    <input type="button" name="Submit3" value="检测"  class="but_02" onclick="checkIsValid()"/>
      </td>
    <td width="37%" class="font_73"><span class="red font_st mr3">*</span>体验用户登录用户名</td>
  </tr>
  <tr>
    <td class="title">服务密码：</td>
    <td><input type="password" name="password" id="password" style="width:126px"/></td>
    <td class="font_73"><span class="red font_st mr3">*</span>体验用户登录服务密码</td>
  </tr>
  <tr>
    <td class="title">确认密码：</td>
    <td><input type="password" name="repeatPassword" id="repeatPassword" style="width:126px"/></td>
    <td class="font_73"><span class="red font_st mr3">*</span>请再一次确认您的服务密码</td>
  </tr>
  <tr>
    <td class="title">真实姓名：</td>
    <td><input type="text" name="realName" id="realName" /></td>
    <td class="font_73"><span class="red font_st mr3">*</span>请认真填写您的真实姓名</td>
  </tr>
  <tr>
    <td class="title">身份证：</td>
    <td><input type="text" name="card" id="card" /></td>
    <td><span class="font_73"><span class="red font_st mr3">*</span>身份证号为15位或者18位</span></td>
  </tr>
  <tr>
    <td class="title">邮箱地址：</td>
    <td><input type="text" name="email" id="email" /></td>
    <td><span class="font_73"><span class="red font_st mr3">*</span>请如实填写您的邮件地址</span></td>
  </tr>
  <tr>
    <td class="title">手机号码：</td>
    <td><input type="text" name="mobile" id="mobile" onkeyup="value=value.replace(/[^0-9]/g,'')"/>
      <!-- <input type="button" value="获取验证码" class="but_02" /> --></td>
    <td><span class="font_73"><span class="red font_st mr3">*</span>请如实填写您的手机号码</span></td>
  </tr>
  <tr>
    <td class="title">固定电话：</td>
    <td><input type="text" name="phone" id="phone" onkeyup="value=value.replace(/[^0-9]/g,'')"/></td>
    <td><span class="font_73"><span class="red font_st mr3">*</span>请如实填写您的固定电话</span></td>
  </tr>
  <tr>
    <td class="title">出生日期：</td>
    <td>
    <input type="text" name="birthday" id="birthday" onfocus="this.blur()" value="" readonly/>
    <input type="button" name="rq" value="选择日期" onClick="gfPop.fStartPop(document.editLoginFrom.birthday,0);return false;"/>
    </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="title">性别：</td>
    <td><label>
      <input name="sex" type="radio" id="sex" value="0" checked="checked" />
      男
      <input type="radio" name="sex" id="sex" value="1" />
      女
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="title">省份：</td>
    <td><input type="text" name="province" id="province" /></td>
    <td><span class="font_73"><span class="red font_st mr3">*</span>请如实填写您的省份</span></td>
  </tr>
  <tr>
    <td class="title">城市：</td>
    <td><input type="text" name="city" id="city" /></td>
    <td><span class="font_73"><span class="red font_st mr3">*</span>请如实填写您的城市</span></td>
  </tr>
  <tr>
    <td class="title">地址：</td>
    <td><input type="text" name="address" id="address" /></td>
    <td><span class="font_73"><span class="red font_st mr3">*</span>请如实填写您的地址</span></td>
  </tr>
  <tr>
    <td class="title">邮编：</td>
    <td><input type="text" name="post" id="post" onkeyup="value=value.replace(/[^0-9]/g,'')"/></td>
    <td><span class="font_73"><span class="red font_st mr3">*</span>请如实填写您的邮编</span></td>
  </tr>
  <tr>
    <td class="title" colspan="3" style="color:red;font-weight:bold;">提示：注册体验用户成功之后可以和客户编号进行绑定，以便提供更好的服务！</td>
  </tr>
  <!-- 
  <tr>
    <td class="title">手机验证码：</td>
    <td><input type="text" name="textfield13" id="textfield13" />
      <input type="button" value="验证合法性" class="but_02" /></td>
    <td>&nbsp;</td>
  </tr>
   -->
</table>

<div align="center" class="mt15">
  <input type="submit" value="确定" class="but_03" />
  <input type="button" onclick="gobuck()" value="返回" class="but_03" /></div>
</div>
</form>
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 

</body>
</html>