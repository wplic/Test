<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册页_牛熊双赢模拟交易大赛</title>
  <jsp:include page="/match/nxsy/commons/head.jsp"></jsp:include>
<link type="text/css" rel="stylesheet" href="../../css/wsyyt/wsyyt.css"/>
<script type="text/javascript" src="${contextPath }/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${contextPath }/js/valid_idcard.js"></script>
<script type="text/javaScript">
window.onload = function(){
	document.getElementById("nick_name").focus();	
}
/*
*lwp 2012-09-07
*/
$.ajaxSetup ({  
      cache: false //关闭AJAX相应的缓存  
});
</script>	
<script type="text/javaScript">	
	function check() {
	var nick_name = document.getElementById("nick_name").value;
	var pwd = document.getElementById("pwd").value;
	var repeat_pwd = document.getElementById("repeat_pwd").value;
	var client_name = document.getElementById("client_name").value;
	var id_no = document.getElementById("id_no").value;
	var email = document.getElementById("email").value;
	var address = document.getElementById("address").value;	
		if(id_no.trim().length < 15 || id_no.trim().length > 18) {
			
			alert("身份证的长度为15位或者18位");			
			//document.getElementById("card").value = "";
			document.getElementById("id_no").focus();
			return false;
		}
		if(IdCardValidate(id_no)==false)
		{
			alert("身份证输入不合法");
			return false;
		}
		if(nick_name == null || nick_name.trim().length == 0) {
		    alert("请填写昵称");			
		    document.getElementById("nick_name").value = "";
		    document.getElementById("nick_name").focus();
			return false;			
		}
		
		if(pwd == null || pwd.trim().length == 0) {
			alert("请输入密码");
			document.getElementById("pwd").value = "";
			document.getElementById("pwd").focus();
			return false;
		}
		if(pwd.trim().length < 6) {
			alert("密码长度不能少于6位");
			document.getElementById("pwd").value = "";
			document.getElementById("pwd").focus();
			return false;
		}
		
		if(repeat_pwd == null || repeat_pwd.trim().length == 0) {
			alert("请再次输入密码");
			document.getElementById("repeat_pwd").value = "";
			document.getElementById("repeat_pwd").focus();
			return false;
		}
		if(repeat_pwd.trim() != pwd.trim()) {
			alert("两次输入的密码必须一致！");
			document.getElementById("repeat_pwd").value = "";
			document.getElementById("repeat_pwd").focus();
			return false;
		}
		if(client_name == null || client_name.trim().length == 0) {
		    alert("请填写真实姓名");			
		    document.getElementById("client_name").value = "";
		    document.getElementById("client_name").focus();
			return false;			
		}		
		if(id_no == null || id_no.trim().length == 0) {
			alert("身份证不能为空");
			//document.getElementById("card").value = "";
			document.getElementById("id_no").focus();
			return false;
		}
		
		//验证email地址是否正确
		if(email.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) != -1){
				}else{
				alert("email地址不正确");
				document.getElementById("email").value="";
				document.getElementById("email").focus();
				return false;
				}	
		if(address == null || address.trim().length == 0) {
			alert("地址不能为空");
			document.getElementById("address").value = "";
			document.getElementById("address").focus();
			return false;
		}
		var province = document.getElementById("province").value;
		if(province=="" || province=="0"){
			alert("请选择营业部");
			return false;
		}
		var recommend = document.getElementById("recommend").value;
		if(recommend == null || recommend.trim().length == 0){
			alert("推荐人不能为空");
			document.getElementById("recommend").value = "";
			document.getElementById("recommend").focus();
			return false;
		}
	}
	/*
	*2012-09-04 lwp
	*/
	function Change_Select(){
		var val = document.getElementById("province").value;
		if(val=="0"){
			document.getElementById("div_").style.display="";
			document.getElementById("div_gncj").style.display="none";
			return;
		}
		$.ajax({ 
			url:'${contextPath }/nxsyRegisterAction.do?method=getBranchProvince&province='+encodeURI(encodeURI(val)), 
			type: 'GET', 
			error: function(msg){ 
			      alert('数据加载错误!'+msg); 
			}, 
			success: function(msg){
				var div_ = document.getElementById("div_");
				var div_gncj = document.getElementById("div_gncj");
				if(div_.style.display==""){
					div_.style.display="none";
				}
				if(div_gncj.style.display=="none"){
					div_gncj.style.display="";
				}
				$("#div_gncj").load("${ctx}/match/nxsy/branchs.jsp");//这里必须关闭ajax缓存，否则联动加载第二个营业部下拉框将不会产生变化
			} 
		});
	}
</script>
<jsp:include page="${contextPath }/nxsyRegisterAction.do?method=getProvince"></jsp:include>
<div id="nxsy_Register">
<div class="pagett1 clearboth"><b>用户申请</b></div>
<div  class="moblietd title">    
      说明：请填写您的真实信息，发放奖品时需要用到！
</div>   
  <form id="nxsy_form" name="nxsy_form" action="/nxsyRegisterAction.do?method=register" method="post" onsubmit="return check();">
  	<script>
	  	var errorMsg="${errorMsg}";
	  	if(errorMsg!=""){
	  		alert(errorMsg);
	  	}
	</script>
  <table width="100%" class="moblietd mt10 ">
  <tr>
    <td width="18%" class="title">用户名：</td>
    <td width="45%"><input type="text" name="nick_name" id="nick_name" autoComplete="Off"/>
    <!-- input type="button" name="Submit3" value="检测"  class="but_02" onclick="checkIsValid()"/-->
      </td>
    <td width="37%" class="font_73"><span class="red font_st mr3">*</span>用户登录用户名</td>
  </tr>
  <tr>
    <td class="title">密码：</td>
    <td><input type="password" name="pwd" id="pwd" style="width:126px"/></td>
    <td class="font_73"><span class="red font_st mr3">*</span>用户登录服务密码</td>
  </tr>
  <tr>
    <td class="title">确认密码：</td>
    <td><input type="password" name="repeat_pwd" id="repeat_pwd" style="width:126px"/></td>
    <td class="font_73"><span class="red font_st mr3">*</span>请再一次确认您的服务密码</td>
  </tr>
  <tr>
    <td class="title">真实姓名：</td>
    <td><input type="text" name="client_name" id="client_name" /></td>
    <td class="font_73"><span class="red font_st mr3">*</span>请认真填写您的真实姓名</td>
  </tr>
  <tr>
    <td class="title">身份证：</td>
    <td><input type="text" name="id_no" id="id_no" /></td>
    <td><span class="font_73"><span class="red font_st mr3">*</span>身份证号为15位或者18位</span></td>
  </tr>
  <tr>
    <td class="title">邮箱地址：</td>
    <td><input type="text" name="email" id="email" /></td>
    <td><span class="font_73"><span class="red font_st mr3">*</span>请如实填写您的邮件地址</span></td>
  </tr>
  <tr>
    <td class="title">联系电话：</td>
    <td><input type="text" name="mobile_tel" id="mobile_tel" /></td>
    <td><span class="font_73"><span class="red font_st mr3">*</span>请如实填写您的联系电话</span></td>
  </tr>
 
  <tr>
    <td class="title">地址：</td>
    <td><input type="text" name="address" id="address" /></td>
    <td><span class="font_73"><span class="red font_st mr3">*</span>请如实填写您的地址</span></td>
  </tr> 
  <tr>
    <td class="title">营业部：</td>
    <td>
		<select name="province" id="province" onChange="Change_Select()" style="width: 120px">
		　　<!--第一个下拉菜单-->
		　　<option value="0" selected>--请选择省份--</option>
			<logic:iterate id="data" name="listProvince">
		　 		<option value="${data.province }">${data.province }</option>
		    </logic:iterate>
		</select>
		<div id="div_gncj" style="display: none;">
			<jsp:include page='${ctx}/match/nxsy/branchs.jsp'></jsp:include>
		</div>
		<div id="div_">
			<select style="width: 200px">
		     <option value="0">--请选择对应省份营业部--</option>
			</select>
		</div>
    </td>
    <td><span class="font_73"><span class="red font_st mr3">*</span>请如实选择您所在地营业部</span></td>
  </tr> 
  <tr>
    <td class="title">推荐人：</td>
    <td><input type="text" name="recommend" id="recommend" /></td>
    <td><span class="font_73"><span class="red font_st mr3">*</span>请填写您的推荐人姓名</span></td>
  </tr> 
</table>

<div align="center" class="mt15">
  <input type="submit" value="确定" class="but_03" />
  <input type="reset"  value="重置" class="but_03" /></div>
</div>
</form>
</div>
<jsp:include page="/match/nxsy/commons/bottom.jsp"></jsp:include>