<%@ page contentType="text/html; charset=utf-8" language="java" %>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<jsp:directive.page import="java.util.*"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证劵_社会公益基金</title>
<link href="${contextPath }/gyjj/css/community.css" rel="stylesheet" type="text/css" />
<script src="${contextPath }/gyjj/js/swfobject_source.js" type=text/javascript></script>
</head>
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
<jsp:include page="/gyjj/index_top.jsp?nav=jjjx" />
<!-- header end -->
<div id="subbanner"><img src="${contextPath }/gyjj/images/subBanner.jpg" /></div>
<div class="subMainconter">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layout">
  <tr>
    <th valign="top" class="wrapleft">
    <div class="navLeft">
      <h3><img src="${contextPath }/gyjj/images/title_jsjz.jpg" /></h3>
      <ul class="navleftList">
      <li class="this"><a href="${contextPath }/gyjj/system.jsp">如何捐赠</a></li>
      <li><a href="${contextPath }/donateAction.do?method=frontlist">捐赠名单</a></li>
    </ul>
    </div>
    </th>
    <td valign="top" class="wrapright">
      <div class="columnOut">
      <div class="columnTitle"><h3>如何捐赠</h3><span><b>首页</b>><b>接受捐赠  </b>><strong>如何捐赠</strong></span></div>
      <div class="columnMain system"> 
          <h3>广东省广发证券社会公益基金会捐赠管理办法</h3>
        <p><strong>第一条</strong> 广东省广发证券社会公益基金会（以下简称“本会”）是由广发证券股份有限公司、广发基金管理有限公司、广发期货有限公司、广发信德投资管理有限公司出资发起成立的非营利性基金会，本会欢迎海内外企业、事业单位、团体、个人向本会捐资。</p>
        <p><strong>第二条</strong> 捐赠单位或个人的捐赠方式以捐款为主，本会开具专门捐赠票据予捐赠方。</p>
        <p><strong>第三条</strong> 本会获赠资金根据规定纳入本会财务管理，依照本会章程宗旨和公益活动的业务范围使用，重点用于扶贫、济困、赈灾、助残等救助；助教助学；推动环境保护事业；以及其他社会公益项目。</p>
        <p><strong>第四条</strong> 捐赠人或单位可依据本会章程与本会签订书面协议，协议内容包括捐赠人或单位的捐赠金额、捐赠意向以及本会的承诺等。 </p>
        <p><strong>第五条</strong> 捐赠自愿，不分多少，个人捐赠100元为起点，团体捐赠1000元为起点。</p>
        <p><strong>第六条</strong> 本会向所有捐款单位和个人鸣谢，鸣谢方式如下： </p>
        <p>1. 捐资在一千万元（含一千万元）以上的单位或个人，本会颁发证书及锦旗，通过新闻媒介报道消息。</p>
        <p>2. 捐资在一百万元（含一百万元）以上的单位或个人，本会颁发证书及锦旗，视其意愿通过新闻媒介报道消息。 </p>
        <p>3. 捐资在十万元以上的单位或个人，颁发证书，视其意愿通过新闻媒介报道消息。</p>
        <p>4. 捐资在一万元以上者，颁发证书。</p>
        <p>5. 当年全部捐资者的姓名及捐赠金额，视捐资者意愿在本会网站上公告，并整理成捐资名册存档保存。</p>
        <p><strong>第七条</strong> 捐赠人有权向本会查询捐赠财产的使用、管理情况，并提出意见和建议。对于捐赠人的查询，基金会将如实答复。</p>
        <p><strong>第八条</strong> 本制度由本会负责解释与修订。本制度自登记管理机关批准本会成立日起施行。</p>
          
      </div>
      <div class="columnButtom"><img src="${contextPath }/gyjj/images/columnButtom.jpg" /></div>
    </div>
    </td>
    </tr>
</table>
</div>
<div class="clear"></div>
<jsp:include page="/gyjj/index_bottom.jsp" />
</body>
</html>
