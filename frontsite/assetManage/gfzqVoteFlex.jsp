<%
request.setCharacterEncoding("UTF-8");
%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/commons/turnPage.jsp"%>
<html lang="en">
<%
String assetProd = "";
if(null!=request.getParameter("assetProd"))
	assetProd = request.getParameter("assetProd");

String	startTime = request.getParameter("startTime");
String	endTime = request.getParameter("endTime");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" type="text/css" href="history/history.css" />

<title></title>
<script src="AC_OETags.js" language="javascript"></script>

<style>
body { margin: 0px; overflow:hidden }
</style>
<script language="JavaScript" type="text/javascript">
<!--
// -----------------------------------------------------------------------------
var requiredMajorVersion = 9;
var requiredMinorVersion = 0;
var requiredRevision = 124;
// -----------------------------------------------------------------------------
// -->
</script>
</head>

<body scroll="no">
<script language="JavaScript" type="text/javascript">
<!--
var hasProductInstall = DetectFlashVer(6, 0, 65);

var hasRequestedVersion = DetectFlashVer(requiredMajorVersion, requiredMinorVersion, requiredRevision);

if ( hasProductInstall && !hasRequestedVersion ) {
	var MMPlayerType = (isIE == true) ? "ActiveX" : "PlugIn";
	var MMredirectURL = window.location;
    document.title = document.title.slice(0, 47) + " - Flash Player Installation";
    var MMdoctitle = document.title;

	AC_FL_RunContent(
		"src", "playerProductInstall",
		"FlashVars", "MMredirectURL="+MMredirectURL+'&MMplayerType='+MMPlayerType+'&MMdoctitle='+MMdoctitle+"",
		"width", "100%",
		"height", "100%",
		"align", "middle",
		"id", "lineChartFlex",
		"quality", "high",
		"bgcolor", "#ffffff",
		"name", "lineChartFlex",
		"allowScriptAccess","sameDomain",
		"type", "application/x-shockwave-flash",
		"pluginspage", "http://www.adobe.com/go/getflashplayer"
	);
} else if (hasRequestedVersion) {
	AC_FL_RunContent(
			"src", "lineChartFlex",
			"width", "100%",
			"height", "100%",
			"align", "middle",
			"id", "lineChartFlex",
			"quality", "high",
			"bgcolor", "#ffffff",
			"name", "lineChartFlex",
			"allowScriptAccess","sameDomain",
			"type", "application/x-shockwave-flash",
			"pluginspage", "http://www.adobe.com/go/getflashplayer"
	);
  } else {  
    var alternateContent = 'Alternate HTML content should be placed here. '
  	+ 'This content requires the Adobe Flash Player. '
   	+ '<a href=http://www.adobe.com/go/getflash/>Get Flash</a>';
    document.write(alternateContent);  
  }
    function flashinit(){
  	document.getElementById('lineChartFlex').load("${contextPath }/prod/productAction.do?method=getProductNetValuetList2&assetProd=<%=assetProd%>&startTime=<%=startTime%>&endTime=<%=endTime%>");
  }
// -->
</script>
<noscript>
  	<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
			id="lineChartFlex" width="100%" height="100%"
			codebase="http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab">
			<param name="movie" value="lineChartFlex.swf" />
			<param name="quality" value="high" />
			<param name="bgcolor" value="#ffffff" />
			<param name="allowScriptAccess" value="sameDomain" />
			<embed src="lineChartFlex.swf" quality="high" bgcolor="#ffffff"
				width="100%" height="100%" name="lineChartFlex" align="middle"
				play="true"
				loop="false"
				quality="high"
				allowScriptAccess="sameDomain"
				type="application/x-shockwave-flash"
				pluginspage="http://www.adobe.com/go/getflashplayer">
			</embed>
	</object>
</noscript>
</body>
</html>
