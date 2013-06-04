
<jsp:directive.page import="com.css.cms.document.DocumentManager"/>
<jsp:directive.page import="com.css.cms.document.Document"/>
<jsp:directive.page import="com.css.cms.document.DocBody"/>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="java.io.OutputStream"/>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.common.toDbLob.service.LobService"/>
<jsp:directive.page import="com.cssweb.common.toDbLob.pojo.FileBlob"/>

<%request.setCharacterEncoding("UTF-8");%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
   //if(request.getSession().getAttribute("tsystemWebuser")!=null||request.getSession().getAttribute("assetUser")!=null){
   if(true){
	String _id = request.getParameter("id") ;
	long id = 0 ;
	try{
		id = Long.parseLong(_id) ;
	}catch(Exception e){
	}
	ServletContext sc = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(sc);
	LobService lobService=(LobService)ctx.getBean("lobService");
	
	//DocumentManager dm = DocumentManager.getDocumentManager();
	//Document docTitle=dm.getDocument(id);
	//DocBody doc = dm.getDocBody(id);
	FileBlob file = lobService.getFileBlobById(id);

	String mime = file.getFileType() ;
	String title = file.getFileName();
	title = new String(title.getBytes("GBK"), "ISO8859_1");
	byte[] bytes = file.getSource() ;

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
	}else {
		response.addHeader("Content-Disposition","attachment;   filename=\""+title+"\"");
	}
	
	response.setContentType(mime);
	OutputStream outStream = response.getOutputStream();
	
	outStream.write(bytes, 0, bytes.length);
	outStream.flush();
	outStream.close();
	}else{
	%>
	<script type="text/javascript">
		alert ("对不起，您没有权限浏览!") ;
		window.opener=null;
		window.open('','_self');
		window.close() ;
	</script>
<%
	}
%>