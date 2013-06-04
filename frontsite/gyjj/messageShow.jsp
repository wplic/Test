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
<%
 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	if(request.getParameter("nav1")!=null&&!request.getParameter("nav1").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav1"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}
	if(request.getParameter("nav")!=null&&!request.getParameter("nav").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}
%>

<%
	String docIdStr = request.getParameter("docId") ;
	if(docIdStr==null){
		docIdStr=request.getParameter("id") ;
	}
	long docId = -2 ;
	try{
		docId = Long.parseLong (docIdStr) ;
	}catch(Exception e){
		docId = -2 ;
	}
		
	Document doc = null ;
	boolean display = false ;
	if(docId>0){
		DocumentManager dm=DocumentManager.getDocumentManager();		
		doc=dm.getDocument(docId);
	}
	String baseBrief ="";
	// 这是判断文章是否存在?
	if(doc!=null){
		Long state = (Long)doc.getAttrValue ("state") ;
		Long is_delete = (Long)doc.getAttrValue ("is_delete") ;
		
		
		if(doc.getAttribute("base_brief")!=null&&!doc.getAttribute("base_brief").equals("null")&&!doc.getAttribute("base_brief").equals(""))
		    baseBrief =  String.valueOf(doc.getAttribute("base_brief"));
		
		if(state!=null && state.longValue()==1 && is_delete!=null && is_delete.longValue()==0)
			display = true ;
	}
	
	if(!display){
%>
	<script type="text/javascript">
		alert ("对不起，您请求的文章不存在！") ;
		window.opener=null;
		window.open('','_self');
		window.close() ;
	</script>
<%
		return ;
	}
%>
<body>
<jsp:include page="/gyjj/index_top.jsp" />
<!-- header end -->
<style>
.textTitle1 {font-size: 30px;}
</style>
<div id="subbanner"><img src="${contextPath }/gyjj/images/subBanner.jpg" /></div>
<div class="subMainconter">
  <div class="newshowup"><img src="${contextPath }/gyjj/images/newshowup.jpg" /></div>
  <div class="newshowMain">
      <dl class="newsTitle">
        <dt ><%=DocumentHelper.getTitle(doc ,150) %></dt>
        <dd><span>信息来源：<%= DocumentHelper.getAttrValue(doc ,"source" , "广发证券") %> </span>
        <span>日期：<%= DocumentHelper.getUploadDate(doc ,"yyyy-MM-dd")%></span>
        <span>作者：<%= DocumentHelper.getAttrValue(doc ,"author" , "广发证券") %></span></dd>
      </dl>
       <br />
       <div class="mainContent">
	      <% 
									String content=DocumentHelper.getContent(doc);
									content="&nbsp;&nbsp;&nbsp;"+content;
									out.print(content);
							   %> 
       </div>
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
