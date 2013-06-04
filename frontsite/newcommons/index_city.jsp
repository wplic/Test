<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<%@page import="java.util.List"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.common.dictionary.service.DictionaryService"%>
<%@page import="com.cssweb.common.dictionary.pojo.Dictionary"%>
<%@page import="com.cssweb.systemset.service.BranchManagerService"%>
<%@page import="com.cssweb.systemset.pojo.Branch"%>
<%
ServletContext st = this.getServletConfig().getServletContext();
ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);

BranchManagerService branchManagerService =(BranchManagerService)ctx.getBean("branchManagerService");
%>

<%
	if(branchManagerService!=null){
		//out.println("<script type='text/javascript'> alert('fuck'); </script>");
	}


	List<String> provinces=null;
	List<String> citys=null;
	//获得全部省份
		provinces= branchManagerService.getProvinces();
		
		//如果选中了省份就获得城市
		String province=null;
		if(request.getParameter("provice")!=null&&!"".equals(request.getParameter("provice"))){
			province=request.getParameter("provice");
			citys=branchManagerService.getCitysByProvince(province);
		}
		request.setAttribute("provinces", provinces);
 		request.setAttribute("province",province);
 		request.setAttribute("citys", citys);
%>


	<div class="mhd">
						<h3>营业部网点查询</h3>
				    </div><!-- mhd -->
				
				    <div class="mbd">
	<form action="/index_new.jsp" class="search">
						<select onchange="onselect1(value)">
							<option>请选择省份</option>
							<c:choose>
								<c:when test="${provinces!=null }">
									<c:forEach items="${provinces }" var="pval">
										<c:choose>
											<c:when test="${province==pval }">
												<option selected="selected" value="${pval }">${pval }</option>
											</c:when>
											<c:otherwise>
												<option  value="${pval }">${pval }</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
						</select>

						<select>
							<option>请选择城市</option>
							<c:choose>
								<c:when test="${citys!=null }">
									<c:forEach items="${citys }" var="cval">
										<option  value="${cval }">${cval }</option>
									</c:forEach>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
						</select>
						
						<input type="text" value="请输入关键字" class="txt" />
						<input type="submit" value="搜索" class="btn"/>
						
						</form>
						</div>