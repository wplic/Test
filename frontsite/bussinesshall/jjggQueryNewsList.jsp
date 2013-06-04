<!-- 搜索结果页 -->
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%request.setCharacterEncoding ("UTF-8") ;%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
    SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	String url = "" ;
	String title = request.getParameter("title") ;
	if(null!=title && sqlInjectValidate.validateSql(title))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	url = url + "title="+title+"&" ;
	String source = request.getParameter("source") ;
	if(null!=source && sqlInjectValidate.validateSql(source))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	url = url + "source="+source+"&" ;
	String author = request.getParameter("author") ;
	if(null!=author && sqlInjectValidate.validateSql(author))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	url = url + "author="+author+"&" ;
	String stock_id = request.getParameter("stock_id") ;
	if(null!=stock_id && sqlInjectValidate.validateSql(stock_id))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	url = url + "stock_id="+stock_id+"&" ;
	String keyword = request.getParameter("keyword") ;
	if(null!=keyword && sqlInjectValidate.validateSql(keyword))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	url = url + "keyword="+keyword+"&" ;
	String importance = request.getParameter("importance") ;
	if(null!=importance && sqlInjectValidate.validateSql(importance))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	url = url + "importance="+importance+"&" ;
	String catIdStr = request.getParameter("catIdStr") ;
	if(null!=catIdStr && sqlInjectValidate.validateSql(catIdStr))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	url = url + "catIdStr="+catIdStr+"&" ;
	String whichCat = request.getParameter("whichCat") ;
	if(null!=whichCat && sqlInjectValidate.validateSql(whichCat))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	url = url + "whichCat="+whichCat+"&" ;
	String StartDate = request.getParameter("StartDate") ;
	if(null!=StartDate && sqlInjectValidate.validateSql(StartDate))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	url = url + "StartDate="+StartDate+"&" ;
	String EndDate = request.getParameter("EndDate") ;
	if(null!=EndDate && sqlInjectValidate.validateSql(EndDate))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	url = url + "EndDate="+EndDate+"&" ;
	String editor = request.getParameter("editor") ;
	if(null!=editor && sqlInjectValidate.validateSql(editor))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	url = url + "editor="+editor+"&" ;
	String auditor = request.getParameter("auditor") ;
	if(null!=auditor && sqlInjectValidate.validateSql(auditor))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	url = url + "auditor="+auditor+"&" ;
	String state = request.getParameter("state") ;
	if(null!=state && sqlInjectValidate.validateSql(state))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	url = url + "state="+state+"&" ;
	String is_delete = request.getParameter("is_delete") ;
	if(null!=is_delete && sqlInjectValidate.validateSql(is_delete))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	url = url + "is_delete="+is_delete+"&" ;
	String doc_type = request.getParameter("doc_type") ;
	if(null!=doc_type && sqlInjectValidate.validateSql(doc_type))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	url = url + "doc_type="+doc_type+"&" ;
	String pageno = request.getParameter("pageno") ;
	if(null!=pageno && sqlInjectValidate.validateSql(pageno))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	if (pageno == null) pageno = "0" ;
	url = url + "pageno="+pageno ;
	url = java.net.URLEncoder.encode(url) ;
    
%>
<html>
<head>
<title></title>
<style type="text/css">
	body {scrollbar-arrow-color:#000000;
	scrollbar-base-color:#ffffff;
	scrollbar-face-color:#ffffff;
	scrollbar-darkshadow-color:#ffffff;
	scrollbar-highlight-color:#C7C7C7;
	scrollbar-shadow-color:#C7C7C7;
	scrollbar-3dlight-color:#ffffff;
	scrollbar-track-color:#EEEEEE;}	
</style>

</head>
<body topmargin=0 bgcolor="#FFFFFF" leftmargin="0" marginwidth="0" marginheight="0" onload="init();">
    <jsp:include page="jjgglist.jsp"/>

</body>
</html>