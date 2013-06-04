<%@page import="com.cssweb.oauth2.SingleSignOn"%>
<%@page import="com.cssweb.common.util.StringHelper"%>
<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", -1);
%>
   

<%
	if(request.getSession().getAttribute("tsystemWebuser")==null){
		Cookie[] cookies = request.getCookies();
		if(null!=cookies){
			for(Cookie c :cookies ){
			    //System.out.println(c.getName()+"--->"+c.getValue());
			    if(c.getName().equals("GF_OAUTH2_SSO")){
			    	if(!StringHelper.isEmpty(c.getValue())){
			    		SingleSignOn singleSignOn = new SingleSignOn();
			    		String msg = singleSignOn.doSingleSignOn(request, c.getValue());
			    		break;
			    	}
			    }
			}
		}
	}
%>