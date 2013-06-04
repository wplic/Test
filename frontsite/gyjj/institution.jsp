<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证劵_社会公益基金</title>
<link href="${contextPath }/gyjj/css/community.css" rel="stylesheet" type="text/css" />
<link href="community.css" rel="stylesheet" type="text/css" />
<script src="${contextPath }/gyjj/js/swfobject_source.js" type=text/javascript></script>
<script src="${contextPath }/js/jquery.js" type=text/javascript></script>
<script>
function Intitution(id,order, title, content){
	this.id = id;
	this.order = order;
	this.title = title;
	this.content = content; 
}

var institutions;

/*
function show(id){
	$.each(institutions,function(i,n){
		if(id == n.id){
			$('#ins_title').html(n.title);
			$('#ins_content').html(n.content);
			return false;
		}
	});
}
*/
$(function(){
	$("#ins_menu").click(function(){
		/*
		var tem = $("#titles").css("display");
		if(tem == 'none'){
			tem = 'block';
		} else 
			tem = 'none';
		$("#titles").css("display",tem);
		*/
	});
	$.getJSON("/institution.do?method=showInstitution",null,
	          function(json){
					institutions = json.insList;
					var html = '';
					$.each(institutions,function(i,n){
						html += '<li><img src="${contextPath }/gyjj/images/newsList_ico.jpg" /> &nbsp; <a href="/institution.do?method=showInstitutionContext&iid='+n.id+' " target="view_window" >' + n.title + '</a></li>';
					});
					//$("#titles").html(html);
					$("#ins_title").html(html);
					//alert(html);
	          });
})
</script>
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
         <li class="this"><a href="javascript:void(0)" id="ins_menu">管理制度</a><%-- 
         <ul id="titles" style="display:none;">
         </ul>
         --%></li>
         <li><a href="agencies.jsp">机构设置</a></li>
         <li><a href="gyjjdis.jsp">基金会大事记</a></li>
    </ul>
    </div>
    </th>
    <td valign="top" class="wrapright">
      <div class="columnOut">
      <div class="columnTitle"><h3>管理制度</h3><span><b>首页</b>><b>基金会简介</b>><strong>管理制度</strong></span></div>
      <div class="columnMain system" >
      <!-- 显示制度讯息 -->
      	
      	<ul id="ins_title" class="newsList subnewsList">
         </ul>
      	<%--<p id="ins_content"></p>--%>
      	
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
