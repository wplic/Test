<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/prototype.js"></script>
<jsp:directive.page import="com.css.system.Configuration" />
<script type="text/javascript" src="${ctx}/js/share/jquery-1.3.2.js"></script>
<script type="text/javascript" src="${ctx}/js/share/jquery.base64.js"></script>
</head>
<script language="javascript">
	var JQ = jQuery.noConflict();
</script>

<%
String flexServelUrl = Configuration.getProperty("flexServelUrl");
String flexUrl = Configuration.getProperty("flexUrl");
//String clientId="030180003901";
String clientId=(String)request.getParameter("clientId");

%>
<script type="text/javascript">
var flag="1";
function check(){
		var serviceName=document.getElementById("serviceName").value;
        if(serviceName=="")
        { 
            alert("服务名不能为空！");
	        document.getElementById("serviceName").focus();
	        return false;
        }
        if(serviceName.length>18)
        { 
            alert("服务名太长！");
	        document.getElementById("serviceName").focus();
	        return false;
        }
		//密码为 6-12 位字母或数字/^([A-Z]|[a-z]|[\d])*$/
		var password=document.getElementById("password").value;
		if(/^([A-Z]|[a-z]|[\d])*$/.test(password)==false||password.length<6||password.length>12){
		alert("密码为 6-12 位字母或数字");
		document.getElementById("password").value="";
		document.getElementById("password").focus();
		return false;
		}
		//新密码和旧密码是否相同
		var password_1=document.getElementById("password_1").value;
		if(password!=password_1){
		alert("两次输入密码不相同");
		document.getElementById("password_1").value="";
		document.getElementById("password_1").focus();
		return false;
		}
		flag = "3";
		var stkname = JQ.base64Encode(serviceName);
		stkname = stkname.replace("+","*");
		//验证通过后调用修改密码的方法
		var url  = '${ctx}/webUser.do';  	
	    var paras = 'method=AESEncryption&serviceName='+stkname+'&password='+password+'&clientId=<%=clientId%>';  		
	    new Ajax.Request(url, {method:'post',postBody: paras,asynchronous: false,				 
				onSuccess: function(response) {         
					CallFlexInsertUser(response.responseText);
				}, 
				onFailure: function() {alert('加密失败！');}    
			}		
		);
	}
		
	/**
	 *身份管理系统修改密码
	 */
	function CallFlexInsertUser(secrity){
		var me;
		if(navigator.appName.indexOf("Microsoft")>-1){
			me=document.getElementById("IeCssLogin");
		}else{
			me= document.getElementById("FfCssLogin");
		}
		me.FlexSetServerUrl("<%=flexServelUrl%>");
		me.FlexInsertUser(secrity,"JY-WEB","127.0.0.1","E0-F1-G2-H3");
	}
	
	/**
	 *身份管理系统返回函数（由flash调用）
	 */
	function CallBackFlex(valIn){
	    var serviceName=document.getElementById("serviceName").value;
	    var backValue = parseInt(valIn) * -1;
	    if (backValue < 0) {
	      if(valIn==1) {
			alert("密码设置成功！");
		  } else if(valIn==2) {
			alert("无此用户！");
		  } else if(valIn==4) {
			alert("系统忙！");//实际提示异常错误，但是不能给客户这种感觉，故提示系统忙
		  } else if(valIn==7) {
			alert("信息格式出错！");
		  } else if(valIn==8) {
			alert("数据库出错！");
		  } else if(valIn==9) {
			alert("网络出错！");
		  } else if(valIn==10) {
			alert("用户名已存在！");
		  } else {
			alert("其他异常情况！");s
		  }
	    } else {
	        //密码设置成功后初始化SESSION
			var url  = '${ctx}/webUser.do';  	
	    	var paras = 'method=initUserSession&clientId=<%=clientId%>&level='+backValue+'&serviceName='+serviceName+'&password='+password;  		
	    	new Ajax.Request(url, {method:'post',postBody: paras,asynchronous: false,				 
				onSuccess: function(response) {         
					alert("用户信息设置成功！");
					window.close();
				}, 
				onFailure: function() {
				    alert('用户session初始化异常！');
				    window.close();
				}    
				}		
			);
	    }
	
	}

</script>
<%
String message="";
if(request.getAttribute("message")!=null)
  message=(String)request.getAttribute("message");
  if(!message.equals("")){
%>
	<script type="text/javascript">	
		 alert('<%=message %>');
	</script>
<%}
  if(request.getAttribute("accountLong")!=null&&(((String)request.getAttribute("accountLong")).equals("1"))){  
%>   
<script type="text/javascript">	
     flag="2";
       window.dialogArguments.top.location.href="${contextPath }/bussinesshall/financingCzh.jsp?nav=wsyyt&nav1=wdlczx";
       window.opener=null;window.close();
</script>
<%}else{%>
	<script type="text/javascript">	
		flag="1";
	</script>
<%}%>
<base target="_self" />
<body class="body_bg">
<OBJECT id=IeCssLogin 
codeBase=http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0 
height=1 width=1 align=middle 
classid=clsid:d27cdb6e-ae6d-11cf-96b8-444553540000>
<PARAM NAME="_cx" VALUE="26"/>
<PARAM NAME="_cy" VALUE="26"/>
<PARAM NAME="FlashVars" VALUE=""/>
<PARAM NAME="Movie" VALUE="<%=flexUrl%>"/>
<PARAM NAME="Src" VALUE="<%=flexUrl%>"/>
<PARAM NAME="WMode" VALUE="Window"/>
<PARAM NAME="Play" VALUE="-1"/>
<PARAM NAME="Loop" VALUE="-1"/>
<PARAM NAME="Quality" VALUE="High"/>
<PARAM NAME="SAlign" VALUE=""/>
<PARAM NAME="Menu" VALUE="-1"/>
<PARAM NAME="Base" VALUE=""/>
<PARAM NAME="AllowScriptAccess" VALUE="sameDomain"/>
<PARAM NAME="Scale" VALUE="ShowAll"/>
<PARAM NAME="DeviceFont" VALUE="0"/>
<PARAM NAME="EmbedMovie" VALUE="0"/>
<PARAM NAME="BGColor" VALUE=""/>
<PARAM NAME="SWRemote" VALUE="TRUE"/>
<PARAM NAME="MovieData" VALUE=""/>
<PARAM NAME="SeamlessTabbing" VALUE="1"/>
<PARAM NAME="Profile" VALUE="0"/>
<PARAM NAME="ProfileAddress" VALUE=""/>
<PARAM NAME="ProfilePort" VALUE="0"/>
<PARAM NAME="AllowNetworking" VALUE="all"/>
<PARAM NAME="AllowFullScreen" VALUE="false"/>
<embed src="<%=flexUrl%>" width="1" height="1" id="FfCssLogin" allowScriptAccess="sameDomain"'>
</embed></OBJECT>
<div>
  <div></div>
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr><td></td></tr>
        <tr>
          <td valign="top">
            <table width="100%" border="1" bordercolor="#cfcfcf" class="lh27 mt5" align="center">
            <tr>
              <td width="94%" class="wdzx_th indent10 bold">设置个人信息： </td>
            </tr>
          </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="lh28" bgcolor="#eceff4">
              <tr>
                <td colspan="3" height="28"></td>
              </tr>
              <tr>
                <td width="20%">&nbsp;</td>
                <td width="20%">服 务 名：</td>
                <td width="60%">
					<input name="serviceName" id="serviceName" type="text" class="input108" style="width:130px"   size="18" />
               </td>
              </tr>
              
             <tr>
                <td>&nbsp;</td>
                <td bgcolor="#eceff4"> 密  码：</td>
                <td bgcolor="#eceff4">
                <input type="password" name="password" id="password" class="input108" style="width:130px"  size="20"/>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td bgcolor="#eceff4"> 密码确认：</td>
                <td bgcolor="#eceff4">
                <input type="password" name="password_1" id="password_1" class="input108" style="width:130px"  size="20"/>
                </td>
            </tr>
              <tr>
                <td height="36">&nbsp;</td>
                <td bgcolor="#eceff4">&nbsp;</td>
                <td bgcolor="#eceff4"><a href="#">
                  <input type="button" name="Submit2" id="button2" onclick="check();" value="保存" class="but_01" />
                <input type="reset" name="button4" id="button4" value="取消" class="but_01" />
                </a></td>
              </tr>
              <tr>
              <td colspan="3" height="20"></td></tr>
          </table>

          </td>
        </tr>
      </table>
</div>
<script language=javascript>
function window.onunload()
{
	if(flag=="3"){
   }
   if(flag=="1")
   {
     alert("您必需要输入服务名才使用其服务!");
	 window.dialogArguments.top.location.href="${contextPath }/index.jsp";
   }
}
</script>
</body>
</html>