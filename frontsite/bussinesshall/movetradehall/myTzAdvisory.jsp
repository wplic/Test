
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.complaints.service.ComplaintsService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cssweb.complaints.pojo.Complaints"%><%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.List"%>
<%@page import="com.cssweb.complaints.pojo.FinanceQuestion"%>
<%@page import="java.text.SimpleDateFormat"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script src="/js/setTab.js"></script>
<jsp:include page="/share/pdLogin.jsp" />
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	if(request.getParameter("StartDate")!=null&&!request.getParameter("StartDate").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("StartDate"),14)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}
	String url="";
	if(request.getAttribute("flag")==null){
	%>
		<script type="text/javascript">
		window.location.href="${ctx}/front/finance.do?method=selectAllFinanceQuestion&category=2&webuser_id=1&is_answer=1";
		</script>
	<%
	}else{
		url=request.getQueryString();
	}
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	ComplaintsService complaintsService = (ComplaintsService)ctx.getBean("complaintsService");//专家分析师管理
	List complaintsList = complaintsService.getComplaintsAllByType("1",null);//获取所有专家列表
	if(complaintsList==null){
		complaintsList=new ArrayList();
	}
	List onlineList = complaintsService.getComplaintsAllByType("1","1");//获取所有专家列表
	if(onlineList==null){
		onlineList=new ArrayList();
	}
 %>
<script type="text/javascript">
		
		function getFinanceQuestion(query){
			var url = "${ctx}/front/finance.do?method=selectAllFinanceQuestion&category=2";
			if(query!=""){
				url=url+query;
			}
			location.href=url;
		}

		function  ggcxListCrm(){
 		  var StartDate = document.getElementById("StartDate").value;
 		  var EndDate = document.getElementById("EndDate").value;
 		//  var stock_id = document.getElementById("stock_id").value;
 		  var title = document.getElementById("title").value;
 		  var zj = document.getElementById("zj").value;
 		  var wtlx = document.getElementById("wtlx").value;
 		  var dm = document.getElementById("dm").value;
 		  var url="${ctx}/front/finance.do?method=selectFQListByAnswer&category=2&webuser_id=1";
 		  if(StartDate!="")
 		  {
 		    url=url+"&beginTime="+StartDate;
 		  }
 		  if(EndDate!="")
 		  {
 		    url=url+"&endTime="+EndDate;
 		  }
 		  /*if(stock_id!="")
 		  {
 		    url=url+"&stock_id="+stock_id;
 		  }*/
 		  if(title!="")
 		  {
 		    url=url+"&keyWord="+encodeURI(title);
 		  }
 		  if(zj!="")
 		  {
 		    url=url+"&apoint_id="+zj;
 		  }
 		  if(wtlx!="")
 		  {
 		    url=url+"&type_tz="+wtlx;
 		  }
 		  if(dm!="")
 		  {
 		    url=url+"&gpdm="+encodeURI(dm);
 		  }
 		  location.href=url;
 	}
</script>
</head>
<%
	List list=null;
	if(request.getAttribute("fannaceList")!=null){
		list=(List)request.getAttribute("fannaceList");
	}
 %>
<body class="">
<jsp:include page="/share/top.jsp?nav=wsyyt&nav1=wdlczx" />

<div class="body_bg">
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
 <div class="dqwz">当前位置：<a href="/index.jsp?nav=index">首页</a> ><a href="/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a>  > <a href="/bussinesshall/movetradehall/seneschalInfo.jsp?nav=wsyyt&nav1=wdlczx">我的理财中心</a> &gt; <a href="/bussinesshall/movetradehall/myAdvisory.jsp">我的咨询服务</a></div>
  <jsp:include page="/bussinesshall/movetradehall/financing_submenu.jsp?nav3=wdzxfw" />
  <div class="blank5"></div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
    <table width="189" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
      <tr>
        <td align="center"><img src="/pic/wsyyt/wdlc/wdlc_ban1.jpg" /></td>
      </tr>
      <tr>
        <td height="5"></td>
      </tr>
      <tr>
        <td class="wdlc_ltag2"><a href="/bussinesshall/movetradehall/myAdvisory.jsp">业务咨询</a></td>
      </tr>
      <tr>
        <td class="wdlc_ltag1 white"><a href="/bussinesshall/movetradehall/myTzAdvisory.jsp">投资咨询</a></td>
      </tr>
      <tr>
        <td class="wdlc_ltag2"><a href="/bussinesshall/movetradehall/myJsAdvisory.jsp">技术支持</a></td>
      </tr>
      <tr>
        <td class="wdlc_ltag2"><a href="/bussinesshall/movetradehall/newmyAdvisory.jsp">反洗钱咨询</a></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table>
     <table width="92%" style="border-collapse:collapse" border="1" bgcolor="#ffffff" bordercolor="#cfcfcf" class="lh27 mt5" align="center">
  <tr>
    <td width="94%" class="wdzx_th indent10 bold">投资咨询查询</td>
  </tr>
  <tr>
    <td style="padding:5px">
        	<form action="" name="query" method="post">
    	<table width="100%" align="center" border="0" cellspacing="0" cellpadding="0">

      <tr>
      	<td>时间:</td>
        <td>
          <input type="text" id="StartDate" name="StartDate" onfocus="this.blur()" value="" style="width:86px; border:1px solid #c3c3c3;"  ><a href="javascript:void(0)" onclick="gfPop.fStartPop(document.query.StartDate,document.query.EndDate);return false;" HIDEFOCUS><img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="absmiddle"></a>
      </tr>
       <tr>
       <td>至:</td>
        <td>
<input type="text" name="EndDate" id="EndDate" onfocus="this.blur()" value="" style="width:86px; border:1px solid #c3c3c3;" ><a href="javascript:void(0)" onClick="gfPop.fEndPop(document.query.StartDate,document.query.EndDate);return false;" HIDEFOCUS><img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="absmiddle"></a>      </tr>
     <tr>
        <td>专家:</td>
        <td><select name="zj" id="zj">
          <option value="">--任意专家--</option>
                <%
                	for(int i=0;i<complaintsList.size();i++){
                		Complaints complaints = (Complaints)complaintsList.get(i);
                %>
                		 <option value="<%=complaints.getId() %>" ><%=complaints.getName() %></option>
                		
                <%
                	}
                 %>
        </select></td>
      </tr>
      <tr>
        <td>问题类型:</td>
        <td><select name="wtlx" id="wtlx">
          <option value="">--所有类型--</option>
          <option value="1">--个股--</option>
          <option value="2">--大盘--</option>
        </select></td>
      </tr>
      <tr>
      <td>关键字:</td>
        <td>
          <input type="text" id="title" name="title" class="input108" /></td>
      </tr>
      <tr>
      <td>股票代码:</td>
        <td>
          <input type="text" id="dm" name="dm" class="input108" /></td>
      </tr>
      <tr>
      <td height="10" colspan="2"></td>
      </tr>
      <tr>
        <td align="center" colspan="2" height="28"><a href="#" onclick="ggcxListCrm();"><img src="/pic/wsyyt/but_cx1.jpg" /></a></td>
      </tr>
    </table> </form></td>
  </tr>

</table>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始--> 
  <div class="w706 fright">
    <div class="right_tit2 red bold">
    <table width="100%">
    <tr>
    <td align="center" width="15%">投资咨询</td>
    <td align="right" width="70%"> 在线专家:
    <%
    	String onlineName = "";
    	for(int i=0;i<onlineList.size();i++){
    		Complaints complaints = (Complaints)onlineList.get(i);
    		if(i==0){
    			onlineName = complaints.getName();
    		}else{
    			onlineName = ","+complaints.getName();
    		}
    	%>
         	<%=onlineName %>
         		
        <%
    	}
     %>
    </td>
    <td align="right" width="5%"></td>
    </tr>
    </table>
    </div>
    <div class=" bg_ec mt5" style=" height:35px; vertical-align:middle">
    <div style=" height:8px; overflow:hidden"></div>
    <table width="90%" align="center" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="15%"><input type="button" name="button2" id="button2" value="我的已回复" class="but_02" onclick="getFinanceQuestion('&webuser_id=1&is_answer=1');"/></td>
      <td width="15%"><input type="button" name="button" id="button" value="我的未回复" class="but_02" onclick="getFinanceQuestion('&webuser_id=1&is_answer=0');"/></td>
      <td width="15%"></td>
    <td width="38%"></td>
      <td width="17%">
     
        <input type="button" name="button5" id="button5" value="我要咨询" onclick="location.href='/bussinesshall/movetradehall/myTzAdvisory_zx.jsp'" class="but_04" />
        </td>
      </tr>
    </table>
    </div>
<form name="myAdvisoryForm" action="${ctx}/front/finance.do?<%=url %>" method="post">
    <table width="96%" border="1" bordercolor="#cfcfcf" class="lh27 mt15" align="center">
      <tr>
        <td class="wdzx_th" width="4%" align="center">问答</td>
        <td class="wdzx_th" width="15%" align="center">作者 </td>
        <td class="wdzx_th" width="66%" align="center">问题</td>
        <td class="wdzx_th" width="15%" align="center">时间</td>
      </tr>
	<%if(list!=null&&list.size()>0) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
		for(int i=0;i<list.size();i++){
			FinanceQuestion financeQuestion=(FinanceQuestion)list.get(i);
			String wuName = financeQuestion.getWuName();
			String askContent = financeQuestion.getAskContent();
			String askTime = sdf.format(financeQuestion.getAskTime());
			%>
			<tr>
			    <td align="center">问</td>
			    <td align="center"><%=wuName %></td>
			    <td><%=askContent %></td>
			    <td align="center"><%=askTime %></td>
		    </tr>
			<% 
			if("1".equals(financeQuestion.getIsAnswer())){
				String tuName = financeQuestion.getTuName();
				String answerContent = financeQuestion.getAnswerContent();
				String answerTime = sdf.format(financeQuestion.getAnswerTime());
			%>
				<tr>
			    <td align="center">答</td>
			    <td align="center"><%=tuName %></td>
			    <td><%=answerContent %></td>
			    <td align="center"><%=answerTime %></td>
		    </tr>
			<% 
			}
		}   
	}%>
    </table>
    <div class="clearfloat"></div>
      <p align="center"> <%=PageUtil.pagination("window.myAdvisoryForm",totleCount, currentPage, pagesize)%></p>
  	</form>
  </div>
   <!--右侧sied结束--> 
    <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"/> 

</div>
</body>
<script type="text/javascript"> 
var _aq = _aq || [];
_aq.push(['_setSiteId', 10001]);_aq.push(['_setCatalogId', 34]); _aq.push(['_trackPageview']); (function() {
var ga = document.createElement( 'script'); ga.type = 'text/javascript'; ga.async = true; ga.src='http://121.8.153.59:8080/stat/stat.js'; var s = document.getElementsByTagName( 'script')[0]; s.parentNode.insertBefore(ga, s); })();
</script>
</html>