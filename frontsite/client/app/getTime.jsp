<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%
DateFormat df  = new SimpleDateFormat("yyyy-MM-dd HH:mm");
out.print(df.format(new Date()));
%>