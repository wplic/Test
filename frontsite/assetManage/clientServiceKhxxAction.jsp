<%@ page contentType="text/html; charset=utf-8" language="java"%>
<jsp:directive.page import="com.cssweb.assetManager.pojo.AssetUser"/>

<%
String fundAccount = "";
if(null!=request.getSession().getAttribute("assetUser")){
	AssetUser assetUser = (AssetUser)request.getSession().getAttribute("assetUser");
	fundAccount = assetUser.getFundAccount();
}else{%>	
		<script language="javascript">
			window.location="/commons/loginms.jsp";
		</script>
	<%}
Integer re = (Integer)request.getAttribute("return");
String url = (String)request.getAttribute("url");
if("updateinfo".equals(url))
	url = "/clientservice/LcUserInfo.do?method=getLcUserInfo&fundaccount="+fundAccount;
else if("updatepass".equals(url))
	url = "/assetManage/clientServiceMmxg.jsp";
if(null!= re && re.intValue()>0){
%>
<script language="javascript">
	alert("修改成功！");
	window.location="<%=url%>";
</script>
<%
}else{%>
<script language="javascript">
	alert("修改失败！");
	window.location="<%=url%>";
</script>
<%}
%>