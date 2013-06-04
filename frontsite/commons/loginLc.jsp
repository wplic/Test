<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<script type="text/javascript">
      if(window.parent==null)
       {
		window.document.location.href="/commissionAction.do?method=loginCommission&type=1&menu=khdzfw";
	   }else{
		window.parent.document.location.href="/commissionAction.do?method=loginCommission&type=1&menu=khdzfw";
	   }
</script>