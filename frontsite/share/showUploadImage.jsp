
<jsp:directive.page import="com.cssweb.common.util.FileDownloader"/>
<jsp:directive.page import="com.cssweb.common.toDbLob.service.LobService"/>
<jsp:directive.page import="com.cssweb.common.toDbLob.pojo.FileBlob"/>
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/>
<%
request.setCharacterEncoding("UTF-8");
%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", -1);
%>
<%  
	String id = request.getParameter("id");
	byte[] pic = null;  
	
	if(!StringUtils.isEmpty(id) && StringUtils.isNumeric(id)){
		ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(this.getServletConfig().getServletContext());
		LobService lobService=(LobService)ctx.getBean("lobService");
		FileBlob fileBlob = lobService.getFileBlobById(Long.valueOf(id));
		
	    if(fileBlob!=null) {
	       pic = fileBlob.getSource();
	    }	
	}	
	if(pic!=null){
	    response.reset();
		FileDownloader.write(response, "image/jpeg", pic);
		if(getServletConfig().getServletContext().getServerInfo().indexOf("Apache Tomcat")>=0)
	    {
			out.clear();
		    out = pageContext.pushBody();
	    }
	}
%>
