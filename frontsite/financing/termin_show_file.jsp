<%@ page import="com.css.system.Configuration"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.util.*,java.io.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	out.clearBuffer();
	String loadurl = request.getParameter("url");
	String filename = loadurl.substring(loadurl.lastIndexOf("/") + 1);
	String url = Configuration.getProperty("serviceRarFileDir")
			+ "frontsite" + loadurl;
	byte[] file = null;
	File dfile = new File(url);
	try {
		//将file转换为byte[]类型
		if (dfile != null) {
			FileInputStream stream = new FileInputStream(dfile);
			ByteArrayOutputStream outf = new ByteArrayOutputStream(1000);
			byte[] b = new byte[1000];
			int n;
			while ((n = stream.read(b)) != -1)
				outf.write(b, 0, n);
			stream.close();
			outf.close();
			file = outf.toByteArray();
		}

	} catch (IOException e) {
		e.printStackTrace();
		return;
	}

	if (file != null) {
		try {
			String fileName = new String(filename.toString().getBytes(
					"gb2312"), "iso8859-1");
			response.setContentType("application/vnd.ms-excel");
			response.addHeader("Content-Disposition",
					"attachment;filename="  + fileName);
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
