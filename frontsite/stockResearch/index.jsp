<%@page import="com.css.cms.document.util.DocumentHelper"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/stockResearch/stockResearch.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：首页 - 证券研究</div>
</div>
<div class="w920 sr_bg">
    <!--左侧sied开始-->
<div class="fleft sr_left">
<div class="l558">
<table width="96%" class="mt53 mb70">
  <tr>
    <td height="47" colspan="2" valign="top"><img src="/pic/stockResearch/zqyj.jpg" /></td>
    </tr>
  <tr>
    <td width="142"><img src="/pic/stockResearch/zqyj_tu.jpg" /></td>
    <td class="font14 lh20 inden25 font_st">
    <% String category="zqyj_zqyjjs"; %>
     <paging:page count="false" row="<%=1%>" provider="<%=new com.css.cms.document.model.DocumentFrontListProvider(category, request)%>">
		<paging:pageRow id="doc" type="com.css.cms.document.Document">
					<%
						String detailPage = "/commons/infoList.jsp?docId="+doc.getId() ;
		       					String content=DocumentHelper.getContent(doc);
								content="&nbsp;&nbsp;&nbsp;"+content;
		      					content=StringUtils.subString(content,280,"......")+"&nbsp;&nbsp;";
		      					//content=HTMLutils.TextToHtml(content);
					            out.println(content);
			      %> 
				      
				   <span class="red"><a href="<%=detailPage %>"  target="_blank">[更多内容]</a></span>  
		</paging:pageRow>
</paging:page>
    

    </td>
  </tr>
</table>
<div class="bmdsj mb12">
<table width="95%" class="ml17">
  <tr>
    <td width="20"><img src="/pic/stockResearch/dot_bm.gif" /></td>
    <td class="font14 bold" >部门大事记</td>
    <td align="right" class="font_st font_8c bold">更多&gt;&gt;</td>
  </tr>
</table>
</div>

    <% String category_bmdsj="zqyj_bmdsj"; %>
     <paging:page count="false" row="<%=3%>" provider="<%=new com.css.cms.document.model.DocumentFrontListProvider(category_bmdsj, request)%>">
		<paging:pageRow id="doc" type="com.css.cms.document.Document">
				<table class="bmdsj_bk" height="126">
				  <tr>
				    <td width="100" valign="top" class="red2 bold">
				    <%= DocumentHelper.getUploadDate(doc ,"yyyy-MM-dd")%>
				    </td>
				   
				   <%
						        String detailPage = "/commons/infoList.jsp?docId="+doc.getId() ;
		       					String content=DocumentHelper.getContent(doc);
								content=""+content;
		      					content=StringUtils.subString(content,480,"......")+"&nbsp;&nbsp;";
		      					//content=HTMLutils.TextToHtml(content);
			        %> 
				    <td valign="top" class="lh20 pr25">
				    <a href="<%=detailPage %>"  target="_blank"><%=content %></a>
				    </td>
				  </tr>
				</table>   
		</paging:pageRow>
</paging:page>
</div>

</div>
    <!--左侧sied结束-->
    
    <!--右侧sied开始-->
<div class="fleft sr_right mt10">
<p class="ml8 mt8"><img src="/pic/stockResearch/zqyj_bn.jpg" /></p>
<div class="blank10"></div>
<div class="yjdt w299">
<table width="95%" class="ml10">
  <tr>
    <td width="15"><img src="/pic/stockResearch/dot_bm.gif" /></td>
    <td class="font14 bold" >研究动态</td>
    <td align="right" class="font_st font_8c bold"><a href="${ctx }/stockResearch/researchInfo.jsp"> 更多&gt;&gt;</a></td>
  </tr>
</table></div>
<marquee scrollamount="3" direction="up" onmouseover="this.stop()" onmouseout="this.start()" height="196">
<jsp:include page="/stockResearch/stockList.jsp"/>
</marquee>
  <div class="clearfloat h25"></div>
<div class="yjdt w299"><table width="95%" class="ml10">
  <tr>
    <td width="15"><img src="/pic/stockResearch/dot_bm.gif" /></td>
    <td class="font14 bold" >研究报告</td>
  
  </tr>
</table></div>
<div class="ml15 yjbg_button_up">
<ul>
<li><a href="${ctx }/stockResearch/companyResearch.jsp?whichCat=gfyj_gslyjbg">公司研究</a></li>
<li><a href="${ctx }/stockResearch/companyResearch.jsp?whichCat=gfyj_hyyjbg">行业研究</a></li>
<li><a href="${ctx }/stockResearch/companyResearch.jsp?whichCat=gfyj_hglyjbg">宏观研究</a></li>
<li><a href="${ctx }/stockResearch/companyResearch.jsp?whichCat=gfyj_jjscbg">基金研究</a></li>
<li><a href="${ctx }/stockResearch/companyResearch.jsp?whichCat=gfyj_tzclbg">投资策略</a></li>
<li><a href="${ctx }/stockResearch/companyResearch.jsp?whichCat=gfyj_zjyjbg">债券研究</a></li>
<li><a href="${ctx }/stockResearch/companyResearch.jsp?whichCat=gfyj_yspscbg">衍生品研究</a></li>
<li><a href="${ctx }/stockResearch/companyResearch.jsp?whichCat=gfyj_yzhg">一周回顾</a></li>
</ul></div>
<div class="clearfloat h106"></div>
</div>
    <!--右侧sied结束--> 
  <div class="blank5"></div><!--清除浮动--> 
</div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
<script type="text/javascript" > 
var _aq = _aq || [];
_aq.push(['_setSiteId', 10001]);_aq.push(['_setCatalogId', 13]); _aq.push(['_trackPageview']); (function() {
var ga = document.createElement( 'script'); ga.type = 'text/javascript'; ga.async = true; ga.src='http://121.8.153.59:8080/stat/stat.js'; var s = document.getElementsByTagName( 'script')[0]; s.parentNode.insertBefore(ga, s); })();
</script>
</html>