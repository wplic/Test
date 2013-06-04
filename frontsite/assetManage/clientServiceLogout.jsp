<%@ page contentType="text/html; charset=utf-8" language="java"%>
<jsp:directive.page import="com.cssweb.assetManager.pojo.AssetUser"/>
<%
String url=request.getParameter("url");

request.getSession().removeAttribute("tsystemWebuser");
request.getSession().removeAttribute("assetUser");
%>
<script type="text/javascript">
    var url="${ctx}<%=url%>";
    window.location.href=url;
</script>