<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="com.cssweb.question.service.QuestionService"/>
<jsp:directive.page import="com.cssweb.question.po.Question"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.cssweb.hr.pojo.ThrPostInfo"/>
<jsp:directive.page import="com.cssweb.hr.service.ThrPostInfoService"/>
<jsp:directive.page import="java.util.Map"/>
<jsp:directive.page import="java.util.HashMap"/>

<%@page import="java.util.ArrayList"%>

<%@page	import="java.text.SimpleDateFormat"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<%
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String category = "rczp_zpgg";
	ServletContext sc = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(sc);
	QuestionService service = (QuestionService)ctx.getBean("question");
	ThrPostInfoService postService = (ThrPostInfoService)ctx.getBean("thrPostInfoService");
	List list = service.getQuestionList("question_rczp",1, 4);
	Map map1 = new HashMap();
	Map map2 = new HashMap();
	List lists = new ArrayList();
	lists.add("1");
	lists.add("4");
	map1.put("category", lists);
	List socilist = postService.getThrPostList(map1,1, 8);
	List lists2 = new ArrayList();
	lists2.add("2");
	lists2.add("4");
	map2.put("category", lists2);
	List schoollist = postService.getThrPostList(map2,1, 8);
	//System.out.println("schoollist =====" + schoollist);
	pageContext.setAttribute("list",list);
	pageContext.setAttribute("socilist",socilist);
	pageContext.setAttribute("schoollist",schoollist);
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/job/job.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script></head>

<c:if test="${message!=null }">
	<script>
		alert("${message}");
	</script>
</c:if>
<body>
<jsp:include page="/commons/mstop.jsp" />
<jsp:include page="${contextPath }/hrBbsAction.do?method=listJobIndex&pageSize=4"></jsp:include>
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.jsp">首页 </a> - 人才招聘</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/job/job_lmenu.jsp" />
    <div class="blank5"></div>
    <iframe target="_blank" id="leftlogin" name="leftlogin"  marginWidth="0" marginHeight="0" src="${contextPath }/job/job_login.jsp"
						frameBorder="0" noresize width="100%" scrolling="no" height="198" style="position:relative"></iframe>
            <div class="blank5"></div>

  </div>
  <div class="w706 fright">
	<div><img src="/pic/job/banner.jpg" /></div>
  <div class="clearfloat h15">
  <jsp:include page="/ad/ad_paintings.jsp">
              <jsp:param name="widths" value="120"/>
			  <jsp:param name="heights" value="250"/>
			  <jsp:param name="subAdCode" value="ad_paintings_hr"/>
     </jsp:include>
  </div>
<div class="fleft pl_12 w334">
<div class="shzp_tt w334"><p class="shzp_bq bold fleft">社会招聘职位</p><p class="fright lh29 mr5 font_st font_73"><a href="${ctx }/job/jobSocial.jsp?nav=shzp">更多>></a></p></div>
<div class="blank10"></div>
<table width="95%" align="center" class="lh25 font_st">
<%if(socilist!=null&&socilist.size()>0){
 for(int i=0;i<socilist.size();i++)
 {
   ThrPostInfo ThrPostInfo=(ThrPostInfo)socilist.get(i);
   String centext="["+ThrPostInfo.getBranchName()+"]"+ThrPostInfo.getPostName();
   centext=centext.length()>16?centext.substring(0,16)+"...":centext;
   String datepublishDate="";
   if(ThrPostInfo.getPublishDate()!=null)
   datepublishDate=sdf.format(ThrPostInfo.getPublishDate());
   %>
   <tr class="xuxian">
    <td width="70%"><span class="font_8c">·</span><a href="${ctx }/job/jobReq.jsp?jobId=<%=ThrPostInfo.getId() %>" title="<%=ThrPostInfo.getBranchName()+","+ThrPostInfo.getPostName() %>" target="_blank">
     <font <%=ThrPostInfo.getIsHot()!=null&&ThrPostInfo.getIsHot().equals("1")?"color='red'":"color='#000000'" %>>  <%=centext %></font>
    </a></td>
    <td align="right"><span class="font_8c">
    <%=datepublishDate %>
    </span></td>
  </tr>
   <%
 }
} %>
</table>
</div>
<div class="fleft pl_12 w334">
<div class="shzp_tt w334"><p class="shzp_bq bold fleft">校园招聘职位</p><p class="fright lh29 mr5 font_st font_73"><a href="${ctx }/job/jobCampus.jsp?nav=xyzp">更多>></a></p></div>
<div class="blank10"></div>
<table width="95%" align="center" class="lh25 font_st">
<%if(schoollist!=null&&schoollist.size()>0){
 for(int i=0;i<schoollist.size();i++)
 {
   ThrPostInfo ThrPostInfo=(ThrPostInfo)schoollist.get(i);
   String centext="["+ThrPostInfo.getBranchName()+"]"+ThrPostInfo.getPostName();
   centext=centext.length()>16?centext.substring(0,16)+"...":centext;
   String datepublishDate="";
   if(ThrPostInfo.getPublishDate()!=null)
   datepublishDate=sdf.format(ThrPostInfo.getPublishDate());
   %>
   <tr class="xuxian">
    <td width="70%"><span class="font_8c">·</span><a href="${ctx }/job/jobReq.jsp?jobId=<%=ThrPostInfo.getId() %>" title="<%=ThrPostInfo.getBranchName()+","+ThrPostInfo.getPostName() %>" target="_blank">
     <font <%=ThrPostInfo.getIsHot()!=null&&ThrPostInfo.getIsHot().equals("1")?"color='red'":"color='#000000'" %>> <%=centext %></font>
    </a></td>
    <td align="right"><span class="font_8c">
    <%=datepublishDate %>
    </span></td>
  </tr>
   <%
 }
} %>
</table>
</div>
<div class="clearfloat h15"></div>
<div class="fleft pl_12 w334">
<div class="shzp_tt w334"><p class="shzp_bq bold fleft">招聘BBS</p><p class="fright lh29 mr5 font_st font_73"><a href="${ctx }/hrBbsAction.do?method=list">更多>></a></p></div>
<div class="blank10"></div>
<table width="95%" align="center" class="lh25 font_st">
<logic:iterate id="data" name="postsList" indexId="num">
  	<tr class="xuxian">
	    <td width="70%"><span class="font_8c">·</span>
	      <a href="${ctx }/hrBbsAction.do?method=info&postId=${data.postId }" target=\"_blank\">
	         <c:set var="len" value="${fn:length(data.postTitle)}"/>
			<c:if test="${len>15}">
				<c:set var="str" value="${fn:substring(data.postTitle, 0, 15)}..."/>
			    ${str}
			</c:if>
			<c:if test="${len<=15}">
			    ${data.postTitle}
			</c:if>
	      </a>
	    </td>
	    <td align="right"><span class="font_8c"><bean:write name="data" property="postCreatetime" format="yyyy-MM-dd" /></span></td>
	  </tr>
  </logic:iterate>
</table>
</div>
<div class="fleft pl_12 w334">
<div class="shzp_tt w334"><p class="shzp_bq bold fleft">常见问题解答</p><p class="fright lh29 mr5 font_st font_73"><a href="${ctx }/question.do?method=getHrQuestionList&nav=cjwt">更多>></a></p></div>
<div class="blank10"></div>
<table width="95%" align="center" class="lh25 font_st">
<%if(list!=null&&list.size()>0){
 for(int i=0;i<list.size();i++)
 {
   Question question=(Question)list.get(i);
   %>
   <tr class="xuxian">
    <td width="70%"><span class="font_8c">·</span>
     <%=question.getQuestion()!=null&&!question.getQuestion().equals("")&&question.getQuestion().length()>16?question.getQuestion().substring(0,16)+"...":question.getQuestion() %>
    </td>
    <td align="right"><span class="font_8c">
    <%=question.getUpdateDateStr() %>
    </span></td>
  </tr>
   <%
 }
} %>
</table>
</div>
<div class="clearfloat h15"></div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />


</body>
<script type="text/javascript"> 
var _aq = _aq || [];
_aq.push(['_setSiteId', 10001]);_aq.push(['_setCatalogId', 18]); _aq.push(['_trackPageview']); (function() {
var ga = document.createElement( 'script'); ga.type = 'text/javascript'; ga.async = true; ga.src='http://121.8.153.59:8080/stat/stat.js'; var s = document.getElementsByTagName( 'script')[0]; s.parentNode.insertBefore(ga, s); })();
</script>
</html>