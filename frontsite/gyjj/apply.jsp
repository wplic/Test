<%@ page contentType="text/html; charset=utf-8" language="java" %>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<jsp:directive.page import="java.util.*"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证劵_社会公益基金</title>
<link href="${contextPath }/gyjj/css/community.css" rel="stylesheet" type="text/css" />
<script src="${contextPath }/gyjj/js/swfobject_source.js" type=text/javascript></script>
<script src="${contextPath }/gyjj/js/prototype.js" type="text/javascript" charset="UTF-8"></script>
<script src="${contextPath }/gyjj/js/validation_cn.js" type="text/javascript" charset="UTF-8"></script>
<script src="${contextPath }/gyjj/js/effects.js" type="text/javascript" charset="UTF-8"></script>
<SCRIPT LANGUAGE="JavaScript">
String.prototype.isMobile = function() {  
	  return (/^(?:13\d|15\d|18[89])-?\d{5}(\d{3}|\*{3})$/.test(this.Trim()));  
	} 

	String.prototype.isTel = function()
	{
	    //"兼容格式: 国家代码(2到3位)-区号(2到3位)-电话号码(7到8位)-分机号(3位)"
	    return (/^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/.test(this.Trim()));
	}
	function refreshCaptcha(){
		document.getElementById("captchaImage").src="${ctx}/share/verifyCodeImage.jsp?ran="+Math.random();
	}
	function checkMoblie(){
		 var moblie=document.getElementById("moblie");
	  if (moblie.value.isMobile())  {  
		 moblie.value = moblie.value.Trim();  
        return true;  
     } 
    else {  
        alert("请输入正确的手机号码或电话号码 例如:13901000000或010-3614072");
        document.getElementById("moblie").focus();
        return false;        
    }
	}
	function checkPhone(){
		 var frPhone=document.getElementById("frPhone");
		 if (frPhone.value.isMobile()||frPhone.value.isTel())  
		 {  
			 frPhone.value = frPhone.value.Trim();  
       		 return true;  
    	 } 
   	 else {  
      	 	 alert("请输入正确的手机号码或电话号码\n\n例如:13901000000或010-3614072");
      	 	 document.getElementById("frPhone").focus();
       		 return false;        
    	  }
	}
	 function checkReg(){
	      
		   var applyName=document.getElementById("applyName").value;
		   var applyFr=document.getElementById("applyFr").value;
		   var frPhone=document.getElementById("frPhone").value;
		   var applyPeople=document.getElementById("applyPeople").value;
		   var moblie=document.getElementById("moblie").value;
		   var email=document.getElementById("email").value;
		   var fax=document.getElementById("fax").value;
		   var address=document.getElementById("address").value;
		   var postal=document.getElementById("postal").value;
		   var website=document.getElementById("website").value;
		   var regJg=document.getElementById("regJg").value;
		   var remark=document.getElementById("remark").value;
		   var verifyCode= document.getElementById("verifyCode").value;  
		  
		   if(applyName=="")
		   {
		     alert("机构名不能为空！");
		     document.getElementById("applyName").value="";
		     document.getElementById("applyName").focus();
		     return false;
		   }
		   if(applyFr=="")
		   {
		     alert("机构法人不能为空！");
		     document.getElementById("applyFr").value="";
		     document.getElementById("applyFr").focus();
		     return false;
		   }
		   if(frPhone=="")
		   {
		     alert("法人电话不能为空！");
		     document.getElementById("frPhone").value="";
		     document.getElementById("frPhone").focus();
		     return false;
		   }
		   if(applyPeople=="")
		   {
		     alert("联系人不能为空！");
		     document.getElementById("applyPeople").value="";
		     document.getElementById("applyPeople").focus();
		     return false;
		   }
		   if(moblie=="")
		   {
		     alert("移动电话不能为空！");
		     document.getElementById("moblie").value="";
		     document.getElementById("moblie").focus();
		     return false;
		   }
		   if(email=="")
		   {
		     alert("电子邮件不能为空！");
		     document.getElementById("email").value="";
		     document.getElementById("email").focus();
		     return false;
		   }
		   if(fax=="")
		   {
		     alert("传真不能为空！");
		     document.getElementById("fax").value="";
		     document.getElementById("fax").focus();
		     return false;
		   }
		   if(address=="")
		   {
		     alert("地址不能为空！");
		     document.getElementById("address").value="";
		     document.getElementById("address").focus();
		     return false;
		   }
		   if(postal=="")
		   {
		     alert("邮编不能为空！");
		     document.getElementById("postal").value="";
		     document.getElementById("postal").focus();
		     return false;
		   }
		   if(postal.length!=6||isNaN(postal)){
			   alert("邮编只能是六位数字！");
			   document.getElementById("postal").value="";
			   document.getElementById("postal").focus();
			   return false;
		   }
		   if(website=="")
		   {
		     alert("网站不能为空！");
		     document.getElementById("website").value="";
		     document.getElementById("website").focus();
		     return false;
		   }
		   if(regJg=="")
		   {
		     alert("注册机构不能为空！");
		     document.getElementById("regJg").value="";
		     document.getElementById("regJg").focus();
		     return false;
		   }
		   if(remark=="")
		   {
		     alert("项目简介不能为空！");
		     document.getElementById("remark").value="";
		     document.getElementById("remark").focus();
		     return false;
		   }
		   if(remark.length>2000)
		   {
		     alert("项目简介不能超过1000字！");
		     document.getElementById("remark").focus();
		     return false;
		   }
		   if(verifyCode=="")
		   {
		     alert("验证码不能为空！");
		     document.getElementById("verifyCode").value="";
		     document.getElementById("verifyCode").focus();
		     return false;
		   }
		    if(verifyCode.length!=4)
		   {
		     alert("验证码应该是4位！");
		     document.getElementById("verifyCode").value="";
		     document.getElementById("verifyCode").focus();
		     return false;
		   }
		    var url  = '${ctx}/webUser.do';  	
		       var paras = 'method=checkVerifyCode&verifyCode='+verifyCode;  	
		       new Ajax.Request(url, {method:'post',postBody: paras,asynchronous: false,				 
					onSuccess: function(response) {    
					    if (response.responseText==0) {
					      alert('验证码输入错误！');
					    } else if (response.responseText==1) { 
					    	 var a = document.getElementById("regForm")
						 	 a.action="${contextPath}/applyAction.do?method=saveOrUpdate"
							 a.submit();
					    }  
					}, 
					onFailure: function() {
					    alert('验证码有误！');
					}    
			   });
	     }
</SCRIPT>
</head>
<%
 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	if(request.getParameter("nav1")!=null&&!request.getParameter("nav1").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav1"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}
	if(request.getParameter("nav")!=null&&!request.getParameter("nav").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}
%>
<body>
<jsp:include page="/gyjj/index_top.jsp?nav=xmsq" />
<!-- header end -->
<div id="subbanner"><img src="${contextPath }/gyjj/images/subBanner.jpg" /></div>
<div class="subMainconter">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layout">
  <tr>
    <th valign="top" class="wrapleft">
    <div class="navLeft">
      <h3><img src="${contextPath }/gyjj/images/title_xmsq.jpg" /></h3>
      <ul class="navleftList">
      <li><a href="${contextPath }/gyjj/sqtj.jsp">申请条件</a></li>
      <li class="this"><a href="${contextPath }/gyjj/apply.jsp">我要申请</a></li>
    </ul>
    </div>
    </th>
    <td valign="top" class="wrapright">
      <div class="columnOut">
      <div class="columnTitle">
        <h3>我要申请</h3>
        <span><b>首页</b>><b>项目申请</b>><strong>我要申请</strong></span></div>
      <div class="columnMain summary">
      <form name="regForm" id="regForm" action="" method="post" >
          <div class="tips">以下每项均为必填项，请填写真实有效信息</div>
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="inputbox">
            <tr>
              <th width="21%" class="odd">机构全名：</th>
              <td width="40%" class="odd"><input type="text" name="applyName" id="applyName" class="intotext" /></td>
              <td width="39%" class="odd"><span></span></td>
            </tr>
            <tr>
              <th>机构法人：</th>
              <td><input type="text" name="applyFr" id="applyFr" class="intotext" /></td>
              <td><span></span></td>
            </tr>
            <tr>
              <th class="odd">法人电话：</th>
              <td class="odd"><input type="text" name="frPhone" id="frPhone" class="intotext" /></td>
              <td class="odd"><span></span></td>
            </tr>
            <tr>
              <th>联&nbsp;&nbsp;系&nbsp;&nbsp;人：</th>
              <td><input type="text" name="applyPeople" id="applyPeople" class="intotext" /></td>
              <td><span></span></td>
            </tr>
            <tr>
              <th class="odd">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</th>
              <td class="odd"><input type="text" name="moblie" id="moblie" class="intotext" /></td>
              <td class="odd"><span>（此项为短信通知）</span></td>
            </tr>
            <tr>
              <th>电子邮件：</th>
              <td><input type="text" name="email" id="email" class="intotext" /></td>
              <td><span></span></td>
            </tr>
            <tr>
              <th class="odd">传&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;真：</th>
              <td class="odd"><input type="text" name="fax" id="fax" class="intotext" /></td>
              <td class="odd"><span></span></td>
            </tr>
            <tr>
              <th>通讯地址：</th>
              <td><input type="text" name="address" id="address" class="intotext" /></td>
              <td><span></span></td>
            </tr>
            <tr>
              <th class="odd">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;编：</th>
              <td class="odd"><input type="text" name="postal" id="postal" class="intotext" /></td>
              <td class="odd"><span></span></td>
            </tr>
            <tr>
              <th>网&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;站：</th>
              <td><input type="text" name="website" id="website" class="intotext" /></td>
              <td><span></span></td>
            </tr>
            <tr>
              <th class="odd">注册机构：</th>
              <td class="odd"><input type="text" name="regJg" id="regJg" class="intotext" /></td>
              <td class="odd"><span></span></td>
            </tr>
            <tr>
              <th >项目描述：</th>
              <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              		<TextArea name="remark" id="remark" rows="5" cols="27"></TextArea></td>
              <td ><span></span></td>
            </tr>
            <tr>
  			  <th >校 验 码：</td>
   			  <td align="center">
    		 <input size="11" id="verifyCode" type="text" class="input108" name="verifyCode" maxlength="4" style=" width:50px" />
  			 <img id="captchaImage" border=0 src="${ctx}/share/verifyCodeImage.jsp" width="70" height="28" align="absmiddle" border="0"/>
  		      <a href="javascript:refreshCaptcha();" >看不清？换一张</a>
  		      </td>
  		       <td><span></span></td>
           </tr>
          </table>
          <div class="referBox">
            <input type="button" onclick="checkReg();"  class="refebtnad1"/>
            <input type="reset"  class="refebtnad2"/>
          </div>
          </form>
      </div>
      <div class="columnButtom"><img src="${contextPath }/gyjj/images/columnButtom.jpg" /></div>
    </div>
    </td>
    </tr>
</table>
</div>
<div class="clear"></div>
<jsp:include page="/gyjj/index_bottom.jsp" />
</body>
</html>
