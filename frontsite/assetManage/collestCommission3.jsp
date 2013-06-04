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
		if(acctCust!=null && acctCust.getEmailaddress()!=null)
		emailStr=acctCust.getEmailaddress();
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
	 <jsp:include page="${contextPath}/assetManage/collectService_lmenu.jsp?menu=dzdzd" />
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
      <td width="10%"><input name="type" type="hidden" id="type" value="2"/></td>
      <td width="30%"><p align="right">电子对账单</p></td>
      <td colspan="2"><p ><input type="radio" name="statementType" id="statementType" value="0" <%=commission2!=null&&commission2.getStatementType()!=null&&!commission2.getStatementType().equals("")&&commission2.getStatementType().indexOf("0")>=0?"checked='true'":"" %>/>订制 </p></td>
     </tr>
     
      <tr>
      <td width="10%"></td>
       <td width="30%"><p align="right">邮箱 : </p></td>
      <td colspan="2"><p><input name="email" type="text" id="email" value="<%=commission2!=null&&commission2.getEmail()!=null?commission2.getEmail():emailStr %>" size="30" style="height:19px;" maxlength="30" /></p></td>
         
     </tr>
      <tr>
      <td width="10%" height="15"></td>        
     </tr>
   
    
     <tr>
      <td colspan="4"><p align="center"><input type="button" name="button1" id="button1" value="定制" class="but01" onclick="checkLogin();"/>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" name="button2" id="button2" value="取消" class="but01" onclick="checkLogindel();"/></p></td> 
          
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
	  
	 //判断email是否为正确地址
		var email=document.getElementById("email").value;
		if(email.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) != -1){
		}else{
		alert("email地址不正确");
		document.getElementById("email").value="";
		document.getElementById("email").focus();
		return false;
		}
	   if(confirm("是否确定?")){
		loginForm.submit();
		}else{
		 return false;
		} 
     }
   function  checkLogindel(){
   if(confirm("是否确定取消定制?")){
		document.location.href="${ctx}/commissionAction.do?method=delCommission&type=1"
		}else{
		 return false;
		}
   }

   var loginForm=document.getElementById("loginForm");
	  var statementType=document.getElementById("statementType");
     var email=document.getElementById("email").value;
     if( statementType.checked){
	   }else{
	     document.getElementById("email").value="";
	   }
	   

</SCRIPT> 
</html>