<%@ page contentType="text/html; charset=utf-8" language="java" %>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<jsp:directive.page import="java.util.*"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="com.cssweb.item.service.ItemService" />
<jsp:directive.page import="com.cssweb.item.pojo.Item" />
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/>
<%@ include file="/commons/taglibs.jsp"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证劵_社会公益基金</title>
<link href="${contextPath }/gyjj/css/community.css" rel="stylesheet" type="text/css" />
<script src="${contextPath }/gyjj/js/swfobject_source.js" type=text/javascript></script>
<script src="${contextPath }/js/jquery-1.4.4.min.js" type=text/javascript></script>
</head>
<%
  String itemName="";
  String item = request.getParameter("item");
  ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	ItemService itemService = (ItemService) ctx.getBean("itemService");
	Map map1 = new HashMap();
	map1.put("sortName","itemId");
	map1.put("dir","asc");
	map1.put("itemState",0);
	List itemList = itemService.getItemList(map1, 0,100);
	if(itemList!=null&&itemList.size()>0)
	{
	 if(item!=null&&!item.equals("")&&!item.equals("null"))
	 {
		 for (Iterator it = itemList.iterator(); it.hasNext();) {
		  Item itemOb = (Item) it.next();
		  if(item.equals(String.valueOf(itemOb.getItemId()))){
		  itemName=itemOb.getItemName();
		  break;
		  }
		 }
	 }else{
	 item=(((Item)itemList.get(0)).getItemId()).toString();
	 itemName=((Item)itemList.get(0)).getItemName();
	 }
	}
	
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
if(request.getParameter("item")!=null&&!request.getParameter("item").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("item"),6)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}
  if(request.getParameter("item")!=null&&!request.getParameter("item").equals("")){
				if(sqlInjectValidate.vakidateSqlIfIngter(request.getParameter("item"))){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}
%>
<body>
<script>
//<!--
function setTab(name,cursel,n){
 for(var i=1;i<=n;i++){
  var menu=document.getElementById(name+i);
  var con=document.getElementById("con_"+name+"_"+i);
  menu.className=i==cursel?"this":"";
  con.style.display=i==cursel?"block":"none";
 }
}

$(function(){
	
	$.getJSON('/itemDocAction.do?method=showDownloadDocList&itemid=<%=item%>&catname=gyxm_zlxz',null,
			/*
	        function(json){
				var html  = '';
				$.each(json.docList,function(i,n){
					html += '<li>'+n.title;
					if(typeof(n.sub) != 'undefined' && n.sub.length > 0){
						html += '(<b>附件</b>:';
						for(var j = 0; j<n.sub.length; j++){
							html += '<a href="/cms/showDocumentFile.jsp?id='+n.sub[j].docId+'">'+
									n.sub[j].title+'</a>';
							//html += '<a href="/commons/infoList.jsp?docId='+n.sub[j].docId+'">'+
									//n.sub[j].title+'</a>';
						}
						html += ')';
					}
					html += "</li>";
				});
				$('#docList').html(html);
			}
			*/
	
			function(json){
				var html  = '';
				$.each(json.docList,function(i,n){
					html += '<li><a target="view_window"  href="/gyjj/downloadInfoShow.jsp?docId='+n.docId+'">'+n.title+'</a>';
					
					html += "</li>";
				});
				$('#docList').html(html);
			}
	);
});
//-->
</script>
<jsp:include page="/gyjj/index_top.jsp?nav=gyxm" />
<!-- header end -->
<div id="subbanner"><img src="${contextPath }/gyjj/images/subBanner.jpg" /></div>
<div class="subMainconter">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layout">
  <tr>
    <th valign="top" class="wrapleft">
    <jsp:include page="/gyjj/project_lmenu.jsp" />
    </th>
    <td valign="top" class="wrapright">
      <div class="columnOut">
      <div class="columnTitle"><h3><%=itemName %></h3>
      <span><b>首页</b>><b>公益项目 </b>><strong><%=itemName %></strong></span></div>
      <div class="columnMain summary">
         <ul class="tabMenu">
           <li class="this" id="term1" onMouseOver="setTab('term',1,5)">项目介绍</li>
           <li id="term2" onMouseOver="setTab('term',2,5)">项目管理</li>
           <li id="term3" onMouseOver="setTab('term',3,5)">项目开展情况</li>
           <li id="term4" onMouseOver="setTab('term',4,5)">相关报道</li>
           <li id="term5" onMouseOver="setTab('term',5,5)">资料下载</li>
         </ul>
         <div class="infoArea" id="con_term_1" style="">
	        <jsp:include  page="/gyjj/project_Con.jsp">
				<jsp:param name="whichCat" value="gyxm_xmjs" />
				<jsp:param name="item" value="<%=item %>" />
			</jsp:include>
         </div>
         <div class="infoArea" id="con_term_2" style="display:none">
          <jsp:include  page="/gyjj/project_Con.jsp">
				<jsp:param name="whichCat" value="gyxm_xmgl" />
				<jsp:param name="item" value="<%=item %>" />
			</jsp:include>
		 </div>
         <div class="infoArea" id="con_term_3" style="display:none">
            <jsp:include  page="/gyjj/project_Con.jsp">
				<jsp:param name="whichCat" value="gyxm_xmkzqk" />
				<jsp:param name="item" value="<%=item %>" />
			</jsp:include>
		 </div>
         <div class="infoArea" id="con_term_4" style="display:none">
           <iframe id="info1" src="${contextPath }/gyjj/project_list.jsp?item=<%=item %>&whichCat=gyxm_xgbd&state=1&is_delete=0&showSize=20" width="720" height="525" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
         </div>
         
         <!-- 资料下载 -->
         <div class="infoArea" id="con_term_5" style="display:none">
            	<%--<ul id="docList" class="newsList subnewsList"></ul> --%>
            	<%--<iframe id="info1" src="${contextPath }/gyjj/project_download_list.jsp?item=<%=item %>&whichCat=gyxm_zlxz&state=1&is_delete=0&showSize=20" width="720" height="525" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
            	--%>
            	<jsp:include page="/gyjj/project_download_list.jsp">
            		<jsp:param value="${item}" name="item_id"/>
            		<jsp:param value="gyxm_zlxz" name="whichCat"/>
            		<jsp:param value="1" name="state"/>
            		<jsp:param value="0" name="is_delete"/>
            		<jsp:param value="20" name="showSize"/>
            	</jsp:include>
		 </div>
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
