<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证劵_社会公益基金</title>
<link href="${contextPath }/gyjj/css/community.css" rel="stylesheet" type="text/css" />
<script src="${contextPath }/gyjj/js/swfobject_source.js" type=text/javascript></script>
</head>

<body>
<!-- header begin -->
<div id="header">
  <div class="topLogowrap">
    <h1>广发证劵社会公益基金</h1>
   <table align="right">
	   <tr>
	     <td width="137">
	     <a href="http://weibo.com/gfsecurities/" target="_Blank"><img src="${contextPath }/gyjj/images/wb.jpg" alt="新浪微薄"/></a>
	     <a href="http://t.qq.com/gfsecurities" target="_Blank"><img src="${contextPath }/gyjj/images/twb.jpg" alt="腾讯微薄"/></a>
	   </td>
	    
	   <td width="220">
		<div class="backArea">
	    <span class="homepage">
	    <a href="${contextPath }/default.html">返回广发网</a></span>
	    <span class="backhome">
	    <a href="http://20.gf.com.cn">广发证券20周年官方网站</a></span>
	    </div>
	   </td>
	   </tr>
	 </table>
   
   
	 </div>
  <div class="navBox">
    <ul>
      <li id="index"><a href="${contextPath }/gyjj/index.jsp">首页</a></li>
      <li id="jjgjj"><a href="${contextPath }/gyjj/institutionList.jsp">基金会简介</a></li>
      <li id="jjhdt"><a href="${contextPath }/gyjj/news.jsp">基金会动态</a></li>
      <li id="gyxm"><a href="${contextPath }/gyjj/project.jsp">公益项目</a></li>
      <li id="grhg"><a href="${contextPath }/gyjj/topicsIndex.jsp">感恩回顾</a></li>
      <li id="xmsq"><a href="${contextPath }/gyjj/apply.jsp">项目申请</a></li>
      <li id="jjjx"><a href="${contextPath }/gyjj/system.jsp">接受捐赠</a></li>
      <li id="gtbz"><a href="${contextPath }/financeMsgAction.do?method=getFinanceMessageList&ext3=4">沟通帮助</a></li>
    </ul>
  </div>
</div>
</body>
<%
	String nav ="index";
	if(request.getParameter("nav")!=null)
	nav=request.getParameter("nav");
	if (nav != null && !"".equals(nav))
	{
			%>
					<script type="text/javascript">
						document.getElementById('<%=nav%>').className = "home";
					</script>
					
			<%
	}
 %>
</html>
