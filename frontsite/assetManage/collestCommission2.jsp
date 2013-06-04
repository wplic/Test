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
    String address="";
    String postcode="";
    String mobiletelno="";
	AssetUser assetUser = null;
	if(null!=request.getSession().getAttribute("assetUser")){
		assetUser = (AssetUser)request.getSession().getAttribute("assetUser");
		String fundAccount = assetUser.getFundAccount();
		ServletContext st = this.getServletConfig().getServletContext();
		ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
		AcctCustService acctCustService=(AcctCustService)ctx.getBean("acctCustService");
		AcctCust acctCust =	acctCustService.getAcctCustByDepositacct(fundAccount);
		
		if(acctCust!=null&&acctCust.getEmailaddress()!=null)
		  emailStr=acctCust.getEmailaddress();
		if(acctCust!=null && acctCust.getAddress()!=null)
		address=acctCust.getAddress();
		if(acctCust!=null && acctCust.getPostcode()!=null)
		postcode=acctCust.getPostcode();
		if(acctCust!=null && acctCust.getMobiletelno()!=null)
		mobiletelno=acctCust.getMobiletelno();
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
    <h4>定制服务</h4></div>
  <div class="blank10"></div>
  <div class="khfwtit1"><span class="font14"><%=typeName %></span></div>
  <form name="loginForm" action="${ctx}/commissionAction.do?method=saveCommission&type=2" method="post" id="loginForm">
   <table border="1"width="100%">
 <tr><td>
  
  <table border="0" bordercolor="#cccccc" width="98%" align="center" class="lh24 mt10">
    
    <tr>
      <td width="10%"></td>
      <td><p align="center">邮箱 : <input name="email" type="text" id="email" value="<%=commission!=null&&commission.getEmail()!=null?commission.getEmail():emailStr %>" size="15" maxlength="30" /></p></td>
      <td><p align="center" class="red"><%=messageStr %></p></td>
      <td></td>     
     </tr>
     
     <tr>
      <td width="10%" height="25"></td>
      <td></td>
      <td></td>
      <td width="30%"></td>     
     </tr>
     
     <tr>
      <td></td>
      <td><p align="left"><input type="checkbox" name="checkbox1" id="checkbox1" value="1" <%=commission!=null&&commission.getContent()!=null&&!commission.getContent().equals("")&&commission.getContent().indexOf("1")>=0?"checked='checked'":"" %>  onclick="selectlDzd('dzdtable2')"/>对账单 </p></td>
      <td></td>
      <td></td>     
     </tr>
    
    
   <tr>
      <td></td>
      
      <td id="dzdtable2" align="left" style=" display:none">
     <table>
      <td></td>
      <td></td>  
      <tr>
      <td><p align="left" >频度:&nbsp;
                <select name="select_name1" id="select_name1" style="width:108px">
                    <option value="1" <%=commission!=null&&commission.getFrequency()!=null&&!commission.getFrequency().equals("")&&commission.getFrequency().indexOf("1")>=0?"selected":"" %>>月度</option>
                    <option value="7" <%=commission!=null&&commission.getFrequency()!=null&&!commission.getFrequency().equals("")&&commission.getFrequency().indexOf("7")>=0?"selected":"" %>>季度</option>
                    <option value="2" <%=commission!=null&&commission.getFrequency()!=null&&!commission.getFrequency().equals("")&&commission.getFrequency().indexOf("2")>=0?"selected":"" %>>年度</option>
              </select></p></td>       
     </tr>
     <tr>
      <td width="10%" height="10"></td>   
     </tr>   
     <tr>
      <td><p align="left" >对账单订购形式:&nbsp;
                <select name="statementType" id="statementType" style="width:108px">
                    <option value="0" <%=commission!=null&&commission.getStatementType() !=null&&!commission.getStatementType().equals("")&&commission.getStatementType().indexOf("0")>=0?"selected":"" %>>电子邮件</option>
                    <option value="1" <%=commission!=null&&commission.getStatementType()!=null&&!commission.getStatementType().equals("")&&commission.getStatementType().indexOf("1")>=0?"selected":"" %>>书面邮寄</option>
                    <option value="2" <%=commission!=null&&commission.getStatementType()!=null&&!commission.getStatementType().equals("")&&commission.getStatementType().indexOf("2")>=0?"selected":"" %>>不需要</option>
              </select></p></td>       
     </tr>
     <tr>
      <td width="10%" height="10"></td>   
     </tr>
     <tr>
      <td><p align="left">地址:&nbsp; <input name="address" type="text" id="address" style="width:200px" value="<%=commission!=null&&commission.getAddress()!=null?commission.getAddress():address %>" maxlength="300"/></p></td>     
     </tr>
     <tr>
      <td width="10%" height="10"></td>   
     </tr>
     <tr>
     <tr>
      <td><p align="left">邮编:&nbsp; 
                <input name="post" type="text" id="post" style="width:108px" value="<%=commission!=null&&commission.getPost()!=null?commission.getPost():postcode %>" maxlength="6" onkeyup="value=value.replace(/[^0-9]/g,'')"/>
                </p></td>   
     </tr>
     <tr>
      <td width="10%" height="10"></td>    
     </tr>
     <tr>
     <tr>
      <td><p align="left">电话:&nbsp;
                <input name="homePohe" type="text" id="homePohe" style="width:108px" value="<%=commission!=null&&commission.getHomePohe()!=null?commission.getHomePohe():mobiletelno %>" maxlength="18" onkeyup="value=value.replace(/[^0-9]/g,'')"/>
       </td>    
     </tr>
          </table>          
       </td>
      <td></td>     
     </tr>
	 
     <tr>
      <td width="10%" height="10"></td>
      <td></td>
      <td></td>
      <td></td>     
     </tr>
     <tr>
      <td></td>
      <td><p align="left"><input type="checkbox" name="checkbox2" id="checkbox2" value="2" <%=commission!=null&&commission.getContent()!=null&&!commission.getContent().equals("")&&commission.getContent().indexOf("2")>=0?"checked='checked'":"" %>/>净值信息 </p></td>
      <td><p align="center"> 
                频度:&nbsp;<select name="select_name2" id="select_name2" style="width:108px">
                    <option value="0" <%=commission!=null&&commission.getFrequency()!=null&&!commission.getFrequency().equals("")&&commission.getFrequency().indexOf("0")>=0?"selected":"" %>>不接受</option>
                    <option value="3" <%=commission!=null&&commission.getFrequency()!=null&&!commission.getFrequency().equals("")&&commission.getFrequency().indexOf("3")>=0?"selected":"" %>>每日</option>
                    <option value="4" <%=commission!=null&&commission.getFrequency()!=null&&!commission.getFrequency().equals("")&&commission.getFrequency().indexOf("4")>=0?"selected":"" %>>每周</option>
                    <option value="5" <%=commission!=null&&commission.getFrequency()!=null&&!commission.getFrequency().equals("")&&commission.getFrequency().indexOf("5")>=0?"selected":"" %>>每月</option>
              </select></p></td>
      <td></td>     
     </tr>
     <tr>
      <td width="10%" height="10"></td>
      <td></td>
      <td></td>
      <td></td>     
     </tr>
       <tr>
      <td></td>
      <td><p align="left"><input type="checkbox" name="checkbox3" id="checkbox3" value="3" <%=commission!=null&&commission.getContent()!=null&&!commission.getContent().equals("")&&commission.getContent().indexOf("3")>=0?"checked='checked'":"" %>/>公告及其它资讯信息</p></td>
      <td><p align="center"> 
                频度:&nbsp;<select name="select_name3" id="select_name3" style="width:108px">
                    <option value="6" <%=commission!=null&&commission.getFrequency()!=null&&!commission.getFrequency().equals("")&&commission.getFrequency().indexOf("6")>=0?"selected":"" %>>不定时</option>
              </select></p></td>
      <td></td>     
     </tr>
     <tr>
      <td width="10%" height="10"></td>
      <td></td>
      <td></td>
      <td></td>     
     </tr>
      <tr>
      <td></td>
      <td><p align="left"><input type="checkbox" name="checkbox8" id="checkbox8" value="8" <%=commission!=null&&commission.getContent()!=null&&!commission.getContent().equals("")&&commission.getContent().indexOf("8")>=0?"checked='checked'":"" %>/>广发晨会资讯</p></td>
      <td><p align="center"> 
                频度:&nbsp;<select name="select_name8" id="select_name8" style="width:108px">
                    <option value="6" <%=commission!=null&&commission.getFrequency()!=null&&!commission.getFrequency().equals("")&&commission.getFrequency().indexOf("6")>=0?"selected":"" %>>不定时</option>
              </select></p></td>
      <td></td>     
     </tr>
     <tr>
      <td width="10%" height="10"></td>
      <td></td>
      <td></td>
      <td></td>     
     </tr>
      <tr>
      <td></td>
      <td><p align="left"><input type="checkbox" name="checkbox9" id="checkbox9" value="9" <%=commission!=null&&commission.getContent()!=null&&!commission.getContent().equals("")&&commission.getContent().indexOf("9")>=0?"checked='checked'":"" %>/>资产管理部研究报告</p></td>
      <td><p align="center"> 
                频度:&nbsp;<select name="select_name3" id="select_name3" style="width:108px">
                    <option value="6" <%=commission!=null&&commission.getFrequency()!=null&&!commission.getFrequency().equals("")&&commission.getFrequency().indexOf("6")>=0?"selected":"" %>>不定时</option>
              </select></p></td>
      <td></td>     
     </tr>
     <tr>
      <td width="10%" height="10"></td>
      <td></td>
      <td></td>
      <td></td>     
     </tr>
     <tr>
     
      <td></td>
      <td><p align="center"><input type="button" name="button1" id="button1" value="定制" class="but01" onclick="checkLogin();"/></p></td>
      <td><input type="button" name="button2" id="button2" value="取消" class="but01" onclick="checkLogindel();"/></td> 
       <td></td>    
     </tr>
     <tr>
      <td width="10%" height="10"></td>
      <td></td>
      <td></td>
      <td></td>     
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
	   var email=document.getElementById("email").value;
	   var loginForm=document.getElementById("loginForm");
	   if(email=="")
	   {
	     alert("邮箱不能为空！");
	     document.getElementById("email").value="";
	     document.getElementById("email").focus();
	     return false;
	   }
	   var emailPat=/^(.+)@(.+)$/;
					var matchArray=email.match(emailPat);
					if (matchArray==null) {
					 alert("电子邮件地址格式不正确")
					 document.getElementById("email").value="";
	                 document.getElementById("email").focus();
					 return false;
					}
	 var statementType=document.getElementById("statementType").value;
	   if(statementType=="1")
	   {
	    var address=document.getElementById("address").value;
		var post=document.getElementById("post").value;
		var homePohe=document.getElementById("homePohe").value;
		   if(address=="")
		   {
		     alert("地址不能为空！");
		     document.getElementById("address").value="";
		     document.getElementById("address").focus();
		     return false;
		   }
		   if(post=="")
		   {
		     alert("邮编不能为空！");
		     document.getElementById("post").value="";
		     document.getElementById("post").focus();
		     return false;
		   }
		   if(homePohe=="")
		   {
		     alert("电话不能为空！");
		     document.getElementById("homePohe").value="";
		     document.getElementById("homePohe").focus();
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
     if(confirm("是否确定取消定制?")){
		    document.location.href="${ctx}/commissionAction.do?method=delCommission&type=2"
		    }else{
		    return false;
		    }
   }
   
	function selectlDzd(obj2)
	{
		var obj2 = document.getElementById(obj2);
		
		var temp = obj2.style.display;
		if(temp == "none")
		{
			obj2.style.display = "";
		}
		else
		{
			obj2.style.display = "none";
		}
	}
</SCRIPT> 
<%
	if (commission!=null&&commission.getContent()!=null&&!commission.getContent().equals("")&&commission.getContent().indexOf("1")>=0)
	{
			%>
					<script type="text/javascript">
						document.getElementById("dzdtable2").style.display= "";
					</script>
			<%
	}
%>
</html>