<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="com.cssweb.enterprisesell.service.EnterpriseSellService"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="java.util.List"/>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/style.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/investmentBank/investmentBank.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%
	String category = "tzyh_thgg";
	ServletContext sc = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(sc);
	EnterpriseSellService service = (EnterpriseSellService)ctx.getBean("enterpriseSellService");
	Map map=new HashMap();
	map.put("type","1");
	map.put("sortName", "code");
	map.put("dir", "asc");
	List list = service.selectAll(map);
	pageContext.setAttribute("list",list);
%>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页</a> - <a href="/investmentBank/index.html">投资银行</a> - 发行公告</div>
</div>
<div class="wrap_2right">
  <!--左侧sied开始-->
  <div class="w706 fleft">
  		<div class="comtit1"><h4>发行公告</h4></div>
    <div class="blank10"></div>
    <paging:page count="false" row="20" provider="<%= new com.css.cms.document.model.DocumentFrontListProvider(category,request)%>" tableId="doclist">
    <table width="95%" align="center" border="0" cellspacing="0" cellpadding="0" class="lh27 list_bline1">
      <paging:pageRow id="doc" type="com.css.cms.document.Document"> 
     	<tr>
	        <td width="20" align="center"><img src="/pic/msindex/list_03.gif"/></td>
	        <td width="554"><a href="${contextPath }/commons/infoList.jsp?docId=<%=doc.getId()%>" target=\"_blank\"><%=DocumentHelper.getTitle(doc ,60)%></a></td>
	        <td width="97"><%= DocumentHelper.getUploadDate(doc ,"yyyy-MM-dd")%></td>
	      </tr>
       </paging:pageRow>
    </table>
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" align="right"><paging:pageInfo empty="没有记录"/>&nbsp;&nbsp;<paging:pageLink pages="8" mode="text" hasGo="false"/></td>
      </tr>
    </table>
      </paging:page>

  </div>
  
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w210 fright">
		<div class="rtit1">中小板企业承销榜</div>
        <div class="bg_ff ptb6 ribor3">
        <marquee scrollamount="4" direction="up" onmouseover="this.stop()" onmouseout="this.start()" height="500">
        <table width="100%" bgcolor="#ffffff">
          <c:forEach items="${list }" var="bean">
          	<tr>
	            <td align="center" class="rcxb"><a href="${ctx }/investmentBank/featQycx.jsp">
	            <img src="${ctx}/share/showUploadImage.jsp?id=${bean.picId }" width="115" height="90"/>
	            <h4>${bean.name }（${bean.code }）</h4></a></td>
	          </tr>
          </c:forEach>
          
        </table>
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