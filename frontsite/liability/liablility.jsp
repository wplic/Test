<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="com.css.cms.category.CategoryTree"%>
<%@page import="com.css.cms.category.*"%>
<%@page import="com.css.cms.document.*"%>
<head>
<%
String bt="基本介绍";
CategoryTree catTree= null;
if(request.getParameter("siteName")!=null){
		catTree = CategoryFactory.getCategoryTree(request.getParameter("siteName"));
	}else{
		catTree = CategoryFactory.getCategoryTree(DocumentManager.getCmsRootName());
		
	}
String whichCat="gfwqjbjs";
if(request.getParameter("whichCat")!=null&&!request.getParameter("whichCat").equals(""))
{
whichCat=request.getParameter("whichCat");
	CategoryNode catNode = catTree.getCategoryNode(whichCat);
	
	if(catNode!=null)
	bt=catNode.getDisplayName();
}

String nav2="";
if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals(""))
 nav2=request.getParameter("nav2").trim();
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/job/job.css" rel="stylesheet" type="text/css" />
<style>
.wrap_3left{width:920px; margin:0 auto; background:url(/pic/liability/wrap2left.gif) repeat-y;}
.wrap_3left .w210{ width:198px; padding:6px;}
.sidemenu3{ width:198px;}
.sidemenu3 .link{ background:url(/pic/liability/sidemnenua.gif) no-repeat; width:198px; height:30px; line-height:30px; text-indent:60px; display:block}
.sidemenu3 .active{ background:url(/pic/liability/sidemnenuh.gif); font-weight:bold; height:30px; line-height:30px; text-indent:60px; display:block}
.sidemenu3 .submenu{background:#FFF; line-height:28px; font-family:"宋体"; padding:6px 0px 6px 56px;}
.shzp_tt{background:url(/pic/liability/shzp_tt.jpg) repeat-x;border-left:1px solid #df97b8;border-right:1px solid #df97b8; height:29px;}
.w703{width:703px;}
.itempiclist li{float:left;text-align:center;position:relative;width:170px;height:135px;padding-right:6px;}
.itempiclist li p{line-height:25px;height:25px;background:#eee;width:170px;position:absolute;left:0;bottom:0;opacity:0.8;filter:alpha(opacity=80)}
.itempiclist img{width:170px;height:135px;margin:0;border:0;padding:0;}
.leftlink8{background:url(/pic/liability/llinkboxbg.gif) no-repeat 0 bottom;padding-bottom:60px;}
.leftlink8 p{line-height:40px;height:53px;text-align:center;font-family:"黑体","宋体",Arial; font-size:18px;font-weight:normal;color:#af5f5e;background:url(/pic/liability/llinkbg.gif) no-repeat;}
.leftlink8 p a{color:#fff;}
.zrinfobox{height:86px;width:530px;background:url(/pic/liability/infobg.jpg) no-repeat;padding:75px 10px 20px 165px;}
</style>
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/default.html">首页</a> - <a href="${ctx }/liability/index.jsp">企业社会责任</a> - <%=bt %></div>
</div>
<div class="wrap_3left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/liability/lmenu.jsp">
		   <jsp:param name="meun" value="<%=nav2%>"/>
		</jsp:include>
    <div class="blank5"></div>
   	

  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
<div class="fleft w706">
<div class="shzp_tt w703"><p class="shzp_bq bold fleft"><%=bt %></p></div>
<div class="blank10"></div>
<table width="95%" align="center" class="lh25 font_st">
  <jsp:include page="/liability/aboutList.jsp">
           <jsp:param name="whichCat" value="<%=whichCat %>"/>
           <jsp:param name="showSize" value="20"/>
           <jsp:param name="titleWidth" value="56"/>
           <jsp:param name="state" value="1"/>
    	</jsp:include>
</table>
</div>
<div class="clearfloat"></div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</script>
</body>
</html>