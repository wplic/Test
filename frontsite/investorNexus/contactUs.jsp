<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<%@ include file="/commons/taglibs.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/investorNexus/investorNexus.css" rel="stylesheet" type="text/css" />

</head>
<%
		
		String category1 = "tzzgx_lxwm";
 %>
<body>
<br><jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页</a> - <a href="/investorNexus/index.html">投资者关系</a> - 联系我们</div>
</div>
<div class="wrap_3c">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/investorNexus/index_lmenu.jsp" />
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w492 fleft mlr4">
  		<div class="comtit1"><h4>联系我们</h4>
  		</div>
    <div class="blank10"></div>
    <paging:page count="false" row="1" provider="<%= new com.css.cms.document.model.DocumentFrontListProvider(category1,request)%>" tableId="doclist">
  		    	<paging:pageRow id="doc" type="com.css.cms.document.Document"> 
		          	 <%=DocumentHelper.getContent(doc)%>
		          </paging:pageRow>
          </paging:page>
  </div>
  <!--中侧sied结束--> 
    <!--右侧sied开始-->
  <jsp:include page="/investorNexus/include_right.jsp" />
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>