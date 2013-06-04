<%@ page contentType="text/html; charset=utf-8" language="java"  import="java.sql.*"%>
<jsp:directive.page
	import="com.cssweb.common.web.filter.SqlInjectValidate" />
<jsp:directive.page import="java.util.*" />
<jsp:directive.page import="java.text.SimpleDateFormat" />
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.common.util.CsswebServiceUtil"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.Map"/>
<%@page import="com.cssweb.client.pojo.TsystemWebuser"%>
<%@page import="com.cssweb.assetManager.pojo.AssetUser"%>

<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="org.apache.struts.action.ActionForm"%>
<%@page import="org.apache.struts.action.ActionForward"%>
<%@page import="org.apache.struts.action.ActionMapping"%>
<%@page import="org.apache.struts.actions.DispatchAction"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
%>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券“融智杯”融资融券仿真交易竞赛</title>
<link href="${contextPath }/css/community.css" rel="stylesheet" type="text/css" />
<link href="${contextPath }/css/financing/rongzhi/rongzhi.css" rel="stylesheet" type="text/css" />
<link href="${contextPath }/infoCenter/goldmoney/css/inner.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/prototype.js"></script>
<script type="text/javascript" src="${ctx}/js/jsUtils.js"></script>

<SCRIPT LANGUAGE="JavaScript">
//客户
function checkCpetName(){
    var nickName=document.getElementById("cnickName").value;
	if(nickName==""||nickName.length == 0)
	{
		alert("请输入昵称");
		return false;
	}
	
	var str=nickName;
	
	if(str.charCodeAt(0)>128||str.charCodeAt(0)<65){
	alert("合法的昵称应该以英文字母开头");
	document.getElementById("cnickName").value="";
	document.getElementById("cnickName").focus();
	return false;
	}
	if(/^[a-zA-Z][a-zA-Z0-9_]{2,15}$/.test(str)==false){
	alert("昵称由英文字母或数字,下划线组成,长度在3-16之间!");
	document.getElementById("cnickName").value="";
	document.getElementById("cnickName").focus();
	return false;
	}
	
	
	var url  = '${ctx}/registerAction.do';  	
	var paras = 'method=checkcnickName&cnickName='+nickName;  		
	new Ajax.Request(url, {method:'post',postBody: paras,asynchronous: false,				 
				  onSuccess: function(response) {		             
								if(response.responseText.trim()=='false'){
									alert("该昵称已经被注册！"); 
									document.getElementById("cnickName").value="";
									document.getElementById("cnickName").focus();
								}else{
									alert("恭喜你该昵称可以注册");
								}
						}, 
				onFailure: function() {alert("昵称注册验证失败！");}    
				}
				
			); 
}
	
	function checkCustonReg() {
	  //验证客户报名表
	 	
		 var nickName=document.getElementById("cnickName").value;
	if(nickName==""||nickName.length == 0)
	{
		alert("请输入昵称");
		return false;
	}
	
	var str=nickName;
	
	if(str.charCodeAt(0)>128||str.charCodeAt(0)<65){
	alert("合法的昵称应该以英文字母开头");
	document.getElementById("cnickName").value="";
	document.getElementById("cnickName").focus();
	return false;
	}
	if(/^[a-zA-Z][a-zA-Z0-9_]{2,15}$/.test(str)==false){
	alert("昵称由英文字母或数字,下划线组成,长度在3-16之间!");
	document.getElementById("cnickName").value="";
	document.getElementById("cnickName").focus();
	return false;
	}
	 	var cmobile = document.getElementById("cmobile").value ;
				if (cmobile == ""){
					alert("手机号码不能为空");
					document.getElementById("cmobile").focus();
					return false;
				}
				if (cmobile.length!=11){
					alert("手机号码输入不正确");
					document.getElementById("cmobile").value="";
				    document.getElementById("cmobile").focus();
					return false;
				}	
				var caddress = document.getElementById("caddress").value ;
				if (caddress == ""){
					alert("联系地址不能为空");
					document.getElementById("caddress").focus();
					return false;
				}	
	
	var url  = '${ctx}/registerAction.do';  	
	var paras = 'method=checkcnickName&cnickName='+nickName;  		
	new Ajax.Request(url, {method:'post',postBody: paras,asynchronous: false,				 
				  onSuccess: function(response) {		             
								if(response.responseText.trim()=='false'){
									alert("该昵称已经被注册！"); 
									document.getElementById("cnickName").value="";
									document.getElementById("cnickName").focus();
								}else{
									var b = document.getElementById("regCustomForm")
									b.action = "${contextPath}/registerAction.do?method=saveRegister"
									b.submit(); 		
								}
						}, 
				onFailure: function() {alert("昵称注册验证失败！");}    
				}
				
			); 
	
	}
	
	function gobuck(){
	window.location.href = "/financing/rongzhi/matchIntro.jsp";
}
</SCRIPT>
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
<%
	SqlInjectValidate sqlInjectValidate = SqlInjectValidate
			.getSqlInjectValidate();
	if (request.getParameter("nav1") != null
			&& !request.getParameter("nav1").equals("")) {
		if (sqlInjectValidate.vakidateSqlStringForLength(
				request.getParameter("nav1"), 10)) {
			response.sendRedirect(request.getContextPath()
					+ "/commons/error2.jsp");
			return;
		}
	}
	if (request.getParameter("nav") != null
			&& !request.getParameter("nav").equals("")) {
		if (sqlInjectValidate.vakidateSqlStringForLength(
				request.getParameter("nav"), 10)) {
			response.sendRedirect(request.getContextPath()
					+ "/commons/error2.jsp");
			return;
		}
	}
%>
<body>
<jsp:include page="/share/pdLogin.jsp" />
	<jsp:include page="/share/top.jsp" />
	<!-- header end -->
	<div id="subbanner">
		<img src="${contextPath }/pic/financing/rongzhi/rongzhi_banner.jpg" />
	</div>
	<div class="subMainconter">
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="layout">
			<tr>
				<th valign="top" class="wrapleft">
					<div class="navLeft">
						<h3>
							<img src="${contextPath }/images/rongzhi/rongzhi_btn.jpg" style="margin-left: 10px;" />
						</h3>
						<jsp:include page="sideMenu.jsp" />
					</div></th>
				<td valign="top" class="wrapright">
					<div class="columnOut">				
					
								<div class="columnTitle">	
								<h3>客户报名</h3>
							<span><b>首页</b>><b>2012年广发证券“融智杯”融资融券仿真交易竞赛</b>><strong>客户报名</strong>
							</span>						
						     </div>
						 <div class="columnMain summary">
							<form name="regCustomForm" id="regCustomForm" action="" method="post">	
							<div class="tips">请输入您的竞赛专用昵称，以便您查看竞赛排名结果</div>
							 <c:choose><c:when test="${custRegister!=null }">
								<div class="nickname">
									<label>客户昵称：</label>
									<input type="text" value="${custRegister.petName }" name="cnickName" id="cnickName" class="intotext"/>	
									<input type="button" name="Submit3" value="检测"  class="but_02" onclick="checkCpetName()"/>	
								</div>
								<div class="nickname odd">
									<label>客户姓名：</label>
									<input type="text" value="${custRegister.custName }" name="cname" id="cname" class="intotext" readonly />	
								</div>	
								<div class="nickname">
									<label>客户编号：</label>
									<input type="text" value="${custRegister.custNo}" name="cNum" id="cNum" class="intotext" readonly />	
								</div>	
								<div class="nickname odd">
									<label>手机号码：</label>
									<input type="text" value="${custRegister.phone}" name="cmobile" id="cmobile" class="intotext"/>	
								</div>	
								<div class="nickname">
									<label>联系地址：</label>
									<input type="text" value="${custRegister.address}" name="caddress" id="caddress" class="intotext"/>	
								</div>								
								</c:when>
  								<c:otherwise>
  								<div class="nickname">
									<label>客户昵称：</label>
									<input type="text" value="${custRegister.petName }" name="cnickName" id="cnickName" class="intotext"/>	
									<input type="button" name="Submit3" value="检测"  class="but_02" onclick="checkCpetName()"/>	
								</div>
								<div class="nickname odd">
									<label>客户姓名：</label>
									<input type="text" name="cname" id="cname" class="intotext" readonly/>	
								</div>	
								<div class="nickname">
									<label>客户编号：</label>
									<input type="text" name="cNum" id="cNum" class="intotext" readonly/>	
								</div>	
								<div class="nickname odd">
									<label>手机号码：</label>
									<input type="text" name="cmobile" id="cmobile" class="intotext"/>	
								</div>	
								<div class="nickname">
									<label>联系地址：</label>
									<input type="text" name="caddress" id="caddress" class="intotext"/>	
								</div>								
  								</c:otherwise>
  								</c:choose>	
  								<div align="center" class="mt15">
							  <input type="button" value="确认报名" onclick="checkCustonReg()"class="but_03" />
							  <input type="button" onclick="gobuck()" value="取消报名" class="but_03" /></div>
							</div>
							</form>
						</div>							
						
						<div class="columnButtom">
							<img src="${contextPath }/gyjj/images/columnButtom.jpg" />
						</div>
					</div></td>
			</tr>
		</table>
	</div>
	<div class="clear"></div>
	<script type="text/javascript" src="../../js/common.js"></script>	
<script type="text/javascript">
$(".tableBar").tabs({meth:"click"});
</script>
	<jsp:include page="${ctx }/share/bottom.jsp" />
</body>
</html>
