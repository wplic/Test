<%@ page contentType="text/html; charset=utf-8" language="java" %>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/style.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/investorNexus/investorNexus.css" rel="stylesheet" type="text/css" />

</head>
<%
		String category = "tzzgx_hdjl";
 %>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页</a> - <a href="/investorNexus/index.html">投资者关系</a> - 投资者关系活动记录</div>
</div>
<div class="wrap_3c">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/investorNexus/index_lmenu.jsp?nav=hdjl" />
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w492 fleft mlr4">
  		<div class="comtit1"><h4>投资者关系活动记录</h4>
  		</div>
    <div class="blank10"></div>
    
     <paging:page count="false" row="20" provider="<%= new com.css.cms.document.model.DocumentFrontListProvider(category,request)%>" tableId="doclist">
     <table width="100%" align="center" border="0" cellspacing="0" cellpadding="0" class="lh27 list_bline1">
      <paging:pageRow id="doc" type="com.css.cms.document.Document"> 
	      <tr>
	        <td width="19" align="center"><img src="/pic/msindex/list_03.gif"/></td>
	        
	        <td><a href="${contextPath }/commons/newsContent.jsp?docId=<%=doc.getId()%>" target=\"_blank\"><%=DocumentHelper.getTitle(doc ,50)%></a></td>
	        <td><%=DocumentHelper.getUploadDate(doc ,"yyyy-MM-dd")%></td>	     
	       </tr>
      </paging:pageRow>
    
    </table>
     <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" align="right"><paging:pageInfo empty="没有记录"/>&nbsp;&nbsp;<paging:pageLink pages="8" mode="text" hasGo="false"/></td>
      </tr>
    </table>
    </paging:page>
<div class="blank10"></div>
  </div>
  <!--中侧sied结束--> 
    <!--右侧sied开始-->
  <jsp:include page="/investorNexus/include_right.jsp" />
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>