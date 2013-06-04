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
	if (type == null) type = "radio" ;
%>
<body class="gray-scrollbar"><!-- onunload="javascript:setBrowser() ;"-->
<table width="98%" border="0" cellspacing="0" cellpadding="6" align="center">
  <tr>
    <td valign="top">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
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
				<a onClick="javascript:setBrowser_liketree('<%= type%>' ,'<%= valueId%>') ;"><img name="ok" src="/plugins/tree/skins/default/ok.gif"/></a>
			</td>
		</tr>
		</table>
	</td>
  </tr>
</table>
<!--翻页数据容器-->
<select name="<%= valueId%>Target" multiple style="display:none"></select>
<select name="<%= valueId%>Buffer" multiple style="display:none"></select>
</body>
</html>
<script>
	document.all("preview").style.height = document.body.offsetHeight - 75 ;
	init_liketree ('<%= type%>' ,'<%= valueId%>') ;
</script>