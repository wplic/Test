<%
request.setCharacterEncoding("UTF-8");
%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<c:if test="${message !=null }">
	<script type="text/javascript">
		
			alert("${message}");
			if(window.opener){
				window.close();
			}else{
				history.go(-1);
			}
			
		
		</script>
</c:if>
