<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<%@page import="com.css.cms.document.*"%>
<%@page import="com.css.cms.document.Document"%>
<%@page import="com.css.cms.category.CategoryFactory"%>
<%@page import="com.css.cms.category.CategoryTree"%>
<%@page import="com.css.cms.category.*"%>
<%@page import="com.css.cms.document.util.DocumentHelper"%>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.systemset.service.BranchManagerService"/>
<jsp:directive.page import="com.cssweb.systemset.pojo.Branch"/>
<jsp:directive.page import="java.util.*"/>
<%@ taglib uri="/WEB-INF/plugins/paging/css-paging.tld" prefix="paging"%>
<%
	String search = "";
	CategoryTree catTree= null;
	if(request.getParameter("siteName")!=null){
		catTree = CategoryFactory.getCategoryTree(request.getParameter("siteName"));
	}else{
		catTree = CategoryFactory.getCategoryTree(DocumentManager.getCmsRootName());
		
	}   
	String column="rzrq_flfg";
	if(request.getParameter("whichCat")!=null)
	column=request.getParameter("whichCat");
	//CategoryNode catNode = catTree.getCategoryNode(column);
	//String bt="";
	//if(catNode!=null)
	//bt=catNode.getDisplayName();

	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	BranchManagerService branchManagerService = (BranchManagerService) ctx.getBean("branchManagerService");
	Branch branch =	branchManagerService.getByBranchCode("fzjg");
	Map map = new HashMap();
	map.put("begin",0);
	map.put("end",5);
	map.put("parentId",branch.getId());
	List branchlist = branchManagerService.getBranchRzrqPages(map);

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：首页 - 融资融券 - 法律法规</div>
</div>
<div class="wrap_2right">
  <!--左侧sied开始-->
  <div class="w706 fleft">
  	<div class="comtit1"><h4>法律法规</h4></div>
    <div class="blank5"></div>
    <p align="center"><img src="/pic/financing/flfg.jpg" /></p>
    <div class="blank10"></div>
	<paging:page count="false" row="10" provider="<%= new com.css.cms.document.model.DocumentFrontListProvider(column,request)%>" tableId="doclist">
		<table width="98%" align="center" border="0" cellspacing="0" cellpadding="0" class="lh27 list_bline1">
		<form name="querylist" action="">

		<paging:pageRow id="doc" type="com.css.cms.document.Document"> 
          <%
          		
          		String content=DocumentHelper.getContent(doc);
								content=content.replaceAll("\\</?(?!(input)|(img)).*?\\>","");
								content=content.replaceAll("    "," ");
								content=content.replaceAll("   "," ");
								content=content.replaceAll("  "," ");
								content=content.replaceAll("　","");
								content=content.replaceAll("	","");
								content=content.replaceAll("&nbsp;","");
								content=content.replaceAll("\r\n\r\n\r\n\r\n\r\n","\r\n");
								content=content.replaceAll("\r\n\r\n\r\n\r\n","\r\n");
								content=content.replaceAll("\r\n\r\n\r\n","\r\n");
								content=content.replaceAll("\r\n\r\n","\r\n");
								content=content.replace("\r\n","<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
							//content="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+content;
								//tempNum ++ ;
								
           %>
           <tr>
            <td width="420"><img src="/pic/msindex/list_03.gif"/>
				<a href="${contextPath }/commons/infoList.jsp?docId=<%= doc.getId()%>" target=\"_blank\">
           <%= DocumentHelper.getTitle(doc ,60)%> </a></td>
            <td width="106"><%= DocumentHelper.getUploadDate(doc ,"yyyy/MM/dd")%></td>
          </tr>
              
		</paging:pageRow>
		</form>
		</table>
		
			<p align="center"><paging:pageInfo empty="没有记录"/>&nbsp;&nbsp;<paging:pageLink pages="8" mode="text" hasGo="false"/></p>
       
	</paging:page>
    <div class="clearfloat h15"></div>
  </div>  
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w210 fright">
  <div class="rtit1">营业网点</div>
  <div class="bg_ff ptb6 ribor3">
    <table width="180" class="fcenter lh25 textcenter">
      <tr class="xuxian bold">
        <td width="39">序号</td>
        <td width="129">网点名称</td>
      </tr>
	  <%if(null!=branchlist){
		  for(int i=0;i<branchlist.size();i++){
			  Branch _branch = (Branch)branchlist.get(i);%>
			  <tr class="xuxian">
				<td><%=_branch.getBranchCode()%></td>
				<td><a href="${contextPath }/branchManagerAction.do?method=getBranchInfoById&id=<%=_branch.getId()%>"><%=_branch.getBranchName()%></a></td>
			  </tr>
	  <%
		  }
	  }%>
      <tr>
        <td colspan="2" align="right"><span class="red font_st"><a href="${contextPath }/branchManagerAdminAction.do?method=getMainBranchList&menu=mainywwd">[查看所有网点]</a></span></td>
        </tr>
    </table>
  </div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />

</body>
</html>