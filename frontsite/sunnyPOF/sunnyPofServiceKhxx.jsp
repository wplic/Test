<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<jsp:directive.page import="com.cssweb.clientService.pojo.LcUserInfo"/>
<%@page import="com.fortuneage.sunnyPOF.pojo.SunnyCust"%>
<jsp:directive.page import="java.util.*"/>
<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="/commons/taglibs.jsp"%>

<%
SunnyCust sunnyCust = null;
if(null!=request.getSession().getAttribute("sunnyCust")){
	sunnyCust = (SunnyCust)request.getSession().getAttribute("sunnyCust");
	}else{%>
		<script language="javascript">
			window.location="login.jsp";
		</script>
	<%}
	//String fundAccount = assetUser.getFundAccount();
%>



<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function bitian(){
		//var tel = document.getElementById("tel").value;
		//var address = document.getElementById("address").value;
		//var postcode = document.getElementById("postcode").value;
		//if(tel==""){
		//	alert("移动电话不能为空！");
		//	document.getElementById("tel").focus();
		//	return false;
		//}
		//if(address==""){
		//	alert("联系地址不能为空！");
		//	document.getElementById("address").focus();
		//	return false;
		//}
		//if(postcode==""){
		//	alert("邮政编码不能为空！");
		//	document.getElementById("postcode").focus();
		//	return false;
		//}
		var qForm =document.getElementById("qForm");
		qForm.submit();
	}
	
</script>
<c:if test="${flag=='ok' }">
	<script type="text/javascript">
		alert("修改成功");
	</script>
</c:if>
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 客户服务 - 帐户资料修改 </div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 <jsp:include page="sunnyPofService_lmenu.jsp" >
	 	<jsp:param value="khjbxx" name="menu"/>
	 </jsp:include>
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w706 fright">
  <div class="comtit1">
    <h4>帐户资料修改 </h4></div>
	<form id="qForm" name="qForm" action="/sunnyCustAction.do?method=updateCust" method="post">
    <table border="1" bordercolor="#cccccc" width="700" align="center" class="lh28">
      <tr>
        <td width="15%" class="rrtab_tt pl5">客户名称</td>
        <td width="30%" class="pl5">${sunnyCust.custname }</td>
        <td width="15%">所属分公司</td>
        <td>${sunnyCust.subcompany }</td>
      </tr>
      
      <tr>
        <td class="rrtab_tt pl5">客户编号</td>
        <td class="pl5">${sunnyCust.custno }</td>
        <td>所属营业部</td>
        <td>${sunnyCust.businesssector }</td>
      </tr>
      
      <tr>
        <td class="rrtab_tt pl5">客户类型 </td>
        <td class="pl5">${sunnyCust.custtype }</td>
        <td>客户经理</td>
        <td>${sunnyCust.custmanager }</td>
      </tr>
      
      <tr>
        <td class="rrtab_tt pl5">证件类型 </td>
        <td class="pl5">${sunnyCust.credentialstype }</td>
        <td>客户经理联系方式</td>
        <td>${sunnyCust.custmanagertel }</td>
      </tr>
      
      <tr>
        <td class="rrtab_tt pl5">证件号码 </td>
        <td colspan="3" class="pl5">${sunnyCust.credentialsno }</td>
      </tr>
      
      <tr>
        <td class="rrtab_tt pl5">联系电话 </td>
        <td class="pl5"><input type="text" name="tel" id="tel" value="${sunnyCust.tel }"/></td>
        <td>服务质量监督电话</td>
        <td>${sunnyCust.complainttel }</td>
      </tr>
      
      <tr>
        <td class="rrtab_tt pl5">电子邮件 </td>
        <td colspan="3" class="pl5"><input type="text" name="email" id="email" value="${sunnyCust.email }"/></td>
      </tr>
      
      <tr>
        <td class="rrtab_tt pl5">通讯地址 </td>
        <td colspan="3" class="pl5"><input type="text" name="address" id="address" value="${sunnyCust.address }"/></td>
      </tr>
      <tr>
        <td class="rrtab_tt pl5">邮政编码 </td>
        <td class="pl5"><input type="text" name="postcode" id="postcode" value="${sunnyCust.postcode }"/></td>
        <td>服务质量监督邮箱</td>
        <td>${sunnyCust.complaintmail }</td>
      </tr>
      <tr>
        <td class="rrtab_tt pl5">职业 </td>
        <td class="pl5"><input type="text" name="vocation" id="vocation" value="${sunnyCust.vocation }"/></td>
        <td></td>
        <td></td>
      </tr>
     
    </table>
	<p align="center" class="mt10">
	  <input type="button" class="khfwbut red" name="button" id="button" onclick="bitian()" value="确定" />
	  <input type="reset" class="khfwbut red" name="button2" id="button2" value="重置" />
	</p>
	</form> 
  </div>
  <!--中侧sied结束--> 
    <!--右侧sied开始-->
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>