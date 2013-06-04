<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
		String cartName = request.getParameter("cartName");
		
 %>
 
<html xmlns="http://www.w3.org/1999/xhtml">
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
	if(request.getParameter("whichCat")!=null&&!request.getParameter("whichCat").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("whichCat"),18)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}
if(request.getParameter("cartName")!=null&&!request.getParameter("cartName").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("cartName"),18)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}			
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery-1.4.2.min.js"></script>

<script type="text/javascript">
		function gotoIfrm(whichCat,titleName)
		{
			window.location.href = "${ctx }/bussinesshall/movetradehall/seneschalInfoNbzx.jsp?isMain=1&whichCat=" + whichCat + "&titleName="+ encodeURI(titleName);
		}
		function  ggcxListCrm(){
 		  var StartDate = document.getElementById("StartDate").value;
 		  var EndDate = document.getElementById("EndDate").value;
 		  var title = document.getElementById("title").value;
 		  var cartName = document.getElementById("cartName").value;
 		  var keyword = "";
 		  var stock_id = "" ;
 		  if ("null" == cartName || cartName == ""  )
 		  {
 		  		
 		  		cartName = "nbzx_gfmrtznc";
 		  }
 		  var url="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat="+cartName;
 		  if(StartDate!="")
 		  {
 		    url=url+"&StartDate="+StartDate;
 		  }
 		  if(EndDate!="")
 		  {
 		    url=url+"&EndDate="+EndDate;
 		  }
 		 
		if(null!=stock_id && stock_id !="")
		{
			url = url + "stock_id="+stock_id+"&" ;
		}
 		  if(keyword!="")
 		  {
 		    url=url+"&keyword="+encodeURI(keyword);
 		  }
 		  if(title!="")
 		  {
 		    url=url+"&title="+encodeURI(title);
 		  }
 		  document.getElementById("ifm").src=url;
 	}
 	
 	function resetCartName(cartName,titleName )
 	{
 			
 			document.getElementById('titleName').innerHTML = titleName;
 			document.getElementById('cartName').value = cartName;
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
		document.getElementById('board4').style.display = "none";
		document.getElementById('hor4').className = "wdlc_ltag2";
		document.getElementById('board6').style.display = "none";
		document.getElementById('hor6').className = "wdlc_ltag2";	
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
</script>
</head>

<body class="body_bg">
<jsp:include page="/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a>  &gt;  我的理财中心 &gt; 我的管家资讯</div>
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
        <td class="wdlc_ltag1" id="hor1" onclick="selectlMenu('hor1','board1')">
     <a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=nbzx_gfmrtznc" onclick="resetCartName('zxzx_glcj','国内财经');"  target="ifm">新闻资讯</a></td>
      </tr>
      <tr id="board1" >
        
        <td class="font_st welc_subtxt" >
        	<p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=zxzx_glcj"  onclick="resetCartName('zxzx_glcj','国内财经');"  target="ifm">·国内财经</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=zxzx_gjcj" onclick="resetCartName('zxzx_gjcj','国际财经');"  target="ifm">·国际财经</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=zxzx_gatcj" onclick="resetCartName('zxzx_gatcj','港澳台财经');"  target="ifm">·港澳台财经</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=zxzx_dfcj" onclick="resetCartName('zxzx_dfcj','地方财经');"  target="ifm">·地方财经</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=zxzx_cjpl" onclick="resetCartName('zxzx_cjpl','财经时评');"  target="ifm">·财经时评</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=zxzx_hyxw" onclick="resetCartName('zxzx_hyxw','行业动态');" target="ifm">·行业动态</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=zxzx_hqsc" onclick="resetCartName('zxzx_hqsc','环球市场');" target="ifm">·环球市场</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=zxzx_qsdt" onclick="resetCartName('zxzx_qsdt','券商动态');" target="ifm">·券商动态</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=zxzx_ztqj" onclick="resetCartName('zxzx_ztqj','专题聚焦');" target="ifm">·专题聚焦</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=zxzx_jysgg_hstbts" onclick="resetCartName('zxzx_jysgg_hstbts','沪市特别提示');"  target="ifm">·沪市特别提示</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=zxzx_jysgg_sstbts" onclick="resetCartName('zxzx_jysgg_sstbts','深市特别提示');" target="ifm">·深市特别提示</a></p>
        </td>
      </tr>
       <tr>
      		<td class="wdlc_ltag2" id="hor2" ><a href="#" onclick="selectlMenu('hor2','board2')">投资顾问资讯</a></td>
      </tr>
      <tr id="board2"  style="display:none">
        <td class="font_st welc_subtxt">
        	<p><a href="#" onclick="showDv('1');"><span id="sp1">+</span>市场速递</a></p>
        	    <div id="dv1" style="display:none" style="padding-left:10px">
        	    	 <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=nbzx_gftzsd"  onclick="resetCartName('nbzx_gftzsd','广发投资速递');" target="ifm">·广发投资速递</a></p>
        	    	 <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=nbzx_gftzsd_zkb" onclick="resetCartName('nbzx_gftzsd_zkb','广发投资速递(周刊版)');" target="ifm">·广发投资速递(周刊版)</a></p>
        	    	  <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=nbzx_pzbb" onclick="resetCartName('nbzx_pzbb',盘中播报');" target="ifm">·盘中播报</a></p>
        	    </div>
            <p><a href="#" onclick="showDv('2');" ><span id="sp2">+</span>研究内参</a></p>
             	<div id="dv2" style="display:none" style="padding-left:10px">
        	    	 <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=nbzx_gffxszb" onclick="resetCartName('nbzx_gffxszb','广发分析师早报');" target="ifm">·广发分析师早报</a></p>
        	    	 <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=nbzx_gfmrtznc" onclick="resetCartName('nbzx_gfmrtznc','广发投资内参');" target="ifm">·广发投资内参</a></p>
        	    </div>
            <p><a href="#" onclick="showDv('3');"><span id="sp3">+</span>产品策略</a></p>
             	<div id="dv3" style="display:none" style="padding-left:10px">
             		 <p><a href="#"  onclick="showDv('31');"><span id="sp31">+</span>基金投资内参</a></p>
        	    	 	<div id="dv31" style="display:none" style="padding-left:15px">
        	    	 		<p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=nbzx_sczx" onclick="resetCartName('nbzx_sczx','市场资讯');" target="ifm">·市场资讯</a></p>
        	    	 		<p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=nbzx_jjxt" onclick="resetCartName('nbzx_jjxt','基金学堂');" target="ifm">·基金学堂</a></p>
        	    	 		<p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=nbzx_jjzk" onclick="resetCartName('nbzx_jjzk','基金投资周刊');" target="ifm">·基金投资周刊</a></p>
        	    	 		<p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=nbzx_jjydbg" onclick="resetCartName('nbzx_jjydbg','基金月度报告');" target="ifm">·基金月度报告</a></p>
        	    	 		<p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=nbzx_jjtzzh" onclick="resetCartName('nbzx_jjtzzh','基金季度投资组合分析');" target="ifm">·基金季度投资组合分析</a></p>
        	    	 		<p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=nbzx_dp" onclick="resetCartName('nbzx_dp','年报点评');" target="ifm">·年报点评</a></p>
        	    	 		<p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=nbzx_jjtj" onclick="resetCartName('nbzx_jjtj','重点基金推荐');" target="ifm">·重点基金推荐</a></p>
        	    	 		<p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=nbzx_jjqt" onclick="resetCartName('nbzx_jjqt','其他');" target="ifm">·其他</a></p>
        	    	 	</div>
             		<p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=nbzx_jgjxxpl" onclick="resetCartName('nbzx_jgjxxpl','金管家基金投资示范组合');" target="ifm">·金管家基金投资示范组合</a></p>
        	    	<p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=nbzx_jgjgptzzh" onclick="resetCartName('nbzx_jgjgptzzh','金管家股票投资示范组合');" target="ifm">·金管家股票投资示范组合</a></p>
        	    	<p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=nbzx_scclbg" onclick="resetCartName('nbzx_scclbg','A股市场策略报告');" target="ifm">·A股市场策略报告</a></p>
        	    	<p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=nbzx_ysptzzk" onclick="resetCartName('nbzx_ysptzzk','衍生品投资周刊');" target="ifm">·衍生品投资周刊</a></p>
        	    	<p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=nbzx_dfxcpyb" onclick="resetCartName('nbzx_dfxcpyb','低风险投资月报');" target="ifm">·低风险投资月报</a></p>
        	    	
        	    	
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
        	    
        	    	 <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=nbzx_gfcb"  onclick="resetCartName('nbzx_gfcb','广发晨间资讯');" target="ifm">·广发晨间资讯</a></p>
        	    	 <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=zqyj_yjbg_ch" onclick="resetCartName('zqyj_yjbg_ch','广发证券晨会纪要');" target="ifm">·广发证券晨会纪要</a></p>
        	    	 <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=nbzx_xgcjzx" onclick="resetCartName('nbzx_xgcjzx','香港财经资讯');" target="ifm">·香港财经资讯</a></p>
        	    	 <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=zqyj_gfyj_qh" onclick="resetCartName('zqyj_gfyj_qh','广发期货日报');" target="ifm">·广发期货日报</a></p>
        	    	 <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=zqyj_gfyj_qhzb" onclick="resetCartName('zqyj_gfyj_qhzb','广发期货周报');" target="ifm">·广发期货周报</a></p>
        	    	 
        	    	 <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListGslyjbg.html" onclick="resetCartName('zqyj_yjbg_gsyj','公司类研究报告');" target="ifm">·公司类研究报告</a></p>
		            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListHglyjbg.html" onclick="resetCartName('zqyj_yjbg_hgyj','宏观类研究报告');" target="ifm">·宏观类研究报告</a></p>
		            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListTzclbg.html" onclick="resetCartName('zqyj_yjbg_scyj','市场策略研究');" target="ifm">·市场策略研究</a></p>
		            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListHyyjbg.html" onclick="resetCartName('zqyj_yjbg_hyyj','行业研究报告');" target="ifm">·行业研究报告</a></p>
		            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListZjyjbg.html" onclick="resetCartName('zqyj_yjbg_gdsycy','债券研究报告');" target="ifm">·债券研究报告</a></p>
		            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListJjscbg.html" onclick="resetCartName('zqyj_yjbg_jjyj','基金市场报告');" target="ifm">·基金市场报告</a></p>
		            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListYspscbg.html" onclick="resetCartName('zqyj_yjbg_yspyj','衍生品市场报告');" target="ifm">·衍生品市场报告</a></p>
		            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListYzhg.html" onclick="resetCartName('zqyj_yjbg_qtzt','广发研究一周回顾');" target="ifm">·广发研究一周回顾</a></p>
        	    	 
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
       <td class="wdlc_ltag2" id="hor6" onclick="selectlMenu('hor6','board6')"><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=nbzx_zgsxcj" onclick="resetCartName('nbzx_zgsxcj','中国首席财经');"  target="ifm">博览财经</a></td>
      </tr>
      <tr id="board6"  style="display:none">
        <td class="font_st welc_subtxt">
             <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=blcj_nbzx_zgsxcj" onclick="resetCartName('blcj_nbzx_zgsxcj','中国首席财经');" target="ifm">·中国首席财经</a></p>
	    	 <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=blcj_nbzx_sxzqcc" onclick="resetCartName('blcj_nbzx_sxzqcc','首席证券内参');" target="ifm">·首席证券内参</a></p>
	         <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=blcj_nbzx_gcjcck" onclick="resetCartName('blcj_nbzx_gcjcck','高层决策参考');" target="ifm">·高层决策参考</a></p>
	    	 <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=blcj_nbzx_cyb" onclick="resetCartName('blcj_nbzx_cyb','创业板');" target="ifm">·创业板</a></p>
              <p><a href="${ctx }/bussinesshall/movetradehall/seneschalInfoGusuo.jsp">·股 搜</a></p>
        </td>
      </tr>
      <tr>
      		<td class="wdlc_ltag2" onclick="selectlMenu('hor4','board4')" id="hor4" ><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=nbzx_jjgs" onclick="resetCartName('nbzx_jjgs','基金公司资讯','');" target="ifm">基金公司资讯</a></td>
      </tr>
       <tr id="board4"  style="display:none">
        <td ></td>
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
    <div class="right_tit2 red bold" id="titleName"></div>
    <div class=" bg_ec mt5" style=" height:35px;">
      <div style=" height:10px; overflow:hidden"></div>
      <form action="" name="query" method="post">
      <table width="95%" align="center" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>时间：</td>
          <td><input type="text" id="StartDate" name="StartDate" onfocus="this.blur()" value="" style="width:86px; border:1px solid #c3c3c3;"  ><a href="javascript:void(0)" onclick="gfPop.fStartPop(document.query.StartDate,document.query.EndDate);return false;" HIDEFOCUS><img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="absmiddle"></a></td>
          <td>到：</td>
          <td><input type="text" name="EndDate" id="EndDate" onfocus="this.blur()" value="" style="width:86px; border:1px solid #c3c3c3;" ><a href="javascript:void(0)" onClick="gfPop.fEndPop(document.query.StartDate,document.query.EndDate);return false;" HIDEFOCUS><img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="absmiddle"></a></td>
          <td>标题：</td>
          <td><input type="text" name="title" id="title" class="input108" /></td>
          <td class="red bold" align="center">
          <a href="#" onclick="ggcxListCrm();">
           <input type="hidden" id="cartName" name="cartName" value="<%=cartName %>" />
           <img src="/pic/wsyyt/but_cx1.jpg" /></a></td>
        </tr>
      </table>
      </form>
    </div>
   
     <iframe id="ifm" name="ifm" src="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&whichCat=nbzx_gfmrtznc&is_delete=0"   frameborder="0" marginheight="0" marginwidth="0" height="518" width="100%" scrolling="no">
    </iframe> 
 
   
    
  </div>
   <!--右侧sied结束--> 
    <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
<iframe width="174" height="189" name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> </iframe>
</body>
</html>
<%
	String whichCat = request.getParameter("whichCat");
		String isMain = request.getParameter("isMain");
		String titleName = request.getParameter("titleName");
		if (isMain != null && "1".equals(isMain) && whichCat != null && !"".equals(whichCat))
		{
			%>
					<script type="text/javascript">
					 var urls="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=<%= whichCat%>";
					 document.getElementById("ifm").src=urls;
					 document.getElementById('titleName').innerText = '<%=titleName%>';
					 document.getElementById('cartName').value = '<%=whichCat%>';
					</script>
					
			<%
			if (whichCat.indexOf("zxzx")>=0 ){
				%>
					<script type="text/javascript">
					
					 document.getElementById('board1').style.display = "";
					 document.getElementById('hor1').className = "wdlc_ltag1 white";
					 var urls="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=<%= whichCat%>";
					 document.getElementById("ifm").src=urls;
					 document.getElementById('titleName').innerText = '<%=titleName%>';
					 document.getElementById('cartName').value = '<%=whichCat%>';
					</script>
				<%
			}else if(whichCat.indexOf("nbzx")>=0&& whichCat.indexOf("blcj_nbzx")<0 && !"nbzx_xgcjzx".equals(whichCat) && !"nbzx_gfcb".equals(whichCat) && !"nbzx_jjgs".equals(whichCat)){
			%>
					<script type="text/javascript">
					selectlMenu('hor2','board2');
					 var urls="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=<%= whichCat%>";
					 document.getElementById("ifm").src=urls;
					 document.getElementById('titleName').innerText = '<%=titleName%>';
					 document.getElementById('cartName').value = '<%=whichCat%>';
					</script>
			<%
			}else if ("nbzx_jjgs".equals(whichCat)){
					%>
						<script type="text/javascript">
							document.getElementById('hor1').className =  "wdlc_ltag2";
							document.getElementById('board1').style.display = "none";
							document.getElementById('hor4').className = "wdlc_ltag1 white";
						</script>
					<%
				}else if (whichCat.indexOf("blcj_nbzx")==0){
					%>
						<script type="text/javascript">
							document.getElementById('hor1').className =  "wdlc_ltag2";
							document.getElementById('board1').style.display = "none";
							document.getElementById('hor6').className = "wdlc_ltag1 white";
							document.getElementById('board6').style.display = "";
						</script>
					<%
					
					
			}else {
			%>
					<script type="text/javascript">
					selectlMenu('hor3','board3');
					 var urls="${ctx }/bussinesshall/movetradehall/noticeQueryNewsList.jsp?state=1&is_delete=0&whichCat=<%= whichCat%>";
					 document.getElementById("ifm").src=urls;
					 document.getElementById('titleName').innerText = '<%=titleName%>';
					 document.getElementById('cartName').value = '<%=whichCat%>';
					</script>
			<%
			}
		}
		String dv = "";
		if ( request.getParameter("dv") != null && !"".equals(request.getParameter("dv")))
		{
				dv = request.getParameter("dv");
				if ("31".equals(dv))
				{	
						%>
						<script type="text/javascript">
							$("#dv3" ).css("display","block");
							$("#sp3").html("-");
							$("#dv31" ).css("display","block");
							$("#sp31").html("-");
						</script>
					<%
				}
				else
				{
					%>
					<script type="text/javascript">
						$("#dv" + '<%= dv %>' ).css("display","block");
						$("#sp" + '<%= dv %>' ).html("-");
					</script>
				<%
				}
				
		}
 %>
<script language="javascript" for="document" event="onkeydown">
  if(event.keyCode==13 && event.srcElement.type!='button' && event.srcElement.type!='submit' && event.srcElement.type!='reset' && event.srcElement.type!='textarea' && event.srcElement.type!='')
  {
     ggcxListCrm();
  }
</script>