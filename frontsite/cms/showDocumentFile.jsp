
<jsp:directive.page import="com.css.cms.document.DocumentManager"/>
<jsp:directive.page import="com.css.cms.document.Document"/>
<jsp:directive.page import="com.css.cms.document.DocBody"/>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="java.io.OutputStream"/>
<%request.setCharacterEncoding("UTF-8");%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	String _id = request.getParameter("id") ;
	long id = 0 ;
	try{
		id = Long.parseLong(_id) ;
	}catch(Exception e){
	}
	
	DocumentManager dm = DocumentManager.getDocumentManager();
	Document docTitle=dm.getDocument(id);
	DocBody doc = dm.getDocBody(id);
	String mime = doc.getContentType() ;
	String title = DocumentHelper.getTitle(docTitle ,150);
	title = new String(title.getBytes("GBK"), "ISO8859_1");
	byte[] bytes = doc.getContent() ;
	if(bytes==null){
		bytes = new byte[0] ;
		mime = "text/plain" ;
	}
	response.reset();
	if(mime.equals("application/msword")){
		response.addHeader("Content-Disposition","attachment;   filename=\""+title+".doc\"");
	}else if(mime.equals("application/vnd.ms-excel")){
		response.addHeader("Content-Disposition","attachment;   filename=\""+title+".xls\"");
	}else if(mime.equals("application/pdf")){
		response.addHeader("Content-Disposition","attachment;   filename=\""+title+".pdf\"");
	}else if(mime.equals("application/vnd.openxmlformats-officedocument.wordprocessingml.document")){
		response.addHeader("Content-Disposition","attachment;   filename=\""+title+".docx\"");
	}else if(mime.equals("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")){
		response.addHeader("Content-Disposition","attachment;   filename=\""+title+".xlsx\"");
	} else {
		response.addHeader("Content-Disposition","attachment;   filename=\""+title+"\"");
	}
	
	response.setContentType(mime);
	OutputStream outStream = response.getOutputStream();
	
	outStream.write(bytes, 0, bytes.length);
	outStream.flush();
	outStream.close();
%>