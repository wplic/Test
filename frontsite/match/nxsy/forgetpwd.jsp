<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<jsp:include page="${ctx }/match/nxsy/commons/head.jsp"></jsp:include>
		<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
		<style type="text/css">
			.title{
			    color: #DA251C;
			    padding-top: 7px;
			    text-decoration: none;
			}
			.title_left{
				color:#3F626F;
				font-size:20px;
				
			}
			.emailShow{
				height:40px;
			}
			.input{
				height:30px;
				font-size:25px;
				width:250px;
			}
			.input2{
				height:30px;
				font-size:25px;
				width:125px;
			}
			.button {
			    background-color: #FF9900;
			    color: #FFFFFF;
			    height: 30px;
			    width: 70px;
			}
			.reset {
			    background-color: #F3F3F3;
			    color: #666666;
			    height: 30px;
			    width: 70px;
			}
		</style>
		<div style="border: 1px solid #CCCCCC;">
			<div class="p15" style="width: 780px; margin: auto;height:500px;">
				<script language="javascript">
						function checkForm() {
							var strMsg = "";
							strMsg += checkValid("email", "电子邮箱", "NotEmpty");
							strMsg += checkValid("verifyCode", "验证码", "NotEmpty");
							strMsg += checkValid("email","电子邮箱","Email")
							if (!isEmpty(strMsg)) {
								alert(strMsg);
								document.getElementById("email").focus();
								return false;
							}
							document.getElementById("form1").submit();
						}
						/**
						 * 按回车实现Tab功能
						 *
						 */
						function EnterTab(e, id) {
							var ev = window.event || e;
							if (ev.keyCode == 13) {
								if (id == "smt") {
									checkForm();
								} else {
									document.getElementById(id).focus();
								}
							}
						}
					</script>
				<div class="">
					<h2 class="title">找回密码</h2>
					<form name="form1" id="form1"
						action="/nxsyRegisterAction.do?method=forgetPwd" method="post">
						<div style="height:500px;margin:auto 0;">
							<table border="0" align="center" width=100%>
								<tbody>
								<tr>
									<td colspan="3" valign="bottom" height="35" align="left" style="color:#3F626F;">温馨提示：系统会发送一封新密码到您提供的邮箱地址，完成后请用新密码登录。</td>
								</tr>
								<tr>
									<td colspan="3" valign="bottom" height="30" align="center" style="color:#3F626F;"></td>
								</tr>
								<tr class="emailShow">
								<td class="title_left" width="45%" height="35" align="right">注册邮箱</td>
								<td width="10"></td>
								<td class="emailShow" width="299">
								<input  name="email" id="email" type="text" maxlength="60"  class="input">
								</td>
								</tr>
								<tr class="emailShow">
								<td class="title_left"  height="35" align="right">验证码</td>
								<td width="10"></td>
								<td class="emailShow" width="299">
								<input name="verifyCode" id="verifyCode" type="text" maxlength="60" class="input2">
								<img id="captchaImage" border=0 src="${ctx}/share/verifyCodeImage.jsp" width="70" height="28" align="absmiddle" border="0"/>
   
								</td>
								</tr>
								<tr height="30px"></tr>
								<tr>
									<td colspan="3" align="center">
							    	<input type="button" value="确定" onclick="checkForm();" class="button" />
							    	&nbsp;&nbsp;&nbsp;&nbsp;
							    	<input type="reset" value="重置" class="reset" />
	    							</td>
    							</tr>
								</tbody>
							</table>
						</div>
						<script>
							var errorMsg = "${errorMsg}";
							if (errorMsg != "") {
								alert(errorMsg);
							}
						</script>
					</form>
				</div>
			</div>
		</div>
		<jsp:include page="${ctx }/match/nxsy/commons/bottom.jsp"></jsp:include>