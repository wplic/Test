<%@page contentType="text/html;charset=UTF-8"%>

<html>
<head>
	<title></title>
	<meta http-equiv="Content-Type" content="text/html;charset=gb2312">	
	<link type="text/css" rel="stylesheet" href="/plugins/tree/skins/default/styles/general.css">
	<script src="/plugins/tree/script/general.js"></script>
	<script src="/plugins/tree/script/tree.js"></script>
</head>
<%
	String valueId = request.getParameter ("valueId") ;
	String type = request.getParameter ("type") ;
%>
<body class="gray-scrollbar"><!-- onunload="javascript:setBrowser() ;"-->
<table width="98%" border="0" cellspacing="0" cellpadding="6" align="center">
  <tr>
    <td valign="top">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr style="display:none">
			<td>
				<fieldset>
					<legend>预览(Ctrl)</legend>
					<iframe id="preview" name="preview" 
						frameborder="0" scrolling="auto" 
						style="width:100%" 
						src=""></iframe>
				</fieldset>	
			</td>
		</tr>
		<tr>
			<td align="center">
				<a onClick="javascript:setBrowser('<%= valueId%>');"><img name="ok" src="/plugins/tree/skins/default/ok.gif"/></a>
			</td>
		</tr>
		</table>
	</td>
  </tr>
</table>
</body>
</html>
<script>
	//document.all("preview").style.height = document.body.offsetHeight - 75 ;
</script>