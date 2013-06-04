<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwtcdy"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwcpcx"%>
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page	import="com.cssweb.common.dictionary.service.DictionaryService"%>
<%@page	import="com.cssweb.common.dictionary.pojo.Dictionary"%>
<%@page import="com.cssweb.subscribe.service.TcsswebFwcpdyCmsService"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwcpdyCms"%>

<%@page import="com.cssweb.subscribe.service.TcsswebTipsService"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebTips"%>
<%
ServletContext st = this.getServletConfig().getServletContext();
ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
TcsswebTipsService tcsswebTipsService = (TcsswebTipsService)ctx.getBean("tcsswebTipsService");
TsystemWebuser tsystemWebuser=null;
 TcsswebTips tcsswebTips=new TcsswebTips();
	     if(request.getSession().getAttribute("tsystemWebuser")!=null)
	     {
	      tsystemWebuser=(TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
	       if(tsystemWebuser.getUserType()!=null&&tsystemWebuser.getUserType().equals("2")){
	        tcsswebTips.setAccount(tsystemWebuser.getServiceName() );
	       }else{
	         tcsswebTips.setAccount(tsystemWebuser.getUserName() );
	       }
	     }
	     tcsswebTips.setType("1");
	     tcsswebTips.setTipsdate(new Date());
	     tcsswebTipsService.delTcsswebTipsByAccount(tcsswebTips.getAccount());
	     tcsswebTipsService.addTcsswebTips(tcsswebTips);
 %>