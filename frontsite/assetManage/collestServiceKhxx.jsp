<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<jsp:directive.page import="com.cssweb.clientService.pojo.LcUserInfo"/>
<jsp:directive.page import="com.cssweb.assetManager.pojo.AssetUser"/>
<jsp:directive.page import="java.util.*"/>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.cssweb.collect.pojo.AcctCust"%>
<%@ include file="/commons/taglibs.jsp"%>

<%
	AssetUser assetUser = null;
	if(null!=request.getSession().getAttribute("assetUser")){
		assetUser = (AssetUser)request.getSession().getAttribute("assetUser");
		String fundAccount = assetUser.getFundAccount();
	}else{%>
		<script language="javascript">
			window.location="/commons/loginms.jsp";
		</script>
	<%}
	//String fundAccount = assetUser.getFundAccount();
%>


<%
	AcctCust acctCust =	(AcctCust)request.getAttribute("acctCust");
	if (request.getAttribute("flag") != null)
	{
		Boolean flag =(Boolean)	request.getAttribute("flag");
		if(flag==true){
		%>
				<script type="text/javascript">
					alert("修改成功!");
				</script>
		<%
		}else{
		%>
				<script type="text/javascript">
					alert("修改失败!");
				</script>
		<%
		}
	}
 %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function bitian(){
		var mobile = document.getElementById("mobiletelno").value;
		var address = document.getElementById("address").value;
		var postcode = document.getElementById("postcode").value;
		var postcode = document.getElementById("postcode").value;
		var emailaddress=document.getElementById("emailaddress").value;
		if(mobile==""){
			alert("移动电话不能为空！");
			document.getElementById("mobiletelno").focus();
			return false;
		}
		var pattern=/(^[0-9]{3,4}\-[0-9]{3,8}$)|(^[0-9]{3,8}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^0{0,1}[0-9]{11}$)/; 
		if(!pattern.test(mobile)){
			alert("移动电话无效请重新输入！");
			document.getElementById("mobiletelno").focus();
			return false;
		}
		if(emailaddress.replace(/\s+/,"")!=""){
		var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		if(!reg.test(emailaddress)){
			alert("Email格式不对请重新输入！");
			document.getElementById("emailaddress").focus();
			return false;
		}
		}
		if(address==""){
			alert("联系地址不能为空！");
			document.getElementById("address").focus();
			return false;
		}
		if(postcode==""){
			alert("邮政编码不能为空！");
			document.getElementById("postcode").focus();
			return false;
		}
		var postcodestr=postcode.replace(/\s+/,"");
		if(postcodestr.length>6){
			alert("邮政编码大于6位数不正确请重新输入！");
			document.getElementById("postcode").focus();
			return false;
		}
		
		var qForm =document.getElementById("qForm");
		qForm.submit();
	}
</script>
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 客户服务 - 帐户资料修改 </div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 <jsp:include page="${contextPath}/assetManage/collectService_lmenu.jsp" />
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w706 fright">
  <div class="comtit1">
    <h4>帐户资料修改 </h4></div>
  <div class="blank10"></div>
	<form name="qForm" id="qForm" action="${contextPath}/acctCustAction.do?method=joinActive&menu=khjbxx" method="post">
    <table border="1" bordercolor="#cccccc" width="700" align="center" class="lh28">
      <tr>
        <td width="101" class="rrtab_tt pl5"> 客户姓名 </td> 
        <td width="583" class="pl5">
       ${data.cust_name}
        <input type="hidden" name="depositacct" value="${data.capital_account}"/>
		<input type="hidden" name="investorname" value="${data.cust_name}"/>
        </td>
      </tr>
      <tr>
        <td class="rrtab_tt pl5">客户类型</td>
        <td class="pl5">
       <c:if test="${data.cust_type==0}">
      	机构
       </c:if>
       <c:if test="${data.cust_type!=0}">
       	个人
       </c:if>
        	</td>
      </tr>
       <tr>
        <td class="rrtab_tt pl5">证件类型</td>
        <td class="pl5">
       ${data.card_type}
		</td>
      </tr>
       <tr>
        <td class="rrtab_tt pl5">证件号码</td>
        <td class="pl5">
    ${data.idcard}   
	</td>
      </tr>
      <%--
      <tr>
        <td class="rrtab_tt pl5">深圳市开放式号</td>
        <td class="pl5">
          <%=(acctCust==null || acctCust.getSzsecuritiesaccountid()==null)?"":acctCust.getSzsecuritiesaccountid() %></td>
      </tr>
       <tr>
        <td class="rrtab_tt pl5">上交所证券帐号</td>
        <td class="pl5">
          <%=(acctCust==null || acctCust.getShsecuritiesaccountid()==null)?"":acctCust.getShsecuritiesaccountid() %></td>
      </tr> --%>
      <tr>
        <td class="rrtab_tt pl5">账户状态</td>
        <td class="pl5">
        <c:if test="${data.status==0}">
      	正常
       </c:if>
       <c:if test="${data.status!=0}">
       	销户
       </c:if>
          
          </td>
      </tr>
      <%-- 
      <tr>
        <td class="rrtab_tt pl5">理财3号分红方式</td>
        <td class="pl5">
          <%=(acctCust==null || acctCust.getDefdividendmethod()==null)?"":acctCust.getDefdividendmethod() %></td>
      </tr>
      <tr>
        <td class="rrtab_tt pl5">理财4号分红方式</td>
        <td class="pl5">
          <%=(acctCust==null || acctCust.getDefdividendmethod()==null)?"":acctCust.getDefdividendmethod() %></td>
      </tr>
      --%>
      <tr>
        <td class="rrtab_tt pl5">联系电话</td>
        <td class="pl5">
         	<input  type="text" name="telno" id="telno" size="35" value="${data.phone}" /> </td>
      </tr>
      <tr>
        <td class="rrtab_tt pl5">移动电话</td>
        <td class="pl5">
         	<input  type="text" name="mobiletelno" id="mobiletelno" size="35" value="${data.mobile}" /><span class="red font_st ml5">*</span> </td>
      			<input  type="hidden" name="hometelno" id="hometelno" size="35" value="" />
      </tr>
       <tr>
        <td class="rrtab_tt pl5">传真</td>
        <td class="pl5">
         	<input  type="text" name="faxno" id="faxno" size="35" value="${data.fax}" /> </td>
      </tr>
       <tr>
        <td class="rrtab_tt pl5">电子邮件</td>
        <td class="pl5">
         	<input  type="text" name="emailaddress" id="emailaddress" size="35" value="${data.email}" /> </td>
      </tr>
      <tr>
        <td class="rrtab_tt pl5">联系地址</td>
        <td class="pl5"><input name="address" type="text" id="address"  size="35" value="${data.comm_addr }" /><span class="red font_st ml5">*</span></td>
      </tr>
       <tr>
        <td class="rrtab_tt pl5">邮政编码</td>
        <td class="pl5"><input name="postcode" type="text" id="postcode"  size="35" value="${data.zip}" /><span class="red font_st ml5">*</span></td>
      </tr>
      
      <tr>
        <td class="rrtab_tt pl5">开户日期</td>
        <td class="pl5">${data.open_date}</td>
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