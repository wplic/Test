<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
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
	  		strMsg += checkValid("pwd_old", "旧密码", "NotEmpty");
	  		strMsg += checkValid("pwd_new", "新密码", "NotEmpty");
	  		strMsg += checkValid("pwd_new2", "新密码2", "NotEmpty");	  		
	  				
	  		if(checkStrLength(getElement("pwd_new").value,"L<=6")){
        		strMsg+="【用户密码】不能小于6位！"
      		}
	  		if(strMsg != "")
	  		{
	  			alert(strMsg);
	  			return;
	  		}
	  		if(JQ("#pwd_new").val() !=JQ("#pwd_new2").val() )
	  		{
	  			alert("两次输入的新密码不一致！");
	  			return;
	  		}
	  		JQ("#form1").submit();
		}
	  	
	</script>

	<div align="center">
		<div class="wrap" style="width:99%">
			<form name="form1" id="form1"	action="/nxsyRegisterAction.do?method=modifyPwd" method="post">
				<div class="alignleft " style="width: 28%">
					<div class="tb_wrap">
						<div class="tb_header">
							<div>
								<table cellspacing="0" cellpadding="0" class="title line1">
									<tbody>
										<tr>
											<td class="b">用户密码重置</td>
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
												<td class="lbg">原密码：</td>
												<td><input type="password" name="pwd_old" id="pwd_old"/></td>
											</tr>
											
											<tr>
												<td class="lbg">新密码：</td>
												<td><input type="password" name="pwd_new" id="pwd_new"/></td>
											</tr>
											<tr>
												<td class="lbg">再次输入：</td>
												<td><input type="password" name="pwd_new2" id="pwd_new2"/></td>
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
	<script>
		JQ("#pwd_old").val("");
		JQ("#pwd_new").val("");
		JQ("#pwd_new2").val("");
	</script>

</body>
</html>