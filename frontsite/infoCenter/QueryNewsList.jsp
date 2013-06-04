<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:directive.page import="java.net.URLEncoder"/>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<%@ page import="java.util.*" %>
<jsp:directive.page import="java.util.Date"/><!-- 搜索结果页 -->
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%	
    SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
    Date a =  new Date();
	SimpleDateFormat sdf  = new SimpleDateFormat("yyyy-MM-dd");
	String tempDate = sdf.format(a);
	String desc = "";
	String title = request.getParameter("title") ;
	
	
	//title=new String(title.getBytes("ISO-8859-1"),"UTF-8");
	
	//request.setAttribute("title",title);
	
	if(null!=title && sqlInjectValidate.validateSql(title))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	String source = request.getParameter("source") ;
	if(null!=source && sqlInjectValidate.validateSql(source))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	String author = request.getParameter("author") ;
	if(null!=author && sqlInjectValidate.validateSql(author))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	String stock_id = request.getParameter("stock_id") ;
	if(null!=stock_id && sqlInjectValidate.validateSql(stock_id))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	String keyword = request.getParameter("keyword") ;
	if(null!=keyword && sqlInjectValidate.validateSql(keyword))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	String importance = request.getParameter("importance") ;
	if(null!=importance && sqlInjectValidate.validateSql(importance))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	String catIdStr = request.getParameter("catIdStr") ;
	if(null!=catIdStr && sqlInjectValidate.validateSql(catIdStr))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	String whichCat = request.getParameter("whichCat") ;
	if(null!=whichCat && sqlInjectValidate.validateSql(whichCat)){
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		}
	String StartDate = request.getParameter("StartDate") ;
	if(null!=StartDate && sqlInjectValidate.validateSql(StartDate))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	String EndDate = request.getParameter("EndDate") ;
	if(null!=EndDate && sqlInjectValidate.validateSql(EndDate))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	String editor = request.getParameter("editor") ;
	if(null!=editor && sqlInjectValidate.validateSql(editor))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	String auditor = request.getParameter("auditor") ;
	if(null!=auditor && sqlInjectValidate.validateSql(auditor))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	String state = request.getParameter("state") ;
	if(null!=state && sqlInjectValidate.validateSql(state))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	String is_delete = request.getParameter("is_delete") ;
	if(null!=is_delete && sqlInjectValidate.validateSql(is_delete))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	String doc_type = request.getParameter("doc_type") ;
	if(null!=doc_type && sqlInjectValidate.validateSql(doc_type))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	String pageno = request.getParameter("pageno") ;
	if(null!=pageno && sqlInjectValidate.vakidateSqlIfIngter(pageno))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");	
	if (pageno == null) pageno = "0" ;
	if(author!=null&&author.length()>0){
		desc+=author+" | ";
	}
	if(title!=null&&title.length()>0){
		desc+=title+" | ";
	}
	if(StartDate!=null&&StartDate.length()>0){
		desc+="起始时间:"+StartDate+" | ";
	}
	if(EndDate!=null&&EndDate.length()>0){
		desc+="结束时间:"+EndDate;
	}
	desc+="的查询结果";
	//url = java.net.URLEncoder.encode(url) ;
	Enumeration e =(Enumeration)request.getParameterNames();   
	    while(e.hasMoreElements()){   
	      String parName=(String)e.nextElement();   
	     if(parName.equals("title")||parName.equals("source")||parName.equals("author")||parName.equals("stock_id")||parName.equals("keyword")||parName.equals("importance")
	     ||parName.equals("catIdStr")||parName.equals("whichCat")||parName.equals("StartDate")||parName.equals("EndDate")||parName.equals("editor")||parName.equals("state")
	     ||parName.equals("auditor")||parName.equals("is_delete")||parName.equals("doc_type")||parName.equals("pageno")||parName.equals("urlNext")||parName.equals("urlPre"))
		     {
		      System.out.println("        parName="+parName);
		     }
		     else
		     {
		      System.out.println("        parName=222222="+parName);
		      response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");	
		      break;
		     }
	    }
%>
<body class="">
<jsp:include page="${ctx }/share/top.jsp?nav=zxzx" />
<div class="body_bg">
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：资讯检索</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid" >
<jsp:include page="/infoCenter/Search.jsp"/>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
    <div class="left_tit2"><%=desc %></div>
    <div class="blank10"></div>

    <table width="100%" height="320" border="0" cellspacing="0" cellpadding="0">
      <tr >
        <td valign="top">
           <jsp:include page="QueryInfoList.jsp"/>
          <div class="blank10" style="higth:500px"></div>
          </td>
      </tr>
    </table>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
</div>
</body>
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 
</iframe>
<script type="text/javascript"> 
var _aq = _aq || [];
_aq.push(['_setSiteId', 10001]);_aq.push(['_setCatalogId', 63]); _aq.push(['_trackPageview']); (function() {
var ga = document.createElement( 'script'); ga.type = 'text/javascript'; ga.async = true; ga.src='http://121.8.153.59:8080/stat/stat.js'; var s = document.getElementsByTagName( 'script')[0]; s.parentNode.insertBefore(ga, s); })();
</script>
</html>