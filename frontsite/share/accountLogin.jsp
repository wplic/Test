<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<%@ include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="com.css.system.Configuration" />
<script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>
<%
 String loginUrl = Configuration.getProperty("loginUrl");
 String iscc="0";
 if(request.getParameter("iscc")!=null&&!request.getParameter("iscc").equals(""))
 iscc=request.getParameter("iscc").trim();
 
 loginUrl=loginUrl+"&iscc="+iscc;
%>
<script type="text/javascript">
function flagMessage(){
}
</script> 
<body>
<iframe target="_blank" id="leftlogin" name="leftlogin"
						marginWidth="0" marginHeight="0" src="<%=loginUrl %>"
						frameBorder="0" noresize width="100%" height="650" scrolling="no"  onload="frameFitSelfHeight('leftlogin')"></iframe>
</body>
