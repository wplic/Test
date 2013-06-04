<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="com.css.cms.document.DocumentManager"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/job/job.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>
</head>
<%
	String category = "rczp_zpgg";
	int index=1;
%>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页 </a> - <a href="${contextPath }/job/index.html">人才招聘</a> - 招聘公告</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/job/job_lmenu.jsp" />
        <div class="blank5"></div>
<iframe target="_blank" id="leftlogin" name="leftlogin"  marginWidth="0" marginHeight="0" src="${contextPath }/job/job_login.jsp"
						frameBorder="0" noresize width="100%"  height="198" scrolling="no" ></iframe>
    <div class="blank5"></div>
<jsp:include page="faq.jsp" />
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
<div class="comtit1"><h4>招聘公告</h4></div>
<div class="clearfloat h15"></div>
<table width="96%" align="center" class="textcenter">
  <tr>
    <td class="ywfw_l_job">&nbsp;</td>
    <td width="35" class="ywfw_m bold">序号</td>
    <td class="ywfw_m bold">标题</td>
    <td width="88" class="ywfw_m bold">时间</td>
    <td width="78" class="ywfw_m bold">作者</td>
    <td class="ywfw_r">&nbsp;</td>
  </tr>
</table>
<paging:page count="false" row="20" provider="<%= new com.css.cms.document.model.DocumentFrontListProvider(category,request)%>" tableId="doclist">
    <table width="94%" align="center" class="lh25 mt10 xuxian_job textcenter">
      <paging:pageRow id="doc" type="com.css.cms.document.Document"> 
      	<%
      		DocumentManager dm=DocumentManager.getDocumentManager();		
			doc=dm.getDocument(doc.getId());
      	 %>
     	<tr>
		    <td width="66"><%=index %>.</td>
		    <td align="left"><a href="${contextPath }/commons/infoList.jsp?docId=<%=doc.getId()%>" target=\"_blank\"><%=DocumentHelper.getTitle(doc ,60)%></a></td>
		    <td width="88" class="font_73"><%= DocumentHelper.getUploadDate(doc ,"yyyy-MM-dd")%></td>
		    <td width="90" class="font_73"><%= DocumentHelper.getAttrValue(doc ,"author" ,"广发证券") %> </td>
		  </tr>
	      <%index++; %>
       </paging:pageRow>
    </table>
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" align="right"><paging:pageInfo empty="没有记录"/>&nbsp;&nbsp;<paging:pageLink pages="8" mode="text" hasGo="false"/></td>
      </tr>
    </table>
</paging:page>
  
<div class="clearfloat"></div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>