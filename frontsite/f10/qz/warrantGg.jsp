<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />

</head>

<body class="body_bg">
<div class="main">
  <div class="ggxx">

<table class="tab_cwzb">
  <tr>
    <th class="bcolor"><ul>
      <li class="cwzb_qh" id="tagtabs01" onmouseover="SwitchNews('tabs0', 1, 4,'cwzb_qh','')">公告</li>
      <li id="tagtabs02" onmouseover="SwitchNews('tabs0', 2, 4,'cwzb_qh','')">新闻</li>
      <li id="tagtabs03" onmouseover="SwitchNews('tabs0', 3, 4,'cwzb_qh','')">研究报告</li>
      <li id="tagtabs04" onmouseover="SwitchNews('tabs0', 4, 4,'cwzb_qh','')">权证到期提醒</li>
    </ul></th>
  </tr>
  <tr>
    <td height="2"></td>
  </tr>
  <tr>
    <td class="nbord">
    <table width="100%" border="0" class="lh25 textleft font_st" id="tabs01" style="display:">
      <c:forEach var="companyNotify" items="${companyNotifyList}">
		<tr>
			<td width="89%"><span class="font_a8">·</span>
				<a
					href="/cms/newsContentGazx.jsp?tableName=${companyNotifyTable}&guid=${companyNotify.guid}"
					title='${companyNotify.title}' target="_blank">${companyNotify.title}</a>
			</td>
			<td width="11%" class="font_73">
				<fmt:formatDate value="${companyNotify.publishDate}" pattern="yyyy-MM-dd" />
			</td>
		</tr>
	</c:forEach>
    </table>
      <table width="100%" border="0" class="lh25 textleft font_st" id="tabs02" style="display:none">
		<c:forEach var="companyNews" items="${companyNewList}">
			<tr>
				<td width="89%"><span class="font_a8">·</span>
					<a
						href="/cms/newsContentGazx.jsp?tableName=${companyNewsTable}&guid=${companyNews.guid}"
						title='${companyNews.title}' target="_blank">${companyNews.title}</a>
				</td>
				<td class="font_73">
					<fmt:formatDate value="${companyNews.publishDate}"
						pattern="yyyy-MM-dd" />
				</td>
			</tr>
		</c:forEach>
      </table>
      <table width="100%" border="0" class="lh25 textleft font_st" id="tabs03" style="display:none">
		<c:forEach var="companyNews" items="${companyReportsList}">
			<tr>
				<td width="89%"><span class="font_a8">·</span>
					<a
						href="/cms/newsContentGazx.jsp?tableName=${companyReportsTable}&guid=${companyNews.guid}"
						title='${companyNews.title}' target="_blank">${companyNews.title}</a>
				</td>
				<td class="font_73">
					<fmt:formatDate value="${companyNews.publishDate}"
						pattern="yyyy-MM-dd" />
				</td>
			</tr>
		</c:forEach>
      </table>
      <table width="100%"  border="1" class="lh24 center" bordercolor="#cccccc" id="tabs04" style="display:none">
		  <tr bgcolor="#f7f7f7">
			<td width="25%">权证代码</td>
			<td width="25%">权证简称</td>
			<td width="25%">权证类别</td>
			<td width="25%">权证存续终止日</td>
		  </tr>
		<c:forEach var="qzdqtx" items="${companyWarnList}">
			<tr>
				<td width="25%">${qzdqtx.qzdm}</td>
				<td width="25%">${qzdqtx.qzjc}</td>
				<td width="25%">${qzdqtx.qzlb}</td>
				<td class="font_73">
					<fmt:formatDate value="${qzdqtx.qzcxzzr}"
						pattern="yyyy-MM-dd" />
				</td>
			</tr>
		</c:forEach>
      </table></td>
  </tr>
</table>
  </div> 
</div>
<script src="/js/setTab.js"></script>
</body>
</html>