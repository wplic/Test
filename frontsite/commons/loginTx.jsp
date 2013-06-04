<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<script type="text/javascript">
	if(window.parent==null)
       {
		window.document.location.href="${contextPath }/assetManage/clientService.jsp"
	   }else{
		window.parent.document.location.href="${contextPath }/assetManage/clientService.jsp"
	   }
</script>