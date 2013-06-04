<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<%@ include file="/commons/taglibs.jsp"%>
<%@ page import="com.cssweb.client.pojo.TsystemWebuser"%>
<jsp:directive.page import="com.css.system.Configuration" />
</head>
<%
    TsystemWebuser tsystemWebuser = (TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
    String flexUrl = Configuration.getProperty("flexUrl");
%>

<script type="text/javascript">

var goable = "0";

document.onkeydown = function(e){
	var e = window.event ? window.event   :   e; 
	if(e.keyCode == 116){ 
        goable = "1";  
    }
}

function closeWindow(){
	var me;
	if(navigator.appName.indexOf("Microsoft")>-1){
		me=document.getElementById("IeCssLogin");
	}else{
		me= document.getElementById("FfCssLogin");
	}
	if(goable=='1') {
		return;
	}
	me.FlexLogoutCommon('<%=tsystemWebuser==null ? "" : tsystemWebuser.getServiceName()%>');
}

function CallFlexLoginRefreshCommon(){
	var me;
	if(navigator.appName.indexOf("Microsoft")>-1){
		me=document.getElementById("IeCssLogin");				
	}else{
		me= document.getElementById("FfCssLogin");
	}
	me.FlexLoginRefreshCommon('<%=tsystemWebuser==null ? "" : tsystemWebuser.getServiceName()%>');
}
</script>

<body>
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