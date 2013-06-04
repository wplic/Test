<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%request.setCharacterEncoding("UTF-8");%>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"    %>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.developer.pojo.TdeveloperGroup"%>
<%@page import="com.cssweb.common.toDbLob.service.LobService"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.common.toDbLob.pojo.TextBlob"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<%
		String column="zqyj_tdyj";
		List list =	(List)request.getAttribute("list");
		String groupType = (String)request.getAttribute("groupType");
		ServletContext sc = this.getServletConfig().getServletContext();
		ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(sc);
		LobService lobService = (LobService)ctx.getBean("lobService");
 %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/stockResearch/stockResearch.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页</a>  -  <a href="/stockResearch/index.html">证券研究</a> - <a href="/stockResearch/departmentsInfo.html">发展研究中心简介</a> - 研发团队</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/stockResearch/departments_lmenu.jsp?nav2=yftd" />
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w706 fright">
  		<div class="comtit1"><h4>研发团队</h4></div>
    <div class="clearfloat h25"></div>
    		<paging:page count="false" row="20" provider="<%= new com.css.cms.document.model.DocumentFrontListProvider(column,request)%>" tableId="doclist">
				<form name="querylist" action="">
					<table align="center">
						<paging:pageRow id="doc" type="com.css.cms.document.Document"> 
							<%
										String content=DocumentHelper.getContent(doc);
										//content=content.replaceAll("\\</?(?!(input)|(img)).*?\\>","");
										
							 %>
				   		
				   		<tr>
				            <td width="556" valign="top" class="lh24">
				            			<%= content %>
				            </td>
				          </tr>
				         </paging:pageRow> 
		           </table> 
   			  </form>
			</paging:page>
		
    <div class="clearfloat h25"></div>
  </div>
  <!--中侧sied结束--> 
   
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>