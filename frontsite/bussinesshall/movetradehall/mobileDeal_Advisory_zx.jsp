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

<%
	Object flag = request.getAttribute("flag");
	if(flag!=null&&flag.equals("success")){
	%>
	<script type="text/javascript">
		alert("提交成功");
		window.location.href="${ctx}/front/finance.do?method=selectAllFinanceQuestion&category=4&webuser_id=1&type_js=2";
	</script>
	<%
	}else if(flag!=null&&flag.equals("fail")){
	%>
	<script type="text/javascript">
		alert("提交失败");
	</script>
	<%
	}
 %>
 
 <script type="text/javascript">
 
 	function ask_contentClear(){
		if(document.getElementById("ask_content").value=="请不要超过500字！"){
 			document.getElementById("ask_content").value="";
 		}
	}
 
 	function check(){
 		if(document.getElementById("ask_content").value==""||document.getElementById("ask_content").value=="请不要超过500字！"){
 			alert("请填写咨询内容！");
 			return false;
 		}
 		if(document.getElementById("ask_content").value.legth>500){
 			alert("请不要超过500字！");
 			return false;
 		}
 		return true;
 	} 
 	
 	function  ggcxListCrm(){
 		  var StartDate = document.getElementById("StartDate").value;
 		  var EndDate = document.getElementById("EndDate").value;
 		//  var stock_id = document.getElementById("stock_id").value;
 		  var title = document.getElementById("title").value;
 		  var url="${ctx}/front/finance.do?method=selectFQListByAnswer&category=4&webuser_id=1&type_js=2";
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
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=wsyyt&nav1=gfydjyt" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a>  &gt; <a href="${ctx }/bussinesshall/movetradehall/mobileDeal.jsp?nav=wsyyt&nav1=gfydjyt">金管家手机证券</a>&gt;技术咨询</div>
  <div class="blank5"></div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="mobileDeal_lmenu.jsp?nav2=jszx" />
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td class="wdzx_tit1 red bold">广发移动交易厅技术咨询</td>
      </tr>
    </table>
    <table width="100%" border="1" bordercolor="#cfcfcf" cellpadding="0" cellspacing="0" align="center" bgcolor="#eceff4" class="lh28">
      <tr>
        <td width="480" class="ptb13" valign="top"><table width="90%" align="center" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="5%"><img src="/pic/wsyyt/wdlc/list_01.gif" width="13" height="12" /></td>
            <td width="95%" class="bold">请提出您的问题：</td>
          </tr>
        </table>
        <form action="${ctx}/front/finance.do?method=addQuestion&category=4&type_js=2&webuser_id=1" method="post" onsubmit="return check();">
          <table width="90%" style="border-collapse:collapse" border="1" bgcolor="#ffffff" bordercolor="#cfcfcf" class="lh27 mt5" align="center">
            <tr>
              <td width="94%" class="wdzx_th indent10 bold">&nbsp;</td>
            </tr>
            <tr>
              <td style="padding:5px"><textarea name="ask_content" id="ask_content" cols="45" rows="10" style=" width:420px; border:0" onclick="ask_contentClear()">请不要超过500字！</textarea></td>
            </tr>
          </table>
          <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="mt15">
            <tr>
              <td width="63%">&nbsp;</td>
              <td width="37%" align="center"><input type="submit" name="button6" id="button6" value="提　交" class="but_03" />
                <input type="reset" name="button6" id="button7" value="重　写" class="but_03" /></td>
            </tr>
          </table>
          </form>
          </td>
        <td class="ptb13" valign="top">
        <table width="90%" align="center" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="95%" class="bold">尊敬的客户：</td>
          </tr>
          <tr>
            <td>我们在线答复的时间是早上9：00—11：30下午13：00---17：00如果您不是在这个时段提出的问题，请您写下您对问题，我们将在第二天工作时间尽快给你答复。</td>
          </tr>
        </table>
          <table width="92%" style="border-collapse:collapse" border="1" bgcolor="#ffffff" bordercolor="#cfcfcf" class="lh27 mt5" align="center">
  <tr>
    <td width="94%" class="wdzx_th indent10 bold">业务咨询查询</td>
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
          </td>
      </tr>
    </table>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"/> 
</body>
</html>