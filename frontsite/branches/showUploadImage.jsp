<jsp:directive.page import="com.cssweb.common.util.FileDownloader"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.cssweb.collect.service.MgrInfoService"/>
<jsp:directive.page import="com.cssweb.collect.pojo.MgrInfo"/>
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
	String id = request.getParameter("id");
	byte[] pic = null;  
	
	if(!StringUtils.isEmpty(id) && StringUtils.isNumeric(id)){
		ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(this.getServletConfig().getServletContext());
		MgrInfoService mgrInfoService = (MgrInfoService)ctx.getBean("mgrInfoService");
		List list=mgrInfoService.getMgrInfoBySearch(Long.valueOf(id),"","","");
	    if(list!=null&&list.size()>0) {
	       MgrInfo mgrInfo=(MgrInfo)list.get(0);
	       pic = mgrInfo.getYgzpImage();
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
