<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<%@page import="com.css.cms.document.*"%>
<%@page import="com.css.cms.document.Document"%>
<%@page import="com.css.cms.category.CategoryFactory"%>
<%@page import="com.css.cms.category.CategoryTree"%>
<%@page import="com.css.cms.category.*"%>
<%@page import="com.css.cms.document.util.DocumentHelper"%>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.common.util.CsswebServiceUtil"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.Map"/>
<%@ taglib uri="/WEB-INF/plugins/paging/css-paging.tld" prefix="paging"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
</head>
<%
long docid = -1;
String column = "rzrq_ywlc";
%>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页</a> - <a href="/financing/index.html"> 融资融券</a> - 业务流程</div>
  <div class="comtit1"><h4>业务流程</h4></div>
  <div class="blank5"></div>
  <div class="bg_f5 p8">
  		<div class="tlbg">
            <table width="100%" align="center">
              <tr>
                <td width="260" class="zzjgTxt1"><img src="/pic/financing/ywlctu.jpg" width="236" height="633" /></td>
                <td valign="top">
					<%String whichCat="rzrq_ywlc"; %>
					<jsp:include  page="/financing/cmsListAll.jsp">
						<jsp:param name="whichCat" value="<%=whichCat %>" />
					</jsp:include>
				</td>
              </tr>
            </table>
	</div>
  </div>
</div>

<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>