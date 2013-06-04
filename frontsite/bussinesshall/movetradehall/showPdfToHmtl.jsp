
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<jsp:directive.page import="com.cssweb.gazx.jrsj.service.VipgazxService" />
<jsp:directive.page import="com.cssweb.gazx.jrsj.pojo.Vipgazx"/>
<jsp:directive.page import="java.io.OutputStream"/>
<%request.setCharacterEncoding("UTF-8");%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	String _id = request.getParameter("id") ;
	int id = 0 ;
	try{
		id = Integer.parseInt(_id) ;
	}catch(Exception e){
	}
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	VipgazxService vipgazxService = (VipgazxService)ctx.getBean("vipgazxService");
	Vipgazx vipgazx=vipgazxService.getJrsjGazxFile(id);
	String title = vipgazx.getFjwjmc();
	String mime = "";
	if(title.lastIndexOf(".")>0)
	mime=title.substring(title.lastIndexOf(".")+1);
	title = new String(title.getBytes("GBK"), "ISO8859_1");
	byte[] bytes =vipgazx.getBgfj();
	if(bytes==null){
		bytes = new byte[0] ;
	}
	String mimeType="text/plain";
	response.reset();
	if(mime.equals("doc")){
		response.addHeader("Content-Disposition","nosave;   filename=\""+title+".doc\"");
		mimeType="application/msword";
	}else if(mime.equals("xls")){
		response.addHeader("Content-Disposition","nosave;   filename=\""+title+".xls\"");
		mimeType="application/vnd.ms-excel";
	}else if(mime.equals("application/pdf")){
		response.addHeader("Content-Disposition","nosave;   filename=\""+title+".pdf\"");
		mimeType="application/pdf";
	}else {
		response.addHeader("Content-Disposition","nosave;   filename=\""+title+"\"");
	}
	
	response.setContentType(mimeType);
	OutputStream outStream = response.getOutputStream();
	
	outStream.write(bytes, 0, bytes.length);
	outStream.flush();
	outStream.close();
%>