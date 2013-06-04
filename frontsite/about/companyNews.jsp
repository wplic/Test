<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="com.css.cms.category.CategoryTree"%>
<%@page import="com.css.cms.category.*"%>
<%@page import="com.css.cms.document.*"%>
<head>
<%
String bt="公司动态";
CategoryTree catTree= null;
if(request.getParameter("siteName")!=null){
		catTree = CategoryFactory.getCategoryTree(request.getParameter("siteName"));
	}else{
		catTree = CategoryFactory.getCategoryTree(DocumentManager.getCmsRootName());
		
	}
String whichCat="gygf_gsdt";
if(request.getParameter("whichCat")!=null&&!request.getParameter("whichCat").equals(""))
{
whichCat=request.getParameter("whichCat");
	CategoryNode catNode = catTree.getCategoryNode(whichCat);
	
	if(catNode!=null)
	bt=catNode.getDisplayName();
}

String nav2=whichCat;
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页</a> - <a href="/about/aboutUs.html">关于广发</a>  - <%=bt %></div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
				<jsp:include page="/about/about_lmenu.jsp">
		           <jsp:param name="meun" value="<%=nav2%>"/>
		    	</jsp:include>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  		<div class="comtit1"><h4><%=bt %></h4></div>
    <div class="blank10"></div>
        <jsp:include page="/about/aboutListGygf.jsp">
           <jsp:param name="whichCat" value="<%=whichCat%>"/>
           <jsp:param name="showSize" value="20"/>
           <jsp:param name="titleWidth" value="56"/>
    	</jsp:include>
  </div>
  <!--右侧sied结束--> 
<div class="clearfloat"></div>
</div>  <div class="blank5"></div><!--清除浮动--> 
<jsp:include page="/commons/msbottom.jsp" />
</body>
<script type="text/javascript"> 
var _aq = _aq || [];
_aq.push(['_setSiteId', 10001]);_aq.push(['_setCatalogId', 54]); _aq.push(['_trackPageview']); (function() {
var ga = document.createElement( 'script'); ga.type = 'text/javascript'; ga.async = true; ga.src='http://121.8.153.59:8080/stat/stat.js'; var s = document.getElementsByTagName( 'script')[0]; s.parentNode.insertBefore(ga, s); })();
</script>
</html>