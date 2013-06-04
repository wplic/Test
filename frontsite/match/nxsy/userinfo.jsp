<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">   
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">   
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT"> 
<link href="${ctx }/match/nxsy/mncg/skin/default/css/global.css"rel="stylesheet" type="text/css">
<link href="${ctx }/match/nxsy/mncg/skin/default/css/font.css"rel="stylesheet" type="text/css">
<script src="${ctx }/match/nxsy/mncg/js/jquery-1.3.2.js"	type="text/javascript"></script>
<script type="text/javascript"	src="${ctx }/match/nxsy/mncg/js/commons.js"></script>
<script src="${ctx }/match/nxsy/mncg/js/page.js" type="text/javascript"></script>
<script language="javascript">
	var JQ = jQuery.noConflict();
</script>
</head>
<body>
	<script>
	  	var errorMsg="${errorMsg}";
	  	if(errorMsg!=""){
	  		alert(errorMsg);
	  	}
	  	function dosubmit()
		{
	  		var strMsg = "";
	  		strMsg += checkValid("client_name", "用户姓名", "NotEmpty");
	  		strMsg += checkValid("nick_name", "用户昵称", "NotEmpty");
	  		strMsg += checkValid("email", "用户邮箱", "NotEmpty");
	  		strMsg += checkValid("mobile_tel", "移动电话", "NotEmpty");
	  		strMsg += checkValid("address", "家庭住址", "NotEmpty");
	  		strMsg += checkValid("id_no", "身份证号码", "NotEmpty");
	  		strMsg += checkValid("email","电子邮箱","Email");
	  		strMsg += checkValid("mobile_tel", "移动电话", "Mobile");
	  		if(strMsg != "")
	  		{
	  			alert(strMsg);
	  			return;
	  		}
	  		var id_no = document.getElementById("id_no").value;
	  		if(id_no.trim().length != 15 && id_no.trim().length != 18) {
	  			
				alert("身份证的长度为15位或者18位");
				//document.getElementById("card").value = "";
				document.getElementById("card").focus();
				return false;
			}
	  		JQ("#form1").submit();
		}
	  	
	</script>

	<div align="center">
		<div class="wrap" style="width:99%">
			<form name="form1" id="form1"	action="/nxsyRegisterAction.do?method=modifyUserinfo" method="post">
				<div class="alignleft " style="width: 35%">
					<div class="tb_wrap">
						<div class="tb_header">
							<div>
								<table cellspacing="0" cellpadding="0" class="title line1">
									<tbody>
										<tr>
											<td class="b">用户资料修改</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- end header -->
						<div class="tb_body">
							<div class="tb_content">

								<div class="alignleft " id="stockBox">
									<table class="bs">
										<tbody>
											<tr>
												<td class="lbg">客户编号：</td>
												<td>
													<div id="dclient_id">${data.client_id }</div></td>
												<input type="hidden" name="client_id" id="client_id" value="${data.client_id }"/>
											</tr>
											<tr>
												<td class="lbg">用户姓名：</td>
												<td><input type="text" tabindex="2" size="20" id="client_name" name="client_name" value="${data.client_name }">
												</td>
											</tr>
											<tr>
												<td class="lbg">用户昵称：</td>
												<td><input readonly="redonly" style="background-color: #EEEEE0;" type="text" tabindex="2" size="20" id="nick_name" name="nick_name" value="${data.nick_name }">
												</td>
											</tr>
											<tr>
												<td class="lbg">身份证：</td>
												<td><input readonly="redonly" style="background-color: #EEEEE0;" type="text" tabindex="2" size="20" id="id_no" name="id_no" value="${data.id_no }">
												</td>
											</tr>
											<tr>
												<td class="lbg">联系电话：</td>
												<td><input type="text" tabindex="2" size="20" id="mobile_tel" name="mobile_tel" value="${data.mobile_tel }">
												</td>
											</tr>
											<tr>
												<td class="lbg">邮箱地址：</td>
												<td><input readonly="redonly" style="background-color: #EEEEE0;" type="text" tabindex="2" size="20" id="email" name="email" value="${data.email }">
												</td>
											</tr>
											<tr>
												<td class="lbg">地址：</td>
												<td><input type="text" tabindex="2" size="28" id="address" name="address" value="${data.address }">
												</td>
											</tr>
											<tr>
												<td height="36" align="center" colspan="2">
													<input type="button" value="确&nbsp;&nbsp;定" class="button4" onClick="dosubmit()">
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- end tb_body -->
						<div class="tb_footer">
							<div></div>
						</div>
						<!-- end tb_footer -->
						<div class="clear"></div>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>
</html>