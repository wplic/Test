<%@ page contentType="text/html; charset=utf-8" language="java" %>
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
<link href="${contextPath }/gyjj/css/community.css" rel="stylesheet" type="text/css" />
<%
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
	  item=item;
	 }else{
	 item=(((Item)itemList.get(0)).getItemId()).toString();
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
	
%>
    <div class="navLeft">
      <h3><img src="${contextPath }/gyjj/images/title_gysm.jpg" /></h3>
      <ul class="navleftList">
       <%
       if (itemList != null) {
		for (Iterator it = itemList.iterator(); it.hasNext();) {
		Item itemOb = (Item) it.next();
        %>
	      <li <%=item.equals(String.valueOf(itemOb.getItemId()))?"class='this'":"" %>><a href="${contextPath }/gyjj/project.jsp?item=<%=itemOb.getItemId() %>"><%=itemOb.getItemName() %></a></li>
      <%}} %>
    </ul>
    </div>
 