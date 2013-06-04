<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx}/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/prototype.js"></script>
<%@ include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="com.css.system.Configuration" />
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
	SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	String url="/bussinesshall/loginLc.jsp";
	if(request.getParameter("url")!=null&&!request.getParameter("url").equals(""))
	{
		url=(String)request.getParameter("url");
		if(sqlInjectValidate.validateSql(url))
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	}
	String urlError="/commons/loginTemp.jsp";
	
 String mainBeforeLoginUrl = Configuration.getProperty("mainBeforeLoginUrl");

%>
 <SCRIPT LANGUAGE="JavaScript">

     function checkLogin(){
	   var serviceName=document.getElementById("serviceName").value;
	   var password=document.getElementById("password").value;
	   var verifyCode= document.getElementById("verifyCode").value; 
	   var loginForm =document.getElementById("loginForm");
	   if(serviceName=="")
	   {
	     alert("用户名不能为空！");
	     document.getElementById("serviceName").value="";
	     document.getElementById("serviceName").focus();
	     return false;
	   }
	   if(password=="")
	   {
	     alert("密码不能为空！");
	     document.getElementById("password").value="";
	     document.getElementById("password").focus();
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
	   var select_name=document.getElementById("select_name").value;
	   if(select_name=="2")
	   {
	   loginForm.action="${ctx}/webUser.do?method=loginTx";
	   loginForm.submit();
	   }else if(select_name=="3")
	   {
	    loginForm.action="${ctx}/webUser.do?method=loginTy";
	    loginForm.submit();
	   }else if(select_name=="4"){
		   loginForm.action="/sunnyCustAction.do?method=login";
		    loginForm.submit();
	   } else {
	       //先验证验证码
		   var url  = '${ctx}/webUser.do';  	
	       var paras = 'method=checkVerifyCode&verifyCode='+verifyCode;  		
	       new Ajax.Request(url, {method:'post',postBody: paras,asynchronous: false,				 
				
				onSuccess: function(response) {   
				    //alert("111="+response.responseText);
				    if (response.responseText==0) {
				      alert('验证码输入错误！');
				    } else if (response.responseText==1) { 
				      getEncryptionTime();
				    }  
				}, 
				onFailure: function() {
				    alert('验证码有误！');
				}    
		   });
	    }
     }
    function checkJy()
    {
      document.location.href="<%=mainBeforeLoginUrl%>";
    }
</SCRIPT> 
 <jsp:include page="/share/cssValidate.jsp" />
<body class="body_bg" bottommargin="0" leftmargin="0" marginheight="0" marginwidth="0" rightmargin="0" topmargin="0" >
        <div class="letagt1">
        	<div class="newtit1">用户登录</div>
        </div>
        <div class="letagm1">
         <form name="loginForm" id="loginForm" action="${ctx}/webUser.do?method=login" method="post">
           <table width="98%" align="center" class="lh21">
         <tr>
              <td width="10" rowspan="5">&nbsp;</td>
              <td>用户类型：</td>
              <td>
               <select name="select_name" id="select_name" style="width:100px" onchange="changeLoginType(this);">
                    <option value="1" >交易客户</option>
                    <option value="2" selected="selected">理财客户</option>
                    <option value="3">体验客户</option>
              </select>
              </td>
            </tr>
            <tr>
              <td>
              <div id="default_yhm">
                用户名：
               </div>
               <div id="default_khh" style="display:none">
                客户号或<br/>身份证：
                
               </div>
              </td>
              <td>
               <input class="input100" id="serviceName" name="serviceName" type="text" maxlength="18" />
		       <input type="hidden" name="url" value="<%=url %>"/>
		       <input type="hidden" name="urlError" value="<%=urlError %>"/>
		       <input type="hidden" name="callBack" id="callBack" value=""/>
           </td>
            </tr>
            <tr>
              <td>密　码：</td>
              <td>
              <input class="input100" id="password" name="password" type="password"  maxlength="18" style="width:88px"/>
              </td>
            </tr>
            <tr>
              <td>验证码：</td>
              <td>
              <input class="input100" size="11" id="verifyCode" type="text" name="verifyCode" maxlength="4" style=" width:40px"/>
	          <img id="captchaImage" border=0 src="${ctx}/share/verifyCodeImage.jsp" width="60" height="28" align="absmiddle" border="0"/>
              </td>
            </tr>
            <tr>
              <td colspan="3" align="center">
            <div id="sjdl">
            <table width="100%" align="center" class="mt5">
            <tr>
              <td>首次登录：</td>
              <td><input type="checkbox" name="checkbox" id="checkbox" onclick="checkJy();"/>
				<a href="javascript:refreshCaptcha();" >看不清？换一张</a></td>
            </tr>
            </table>
            </div></td></tr>
            <tr>
              <td colspan="3" align="center">
                  <table width="95%" align="center" class="mt5">
                      <tr>
                        <td align="left"><a href="#" onclick="openHple();" class="font_9fu">帮助</a></td>
                        <td><img src="/pic/index/list_01.gif" /></td>
                        <td><input type="button" name="button" id="button" value="登录" class="but01" onclick="checkLogin();"/>
                        </td>
                        <td align="left">* <a href="${ctx }/share/userApplication.jsp" target="_blank" class="font_9fu">体验申请</a></td>
                      </tr>
                </table>
              </td>
            </tr>
          </table>
          </form>
        </div>
        <div class="letagb1"></div>
</body>   </html>     
    <!-- 以下为iframe高度自适应代码 -->
  <SCRIPT LANGUAGE="JavaScript">
function frameFitSelfHeight1(frameId,countNum){
	myFrameId=frameId;
	myCountNum=countNum;
	
	if(myCountNum==null || myCountNum==undefined || myCountNum<0){
		myCountNum=0;
	}
	
	myCountNum++;
	if(myCountNum<=20){
		window.parent.window.document.getElementById(myFrameId).height = window.parent.window.document.getElementById(myFrameId).contentWindow.document.body.scrollHeight;
		setTimeout('frameFitSelfHeight1(myFrameId,myCountNum)',100);
	}
}
frameFitSelfHeight1('leftlogin',null);

function refreshCaptcha(){
	document.getElementById("captchaImage").src="${ctx}/share/verifyCodeImage.jsp?ran="+Math.random();
}
function openHple()
	{
	var ah = 280;
	var aw = 500;
	window.open('${contextPath }/share/beforeHple.jsp', 'newwindow', 'height='+ah +', width='+aw+', top=100, left=260, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
    }
     function changeLoginType(choose){
	  var loginType = choose.value;
	  if(loginType=="1"||loginType=="3")
	  {
	   document.getElementById("sjdl").style.display = "block";	
	   document.getElementById("default_yhm").style.display = "block";	
	   document.getElementById("default_khh").style.display = "none";
	  }else{
	   document.getElementById("default_yhm").style.display = "none";
	   document.getElementById("default_khh").style.display = "block";	
	   document.getElementById("sjdl").style.display = "none";
	  }
	}
</SCRIPT>
