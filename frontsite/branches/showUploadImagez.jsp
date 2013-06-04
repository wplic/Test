<jsp:directive.page import="com.cssweb.common.util.FileDownloader"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.cssweb.collect.service.TcsswebRyxxService"/>
<jsp:directive.page import="com.cssweb.collect.pojo.TcsswebRyxx"/>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/>
<%
request.setCharacterEncoding("UTF-8");
%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", -1);
%>
<%  
	byte[] pic = null;  
	 String zsbh="1";
    if(request.getParameter("zsbh")!=null&&!request.getParameter("zsbh").equals(""))
	{
	    zsbh = request.getParameter("zsbh");
		ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(this.getServletConfig().getServletContext());
		TcsswebRyxxService tcsswebRyxxService = (TcsswebRyxxService)ctx.getBean("tcsswebRyxxService");
		List list=tcsswebRyxxService.getTcsswebRyxxBySearch("","",zsbh);
	    if(list!=null&&list.size()>0) {
	       TcsswebRyxx tcsswebRyxx=(TcsswebRyxx)list.get(0);
	       pic = tcsswebRyxx.getYxxx();
	    }	
	}	
	if(pic!=null){
	    byte[] pic3 = new byte[1];
	    pic3[0]=pic[0];
	    int sint=TcsswebRyxx.byteToInt(pic3);
	    byte[] pic2 = new byte[pic.length-sint];
	    for(int j=sint+1;j<pic.length ;j++){
	     pic2[j-sint-1]=pic[j];
	    }
	    response.reset();
		FileDownloader.write(response, "image/jpeg", pic2);
		if(getServletConfig().getServletContext().getServerInfo().indexOf("Apache Tomcat")>=0)
	    {
			out.clear();
		    out = pageContext.pushBody();
	    }
	}
	
	
%>
