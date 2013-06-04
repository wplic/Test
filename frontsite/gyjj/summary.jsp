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
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	if(request.getParameter("nav1")!=null&&!request.getParameter("nav1").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav1"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}
	if(request.getParameter("nav")!=null&&!request.getParameter("nav").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}
%>
<body>
<!-- header begin -->
<jsp:include page="/gyjj/index_top.jsp?nav=jjgjj" />
<!-- header end -->
<div id="subbanner"><img src="${contextPath }/gyjj/images/subBanner.jpg" /></div>
<div class="subMainconter">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layout">
  <tr>
    <th valign="top" class="wrapleft">
    <div class="navLeft">
      <h3><img src="${contextPath }/gyjj/images/title_jjjj.jpg" /></h3>
      <ul class="navleftList">
      <li><a href="regulation.jsp">基金会章程</a></li>
      <li><a href="institutionList.jsp">管理制度</a></li>
      <li><a href="agencies.jsp">机构设置</a></li>
      <li><a href="gyjjdis.jsp">基金会大事记</a></li>
    </ul>
    </div>
    </th>
    <td valign="top" class="wrapright">
      <div class="columnOut">
      <div class="columnTitle">
        <h3>基金会简介</h3>
        <span><b>首页</b>><strong>基金会简介</strong></span></div>
      <div class="columnMain summary">
        <p>广东省广发证券社会公益基金会是由广发证券股份有限公司、广发基金管理有限公司、广发期货有限公司和广发信德投资管理有限公司共同发起设立的非公募公益型慈善基金会，于2011年1月21日获广东省民政厅批复正式成立。基金会注册地为广东省广州市天河北路183号大都会广场41楼，原始基金数额为人民币 4300万元，其中广发证券股份有限公司捐赠3000万元，广发基金管理有限公司捐赠1000万元，广发期货有限公司捐赠200万元，广发信德投资管理有限公司捐赠100万元。基金会的登记管理机关是广东省民政厅，业务主管单位是广东省人民政府相关职能部门。基金会的宗旨是“发扬广发爱心，关注民生，热心公益，扶贫济困，助学兴教，保护环境，推动构建和谐社会，促进可持续发展”，业务范围包括：接受境内外社团、企事业单位及个人的捐赠；根据国家有关法律法规和本章程，选择基金管理人对本基金会资产实施合法、安全、高效的管理运作，实现资金的保值增值；资助符合本基金宗旨的各类教育及其他扶贫助弱项目。</p> 
        <p>广东省广发证券社会公益基金会根据国务院颁布实施的《基金会管理条例》制定了《基金会章程》，设立了理事会作为日常管理机构。基金会理事会由孙树明、王志伟、肖成、肖雪生、程怀远等五人组成，其中广发证券股份有限公司党委书记孙树明同志担任基金会理事长（法定代表人）。</p>
        <p>广东省广发证券社会公益基金会将按照合法、安全、有效的原则，进一步完善基金会运作方案，同时总结、借鉴其他基金会的好经验，不断推动公益事业的发展，努力为建设和谐型社会作出贡献。</p>
      </div>
      <div class="columnButtom"><img src="${contextPath }/gyjj/images/columnButtom.jpg" /></div>
    </div>
    </td>
    </tr>
</table>
</div>
<div id="footer">
  <div class="foot">
    <div class="textLeft">
      <p><a href="#">联系我们</a>|<a href="#">分支机构</a>|<a href="#">版权信息</a></p>
      <p>本站所提供的信息仅供参考，股市有风险，入市需谨慎</p>
    </div>
    <div class="textRight">
      <p>[ICP 备案登记证编号：粤ICP备11070729号] 　广发证券股份有限公司版权所有</p>
      <p>Copyright © 2000-2007 All Rights Reserved.</p>
    </div>
  </div>
</div>
</body>
</html>
