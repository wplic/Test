
<jsp:directive.page import="com.cssweb.common.util.FileDownloader" />
<jsp:directive.page
	import="com.cssweb.common.toDbLob.service.LobService" />
<jsp:directive.page import="com.cssweb.common.toDbLob.pojo.FileBlob" />
<jsp:directive.page import="org.apache.commons.lang.StringUtils" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.util.*,java.io.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page
	import="org.springframework.web.context.support.WebApplicationContextUtils"%>

<%
	out.clearBuffer();
	String id = request.getParameter("id");
	byte[] file = null;
	FileBlob fileBlob = null;
	if (!StringUtils.isEmpty(id) && StringUtils.isNumeric(id)) {
		ApplicationContext ctx = WebApplicationContextUtils
				.getRequiredWebApplicationContext(this
						.getServletConfig().getServletContext());
		LobService lobService = (LobService) ctx.getBean("lobService");
		fileBlob = lobService.getFileBlobById(Long.parseLong(id));

		if (fileBlob != null) {
			file = fileBlob.getSource();
		}
	}

	if (file != null) {
		try {
			String fileName =new String(fileBlob.getFileName().getBytes("gb2312"),"iso8859-1");
			response.setContentType("application/vnd.ms-excel");
			//String fileBar = System.getProperty("file.separator");
			//response.addHeader("Content-Disposition",
			//		"attachment;filename=" + fileBar + fileName);
			response.addHeader("Content-Disposition",
					"attachment;filename=" + fileName);
			OutputStream os = response.getOutputStream();
			os.write(file);
			os.close();
			if (getServletConfig().getServletContext().getServerInfo()
					.indexOf("Apache Tomcat") >= 0) {
				out.clear();
				out = pageContext.pushBody();
			}
		} catch (Exception ex) {
				out.clear();
				out = pageContext.pushBody();
				//ex.printStackTrace();
		}
	}
%>
