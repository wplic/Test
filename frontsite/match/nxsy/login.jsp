<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
     <jsp:include page="${ctx }/match/nxsy/commons/head.jsp"></jsp:include>
     <link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" /> 
     <div class="ggjs_box1" style="display:block; background:url('../../pic/infoCenter/f10/ggjs_bg.jpg') repeat-x scroll center top #E8E6E7;">  
    	 <div class="p15" style="width:780px; margin:auto; ">
      <div class="log_bg1"></div>
<script language = javascript>
if (window.top !== window.self) {
	var errorMsg="${errorMsg}";
  	if(errorMsg!=""){
  		alert(errorMsg);
  	}
	window.open('${ctx }/match/nxsy/login.jsp','_top');
}
</script>
<script language="javascript">
	function checkForm()
	{
		var strMsg = "";
		strMsg += checkValid("login_name", "登录名", "NotEmpty");
		strMsg += checkValid("pwd", "登录密码", "NotEmpty");
		strMsg += checkValid("verifyCode", "验证码", "NotEmpty");
		var login_type = document.getElementById("login_type").value;
		if(login_type == "client_id")
		{
			strMsg += checkValid("login_name", "登录名", "Numeric");	
		}
		if(!isEmpty(strMsg))
		{
			alert(strMsg);
			document.getElementById("login_name").focus();
            return false;
		}
		document.getElementById("loginForm").submit();
	}
	/**
	 * 按回车实现Tab功能
	 *
	 */
	function EnterTab(e,id)
	{
		var ev   = window.event|| e;
		if (ev.keyCode == 13)
		{
			if(id == "smt")
			{
				checkForm();
			} else {
				document.getElementById(id).focus();
			}
		}
	}
</script>
<div class="log_bg2">
<table width="77%" align="center" style="margin:0 auto;">
  <tr>
    <td height="8"></td>
  </tr>
  <tr>
    <td class="red bold">用户登录</td>
  </tr>
</table>
<div style=" height:38px"></div> 
<form name="loginForm" id="loginForm" action="/nxsyLoginAction.do?method=login" method="post">
	<script>
	  	var errorMsg="${errorMsg}";
	  	if(errorMsg!=""){
	  		alert(errorMsg);
	  	}
	</script>
<table width="30%" border="0" align="center" cellpadding="0" cellspacing="0" class="lh25">
  <tr>
   <td width="10" rowspan="5">&nbsp;</td>
   <td>登陆方式：</td>
   <td>
           <select name="login_type" id="login_type" style="width:108px">
                   <option value="nick_name">用户昵称</option>
    			<option value="id_no">身份证号码</option> 	
              </select>
   </td>
 </tr>
  <tr>
    <td>用 户 名：</td>
    <td><input type="text" id="login_name" name="login_name" type="text" onKeyDown="EnterTab(event,'pwd');" class="input108"/>
    <input type="hidden" name="url" value=""/>
    <input type="hidden" name="urlError" value=""/>
    <input type="hidden" name="callBack" id="callBack" value=""/>
    </td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密     码：</td>
    <td><input id="pwd" name="pwd" type="password"  maxlength="18" onKeyDown="EnterTab(event,'verifyCode');" class="input108"/>
      </td>
  </tr>
  <tr>
    <td>校 验 码：</td>
    <td>
     <input size="11" id="verifyCode" type="text" class="input108" name="verifyCode" maxlength="4" style=" width:50px" onKeyDown="EnterTab(event,'smt');"/>
     <img id="captchaImage" border=0 src="${ctx}/share/verifyCodeImage.jsp" width="70" height="28" align="absmiddle" border="0"/>
     </td>
  </tr>
  <tr>
	<td colspan="2">
		<table border="0" style="float:right;">
			<tr>
				<td><a href="${ctx }/match/nxsy/forgetpwd.jsp"><u><font color="red">忘记密码?</font></u></a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="javascript:refreshCaptcha();" ><u>看不清？换一张</u></a></td>
			</tr>
		</table>
	</td>
  </tr>
</table>
<div style=" height:15px"></div>
<table width="30%" border="0" align="center" cellpadding="0" cellspacing="0" class="lh25">
  <tr> 
  <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>   
    <td width="30%">
    	<input type="button" value="登&nbsp;&nbsp;陆" onclick="checkForm();" />
    </td>
    <td><input type="reset" value="重&nbsp;&nbsp;置"/></td>  
     <td><a href="${ctx }/match/nxsy/register.jsp"><u><font color="red">新用户注册</font></u></a>&nbsp;&nbsp;&nbsp;&nbsp;
     	</td> 
  </tr>
</table>
</form>

 <div style="margin-top: 30px; padding-left: 150px; color: red;" >提示：模拟交易大赛已经圆满结束！模拟交易系统将继续运行，同时初始理论<br/><code style="margin-left:35px;">杠杆倍数将调整为3倍！欢迎各位客户踊跃参与！</code></div>
</div>

    </div>
   
      </div>
	<jsp:include page="${ctx }/match/nxsy/commons/bottom.jsp"></jsp:include>