<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@page import="java.util.List"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page	import="com.cssweb.systemset.pojo.BranchNotice"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<%@page	import="java.text.SimpleDateFormat"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<%
	List list =(List)request.getAttribute("list");	
	 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
</head>
<script >
		function yybInfoSubmit()
		{
				document.getElementById("yybInfoForm").submit();
		}
</script>
<body class="ggjs_bg">
<form action="${contextPath }/branchNotice.do?method=getDefaultBranchNoticeList" id="yybInfoForm" name="yybInfoForm" method="post">
  
<div class="ggjs_box">
	<div class="jobtcy_tt">
    	<p><a href="/default.jsp"><img src="/pic/job/tcy_logo.jpg" /></a></p>
    </div>
    <div class="ggjs_line"></div>
    
    <div class="dqwz"><span class=" mr10 ml10">当前位置：<a href="${contextPath }/default.html"> 首页 </a> - 分支机构公告</span></div>
  <div class="p15">
    
    <div class="khfwcx"> <a href="#"></a>
      <table width="90%" align="center" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="7%">标题 ：</td>
          <td width="18%"><input name="title" type="text" id="title" style=" width:100px" value="${title }" /></td>
          <td width="21%"><a href="#" onclick="yybInfoSubmit();"><img src="/pic/assetManage/butCx.jpg"/></a></td>
          <td width="10%"></td>
          <td width="44%">
             </td>
        </tr>
      </table>
      </div>
    <table cellspacing="0" cellpadding="0" width="100%" border="0" bordercolor="#cccccc">
      <tr>
          <td height="10"></td>
        </tr>
      <%if(list!=null&&list.size()>0 ){
          for(int i=0;i<list.size();i++)
          {
          BranchNotice branchNotice=(BranchNotice)list.get(i);
          %>
          <tr>
            <td width="80%"><a href="${ctx}/bussinesshall/branchNotice.jsp?id=<%=branchNotice.getId() %>" target=\"_blank\">·<%=branchNotice.getTitle()!=null&&branchNotice.getTitle().length()>38?branchNotice.getTitle().substring(0,38)+"...":branchNotice.getTitle() %> </a></td>
            <td width="20%" align="center"><%=sdf.format(branchNotice.getCreateDate()) %></td>
          </tr>
          <tr height="3">
             <td class="list_bline02" colspan="2">&nbsp;</td>
          </tr>
          <%
        %>
        
        <%} }%>
        <tr>
          <td height="10"></td>
        </tr>
   		<tr>
   			<td colspan="7" align="center"><%=PageUtil.pagination("window.yybInfoForm",totleCount, currentPage, pagesize)%></td>
   		</tr>

    </table>
   
    <div align="center" class="mt10">
      <input name="input" type="button" class="but02 blue" value="关闭此页" onclick="javascript:window.opener=null;window.close();" />
    </div>
  </div>
  
    <jsp:include page="/commons/msbottom2.jsp" />
</div>
 </form>
</body>
<script type="text/javascript"> 
var _aq = _aq || [];
_aq.push(['_setSiteId', 10001]);_aq.push(['_setCatalogId', 51]); _aq.push(['_trackPageview']); (function() {
var ga = document.createElement( 'script'); ga.type = 'text/javascript'; ga.async = true; ga.src='http://121.8.153.59:8080/stat/stat.js'; var s = document.getElementsByTagName( 'script')[0]; s.parentNode.insertBefore(ga, s); })();
</script>
</html>