<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.question.service.QuestionService"/>
<jsp:directive.page import="java.util.*"/>
<jsp:directive.page import="com.cssweb.question.po.Question"/>
<%@page import="com.css.cms.document.*"%>
<%@page import="com.css.cms.document.Document"%>
<%@page import="com.css.cms.category.CategoryFactory"%>
<%@page import="com.css.cms.category.CategoryTree"%>
<%@page import="com.css.cms.category.*"%>
<%@page import="com.css.cms.document.util.DocumentHelper"%>
<%@ taglib uri="/WEB-INF/plugins/paging/css-paging.tld" prefix="paging"%>

<%
ServletContext st = this.getServletConfig().getServletContext();
ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
QuestionService questionService = (QuestionService) ctx.getBean("question");
List queslist = questionService.getNumQuestion("question_rzrq",10);
String column="rzrq_flfg";
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
  <div class="dqwz">当前位置：<a href="/default.html">首页</a> - <a href="/financing/index.html"> 融资融券</a></div>
</div>
<div class="wrap_2right">
  <!--左侧sied开始-->
  <div class="w706 fleft">
  		<div class="comtit1"><h4>广发融资融券</h4></div>
    <div class="blank5"></div>

<div class="clearfloat h15"></div>
<div class="line28 pl15">
<ul class="rrqh">
<li class="rrqh_down red" id="tagtabs01" >公告信息</li>
<li style="width:520px;"></li>
<li class="red"><a href="${contextPath }/financing/rateNotice.html">更多</a></li>
</ul>
</div>
<div class="blank10"></div>
<table width="96%" align="center" class="lh25 font_st" id="tabs01" style="display:">
  <tr>
    <td width="9"><img src="/pic/financing/dot-jt.gif" /></td>
    <td><span class="bold">
    <jsp:include page="/financing/indexTitlebt.jsp">
           <jsp:param name="whichCat" value="rzllhrqgl"/>
    	</jsp:include>
    </span>
    <span class="red"><a href="${contextPath }/financing/rateNotice.html">[详细]</a></span></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>
    <jsp:include page="/financing/indexTitle.jsp">
           <jsp:param name="whichCat" value="rzllhrqgl"/>
    	</jsp:include>
    </td>
  </tr>
  <tr>
    <td><img src="/pic/financing/dot-jt.gif" /></td>
    <td><span class="bold">
    <jsp:include page="/financing/indexTitlebt.jsp">
           <jsp:param name="whichCat" value="zqzlhzsl"/>
    	</jsp:include>
    </span>
    <span class="red"><a href="${contextPath }/assureAction.do?method=getAssureFrontList">[详细]</a></span></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>
    <jsp:include page="/financing/indexTitle.jsp">
           <jsp:param name="whichCat" value="zqzlhzsl"/>
    	</jsp:include>
    </td>
  </tr>
  <tr>
    <td><img src="/pic/financing/dot-jt.gif" /></td>
    <td><span class="bold">
    <jsp:include page="/financing/indexTitlebt.jsp">
           <jsp:param name="whichCat" value="bdzqtzgg"/>
    	</jsp:include>
    </span>
    <span class="red"><a href="${contextPath }/financing/subjectNotice.html">[详细]</a></span></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>
    <jsp:include page="/financing/indexTitle.jsp">
           <jsp:param name="whichCat" value="bdzqtzgg"/>
    	</jsp:include>
    </td>
  </tr>
  <tr>
    <td><img src="/pic/financing/dot-jt.gif" /></td>
    <td><span class="bold">
    <jsp:include page="/financing/indexTitlebt.jsp">
           <jsp:param name="whichCat" value="bzjhwcdbp"/>
    	</jsp:include>
    </span>
    <span class="red"><a href="${contextPath }/pledgeAndKeepAction.do?method=getPledgeAndKeepFrontList">[详细]</a></span></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>
    <jsp:include page="/financing/indexTitle.jsp">
           <jsp:param name="whichCat" value="bzjhwcdbp"/>
    	</jsp:include>
    </td>
  </tr>
  <tr>
    <td height="5">&nbsp;</td>
 </tr>
  </table>
<div class="line28 pl15"><ul class="rrqh">
<li class="rrqh_down red" id="tagtabs02">投资者学苑</li></ul>
</div>
<div class="blank10"></div>
<table width="96%" align="center" class="lh30 textcenter" id="tabs02">
  <tr>
    <td width="50%" class="ptb6"><a href="${contextPath }/financing/basicKnowledge.jsp?menu=1&type=rzrq_tzzjy_jczs"><img src="/pic/financing/flash1.jpg" /></a></td>
    <td class="ptb6"><a href="${contextPath }/financing/basicKnowledge.jsp?menu=2&type=rzrq_tzzjy_jczs"><img src="/pic/financing/flash2.jpg" /></a></td>
    </tr>
  <tr>
    <td><span class="red bold"><img src="/pic/financing/dot-hand.jpg" align="absmiddle" /><font size="1.5">融资融券基础知识介绍</font></span></td>
    <td><span class="red bold"><img src="/pic/financing/dot-hand.jpg" align="absmiddle" /><font size="1.5">融资融券风险与收益</font></span></td>
  </tr>
  <tr>
    <td class="ptb6"><a href="${contextPath }/financing/basicKnowledge.jsp?menu=3&type=rzrq_tzzjy_jczs"><img src="/pic/financing/flash3.jpg" /></a></td>
    <td class="ptb6"><a href="${contextPath }/financing/basicKnowledge.jsp?menu=4&type=rzrq_tzzjy_jczs"><img src="/pic/financing/flash4.jpg" /></a></td>
  </tr>
  <tr>
    <td><span class="red bold"><img src="/pic/financing/dot-hand.jpg" align="absmiddle" /><font size="1.5">融资融券业务办理流程</font></span></td>
    <td><span class="red bold"><img src="/pic/financing/dot-hand.jpg" align="absmiddle" /><font size="1.5">融资融券业务交易与注意事项</font></span></td>
  </tr>
  </table>
<div class="clearfloat h25"></div>
  </div>  
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w210 fright">
    <div class="rtit1">
      <table width="92%" class="fcenter indent0">
      <tr>
        <td width="48%" class="red" id="tagtabs1" onmouseover="SwitchNews('tabs', 1, 2,'red','font_73')"><a href="${contextPath }/financing/faq.html">常见问题</a></td>
        <td width="4%" align="center" class="indent0"><img src="/pic/financing/shuxian.jpg" /></td>
        <td class="font_73" id="tagtabs2" onmouseover="SwitchNews('tabs', 2, 2,'red','font_73')"><a href="${contextPath }/financing/lawsStatute.html">法律法规</a></td>
      </tr>
    </table>
  </div>
  <div class="bg_ff ptb6 ribor3">
    <table width="180" class="fcenter lh25" id="tabs1" style="display:">
	<%if(null!=queslist){
		for(int i=0;i<queslist.size()&&i<4;i++){
			Question ques = (Question)queslist.get(i);%>
		  <tr>
			<td width="10" valign="top"><img src="/pic/financing/dot-dd.gif" /></td>
			<td><a href="${contextPath }/question.do?method=getRzrqQuestionList&quesid=<%=ques.getId()%>"><%=ques.getQuestion()%></a></td>
		  </tr>
	<%	}
	}%>
	 <tr>
	   <td></td>
	   <td align="right"><a href="${contextPath }/financing/faq.html"><font color="red">更多</font></a></td>
	 </tr>
      </table>
    <table width="180" class="fcenter lh25" id="tabs2" style="display:none">
	<paging:page count="false" row="3" provider="<%= new com.css.cms.document.model.DocumentFrontListProvider(column,request)%>" tableId="doclist">
	<paging:pageRow id="doc" type="com.css.cms.document.Document"> 
      <tr>
        <td width="10" valign="top"><img src="/pic/financing/dot-dd.gif" /></td>
        <td><a href="${contextPath }/commons/infoList.jsp?docId=<%= doc.getId()%>" target=\"_blank\" ><%= DocumentHelper.getTitle(doc ,60)%></a></td>
      </tr>
	</paging:pageRow>
	</paging:page>
	 <tr>
	   <td></td>
	   <td align="right"><a href="${contextPath }/financing/lawsStatute.html"><font color="red">更多</font></a></td>
	 </tr>
    </table>
  </div>
    <div class="blank5"></div>
    <div class="fcenter"><a href="${contextPath }/financing/businessProcess.jsp"><img src="/pic/financing/rongzhi_logo.jpg" /></a></div>
    <div class="blank5"></div>
    <div class="fcenter"><a href="${contextPath }/financing/businessProcess.jsp"><img src="/pic/financing/rzrqywlc_b.jpg" /></a></div>     
    <div class="blank5"></div>
  
      <div class="rtit1">
      <table width="92%" class="fcenter indent0">
      <tr>
        <td width="80%" class="font_73"><a href="${contextPath }/financing/otherNotice.html">融资融券公告 </a></td>
        <td></td>
      </tr>
    </table>
  </div>
  <div class="bg_ff ptb6 ribor3">
  <% 
  String columnGg="rzrq_qtgg";
   %>
    <table width="180" class="lh25">
	<paging:page count="false" row="5" provider="<%= new com.css.cms.document.model.DocumentFrontListProvider(columnGg,request)%>" tableId="doclist">
	<paging:pageRow id="doc" type="com.css.cms.document.Document"> 
      <tr>
        <td width="10" valign="top"><img src="/pic/financing/dot-dd.gif" /></td>
        <td><a href="${contextPath }/commons/infoList.jsp?docId=<%= doc.getId()%>" target=\"_blank\" ><%= DocumentHelper.getTitle(doc ,60)%></a></td>
      </tr>
	</paging:pageRow>
	</paging:page>
	<tr>
	   <td></td>
	   <td align="right"><a href="${contextPath }/financing/otherNotice.html"><font color="red">更多</font></a></td>
	 </tr>
    </table>
  </div>
    
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
<script src="/js/setTab.js"></script>
</body>
<script type="text/javascript"> 
var _aq = _aq || [];
_aq.push(['_setSiteId', 10001]);_aq.push(['_setCatalogId', 15]); _aq.push(['_trackPageview']); (function() {
var ga = document.createElement( 'script'); ga.type = 'text/javascript'; ga.async = true; ga.src='http://121.8.153.59:8080/stat/stat.js'; var s = document.getElementsByTagName( 'script')[0]; s.parentNode.insertBefore(ga, s); })();
</script>
</html>