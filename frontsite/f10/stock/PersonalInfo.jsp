<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>

<body class="ggjs_bg">
<div class="ggjs_box">
	<div class="ggjs_top">
    	<p><a href="${ctx }/index.jsp"><img src="${ctx }/pic/infoCenter/f10/ggjs_logo.jpg" /></a></p>
    </div>
    <div class="ggjs_line"></div>
    <div class="ggjs_tit"><span class=" mr10 ml10"><img src="${ctx }/pic/infoCenter/f10/ggjs_01.gif"/></span>当前位置：首页 > 个股资料 > 高管简介</div>
    <div class="p15">
      <table border="1" class="lh30 tab_pl5 f10_tab01" bordercolor="#cccccc" width="100%">
			<tr>
				<tr>
          <th width="13%" class="bold">姓名： </th>
           <td width="40%">${people.name }</td>
          <th width="12%" class="bold">英文名： </th>
          <td width="35%">${people.englishName }</td>
			</tr>
			
			
			 <tr>
          <th class="bold">出生日期： </th>
          <td>
          <c:set var="increaseIssueDate">
										<fmt:formatDate value="${people.birthday }"
											pattern="yyyy-MM-dd" />
									</c:set>
					<c:if test='${increaseIssueDate!="1900-01-01"}'>${increaseIssueDate}</c:if>
					&nbsp;
          </td>
          <th class="bold">国家： </th>
          <td>${people.country }  </td>
        </tr>
        <tr>
          <th class="bold">省份： </th>
          <td>${people.province }</td>
          <th class="bold">城市： </th>
          <td>${people.city }</td>
        </tr>
        <tr>
          <th class="bold">邮编： </th>
          <td>${people.zipCode }</td>
          <th class="bold">电话： </th>
          <td>${people.phone }</td>
        </tr>
        <tr>
          <th class="bold">传真： </th>
          <td>${people.fax }</td>
          <th class="bold">电子邮件： </th>
          <td>${people.email }</td>
        </tr>
        <tr>
          <th class="bold">简历： </th>
          <td colspan="3">${people.curriculumVitae }</td>
        </tr>
      </table>
    </div>
</div>
</body>
</html>


