<%request.setCharacterEncoding("UTF-8");%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script src="/js/setTab.js"></script>
<jsp:include page="/share/pdLogin.jsp" />
<%
	String url="";
	if(request.getAttribute("flag")==null){
	%>
		<script type="text/javascript">
		window.location.href="${ctx}/front/finance.do?method=selectAllFinanceQuestion&category=5&webuser_id=1&is_answer=1";
		</script>
	<%
	}else{
		url=request.getQueryString();
	}
 %>
<script type="text/javascript">
		
		function getFinanceQuestion(query){
			var url = "${ctx}/front/finance.do?method=selectAllFinanceQuestion&category=5";
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
 		  var url="${ctx}/front/finance.do?method=selectFQListByAnswer&category=5&webuser_id=1";
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
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=wsyyt&nav1=wdlczx" />
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
      <!-- <tr>
        <td class="wdlc_ltag2">
        <a href="/bussinesshall/movetradehall/myTzAdvisory.jsp">投资咨询</a></td>
      </tr> -->
      <tr>
        <td class="wdlc_ltag2"><a href="/bussinesshall/movetradehall/myJsAdvisory.jsp">技术支持</a></td>
      </tr>
       <tr>
        <td class="wdlc_ltag1 white"><a href="/bussinesshall/movetradehall/newmyAdvisory.jsp">反洗钱咨询</a></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table>
    <table width="92%" style="border-collapse:collapse" border="1" bgcolor="#ffffff" bordercolor="#cfcfcf" class="lh27 mt5" align="center">
  <tr>
    <td width="94%" class="wdzx_th indent10 bold">反洗钱咨询</td>
  </tr>
  <tr>
    <td style="padding:5px">
        	<form action="" name="query" method="post">
    	<table width="92%" align="center" border="0" cellspacing="0" cellpadding="0">

      <tr>
      	<td>时    间：</td>
        <td>
          <input type="text" id="StartDate" name="StartDate" onfocus="this.blur()" value="" style="width:86px; border:1px solid #c3c3c3;"  ><a href="javascript:void(0)" onclick="gfPop.fStartPop(document.query.StartDate,document.query.EndDate);return false;" HIDEFOCUS><img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="absmiddle"></a>
      </tr>
       <tr>
       <td>至</td>
        <td>
<input type="text" name="EndDate" id="EndDate" onfocus="this.blur()" value="" style="width:86px; border:1px solid #c3c3c3;" ><a href="javascript:void(0)" onClick="gfPop.fEndPop(document.query.StartDate,document.query.EndDate);return false;" HIDEFOCUS><img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="absmiddle"></a>      </tr>
      <tr>
      <td>关键字:</td>
        <td>
          <input type="text" id="title" name="title" class="input108" /></td>
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
    <div class="right_tit2 red bold">反洗钱咨询</div>
    <div class=" bg_ec mt5" style=" height:35px; vertical-align:middle">
    <div style=" height:8px; overflow:hidden"></div>
    <table width="90%" align="center" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="15%"><input type="button" name="button2" id="button2" value="我的已回复" class="but_02" onclick="getFinanceQuestion('&webuser_id=1&is_answer=1');"/></td>
      <td width="15%"><input type="button" name="button" id="button" value="我的未回复" class="but_02" onclick="getFinanceQuestion('&webuser_id=1&is_answer=0');"/></td>
        <td width="15%"></td>
         <td width="38%"></td>
      <td width="17%"><input type="button" name="button5" id="button5" value="我要咨询" onclick="location.href='/bussinesshall/movetradehall/newmyAdvisory_zx.jsp'" class="but_04" /></td>
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
			if(wuName==null||wuName.equals("")){
				wuName="游客";
			}
			String askContent = financeQuestion.getAskContent();
			String askTime = sdf.format(financeQuestion.getAskTime());
			%>
			<tr>
			    <td align="center">问</td>
			    <td align="center"><%=wuName %></td>
			    <td>&nbsp;&nbsp;<%=askContent %></td>
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
			    <td>&nbsp;&nbsp;<%=answerContent %></td>
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
  <br/><br/>
  <div>
  		<p>&nbsp;&nbsp;&nbsp;&nbsp;<img src="../pic/msindex/list_02.gif"/>&nbsp;&nbsp;&nbsp;<a href="/bussinesshall/movetradehall/ChinaFxqf.jsp" target="_Blank">中华人民共和国反洗钱法</a>
  		&nbsp;&nbsp;&nbsp;&nbsp;<img src="../pic/msindex/list_02.gif"/>&nbsp;<a href="/bussinesshall/movetradehall/kyjygl.jsp" target="_Blank">《金融机构报告涉嫌恐怖融资的可疑交易管理办法》</a></p><br/>
  		<p>&nbsp;&nbsp;&nbsp;&nbsp;<img src="../pic/msindex/list_02.gif"/>&nbsp;<a href="/bussinesshall/movetradehall/ChinaBankfxqgd.jsp" target="_Blank">《金融机构反洗钱规定》</a>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../pic/msindex/list_02.gif"/>&nbsp;<a href="/bussinesshall/movetradehall/big_ky.jsp" target="_Blank">《金融机构大额交易和可疑交易报告管理办法》</a></p><br/>
  		<p>&nbsp;&nbsp;&nbsp;&nbsp;<img src="../pic/msindex/list_02.gif"/>&nbsp;<a href="/bussinesshall/movetradehall/jyjl_sfxb.jsp" target="_Blank">《金融机构客户身份识别和客户身份资料及交易记录保存管理办法》</a></p>
  </div>
   <!--右侧sied结束--> 
    <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"/> 
</body>
</html>