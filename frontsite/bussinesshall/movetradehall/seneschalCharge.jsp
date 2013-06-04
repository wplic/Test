<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />

<style>
.gftab1{ border-collapse:collapse; font-size:12px;}
.gftab1 th{ line-height:22px; text-align:center; background:#ebebeb;border:1px solid #d3d3d3}
.gftab1 td{ border:1px solid #d3d3d3; line-height:22px; padding:0 3px 0}
</style>
<script type="text/javascript" src="/js/jquery-1.4.2.min.js"></script>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	if(request.getParameter("nav1")!=null&&!request.getParameter("nav1").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav1"),16)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}
	if(request.getParameter("nav")!=null&&!request.getParameter("nav").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav"),16)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}
	if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav2"),16)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}
%>			
<script type="text/javascript">
		function gotoIfrm(whichCat,titleName,dv)
		{
			window.location.href = "${ctx }/bussinesshall/movetradehall/seneschalInfoNbzx.jsp?isMain=1&dv=" +dv + "&whichCat=" + whichCat + "&titleName="+ encodeURI(titleName);
		}
		
	function selectlMenu(obj1,obj2)
	{
		var obj1 = document.getElementById(obj1);
		var obj2 = document.getElementById(obj2);
		
		var temp = obj2.style.display;
		document.getElementById('board1').style.display = "none";
		document.getElementById('hor1').className = "wdlc_ltag2";
		document.getElementById('board2').style.display = "none";
		document.getElementById('hor2').className = "wdlc_ltag2";
		
		document.getElementById('board3').style.display = "none";
		document.getElementById('hor3').className = "wdlc_ltag2";
		//document.getElementById('board4').style.display = "none";
		//document.getElementById('hor4').className = "wdlc_ltag2";
		//document.getElementById('board5').style.display = "none";
		//document.getElementById('hor5').className = "wdlc_ltag2";
		if(temp == "none")
		{
			obj2.style.display = "";
			obj1.className = "wdlc_ltag1 white";
			
		}
		else
		{
			obj2.style.display = "none";
			obj1.className = "wdlc_ltag2";
		}
	}
	
	function showDv(obj)
	{
		if (document.getElementById('dv'+obj).style.display == "block")
		{
			$("#sp"+obj).html("+");
			$("#dv" + obj).css("display","none");
		}
		else
		{
			$("#sp"+obj).html("-");
			$("#dv" + obj).css("display","block");
		}
		
	}
	
	//$(document).ready(function(){
	//		alert('金管家资讯产品经过全新整合，现向广大客户进行推广，推广期一个月，推广期内免费使用，感谢您的关注!');
	//});	
</script>
</head>

<body class="body_bg">

<jsp:include page="/share/top.jsp" />
<jsp:include page="/share/pdLogin.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="${ctx }/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt;<a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a> &gt;<a> 我的理财中心</a> &gt; 我的管家资讯</div>
  <jsp:include page="financing_submenu.jsp?nav3=gdgjzx" />
  <div class="blank5"></div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
   		
   		 <table width="189" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
     
      <tr>
        <td class="wdlc_ltag2" id="hor1" onclick="selectlMenu('hor1','board1')">
     <a href="#" onclick="gotoIfrm('zxzx_glcj','国内财经');">新闻资讯</a></td>
      </tr>
      <tr id="board1" style="display:none">
        <td class="font_st welc_subtxt" >
        	<p><a onclick="gotoIfrm('zxzx_glcj','国内财经','');" href="#"  >·国内财经</a></p>
            <p><a href="#" onclick="gotoIfrm('zxzx_gjcj','国际财经','');">·国际财经</a></p>
            <p><a href="#" onclick="gotoIfrm('zxzx_gatcj','港澳台财经','');">·港澳台财经</a></p>
            <p><a href="#" onclick="gotoIfrm('zxzx_dfcj','地方财经','');" >·地方财经</a></p>
            <p><a href="#" onclick="gotoIfrm('zxzx_cjpl','财经时评','');">·财经时评</a></p>
            <p><a href="#" onclick="gotoIfrm('zxzx_hyxw','行业动态','');">·行业动态</a></p>
            <p><a href="#" onclick="gotoIfrm('zxzx_hqsc','环球市场','');">·环球市场</a></p>
            <p><a href="#" onclick="gotoIfrm('zxzx_qsdt','券商动态','');">·券商动态</a></p>
            <p><a href="#" onclick="gotoIfrm('zxzx_ztqj','专题聚焦','');">·专题聚焦</a></p>
            <p><a href="#" onclick="gotoIfrm('zxzx_jysgg_hstbts','沪市特别提示','');">·沪市特别提示</a></p>
            <p><a href="#" onclick="gotoIfrm('zxzx_jysgg_sstbts','深市特别提示','');">·深市特别提示</a></p>
        </td>
      </tr>
      <tr>
      		<td class="wdlc_ltag2" id="hor2" ><a href="#" onclick="selectlMenu('hor2','board2')">投资顾问资讯</a></td>
      </tr>
      <tr id="board2"  style="display:none">
        <td class="font_st welc_subtxt">
      
       		<p><a href="#" onclick="showDv('1');"><span id="sp1">+</span>市场速递</a></p>
        	    <div id="dv1" style="display:none" style="padding-left:10px">
        	    	  <p><a href="#" onclick="gotoIfrm('nbzx_gftzsd','广发投资速递','1');">·广发投资速递</a></p>
        	    	 <p><a href="#" onclick="gotoIfrm('nbzx_gftzsd_zkb','广发投资速递(周刊版)','1');">·广发投资速递(周刊版)</a></p>
        	    	 <p><a href="#" onclick="gotoIfrm('nbzx_pzbb','盘中播报','1');">·盘中播报</a></p>
        	    </div>
            <p><a href="#" onclick="showDv('2');" ><span id="sp2">+</span>研究内参</a></p>
             	<div id="dv2" style="display:none" style="padding-left:10px">
             		 <p><a href="#" onclick="gotoIfrm('nbzx_gffxszb','广发分析师早报','2');">·广发分析师早报</a></p>
        	    	 <p><a href="#" onclick="gotoIfrm('nbzx_gfmrtznc','广发投资内参','2');">·广发投资内参</a></p>
        	    </div>
            <p><a href="#" onclick="showDv('3');"><span id="sp3">+</span>产品策略</a></p>
             	<div id="dv3" style="display:none" style="padding-left:10px">
             		<!--  <p><a href="#" onclick="gotoIfrm('nbzx_jjtzzk','基金投资内参','dv3');">·基金投资内参</a></p> -->
        	    	 <p><a href="#"  onclick="showDv('31');"><span id="sp31">+</span>基金投资内参</a></p>
        	    	 	<div id="dv31" style="display:none" style="padding-left:15px">
        	    	 		
        	    	 		<p><a href="#" onclick="gotoIfrm('nbzx_sczx','市场资讯','31');">·市场资讯</a></p>
        	    	 		<p><a href="#" onclick="gotoIfrm('nbzx_jjxt','基金学堂','31');">·基金学堂</a></p>
        	    	 		<p><a href="#" onclick="gotoIfrm('nbzx_jjzk','基金投资周刊','31');">·基金投资周刊</a></p>
        	    	 		<p><a href="#" onclick="gotoIfrm('nbzx_jjydbg','基金月度报告','31');">·基金月度报告</a></p>
        	    	 		<p><a href="#" onclick="gotoIfrm('nbzx_jjtzzh','基金季度投资组合分析','dv31');">·基金季度投资组合分析</a></p>
        	    	 		<p><a href="#" onclick="gotoIfrm('nbzx_dp','年报点评','dv31');">·年报点评</a></p>
        	    	 		<p><a href="#" onclick="gotoIfrm('nbzx_jjtj','重点基金推荐','31');">·重点基金推荐</a></p>
        	    	 		<p><a href="#" onclick="gotoIfrm('nbzx_jjqt','其他','31');">·其他</a></p>
        	    	 	</div>
        	    	 <p><a href="#" onclick="gotoIfrm('nbzx_jgjxxpl','金管家基金投资示范组合','3');">·金管家基金投资示范组合</a></p>
        	    	 <p><a href="#" onclick="gotoIfrm('nbzx_jgjgptzzh','金管家股票投资示范组合','3');">·金管家股票投资示范组合</a></p>		
        	    	 <p><a href="#" onclick="gotoIfrm('nbzx_scclbg','A股市场策略报告','3');">·A股市场策略报告</a></p>
        	    	 <p><a href="#" onclick="gotoIfrm('nbzx_ysptzzk','衍生品投资周刊','3');">·衍生品投资周刊</a></p>
        	    	 <p><a href="#" onclick="gotoIfrm('nbzx_dfxcpyb','低风险投资月报','3');">·低风险投资月报</a></p>
        	    	
        	    	  
        	    </div>
        </td>
      </tr>
      
      
      
      
      
        <tr>
      		<td class="wdlc_ltag2" id="hor3" ><a href="#" onclick="selectlMenu('hor3','board3')">研究报告资讯</a></td>
      </tr>
      <tr id="board3"  style="display:none">
        <td class="font_st welc_subtxt">
        	<p><a href="#" onclick="showDv('4');"><span id="sp4">+</span>广发研究</a></p>
        	    <div id="dv4" style="display:none" style="padding-left:10px">
        	    
        	    	 <p><a href="#"  onclick="gotoIfrm('nbzx_gfcb','广发晨间资讯','4');" >·广发晨间资讯</a></p>
        	    	 <p><a href="#" onclick="gotoIfrm('zqyj_yjbg_ch','广发证券晨会纪要','4');" >·广发证券晨会纪要</a></p>
        	    	 <p><a href="#" onclick="gotoIfrm('nbzx_xgcjzx','香港财经资讯','4');" >·香港财经资讯</a></p>
        	    	  <p><a href="#" onclick="gotoIfrm('zqyj_gfyj_qh','广发期货报告','4');" >·广发期货报告</a></p>
        	    	 
        	    	 <p><a href="#" onclick="gotoIfrm('zqyj_yjbg_gsyj','公司类研究报告','4');" >·公司类研究报告</a></p>
		            <p><a href="#" onclick="gotoIfrm('zqyj_yjbg_hgyj','宏观类研究报告','4');" >·宏观类研究报告</a></p>
		            <p><a href="#" onclick="gotoIfrm('zqyj_yjbg_scyj','市场策略研究','4');" >·市场策略研究</a></p>
		            <p><a href="#" onclick="gotoIfrm('zqyj_yjbg_hyyj','行业研究报告','4');" >·行业研究报告</a></p>
		            <p><a href="#" onclick="gotoIfrm('zqyj_yjbg_gdsycy','债券研究报告','4');" >·债券研究报告</a></p>
		            <p><a href="#" onclick="gotoIfrm('zqyj_yjbg_jjyj','基金市场报告','4');" >·基金市场报告</a></p>
		            <p><a href="#" onclick="gotoIfrm('zqyj_yjbg_yspyj','衍生品市场报告','4');" >·衍生品市场报告</a></p>
		            <p><a href="#" onclick="gotoIfrm('zqyj_yjbg_qtzt','广发研究一周回顾','4');" >·广发研究一周回顾</a></p>
        	    	 
        	    </div>
            <p><a href="#" onclick="showDv('5');" ><span id="sp5">+</span>第三方研究</a></p>
             	<div id="dv5" style="display:none" style="padding-left:10px">
        	    	 <p><a href="${ctx }/vip.do?method=getJrsjGazxList&whichCat=01&dv=5">·公司研究</a></p>
		            <p><a href="${ctx }/vip.do?method=getJrsjGazxList&whichCat=02&dv=5">·行业研究</a></p>
		            <p><a href="${ctx }/vip.do?method=getJrsjGazxList&whichCat=03&dv=5">·策略研究</a></p>
		            <p><a href="${ctx }/vip.do?method=getJrsjGazxList&whichCat=04&dv=5">·股票市场</a></p>
		            <p><a href="${ctx }/vip.do?method=getJrsjGazxList&whichCat=05&dv=5">·基金市场</a></p>
		            <p><a href="${ctx }/vip.do?method=getJrsjGazxList&whichCat=06&dv=5">·债券市场</a></p>
		            <p><a href="${ctx }/vip.do?method=getJrsjGazxList&whichCat=07&dv=5">·金融工程</a></p>
		            <p><a href="${ctx }/vip.do?method=getJrsjGazxList&whichCat=08&dv=5">·宏观研究</a></p>
		            <p><a href="${ctx }/vip.do?method=getJrsjGazxList&whichCat=09&dv=5">·专题研究</a></p>
		            <p><a href="${ctx }/vip.do?method=getJrsjGazxGgpjList&dv=5">·个股评级</a></p>
		            <p><a href="${ctx }/vip.do?method=getJrsjBgylycbList&dv=5">·盈利预测</a></p>
		            <p><a href="${ctx }/zxtzpj.do?method=getZxtzpjList&dv=5">·最新投资评级</a></p>
		            <p><a href="${ctx }/jggpc.do?method=getJggpcList&dv=5">·机构股票池</a></p>
		            <p><a href="${ctx }/pjtggg.do?method=getPjtgggList&dv=5">·评级调高个股</a></p>
        	    </div>
            
        </td>
      </tr>
      <tr>
      		<td class="wdlc_ltag2" id="hor4" ><a href="#" onclick="gotoIfrm('nbzx_jjgs','基金公司资讯','');">基金公司资讯</a></td>
      </tr>
      
      
    
    </table>
    
  </div>
  <div class="iptvside_bot"></div>
  <table width="100%" cellpadding="0" cellspacing="5" border="0">
  		
    	<tr>
        <td align="center"><a href="http://get.adobe.com/cn/reader/"><img src="/pic/wsyyt/wdlc/downpdf.jpg" border="0" /></a></td>
      </tr>
    </table>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始--> 
  <div class="w706 fright">
 <table cellspacing="0" cellpadding="0" width="100%" class="gftab1">
  <tr>
    <th width="177" colspan="2" valign="top"><p align="center"><strong>类别 </strong></p></th>
    <th width="163" valign="top">内容</th>
    <th width="57" valign="top">财经汇</th>
    <th width="66" valign="top">财智汇</th>
    <th width="67" valign="top">财富汇</th>
    <th width="90" valign="top">自选提佣水平</th>
  </tr>
  <tr>
    <td width="177" colspan="2" rowspan="11" valign="top"><p align="center">&nbsp;</p>
      <p align="center">&nbsp;</p>
      <p align="center">&nbsp;</p>
      <p align="center">&nbsp;</p>
      <p align="center">新闻资讯 </p></td>
    <td width="163" valign="top"><p>国内财经 </p></td>
    <td width="57" valign="top"><p>★ </p></td>
    <td width="66" valign="top"><p>★ </p></td>
    <td width="67" valign="top"><p>★ </p></td>
    <td width="78" rowspan="11" valign="top"><p align="center">免费 </p></td>
  </tr>
  <tr>
    <td width="163" valign="top"><p>国际财经 </p></td>
    <td width="57" valign="top"><p>★ </p></td>
    <td width="66" valign="top"><p>★ </p></td>
    <td width="67" valign="top"><p>★ </p></td>
  </tr>
  <tr>
    <td width="163" valign="top"><p>港澳台财经 </p></td>
    <td width="57" valign="top"><p>★ </p></td>
    <td width="66" valign="top"><p>★ </p></td>
    <td width="67" valign="top"><p>★ </p></td>
  </tr>
  <tr>
    <td width="163" valign="top"><p>地方财经 </p></td>
    <td width="57" valign="top"><p>★ </p></td>
    <td width="66" valign="top"><p>★ </p></td>
    <td width="67" valign="top"><p>★ </p></td>
  </tr>
  <tr>
    <td width="163" valign="top"><p>财经时评 </p></td>
    <td width="57" valign="top"><p>★ </p></td>
    <td width="66" valign="top"><p>★ </p></td>
    <td width="67" valign="top"><p>★ </p></td>
  </tr>
  <tr>
    <td width="163" valign="top"><p>行业动态 </p></td>
    <td width="57" valign="top"><p>★ </p></td>
    <td width="66" valign="top"><p>★ </p></td>
    <td width="67" valign="top"><p>★ </p></td>
  </tr>
  <tr>
    <td width="163" valign="top"><p>环球市场 </p></td>
    <td width="57" valign="top"><p>★ </p></td>
    <td width="66" valign="top"><p>★ </p></td>
    <td width="67" valign="top"><p>★ </p></td>
  </tr>
  <tr>
    <td width="163" valign="top"><p>券商动态 </p></td>
    <td width="57" valign="top"><p>★ </p></td>
    <td width="66" valign="top"><p>★ </p></td>
    <td width="67" valign="top"><p>★ </p></td>
  </tr>
  <tr>
    <td width="163" valign="top"><p>专题聚焦 </p></td>
    <td width="57" valign="top"><p>★ </p></td>
    <td width="66" valign="top"><p>★ </p></td>
    <td width="67" valign="top"><p>★ </p></td>
  </tr>
  <tr>
    <td width="163" valign="top"><p>沪市特别提示 </p></td>
    <td width="57" valign="top"><p>★ </p></td>
    <td width="66" valign="top"><p>★ </p></td>
    <td width="67" valign="top"><p>★ </p></td>
  </tr>
  <tr>
    <td width="163" valign="top"><p>深市特别提示 </p></td>
    <td width="57" valign="top"><p>★ </p></td>
    <td width="66" valign="top"><p>★ </p></td>
    <td width="67" valign="top"><p>★ </p></td>
  </tr>
  <tr>
    <td width="97" rowspan="10" valign="top"><p align="center">&nbsp;</p>
      <p align="center">&nbsp;</p>
      <p align="center">&nbsp;</p>
      <p align="center">投资顾问资讯 </p></td>
    <td width="80" rowspan="2" valign="top"><p align="center">&nbsp;</p>
      <p align="center">市场速递 </p></td>
    <td width="163" valign="top"><p>广发投资速递(日刊、周刊) </p></td>
    <td width="57" valign="top"><p>★ </p></td>
    <td width="66" valign="top"><p>★ </p></td>
    <td width="67" valign="top"><p>★ </p></td>
    <td width="78" valign="top"><p>0．0001</p></td>
  </tr>
  <tr>
    <td width="163" valign="top"><p>广发《盘中播报》 </p></td>
    <td width="57" valign="top"><p>&nbsp;</p></td>
    <td width="66" valign="top"><p>★ </p></td>
    <td width="67" valign="top"><p>★ </p></td>
    <td width="78" valign="top"><p>0．0001</p></td>
  </tr>
  <tr>
    <td width="80" rowspan="2" valign="top"><p align="center">&nbsp;</p>
      <p align="center">研究内参 </p></td>
    <td width="163" valign="top"><p>广发分析师早报 </p></td>
    <td width="57" valign="top"><p>&nbsp;</p></td>
    <td width="66" valign="top"><p>★ </p></td>
    <td width="67" valign="top"><p>★ </p></td>
    <td width="78" valign="top"><p>0．0002</p></td>
  </tr>
  <tr>
    <td width="163" valign="top"><p>广发投资内参(含内参快讯)</p></td>
    <td width="57" valign="top"><p>&nbsp;</p></td>
    <td width="66" valign="top"><p>★ </p></td>
    <td width="67" valign="top"><p>★ </p></td>
    <td width="78" valign="top"><p>0．0002</p></td>
  </tr>
  <tr>
    <td width="80" rowspan="6" valign="top"><p align="center">&nbsp;</p>
      <p align="center">&nbsp;</p>
      <p align="center">产品策略 </p></td>
    <td width="163" valign="top"><p>基金投资内参 </p></td>
    <td width="57" valign="top"><p>★ </p></td>
    <td width="66" valign="top"><p>★ </p></td>
    <td width="67" valign="top"><p>★ </p></td>
    <td width="78" valign="top"><p>0．0001</p></td>
  </tr>
  <tr>
    <td width="163" valign="top"><p>金管家基金投资示范组合 </p></td>
    <td width="57" valign="top"><p>&nbsp;</p></td>
    <td width="66" valign="top"><p>★ </p></td>
    <td width="67" valign="top"><p>★ </p></td>
    <td width="78" valign="top"><p>0．0001</p></td>
  </tr>
  <tr>
    <td width="163" valign="top"><p>金管家股票投资示范组合 </p></td>
    <td width="57" valign="top"><p>&nbsp;</p></td>
    <td width="66" valign="top"><p>★ </p></td>
    <td width="67" valign="top"><p>★ </p></td>
    <td width="78" valign="top"><p>0．0001</p></td>
  </tr>
  <tr>
    <td width="163" valign="top"><p>A股市场策略报告 </p></td>
    <td width="57" valign="top"><p>&nbsp;</p></td>
    <td width="66" valign="top"><p>★ </p></td>
    <td width="67" valign="top"><p>★ </p></td>
    <td width="78" valign="top"><p>0．0001</p></td>
  </tr>
  <tr>
    <td width="163" valign="top"><p>衍生品投资周刊 </p></td>
    <td width="57" valign="top"><p>★ </p></td>
    <td width="66" valign="top"><p>★ </p></td>
    <td width="67" valign="top"><p>★ </p></td>
    <td width="78" valign="top"><p>0．0001</p></td>
  </tr>
  <tr>
    <td width="163" valign="top"><p>低风险投资月报 </p></td>
    <td width="57" valign="top"><p>★ </p></td>
    <td width="66" valign="top"><p>★ </p></td>
    <td width="67" valign="top"><p>★ </p></td>
    <td width="78" valign="top"><p>0．0001</p></td>
  </tr>
  <tr>
    <td width="97" rowspan="10"><p align="center">&nbsp;</p>
      <p align="center">&nbsp;</p>
      <p align="center">研究报告资讯 </p></td>
    <td width="80" rowspan="7"><p align="center">广发研究 </p></td>
    <td width="163" valign="top"><p>广发晨间资讯 </p></td>
    <td width="57" valign="top"><p>&nbsp;</p></td>
    <td width="66" valign="top"><p>★ </p></td>
    <td width="67" valign="top"><p>★ </p></td>
    <td width="78" valign="top"><p>0．0001</p></td>
  </tr>
  <tr>
    <td width="163" valign="top"><p>广发证券晨会纪要 </p></td>
    <td width="57" valign="top"><p>&nbsp;</p></td>
    <td width="66" valign="top"><p>&nbsp;</p></td>
    <td width="67" valign="top"><p>★ </p></td>
    <td width="78" valign="top"><p>0．0002</p></td>
  </tr>
  <tr>
    <td width="163" valign="top"><p>香港财经资讯 </p></td>
    <td width="57" valign="top"><p>&nbsp;</p></td>
    <td width="66" valign="top"><p>★ </p></td>
    <td width="67" valign="top"><p>★ </p></td>
    <td width="78" valign="top"><p>0．0001</p></td>
  </tr>
  <tr>
    <td width="163" valign="top"><p>广发期货报告 </p></td>
    <td width="57" valign="top"><p>&nbsp;</p></td>
    <td width="66" valign="top"><p>★ </p></td>
    <td width="67" valign="top"><p>★ </p></td>
    <td width="78" valign="top"><p>0．0001</p></td>
  </tr>
  <tr>
    <td width="163" valign="top"><p>广发研究报告目录 </p></td>
    <td width="57" valign="top"><p>★ </p></td>
    <td width="66" valign="top"><p>★ </p></td>
    <td width="67" valign="top"><p>★ </p></td>
    <td width="78" valign="top"><p>0．0001</p></td>
  </tr>
  <tr>
    <td width="163" valign="top"><p>广发研究报告摘要 </p></td>
    <td width="57" valign="top"><p>&nbsp;</p></td>
    <td width="66" valign="top"><p>★ </p></td>
    <td width="67" valign="top"><p>★ </p></td>
    <td width="78" valign="top"><p>0．0001</p></td>
  </tr>
  <tr>
    <td width="163" valign="top"><p>广发研究报告 </p></td>
    <td width="57" valign="top"><p>&nbsp;</p></td>
    <td width="66" valign="top"><p>&nbsp;</p></td>
    <td width="67" valign="top"><p>★ </p></td>
    <td width="78" valign="top"><p>0．0002</p></td>
  </tr>
  <tr>
    <td width="80" rowspan="3"><p align="center">第三方研究 </p></td>
    <td width="163" valign="top"><p>第三方研究报告目录 </p></td>
    <td width="57" valign="top"><p>★ </p></td>
    <td width="66" valign="top"><p>★ </p></td>
    <td width="67" valign="top"><p>★ </p></td>
    <td width="78" valign="top"><p>0．0001</p></td>
  </tr>
  <tr>
    <td width="163" valign="top"><p>第三方研究报告摘要 </p></td>
    <td width="57" valign="top"><p>&nbsp;</p></td>
    <td width="66" valign="top"><p>★ </p></td>
    <td width="67" valign="top"><p>★ </p></td>
    <td width="78" valign="top"><p>0．0001</p></td>
  </tr>
  <tr>
    <td width="163" valign="top"><p>第三方研究报告 </p></td>
    <td width="57" valign="top"><p>&nbsp;</p></td>
    <td width="66" valign="top"><p>&nbsp;</p></td>
    <td width="67" valign="top"><p>★ </p></td>
    <td width="78" valign="top"><p>0．0002</p></td>
  </tr>
  <tr>
    <td width="177" colspan="2" valign="top"><p align="center">基金公司资讯 </p></td>
    <td width="163" valign="top"><p><strong>&nbsp;</strong></p></td>
    <td width="57" valign="top"><p><strong>&nbsp;</strong></p></td>
    <td width="66" valign="top"><p>★ </p></td>
    <td width="67" valign="top"><p>★ </p></td>
    <td width="78" valign="top"><p>0．0001<strong> </strong></p></td>
  </tr>
</table>
  </div>
   <!--右侧sied结束--> 
    <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />

</body>
</html>