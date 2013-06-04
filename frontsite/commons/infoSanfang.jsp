<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:directive.page import="java.net.URLEncoder"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="java.util.Date"/><!-- 搜索结果页 -->
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%	Date a =  new Date();
	SimpleDateFormat sdf  = new SimpleDateFormat("yyyy-MM-dd");
	SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	String tempDate = sdf.format(a);
	String desc = "";
	String url = "" ;
	String title = request.getParameter("title") ;
	if(null!=title && sqlInjectValidate.validateSql(title))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	url = url + "title="+title+"&" ;
	String source = request.getParameter("source") ;
	if(null!=source && sqlInjectValidate.validateSql(source))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	url = url + "source="+source+"&" ;
	String author = request.getParameter("author") ;
	if(null!=author && sqlInjectValidate.validateSql(author))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	url = url + "author="+author+"&" ;
	String stock_id = request.getParameter("stock_id") ;
	if(null!=stock_id && sqlInjectValidate.validateSql(stock_id))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	url = url + "stock_id="+stock_id+"&" ;
	String keyword = request.getParameter("keyword") ;
	if(null!=keyword && sqlInjectValidate.validateSql(keyword))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	url = url + "keyword="+keyword+"&" ;
	String importance = request.getParameter("importance") ;
	if(null!=importance && sqlInjectValidate.validateSql(importance))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	url = url + "importance="+importance+"&" ;
	String catIdStr = request.getParameter("catIdStr") ;
	if(null!=catIdStr && sqlInjectValidate.validateSql(catIdStr))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	url = url + "catIdStr="+catIdStr+"&" ;
	String whichCat = request.getParameter("whichCat") ;
	if(null!=whichCat && sqlInjectValidate.validateSql(whichCat))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	url = url + "whichCat="+whichCat+"&" ;
	String StartDate = request.getParameter("StartDate") ;
	if(null!=StartDate && sqlInjectValidate.validateSql(StartDate))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	url = url + "StartDate="+StartDate+"&" ;
	String EndDate = request.getParameter("EndDate") ;
	if(null!=EndDate && sqlInjectValidate.validateSql(EndDate))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	url = url + "EndDate="+EndDate+"&" ;
	String editor = request.getParameter("editor") ;
	if(null!=editor && sqlInjectValidate.validateSql(editor))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	url = url + "editor="+editor+"&" ;
	String auditor = request.getParameter("auditor") ;
	if(null!=auditor && sqlInjectValidate.validateSql(auditor))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	url = url + "auditor="+auditor+"&" ;
	String state = request.getParameter("state") ;
	if(null!=state && sqlInjectValidate.validateSql(state))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	url = url + "state="+state+"&" ;
	String is_delete = request.getParameter("is_delete") ;
	if(null!=is_delete && sqlInjectValidate.validateSql(is_delete))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	url = url + "is_delete="+is_delete+"&" ;
	String doc_type = request.getParameter("doc_type") ;
	if(null!=doc_type && sqlInjectValidate.validateSql(doc_type))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	url = url + "doc_type="+doc_type+"&" ;
	String pageno = request.getParameter("pageno") ;
	if(null!=pageno && sqlInjectValidate.validateSql(pageno))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	if (pageno == null) pageno = "0" ;
	url = url + "pageno="+pageno ;
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
	if(keyword!=null&&keyword.length()>0){
		desc+="关键字:"+keyword;
	}
	if(author!=null&&author.length()>0){
		desc+="作者:"+author;
	}
	if(stock_id!=null&&stock_id.length()>0){
		desc+="股票代码:"+stock_id;
	}
	if(title!=null&&title.length()>0){
		desc+="标题:"+title;
	}
	if (desc.equals("")) {
		desc+="第三方存管业务动态";
	} else {
		//desc+="的查询结果";
		desc+="";
	}

%>
<body class="body_bg">
<jsp:include page="${ctx }/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：第三方存管业务动态</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
<jsp:include page="/commons/Search.jsp"/>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
    <div class="comtit1"><font color="#003994"><h4><%=desc %></h4></font></div>
    <div class="blank10"></div>

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td valign="top" height="320">
           <jsp:include page="QuerySfInfoList.jsp?whichCat=sy_wxts_dsf"/>
          <div class="blank10"></div>
          </td>
      </tr>
    </table>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/commons/msbottom.jsp" />

</body>
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 

</html>