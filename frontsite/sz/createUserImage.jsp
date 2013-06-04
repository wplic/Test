<jsp:directive.page import="com.cssweb.common.util.FileDownloader"/>
<%@page import="com.cssweb.branchcomp.service.DepartmentManagerService"%>
<%@page import="com.cssweb.branchcomp.pojo.DepartmentManager"%>
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/>

<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%
	String mpic=request.getParameter("mpic");
	byte[] pic = null;  
	if(!StringUtils.isEmpty(mpic) && StringUtils.isNumeric(mpic)){
		ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(this.getServletConfig().getServletContext());
		DepartmentManagerService departmentManagerService=(DepartmentManagerService)ctx.getBean("departmentManagerService");
		DepartmentManager departmentManager=departmentManagerService.getbyId(mpic);
	    if(departmentManager!=null) {
	       pic = departmentManager.getPicsource();
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