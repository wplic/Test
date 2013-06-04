<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@page import="com.cssweb.commission.pojo.Commission"%>
<%@page import="com.cssweb.assetManager.pojo.AssetUser"%>
<%@page import="com.cssweb.collect.service.AcctCustService"%>
<%@page import="com.cssweb.collect.pojo.AcctCust"%>
<%@page import="java.util.List"%>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<%
    String emailStr="";
	AssetUser assetUser = null;
	if(null!=request.getSession().getAttribute("assetUser")){
		assetUser = (AssetUser)request.getSession().getAttribute("assetUser");
		String fundAccount = assetUser.getFundAccount();
		ServletContext st = this.getServletConfig().getServletContext();
		ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
		AcctCustService acctCustService=(AcctCustService)ctx.getBean("acctCustService");
		AcctCust acctCust =	acctCustService.getAcctCustByDepositacct(fundAccount);
		if(acctCust!=null && acctCust.getMobiletelno()!=null)
		emailStr=acctCust.getMobiletelno();
	}else{%>
		<script language="javascript">
			window.location="/commons/loginms.jsp";
		</script>
	<%}
	String typeName="短信定制";
	
	String messageStr="";
	if(request.getAttribute("message")!=null&&!request.getAttribute("message").equals(""))
	{
	 if(request.getAttribute("message").toString().equals("1")){
	 messageStr="定制成功" ;
	 }else if(request.getAttribute("message").toString().equals("2")){
	 messageStr="取消成功" ;
	 }
	}
%>

<%
    Commission commission=null;
	if(request.getAttribute("commission")!=null&&!request.getAttribute("commission").equals(""))
	{
	  commission=(Commission)request.getAttribute("commission");
	}
	Commission commission2=null;
	if(request.getAttribute("commission2")!=null&&!request.getAttribute("commission2").equals(""))
	{
	  commission2=(Commission)request.getAttribute("commission2");
	}
	if(commission!=null)
	{
	 if(commission.getType().equals("2"))
	  typeName="邮件定制";
	}
 %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${contextPath }/css/style.css" rel="stylesheet" type="text/css" />

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
<jsp:include page="${contextPath}/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 定制服务</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 <jsp:include page="${contextPath}/assetManage/collectService_lmenu.jsp?menu=khdzfw" />
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w706 fright">
  <div class="comtit1">
    <h4>服务订制</h4></div>
  <div class="blank10"></div>
  <form name="loginForm" action="${ctx}/commissionAction.do?method=saveCommission" method="post" id="loginForm">
 
 <table border="1"width="100%">
 <tr><td>
  <table  width="98%" align="center" class="lh24 mt10 fwdz">
     <tr>
      
      <td width="30%"><p align="right">电子对账单</p></td>
      <td colspan="2"><p >
      		<input type="radio" name="statementType" id="statementType" onclick="radio1()" value="0" <%=commission2!=null&&commission2.getStatementType()!=null&&!commission2.getStatementType().equals("")&&commission2.getStatementType().indexOf("0")>=0?"checked='true'":"" %>/>订制 
      		<input type="radio" class="ml30" name="statementType" id="statementType2" value="2" <%=commission2!=null&&commission2.getContent()!=null&&!commission2.getStatementType().equals("")&&commission2.getStatementType().indexOf("2")>=0?"checked='checked'":"" %>/>取消</p></td>

     </tr>
     
      <tr>
     
       <td width="30%"><p align="right">邮箱 : </p></td>
      <td colspan="2"><p >
     		<input name="email" class="fwdz_input" type="text"
				id="email"
				value="${acctCust.emailaddress }"
				size="15" maxlength="30" />
      </p></td>
         
     </tr>
     
      <tr>
      	<td height="20"></td>     
      </tr>
      <tr>
        
      <td><p align="right">纸质对账单</p></td>

      <td colspan="2"><p >
      	<input type="radio" name="statementType1" id="statementType1" onclick="radio2()" value="1" <%=commission2!=null&&commission2.getStatementType()!=null&&!commission2.getStatementType().equals("")&&commission2.getStatementType().indexOf("1")>=0?"checked='checked'":"" %>/>订制 
      	<input type="radio" class="ml30" name="statementType1" id="statementType11" value="2"      <%=commission2!=null&&commission2.getContent()!=null&&!commission2.getStatementType().equals("")&&commission2.getStatementType().indexOf("2")>=0?"checked='checked'":"" %>/>取消</p></td>

        
     </tr>
     
      <tr>
      
       <td><p align="right">地址: </p></td>
      <td colspan="2"><p >
      	<input name="address" class="fwdz_input" type="text"
			id="address"
			value="${acctCust.address }"
			maxlength="300" />
      </p></td>
       
     </tr>
      <tr>
      	<td height="20"></td>     
      </tr>
     
      <tr>      
      <td><p align="right">每周产品净值短信</p></td>
      <td colspan="2"><p >
      	<input type="radio" name="type" id="type" value="1" <%=commission!=null&&commission.getContent()!=null&&!commission.getContent().equals("")&&commission.getContent().indexOf("5")>=0?"checked='checked'":"" %>/>订制 
      	<input type="radio" class="ml30" name="type" id="type1" value="3" <%=commission!=null&&commission.getContent()!=null&&!commission.getContent().equals("")&&commission.getContent().indexOf("null")>=0?"checked='checked'":"" %>/>取消</p></td>

     </tr>
      <tr>
      
       <td><p align="right">手机: </p></td>
      <td colspan="2"><p>
			<input name="phone" type="text" class="fwdz_input"
				id="phone"
				value="${acctCust.mobiletelno }"
				size="15" maxlength="11"
				onkeyup="value=value.replace(/[^0-9]/g,'')" />
      	</p>
      </td>
         
     </tr>
    
  <tr>
      	<td height="10"></td>     
      </tr>
     <tr>
      <td colspan="4"><p align="center">
      	<input type="hidden" value="${acctCust.custno }" name="custno"/>
      <input type="button" name="button1" id="button1" value="订制" class="but01" onclick="checkLogin();"/>

      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" name="button2" id="button2" value="返回" class="but01" onclick="checkLogindel();"/></p></td> 
          
     </tr>
      
  </table>
  </td></tr></table>
  </form>
  <div class="blank10"></div>				
  </div>
  <!--中侧sied结束--> 
    <!--右侧sied开始-->
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
<jsp:include page="${contextPath}/commons/msbottom.jsp" />
</body>
<SCRIPT LANGUAGE="JavaScript">
     function checkLogin(){
	 
	   var loginForm=document.getElementById("loginForm");
	  var statementType=document.getElementById("statementType");
      var statementType1=document.getElementById("statementType1");
        var type=document.getElementById("type");
       var email=document.getElementById("email").value;
	   var address=document.getElementById("address").value;
	   var phone= document.getElementById("phone").value; 
	    
	   if( statementType.checked){
      
	   if(email=="")
	   {
	     alert("邮箱不能为空！");
	     document.getElementById("email").value="";
	     document.getElementById("email").focus();
	     return false;
	   }
	   }
	    if( statementType1.checked){
      
	   if(address=="")
	   {
	     alert("地址不能为空！");
	     document.getElementById("address").value="";
	     document.getElementById("address").focus();
	     return false;
	   }
	   }
	   if( type.checked){
      
	   if(phone=="")
	   {
	     alert("电话不能为空！");
	     document.getElementById("phone").value="";
	     document.getElementById("phone").focus();
	     return false;
	   }
     
      }
	   if(confirm("是否确定?")){
		loginForm.submit();
		}else{
		 return false;
		} 
     }
   function  checkLogindel(){
   history.go(-1); 
   }
   
   function radio1(){
    var statementType=document.getElementById("statementType");
    var statementType2=document.getElementById("statementType2");
    var statementType1=document.getElementById("statementType1");
    var statementType11=document.getElementById("statementType11");
    statementType.checked=true;
    statementType11.checked=true;
   
}
function radio2(){
   var statementType=document.getElementById("statementType");
    var statementType2=document.getElementById("statementType2");
    var statementType1=document.getElementById("statementType1");
    var statementType11=document.getElementById("statementType11");
   statementType1.checked=true;
   statementType2.checked=true;
   
}
       var loginForm=document.getElementById("loginForm");
	  var statementType=document.getElementById("statementType");
	   var statementType2=document.getElementById("statementType2");
      var statementType1=document.getElementById("statementType1");
       var statementType11=document.getElementById("statementType11");
        var type=document.getElementById("type");
        var type1=document.getElementById("type1");
        if( statementType.checked){
	   }else{
	     statementType2.checked=true;
	   }
	   
	    if( statementType1.checked){
	   }else{
	     statementType11.checked=true;
	   }
	   
	    if( type.checked){
	   }else{
	     type1.checked=true;
	   }
 
</SCRIPT> 
</html>