<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.admanger.service.AdMangerService"/>
<jsp:directive.page import="com.cssweb.admanger.pojo.AdManger"/>
<jsp:directive.page import="com.css.system.Configuration" />
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
 	String hangqingUrl = Configuration.getProperty("hangqingDefaultUrl");
 	String gfymhq = Configuration.getProperty("gfymhq"); 
	String gfymjy = Configuration.getProperty("gfymjy");
    String yykf= Configuration.getProperty("yykf");
%>
<div class="mhd">
						<h3>体验中心</h3>
				    </div><!-- mhd -->
				
				    <div class="mbd">
						<div class="extraMenu extraMenu1">
							<p>
								<a href="${contextPath }/bussinesshall/softDownload.html">·软件下载</a>
								<a href="#" onclick="javascript:window.open('<%=gfymhq %>');">·高速行情</a>
							</p>
							<p>
								<a href="#" onclick="javascript:window.open('<%=yykf %>')">·预约开户</a>
								<a href="#" onclick="javascript:window.open('<%=gfymjy %>');">·页面交易</a>							
							</p>
							<p>
								<a href="${contextPath }/infoCenter/fundGfrgjjylb.html">·认购基金</a>
								<a href="${contextPath }/infoCenter/fundGfsgjjylb.html">·申购基金</a>							
							</p>
						</div>

						<div class="extraMenu extraMenu2">
							<p>
								<a href="${contextPath }/bussinesshall/iptv/iptv.html">·财富频道</a>
								<a href="${contextPath }/front/finance.do?method=selectAllFinanceQuestion&category=1&webuser_id=1&is_answer=1">·业务咨询</a>
							</p>
							<p>
								<a href="${contextPath }/front/finance.do?method=selectAllFinanceQuestion&category=2&webuser_id=1&is_answer=1">·投资咨询</a>
								<a href="${contextPath }/front/finance.do?method=selectAllFinanceQuestion&category=3&webuser_id=1&is_answer=1">·技术咨询</a>
							</p>
						</div>

						<div class="extraMenu extraMenu3">
							<p>
								<a href="${contextPath }/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount">·投资资讯</a>
								<a href="${contextPath }/stockResearch/resrarchReport.html">·研究资讯</a>
							</p>
							<p>
								<a href="${contextPath }/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount">·博览财经</a>
								<a href="${contextPath }/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount">·基金资讯</a>
							</p>
						</div>
				    </div>
