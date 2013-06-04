<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="com.css.cms.document.Document"/>
<jsp:directive.page import="com.css.cms.document.DocumentManager"/>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.common.util.CsswebServiceUtil"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.Map"/>
<%
request.setCharacterEncoding("UTF-8");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证劵_社会公益基金</title>
<link href="${contextPath }/gyjj/css/community.css" rel="stylesheet" type="text/css" />
<script src="${contextPath }/gyjj/js/swfobject_source.js" type=text/javascript></script>
</head>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>

<body>
<jsp:include page="/gyjj/index_top.jsp" />
<!-- header end -->
<div id="subbanner"><img src="${contextPath }/gyjj/images/subBanner.jpg" /></div>
<div class="subMainconter">
  <div class="newshowup"><img src="${contextPath }/gyjj/images/newshowup.jpg" /></div>
  <div class="newshowMain">
      <dl class="newsTitle">
        <dt>${inst.title}</dt>
      </dl>
       <br />
      		${inst.content}
       <br />
      <div class="close">
      <a href="#" onClick="javascript:window.opener=null;window.close();"><img src="${contextPath }/gyjj/images/closeBtn.jpg" /></a></div>
  </div>
  <div class="newshowdown"><img src="${contextPath }/gyjj/images/newshowdown.jpg" /></div>
</div>
<div class="clear"></div>
<jsp:include page="/gyjj/index_bottom.jsp" />
</body>
</html>
