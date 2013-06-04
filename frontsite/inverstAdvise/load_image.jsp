<jsp:directive.page import="com.cssweb.common.util.FileDownloader"/>
<%@page import="com.cssweb.inverstAdvise.service.InversAdviserService"%>
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/>
<%@page import="com.cssweb.common.util.DataRow"%>
<%
	String mpic=request.getParameter("mpic");
	byte[] pic = null;  
	if(!StringUtils.isEmpty(mpic) && StringUtils.isNumeric(mpic)){
		InversAdviserService inversAdviserService = new InversAdviserService(
				request);
		DataRow inversAdviser=inversAdviserService.querybyid(mpic);
	    if(inversAdviser!=null) {
	       pic = (byte [])inversAdviser.get("imgsource");
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