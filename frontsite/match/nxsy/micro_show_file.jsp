
<jsp:directive.page import="com.cssweb.common.util.FileDownloader" />
<jsp:directive.page
	import="com.cssweb.common.toDbLob.service.LobService" />
<jsp:directive.page import="com.cssweb.common.toDbLob.pojo.FileBlob" />
<jsp:directive.page import="org.apache.commons.lang.StringUtils" />
<%@page import="com.cssweb.common.util.DataRow"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.util.*,java.io.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.cssweb.nxsy.service.NxsyMicroCommentService"%>


<%
	out.clearBuffer();
	String id = request.getParameter("id");
	byte[] file = null;
	DataRow datarow=new DataRow();
	if (!StringUtils.isEmpty(id) && StringUtils.isNumeric(id)) {
		NxsyMicroCommentService nxsyMicroCommentService = new NxsyMicroCommentService(request);
		datarow=nxsyMicroCommentService.queryloadbyid(id);
		file=(byte [])datarow.get("filedata");
	}
	if (file != null) {
		try {
			String fileName =new String(datarow.get("filename").toString().getBytes("gb2312"),"iso8859-1");
			response.setContentType("application/pdf");
			String fileBar = System.getProperty("file.separator");
			response.addHeader("Content-Disposition",
					"attachment;filename=" + fileBar + fileName);
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
