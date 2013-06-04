<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/turnPage.jsp"%>
<jsp:directive.page import="com.cssweb.common.util.PageUtil"/>
<jsp:directive.page import="java.util.*"/>
<jsp:directive.page import="com.cssweb.subscribe.pojo.TcsswebFwcpdyCms"/>
<%@page import="java.text.SimpleDateFormat"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
</head>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	List list=null;
	if(request.getAttribute("list")!=null)
	list=(List)request.getAttribute("list");
	String productId="";
	if(request.getParameter("productId")!=null&&!request.getParameter("productId").equals(""))
	{
	 productId=request.getParameter("productId");
	}
	String prodName="";
	if(list!=null&&list.size()>0){
	TcsswebFwcpdyCms tcs=(TcsswebFwcpdyCms)list.get(0);
	prodName=tcs.getProductName();
	}
 %>
<body>
<div class="left_tit2">
    <span class="pjcp"><a href="#">我要评价此产品</a></span><%=prodName %></div>
      <form name="qForm" id="qForm" action="${ctx }/tcsswebFwcpcxAction.do?method=getTcsswebFwcpdyCmsByProductId&productId=<%=productId %>" method="post">
       <table width="90%" align="center" class="lh28 mt20  font_st list_bline1">
      
      <%if(list!=null&&list.size()>0) {
		for(int i=0;i<list.size();i++){
			TcsswebFwcpdyCms tcsswebFwcpdyCms=(TcsswebFwcpdyCms)list.get(i);	
	%>
		<tr>
		  <td width="515"><a href="${ctx }/Subscribe/newsContent.jsp?docId=<%=tcsswebFwcpdyCms.getId() %>" target="_blank">·<%=tcsswebFwcpdyCms.getTitle() %>  </a></td>
        <td width="108"><%=tcsswebFwcpdyCms.getCmsDate()!=null&&!tcsswebFwcpdyCms.getCmsDate().equals("")?sdf.format(tcsswebFwcpdyCms.getCmsDate()):"" %></td>
      </tr>
	<%}
	}%>
	</table>
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="28" align="right"><p align="right"> <%=PageUtil.pagination("window.qForm",totleCount, currentPage, pagesize)%></p></td>
      </tr>
    </table>
    </form>

      <div style="height:5px; overflow:hidden"></div>
</body>
</html>