<%@page import="java.util.Date"%>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper" />
<jsp:directive.page import="com.cssweb.common.util.StringUtils" />
<jsp:directive.page import="com.css.cms.document.model.DocumentFrontListProvider" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/plugins/paging/css-paging.tld" prefix="paging"%>
<link href="${contextPath }/css/global.css" rel="stylesheet"
	type="text/css" />
<link href="${contextPath }/css/infoCenter/infoCenter.css"
	rel="stylesheet" type="text/css" />
<%
	String catName = "";
	if (request.getParameter("catName") != null
			&& !"".equals(request.getParameter("catName"))) {
		catName = request.getParameter("catName");
	}
	DocumentFrontListProvider documentProvider = new DocumentFrontListProvider(
			request);
	int rowNum = 1;
	String title = "收盘综述";
%>
<paging:page count="false" row="<%=rowNum%>"
	provider="<%= documentProvider%>">
	<paging:pageRow id="doc" type="com.css.cms.document.Document">

<%
							String titlep = DocumentHelper.getTitle(doc);
									if (titlep != null && !titlep.equals("")
											&& titlep.equals("早盘视点"))
										title = titlep;
									else if (titlep != null && !titlep.equals("")
											&& titlep.equals("午间视点"))
										title = titlep;
						%>
						<div class="subMhd">
								<ul class="tab-menu">
									<li class="hover"><a href="#"><%= title %></a></li>
									<li id="szAndsh" class="stockMsg">正在加载......</li>
								</ul> <!-- tab-menu -->
							</div> <!-- subMhd -->
		<div class="subMbd">
			<div class="tab-cont">
				<div class="cont hover">
					
					<!-- date -->

					<div class="pcont">
						
						<table width="95%" border="0" cellspacing="0" cellpadding="0"
							align="center">
							<tr>
								<td valign="top" class="font_43">
									<%
										String detailPagess = "/cms/newsContent.jsp?docId="
														+ doc.getId();
									%>
									<p class="lh21 inden25">
										<%
											String content = DocumentHelper.getContent(doc);
													content = content.replaceAll(
															"\\</?(?!(input)|(img)).*?\\>", "");
													content = "&nbsp;&nbsp;&nbsp;" + content;
													content = StringUtils.subString(content, 180, "......");
													out.println(content);
										%>
										<span class="red"><a href="#"
											onclick="window.open('<%=detailPagess%>','')">[查看详情]</a>
										</span>
										<span class="red "><a href="${contextPath }/infoCenter/gfView.html">[更多……]</a>
										</span>
									</p>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<!-- cont -->
			</div>
			<!-- tab-cont -->
		</div>
	</paging:pageRow>
</paging:page>