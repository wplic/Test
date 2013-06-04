<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<%
 String iscc="0";
 if(request.getParameter("iscc")!=null&&!request.getParameter("iscc").equals(""))
 iscc=request.getParameter("iscc").trim();

 if(iscc.equals("1"))
 {
  %>
  
 <script language="javascript">
     if(window.parent==null) {
	     window.location.href="${context}/bussinesshall/movetradehall/myccgStock.jsp";
	 } else {
	     window.parent.location.href="${context}/bussinesshall/movetradehall/myccgStock.jsp";
	 }
</script>
 <%
 }else{
 %>
 <script language="javascript">
     if(window.parent==null) {
	     window.location.href="${context}/bussinesshall/financingCzh.jsp";
     } else {
	     window.parent.location.href="${context}/bussinesshall/financingCzh.jsp";
     }
</script>
 <%
 }
 %>
 </head>
 <body>
 </body>

