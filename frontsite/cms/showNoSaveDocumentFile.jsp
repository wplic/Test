<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/setTab.js"></script>
</head>
<%
	String _id = request.getParameter("id") ;
	long id = 0 ;
	try{
		id = Long.parseLong(_id) ;
	}catch(Exception e){
 }
 if(id<1)
 {
 %>
	<script type="text/javascript">
		alert ("对不起，您的数据有误！") ;
		window.opener.location.reload();
		window.opener=null;
		window.open('','_self');
		window.close() ;
	</script>
<%
 }
%>
<body>
<OBJECT id=Pdf1 style="LEFT:0px;TOP:0px" height="100%" width="100%" classid="clsid:CA8A9780-280D-11CF-A24D-444553540000">   
  <PARAM NAME="_Version" VALUE="327680">   
  <PARAM NAME="_ExtentX" VALUE="2646">   
  <PARAM NAME="_ExtentY" VALUE="1323">   
  <PARAM NAME="_StockProps" VALUE="0">   
  <PARAM NAME="SRC" VALUE="${contextPath }/cms/showPdfToHmtl.jsp?id=<%=id %>">  
  <!--url   of   PDF   file   -->
  您没有安装AdbeRdr,请点此处下载:<a href="http://get.adobe.com/cn/reader/"><font color="red" size="10">AdbeRdr</font></a>
</OBJECT> 
</body>
</html>