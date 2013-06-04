<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<jsp:directive.page import="com.css.cms.document.model.DocumentFrontListProvider"/>
<%request.setCharacterEncoding("UTF-8");%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/plugins/paging/css-paging.tld" prefix="paging"%>
<%
  String showSize = request.getParameter("showSize");
  String catName = "";
  if (request.getParameter("catName") != null && !"".equals(request.getParameter("catName")))
  {
  	catName = request.getParameter("catName");
  }
  DocumentFrontListProvider documentProvider = new DocumentFrontListProvider(request);
  int i=0;
%>

							<div class="subMhd">
								<ul class="tab-menu">
									<li class="hover"><a href="${contextPath }/about/companyNews.jsp">广发动态</a></li>
								</ul> <!-- tab-menu -->
								<a href="${contextPath }/about/companyNews.jsp" class="more">更多</a>
							</div>
							
							<div class="subMbd">
								<div class="tab-cont">
									<div class="cont hover">
										 <!-- post -->
										<table width="95%" align="center" border="0" cellspacing="0" cellpadding="0" class=" mt10 lh23">
										<paging:page count="false" row="<%=showSize==null?1:Integer.parseInt(showSize) %>" provider="<%= documentProvider%>">
											<paging:pageRow id="doc" type="com.css.cms.document.Document"> 
											 <%
											 	String title = DocumentHelper.getTitle(doc);
												title = title.replaceAll("\\</?(?!(input)|(img)).*?\\>","");
												 String baseBrief ="";
  												if(doc.getAttribute("base_brief")!=null&&!doc.getAttribute("base_brief").equals("null")&&!doc.getAttribute("base_brief").equals("")){
		   										
		   										 baseBrief =  String.valueOf(doc.getAttribute("base_brief"));
		   										 if(baseBrief.length() >= 80){
		   										 baseBrief =  String.valueOf(doc.getAttribute("base_brief")).substring(0,80);
		   										 }
												}
												if(i == 0){%>
												<tr><td colspan="3">
												<ul class="post">
											<li>
											 <jsp:include page="/ad/ad_news_pc.jsp">
										       <jsp:param name="widths" value="90"/>
											   <jsp:param name="heights" value="120"/>
										       <jsp:param name="subAdCode" value="ad_news_"/>
											 </jsp:include>
												<h4><a title="<%= title %>" href="${contextPath }/commons/infoList.jsp?docId=<%= doc.getId()%>"   target=\"_blank\">
										            <%= DocumentHelper.getTitle(doc ,36)%> </a> </h4>
												<p><%=baseBrief%><span class="red"><a title="<%= title %>" href="${contextPath }/commons/infoList.jsp?docId=<%= doc.getId()%>" target=\"_blank\">[查看详细]</a></span></p>
											</li>
										</ul></td></tr>
												<%
												i=1;
												}else{
												
											 	%>
											 
											 			<tr>
										            <td width="20" align="center"><img src="${contextPath }/pic/msindex/list_02.gif"/></td>
										            <td width="75%">
										            <a title="<%= title %>" href="${contextPath }/commons/infoList.jsp?docId=<%= doc.getId()%>"   target=\"_blank\">
										            <%= DocumentHelper.getTitle(doc ,50)%> </a> 
										            
										            </td>
										            <td align="right"><%= DocumentHelper.getUploadDate(doc ,"yyyy-MM-dd")%> </td>
										         </tr>
											 	<%
												}
											  %>
											
									        </paging:pageRow>
										</paging:page> 
									  </table>

									</div><!-- cont -->
								</div> <!-- tab-cont -->
							</div>