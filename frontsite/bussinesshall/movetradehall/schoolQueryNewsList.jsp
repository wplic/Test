<!-- 搜索结果页 -->
<%request.setCharacterEncoding ("UTF-8") ;%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String url = "" ;
	String title = request.getParameter("title") ;
	url = url + "title="+title+"&" ;
	String source = request.getParameter("source") ;
	url = url + "source="+source+"&" ;
	String author = request.getParameter("author") ;
	url = url + "author="+author+"&" ;
	String stock_id = request.getParameter("stock_id") ;
	url = url + "stock_id="+stock_id+"&" ;
	String keyword = request.getParameter("keyword") ;
	url = url + "keyword="+keyword+"&" ;
	String importance = request.getParameter("importance") ;
	url = url + "importance="+importance+"&" ;
	String catIdStr = request.getParameter("catIdStr") ;
	url = url + "catIdStr="+catIdStr+"&" ;
	String whichCat = request.getParameter("whichCat") ;
	url = url + "whichCat="+whichCat+"&" ;
	String StartDate = request.getParameter("StartDate") ;
	url = url + "StartDate="+StartDate+"&" ;
	String EndDate = request.getParameter("EndDate") ;
	url = url + "EndDate="+EndDate+"&" ;
	String editor = request.getParameter("editor") ;
	url = url + "editor="+editor+"&" ;
	String auditor = request.getParameter("auditor") ;
	url = url + "auditor="+auditor+"&" ;
	String state = request.getParameter("state") ;
	url = url + "state="+state+"&" ;
	String is_delete = request.getParameter("is_delete") ;
	url = url + "is_delete="+is_delete+"&" ;
	String doc_type = request.getParameter("doc_type") ;
	url = url + "doc_type="+doc_type+"&" ;
	String pageno = request.getParameter("pageno") ;
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
    <jsp:include page="schoollist.jsp"/>

</body>
</html>