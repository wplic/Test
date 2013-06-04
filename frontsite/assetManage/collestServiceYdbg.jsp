<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@page import="com.css.cms.document.*"%>
<%@page import="com.css.cms.document.dql.*"%>
<%@page import="com.css.cms.document.util.*"%>
<%@page import="java.util.*"%>
<%@ include file="/commons/taglibs.jsp"%>
<%
	String column="cpzx_jhlc_ydbg";
	if(request.getParameter("whichCat")!=null)
		column=request.getParameter("whichCat");
	String StartDate=request.getParameter("StartDate");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
<!--
function checkSearch(){
	var year = document.qForm.year.value;
	var month = document.qForm.month.value;
	document.qForm.StartDate.value = year+"-"+month+"-01";
	document.qForm.EndDate.value = year+"-"+month+"-32";
	document.qForm.submit();
}
//-->
</script>
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 客户服务 - 月度报告</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 <jsp:include page="${contextPath}/assetManage/collectService_lmenu.jsp" />
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w706 fright">
  <div class="comtit1"><h4>月度报告</h4>
  </div>
  <div class="blank10"></div>
  <div class="khfwtit1"><span class="font14">查询月度报告 </span> </div>
  <div class="blank10"></div>
  <div class="khfwcx">
    <a href="#"></a>
	<form name="qForm" action="/assetManage/collestServiceYdbg.jsp?menu=jhlcydbg&whichCat=cpzx_jhlc_ydbg" method="post">
	<input type="hidden" name="StartDate" value="">
	<input type="hidden" name="EndDate" value="">
    <table width="90%" align="center" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="60">报告月度：</td>
        <td width="120">
            <select name="year">
				<%java.util.Date date = new java.util.Date();
				int year = 1900+date.getYear();
				for(int i=0;i<=5;i++){%>
				<option value="<%=year-i%>"><%=year-i%></option>
				<%}%>
			</select> 
            <select name="month">
				<%
				int month = 1+date.getMonth();
				for(int i=1;i<=12;i++){
					String monthstr = i+"";
					if(i<10)
						monthstr = "0" + i+"";%>
				<option value="<%=monthstr%>" <%=i==month?"selected":""%>><%=monthstr%></option>
				<%}%>
			</select>
		</td>
        <td width="80"><a href="#" onclick="checkSearch()"><img src="/pic/assetManage/butCx.jpg"/></a></td>
        <td>&nbsp;</td>
      </tr>
    </table>
	</form>
  </div>
  <div class="blank10"></div>
  <%if(null!=StartDate){%>
  <paging:page count="false" row="100" provider="<%= new com.css.cms.document.model.DocumentFrontListProvider(column,request)%>" tableId="doclist">
	  <table id="doclist" width="95%" align="center" class="lh28 font_st list_bline1">
	  <paging:pageRow id="doc" type="com.css.cms.document.Document">
	  <tr align="center">    
		<td width="70%" align="left"><a href="${ctx}/commons/infoList.jsp?docId=<%=doc.getId()%>" target="_blank" title="<%= DocumentHelper.getTitle(doc)%>"><%= DocumentHelper.getTitle(doc ,70)%></a></td>
		<td width="30%" align="right"><%= DocumentHelper.getUploadDate(doc ,"yyyy-MM-dd")%></td>
	  </tr>
	  </paging:pageRow>
		</table>
	</paging:page>
	<%}%>
  </div>
  <!--中侧sied结束--> 
    <!--右侧sied开始-->
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 
</body>
</html>