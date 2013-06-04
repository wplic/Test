<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<jsp:directive.page import="com.css.system.Configuration" />
<%
 String flexServelUrl = Configuration.getProperty("flexServelUrl");
 String flexUrl = Configuration.getProperty("flexUrl");
 String oauth2Url = Configuration.getProperty("OAUTH2_SERVER_DOMAIN");
 String codeAction = Configuration.getProperty("AUTHORIZATION_ENDPOINT");
 String oauth2_client_id = Configuration.getProperty("OAUTH2_CLIENT_ID");
 String localUrl = Configuration.getProperty("OAUTH2_CLIENT_LOCAL");
 String callback = Configuration.getProperty("CALL_BACK");
 %>
<script type="text/javascript">
	function getEncryptionTime_oauth2(){
		//alert(document.getElementById("serviceName").name+" "+document.getElementById("password").name);
		document.getElementById("serviceName").name = "user_id";
		document.getElementById("password").name = "password";
		//alert(document.getElementById("serviceName").name+" "+document.getElementById("password").name);
		var loginForm=document.getElementById("loginForm");
	    var parameter = document.createElement('input');
		parameter.type = "hidden";
		parameter.name = "login_type";
		parameter.value = "portal_trade";
		loginForm.appendChild(parameter);
	    loginForm.method="post";
	    loginForm.target="_blank";
	    var ourl = "<%=oauth2Url %><%=codeAction %>?client_id=<%=oauth2_client_id %>&redirect_uri=<%=localUrl %><%=callback %>";
	    //alert(ourl);
	    //"https://test.gf.com.cn/server/CodeAction.action?client_id=gfw&redirect_uri=http%3A%2F%2F10.2.110.56%3A8080%2Foauth2%2FCallBack.go"
	    loginForm.action=ourl;
	    loginForm.submit();
	    window.close();
		return;
	}


     //到后台加密服务器当前时间
     function getEncryptionTime() {
		var url  = '${ctx}/webUser.do';
	    var paras = 'method=getEncryptionTime';
	    new Ajax.Request(url, {method:'post',postBody: paras,asynchronous: false,
			onSuccess: function(response) {
				//alert(""+response.responseText);
				CallFlexLoginCommon(response.responseText);
			},
			onFailure: function() {
				alert('时间加密错误！');
				return false;
			}
		});
     }

    function CallFlexLoginCommon(valIn){
        //alert("CallFlexLoginCommon begin");
		var me;
		if(navigator.appName.indexOf("Microsoft")>-1){
			me=document.getElementById("IeCssLogin");
		}else{
			me= document.getElementById("FfCssLogin");
		}
		var user = document.getElementById("serviceName").value;
	    var pass = document.getElementById("password").value;
	    //alert("<%=flexServelUrl%>");
	    //alert("weblogic上的时间串="+valIn);
		me.FlexSetServerUrl("<%=flexServelUrl%>");
		me.FlexLoginCommon(user,pass,"GFZQ","JY-WEB","127.0.0.1","E0-F1-G2-H3",valIn);

	}

	function CallBackFlex(valIn){
		alert(valIn);
        alert("valIn=="+valIn);
		if(valIn==2) {
			//alert("无此用户!");
			alert("您输入的用户名或密码错误!");
		} else if(valIn==3) {
			//alert("密码错误！");//实际提示异常错误，但是不能给客户这种感觉，故提示系统忙
			alert("您输入的用户名或密码错误!");
		} else if(valIn==4) {
			alert("异常错误！");
		} else if(valIn==6) {
			alert("帐号被锁定！");
		} else if(valIn==7) {
			alert("信息格式出错！");
		} else if(valIn==8) {
			alert("数据库出错！");
		} else if(valIn==9) {
			alert("网络出错！");
		} else if(valIn==11) {
			alert("信息过期！");
		} else {
		    //alert(document.getElementById("callBack"));
		    var loginForm=document.getElementById("loginForm");
			document.getElementById("callBack").value=valIn;
		    loginForm.action="${ctx}/webUser.do?method=login";
		    loginForm.submit();
		}
	}

function init(){
    //alert('<%=request.getSession().getAttribute("logout")%>');
	var exc = '<%=request.getSession().getAttribute("logout")%>';
	if(exc=='1') {

	}
	else {

		setTimeout("loadMe()",10000);
	}
}

function loadMe(){
	var me;
	if(navigator.appName.indexOf("Microsoft")>-1){
		me=document.getElementById("IeCssLogin");
	}else{
		me= document.getElementById("FfCssLogin");
	}
	var valIn = me.FlexLoginOriCommon("2","GFZQ","");
	//alert(valIn);
	if(valIn.length > 2){
	    var loginForm=document.getElementById("loginForm");
		document.getElementById("callBack").value=valIn;
	    loginForm.action="/webUser.do?method=autoLogin";
	    loginForm.submit();
	}
}
</script>
</head>

<body onload="init();">
<OBJECT id=IeCssLogin
codeBase=http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0
height=1 width=1 align=middle
classid=clsid:d27cdb6e-ae6d-11cf-96b8-444553540000>
<PARAM NAME="_cx" VALUE="26"/>
<PARAM NAME="_cy" VALUE="26"/>
<PARAM NAME="FlashVars" VALUE=""/>
<PARAM NAME="Movie" VALUE="/csswebsso.swf"/>
<PARAM NAME="Src" VALUE="/csswebsso.swf"/>
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
<embed src="/csswebsso.swf" width="1" height="1" id="FfCssLogin" allowScriptAccess="sameDomain"'>
</embed></OBJECT>
</body>
</html>