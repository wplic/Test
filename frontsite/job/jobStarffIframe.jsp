<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/turnPage.jsp"%>
<bean:parameter name="type" id="type" value="1"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<style type="text/css">
body{ 
SCROLLBAR-FACE-COLOR: #97B0D9; 
SCROLLBAR-HIGHLIGHT-COLOR: #ffffff;
SCROLLBAR-SHADOW-COLOR: #ffffff; 
SCROLLBAR-3DLIGHT-COLOR: #ffffff;
SCROLLBAR-ARROW-COLOR: #5779B2; 
SCROLLBAR-TRACK-COLOR: #ffffff;
SCROLLBAR-DARKSHADOW-COLOR: #ffffff;
}
td {font-size: 12px}
</style>
</head>
<body>
<div id="tabs01">
<form action="${ctx }/empspeakAction.do?method=getStaffList" name="postInfoForm" method="post">
<input type="hidden" name="type" value="<%=type %>"/>
<c:forEach items="${list }" var="bean">
	<table width="94%" align="center" class="lh22">
	  <tr>
	    <td width="26%" align="center" valign="top"><table width="100%" border="0">
	      <tr class="lh22 mt10">
	        <td align="center" valign="bottom"><img src="/share/showUploadImage.jsp?id=${bean.picId }" width="165" height="215" title="广发证券新员工感言" class="mb12"/></td>
	      </tr>
	      <tr class="lh22 mt10">
	        <td align="center" valign="top" class="font14 bold blueqian">${bean.name }</td>
	      </tr>
	      <tr class="lh22 mt10">
	        <td align="left" valign="top" style="word-break:break-all">${bean.intro }</td>
	      </tr>
	      </table></td>
	    <td valign="top">
	    ${bean.contentStr }
	      <p align="right"><bean:write name="bean" property="speakDate" format="yyyy-MM-dd"/></p>
	      
	      </td>
	  </tr>
	  <tr>
	    <td colspan="2" class="cuxuxian">&nbsp;</td>
	  </tr>
	</table>

</c:forEach>
 <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="28" align="right"> <%=PageUtil.pagination("window.postInfoForm",totleCount, currentPage, pagesize)%></td>
      </tr>
 </table>
 </form>
</div>
</body>
</html>