<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<jsp:directive.page import="com.css.cms.document.model.DocumentFrontListProvider"/>
<%@ include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="com.css.cms.document.model.DocumentSqlListProvider"/>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="com.css.cms.document.DocumentManager"/>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%@page import="com.css.cms.category.*"%>
<head>
<%
CategoryTree catTree= null;
if(request.getParameter("siteName")!=null){
		catTree = CategoryFactory.getCategoryTree(request.getParameter("siteName"));
	}else{
		catTree = CategoryFactory.getCategoryTree(DocumentManager.getCmsRootName());
		
	}
String whichCat="zxzx_ztqj";
SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
if(request.getParameter("whichCat")!=null&&!request.getParameter("whichCat").equals(""))
{
whichCat=request.getParameter("whichCat");
		if(sqlInjectValidate.validateSql(whichCat))
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
}
String ctx = request.getContextPath();
	String target = ctx + "/cms/newsContent.jsp";
	int rowNum = 20;
	String sql = "select * from cms_doc_single_attr t where t.subtitle = (select subtitle from cms_doc_single_attr r where r.doc_id="
			+ whichCat
			+ " ) and t.is_delete=0 and t.state=1   order by t.upload_date desc";
boolean flag = true;
String nav2=whichCat;
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>

<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=zxzx&nav1=xw" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 资讯中心 > 新闻</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="/infoCenter/info_lmenu.jsp">
           <jsp:param name="nav2" value="zxzx_ztqj"/>
    	</jsp:include>
<jsp:include page="/infoCenter/Search.jsp"/>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
    <div class="left_tit2">专题聚焦</div>
    <div class="blank5"></div>

<paging:page count="false" row="<%=rowNum%>" provider="<%=new DocumentSqlListProvider(sql)%>">
<table width="95%" align="center" class="lh28 font_st list_bline1">
							<paging:pageRow id="doc" type="com.css.cms.document.Document">
								<%
								if(flag){ 
									flag = false;
								%>
								<div class="right_tit2 blue"><span class="bold">
	                                 <%=doc.getAttrValue("subtitle") %>
								</span></div>
								<div class="blank5"></div>
								<%} %>
								
										<tr>
										
												<td width="85%" height="30">
														<a href="<%=target%>?docId=<%=doc.getId()%>" target="_blank">
												<%=DocumentHelper.getTitle(doc,88)%> </a>
										</td>
										<td width="15%" height="20">
											<%=DocumentHelper.getUploadDate(doc, "yyyy-MM-dd")%>
										</td>
									</tr>
							
							</paging:pageRow>
                             </table>


							<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
         	 <td height="10">
         	 </td>
         	</tr>
								<tr>
									<td width="60%" align="right">
										<paging:pageInfo empty="没有记录" />
									</td>
									<td width="40%" align="center">
										<paging:pageLink baseURL="/infoCenter/newsTopicObject.jsp" hasGo="false" />
									</td>
								</tr>
							</table>
						</paging:page>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
</div>
  <div class="clearfloat"></div><!--清除浮动--> 
<jsp:include page="/share/bottom.jsp" />
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 

</body>
</html>