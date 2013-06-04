<%@page import="com.css.cms.document.util.DocumentHelper"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:directive.page import="com.css.cms.document.model.DocumentFrontListProvider"/>
<%@ include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="com.css.cms.document.model.DocumentSqlListProvider"/>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="com.css.cms.document.DocumentManager"/>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<%@page import="com.css.cms.category.*"%>
<head>
<script type="text/javascript">
	function changeMoreCjxw(vztzmc){
	        var url="${contextPath }/infoCenter/newsTopicObject.jsp?whichCat="+encodeURIComponent(vztzmc);
			document.location.href=url;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>
<%
String whichCat="zxzx_ztqj";
if(request.getParameter("whichCat")!=null&&!request.getParameter("whichCat").equals(""))
{
whichCat=request.getParameter("whichCat");
}
String nav2=whichCat;
%>
<body>

      <div class="cjzt_box">
   		<h4>财经专题</h4>
<%	
	String cat = "zxzx_ztqj";
	String sql = "select * from (select * from cms_doc_single_attr t where t.doc_id in(select p.doc_id from cms_doc_category_map p where p.cat_id = (select o.cat_id from cms_category_basic_info o where o.cat_name='zxzx_ztqj')) and t.is_delete=0 and t.state=1 and t.subtitle is not null order by t.upload_date desc) e1 where rowid = (select min(rowid) from (select * from cms_doc_single_attr t where t.doc_id in(select p.doc_id from cms_doc_category_map p where p.cat_id = (select o.cat_id from cms_category_basic_info o where o.cat_name='zxzx_ztqj')) and t.is_delete=0 and t.state=1 and t.subtitle is not null order by t.upload_date desc) e2 where e1.subtitle=e2.subtitle)";

	String ctx = request.getContextPath();
	int rowNum = 2;
	int subjectNumCount = 1;
	String target = ctx + "/cms/newsContent.jsp";
	int i=0;
%> 
<paging:page count="false" row="2"
	provider="<%=new DocumentFrontListProvider(cat, request)%>">

	<paging:pageRow id="doc2" type="com.css.cms.document.Document">
	
	</paging:pageRow>

</paging:page>

<paging:page count="false" row="<%=rowNum%>" provider="<%=new DocumentSqlListProvider(sql)%>">
	<paging:pageRow id="doc" type="com.css.cms.document.Document">
    	
    	<%
     			String subTitle = (String) DocumentHelper.getAttrValue(doc, "subtitle","");
				String subTitle2 = StringUtils.subString(subTitle,11,"");
             %>
         <table width="92%" class="mt5 lh22" align="center">
           <tr>
           	<td width="20">
           	  <img src="${contextPath }/pic/infoCenter/dot_bt.gif"  />
           	</td>
            <td valign="top">
             <a href="javascript:changeMoreCjxw('<%=doc.getId()%>');">
             	<b><%out.print(subTitle2);%></a></b>
            </td>
          </tr>
        </table>

     <ul>

       <%String sql2 = "select * from cms_doc_single_attr t where t.subtitle ='"+subTitle.trim()+"' and t.is_delete=0 and t.state=1   order by t.upload_date desc";
        %>
								<paging:page count="false" row="<%=rowNum+5%>"
									provider="<%=new DocumentSqlListProvider(sql2)%>">

									<paging:pageRow id="doc2" type="com.css.cms.document.Document">	
                     <%
                     	i++;
						String docTitle = DocumentHelper.getTitle(doc2) ;
						docTitle = StringUtils.subString(docTitle,11,"...");
						docTitle = "<a href=\""+request.getContextPath()+"/cms/newsContent.jsp?docId="+doc2.getId()+"\" title='"+docTitle.replaceAll("\\<.*?\\>","")+"' target=\"_blank\">"+docTitle+"</a>" ;
						out.println("<li class='li_list1'>"+docTitle+"</li>");
					%>
			
          	</paging:pageRow>
		</paging:page>
		</ul>
		<%if(i< (rowNum+5)){ 
			  	for(int j=0;j<(rowNum+5)-i;j++){
				  out.println("<br/>");
			  }
			  }
			  %>
      	</paging:pageRow>
</paging:page>
</div>
</body>
</html>