<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script src="/js/setTab.js"></script>
<jsp:include page="/share/pdLogin.jsp" />
<%
	Object flag = request.getAttribute("flag");
	if(flag!=null&&flag.equals("success")){
	%>
	<script type="text/javascript">
		alert("提交成功");
		window.location.href="${ctx}/front/finance.do?method=selectAllFinanceQuestion&category=1&webuser_id=1&is_answer=0";
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
 		  var url="${ctx}/front/finance.do?method=selectFQListByAnswer&category=1&webuser_id=1";
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
        <td class="wdlc_ltag1 white"><a href="/bussinesshall/movetradehall/myAdvisory.jsp">业务咨询</a></td>
      </tr>
      <!-- <tr>
        <td class="wdlc_ltag2"><a href="/bussinesshall/movetradehall/myTzAdvisory.jsp">投资咨询</a></td>
      </tr> -->
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
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始--> 
  <div class="w706 fright">
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td class="wdzx_tit1 red bold">业务咨询</td>
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
        <form action="${ctx}/front/finance.do?method=addQuestion&category=1" method="post" onsubmit="return check();">
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
          </form></td>
        <td class="ptb13" valign="top"><table width="90%" align="center" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="95%" class="bold">小贴士:</td>
          </tr>
          <tr>
            <td>为了节省您的时间，提高工作效率，
              避免出现重复的问题，强烈建议您
              在提问前先查询一下您所关心的问
              题。</td>
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