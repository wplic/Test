<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<jsp:directive.page import="com.css.cms.document.model.DocumentFrontListProvider"/>
<%@page import="com.css.cms.document.model.DocumentFrontListProvider"%>
<%@page import="com.cssweb.assetManager.pojo.AssetUser"%>
<%@ taglib uri="/WEB-INF/plugins/paging/css-paging.tld" prefix="paging"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%@page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${contextPath}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<<script language="JavaScript" type="text/JavaScript">
</script>

</head>
<%
      
String catName = "";
if (request.getParameter("catName") != null && !"".equals(request.getParameter("catName")))
{
	catName = request.getParameter("catName");
}
	  DocumentFrontListProvider documentProvider = new DocumentFrontListProvider(request);
	  int rowNum = 1;
%>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
 
 <paging:page count="false" row="<%=rowNum%>" provider="<%= documentProvider%>">
<paging:pageRow id="doc" type="com.css.cms.document.Document">
		<%	
			String title=DocumentHelper.getTitle(doc);
		%>
		<p style="font-size: medium" align="center"><%=title %></p> 
            <%
		       					String content=DocumentHelper.getContent(doc);
					            out.print(content);
			%> 
		<%HttpSession session1 = request.getSession(false);
	      AssetUser assetUser = null;
		if (session != null) 
		{
			assetUser = (AssetUser)session1.getAttribute("assetUser");
			if(assetUser != null&&(assetUser.getFundAccount().length()>=15||assetUser.getFundAccount().substring(0, 2).equals("98")||assetUser.getFundAccount().substring(0, 2).equals("87")))
			{ %>
			<center>
			      <a href="${contextPath}/acctCustAction.do?method=getAcctCustByDepositacct&menu=khjbxx" ><img src="/pic/clip_image002.jpg" alt="" /><br/>立即参加，赢取ipad2 </a>
		 	</center>
		  <%}
			else{ %>
			<center>
			      <a href="${contextPath}/commons/loginms.jsp" ><img src="/pic/clip_image002.jpg" alt="" /> <br/>立即参加，赢取ipad2</a>
			  </center>
			  <%}
		} %>
		
 </paging:pageRow>
 </paging:page>
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>