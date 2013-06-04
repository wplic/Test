<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<jsp:directive.page import="com.css.cms.document.model.DocumentFrontListProvider"/>
<%@ include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="com.css.cms.document.model.DocumentSqlListProvider"/>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="com.css.cms.document.DocumentManager"/>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<%@page import="com.css.cms.category.*"%>
<head>
<script type="text/javascript">
	function changeMore(vztzmc){
	        var url="${contextPath }/infoCenter/newsTopicObject.jsp?whichCat="+encodeURIComponent(vztzmc);
			window.location.href=url;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>
<%
String bt="专题聚焦";
CategoryTree catTree= null;
if(request.getParameter("siteName")!=null){
		catTree = CategoryFactory.getCategoryTree(request.getParameter("siteName"));
	}else{
		catTree = CategoryFactory.getCategoryTree(DocumentManager.getCmsRootName());
		
	}
String whichCat="zxzx_ztqj";
if(request.getParameter("whichCat")!=null&&!request.getParameter("whichCat").equals(""))
{
whichCat=request.getParameter("whichCat");
	CategoryNode catNode = catTree.getCategoryNode(whichCat);
	
	if(catNode!=null)
	bt=catNode.getDisplayName();
}

String nav2=whichCat;
%>
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=zxzx&nav1=xw" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：首页 > 资讯中心 > 新闻</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="/infoCenter/info_lmenu.jsp">
           <jsp:param name="nav2" value="<%=nav2%>"/>
    	</jsp:include>
 <jsp:include page="/infoCenter/Search.jsp"/>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
    <div class="left_tit2"><%=bt %></div>
    <div class="blank5"></div>
<%	
	String cat = "zxzx_ztqj";
	String sql = "select * from (select * from cms_doc_single_attr t where t.doc_id in(select p.doc_id from cms_doc_category_map p where p.cat_id = (select o.cat_id from cms_category_basic_info o where o.cat_name='zxzx_ztqj')) and t.is_delete=0 and t.state=1 and t.subtitle is not null order by t.upload_date desc) e1 where rowid = (select min(rowid) from (select * from cms_doc_single_attr t where t.doc_id in(select p.doc_id from cms_doc_category_map p where p.cat_id = (select o.cat_id from cms_category_basic_info o where o.cat_name='zxzx_ztqj')) and t.is_delete=0 and t.state=1 and t.subtitle is not null order by t.upload_date desc) e2 where e1.subtitle=e2.subtitle)";

	String ctx = request.getContextPath();
	int rowNum = 2;
	int subjectNumCount = 1;
	String target = ctx + "/cms/newsContent.jsp";
%>
<paging:page count="false" row="2"
	provider="<%=new DocumentFrontListProvider(cat, request)%>">

	<paging:pageRow id="doc2" type="com.css.cms.document.Document">
	
	</paging:pageRow>

</paging:page>

<paging:page count="false" row="<%=rowNum%>" provider="<%=new DocumentSqlListProvider(sql)%>">
	<paging:pageRow id="doc" type="com.css.cms.document.Document">

<div class="ywzs_box mt10">
    	<h2><span><%= DocumentHelper.getUploadDate(doc ,"yyyy-MM-dd")%></span>
    	<%
     			String subTitle = (String) DocumentHelper.getAttrValue(doc, "subtitle","");
				String subTitle2 = StringUtils.subString(subTitle,22,"");
             %>
    	<a href="javascript:changeMore('<%=doc.getId()%>');">
    	<%out.print(subTitle2);%></a></h2>
        <p>
        
		<%= DocumentHelper.getContent(doc ,280)%>
       </p>
      <div class="blank10"></div>
      <table width="90%" align="center" class="blue2">
       
       <%String sql2 = "select * from cms_doc_single_attr t where t.subtitle ='"+subTitle.trim()+"' and t.is_delete=0 and t.state=1   order by t.upload_date desc";
        int j=0;
        %>
								<paging:page count="false" row="<%=rowNum+2%>"
									provider="<%=new DocumentSqlListProvider(sql2)%>">

									<paging:pageRow id="doc2" type="com.css.cms.document.Document">
							<%if(j==0||j==2) out.println("<tr>");%>		
                     <%
						String docTitle = DocumentHelper.getTitle(doc2) ;
						docTitle = StringUtils.subString(docTitle,26,"...");
						docTitle = "<a href=\""+request.getContextPath()+"/cms/newsContent.jsp?docId="+doc2.getId()+"\" title='"+docTitle.replaceAll("\\<.*?\\>","")+"' target=\"_blank\">"+docTitle+"</a>" ;
						out.println("<td class='li_list2 font13'>"+docTitle+"</td>");
					%>
                         <%if(j==1||j==3) out.println("</tr>"); j++;%>	
          	</paging:pageRow>

		</paging:page>
		
      </table>
           <div class="blank10"></div>
</div> 
      	</paging:pageRow>
</paging:page>
      
<div class="blank10"></div>
<div class="rinfo_tit2"><span class="red"><a href="${contextPath }/infoCenter/newsTopicMore.jsp">更多>></a></span>更多专题聚焦</div>
<div class="blank10"></div>
<table width="95%" align="center" class="lh28 font_st list_bline1">
<paging:page count="false" row="<%=rowNum+6%>" provider="<%=new DocumentSqlListProvider(sql)%>">
	<paging:pageRow id="doc" type="com.css.cms.document.Document">
 <tr>
             <%
     			String subTitle = (String) DocumentHelper.getAttrValue(doc, "subtitle","");
				String subTitle2 = StringUtils.subString(subTitle,22,"");
             %>
    <td width="524"><a href="javascript:changeMore('<%=doc.getId()%>');">
    	<%out.print(subTitle2);%></a></td>
    <td width="67"><%= DocumentHelper.getUploadDate(doc ,"yyyy-MM-dd")%></td>
  </tr>
      	</paging:pageRow>
</paging:page>
</table>
 <div class="clearfloat"></div><!--清除浮动--> 
  </div>
  </div>
  <!--右侧sied结束--> 
   <div class="clearfloat"></div><!--清除浮动--> 
<jsp:include page="/share/bottom.jsp" />
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 

</body>
</html>