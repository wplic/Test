<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/investmentBank/investmentBank.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%
		String category = "tzyh_thgg";
		
		String category1 = "tzyh_lxwm";
 %>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页</a> - <a href="/investmentBank/index.html">投资银行</a> - 联系我们</div>
</div>
<div class="wrap_2right">
  <!--左侧sied开始-->
  <div class="w706 fleft">
  		<div class="comtit1"><h4>联系我们</h4></div>
  		<div class=" blank5"></div>
		<table width="98%" align="center" class="lh24 mt10">
  		  <tr>
  		    <td>
  		    <paging:page count="false" row="1" provider="<%= new com.css.cms.document.model.DocumentFrontListProvider(category1,request)%>" tableId="doclist">
  		    	<paging:pageRow id="doc" type="com.css.cms.document.Document"> 
		          	 <%=DocumentHelper.getContent(doc)%>
		          </paging:pageRow>
          </paging:page>
  		    </td>
	      </tr>
   		 </table>
  </div>
  
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w210 fright">
		<div class="rtit1">发行公告</div>
        <div class="bg_ff ptb6 ribor3">
        <marquee scrollamount="3" direction="up" onmouseover="this.stop()" onmouseout="this.start()" height="200">
          <paging:page count="false" row="20" provider="<%= new com.css.cms.document.model.DocumentFrontListProvider(category,request)%>" tableId="doclist">
	          <table width="93%" align="center" class="lh20 fcenter">
		          <paging:pageRow id="doc" type="com.css.cms.document.Document"> 
		          	 <tr>
		              <td width="13" valign="top"><img src="/pic/stockResearch/dot-hjt.gif" /></td>
		              <td><a href="${contextPath }/commons/infoList.jsp?docId=<%=doc.getId()%>" target=\"_blank\"><%=DocumentHelper.getTitle(doc ,60)%></a></td>
		            </tr>
		          </paging:pageRow>
	          </table>
          </paging:page>
          </marquee>
        </div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>