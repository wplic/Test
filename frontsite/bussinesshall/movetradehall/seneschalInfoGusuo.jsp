<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%request.setCharacterEncoding ("UTF-8") ;%>
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery-1.4.2.min.js"></script>

<script type="text/javascript">
		
	function resetCartName(isMain,whichCat,titleName ,dv)
 	{
 			
 		window.location.href = "${ctx }/bussinesshall/movetradehall/seneschalInfoNbzx.jsp?isMain=1&dv="+ dv+ "&whichCat=" + whichCat + "&titleName="+ encodeURI(titleName);
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
		document.getElementById('hor4').className = "wdlc_ltag2";
		document.getElementById('board6').style.display = "none";
		document.getElementById('hor6').className = "wdlc_ltag2";
		if(temp == "none")
		{
			obj2.style.display = "";
			obj1.className = "wdlc_ltag1 white";
			
		}else{
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
<%
  String carName="股 搜";
%>
<body class="body_bg">
<jsp:include page="/share/top.jsp" />
<jsp:include page="/share/pdLogin.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="${ctx }/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a>  &gt;  我的理财中心 &gt; 我的管家资讯</div>
  <jsp:include page="/bussinesshall/movetradehall/financing_submenu.jsp?nav3=gdgjzx" />
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
     <a href="#" onclick="resetCartName('1','zxzx_glcj','国内财经','');">新闻资讯</a></td>
      </tr>
      <tr id="board1" >
        <td class="font_st welc_subtxt" >
        	<p><a onclick="resetCartName('1','zxzx_glcj','国内财经','');" href="#"  >·国内财经</a></p>
            <p><a href="#" onclick="resetCartName('1','zxzx_gjcj','国际财经','');">·国际财经</a></p>
            <p><a href="#" onclick="resetCartName('1','zxzx_gatcj','港澳台财经','');">·港澳台财经</a></p>
            <p><a href="#" onclick="resetCartName('1','zxzx_dfcj','地方财经','');" >·地方财经</a></p>
            <p><a href="#" onclick="resetCartName('1','zxzx_cjpl','财经时评','');">·财经时评</a></p>
            <p><a href="#" onclick="resetCartName('1','zxzx_hyxw','行业动态','');">·行业动态</a></p>
            <p><a href="#" onclick="resetCartName('1','zxzx_hqsc','环球市场','');">·环球市场</a></p>
            <p><a href="#" onclick="resetCartName('1','zxzx_qsdt','券商动态','');">·券商动态</a></p>
            <p><a href="#" onclick="resetCartName('1','zxzx_ztqj','专题聚焦','');">·专题聚焦</a></p>
            <p><a href="#" onclick="resetCartName('1','zxzx_jysgg_hstbts','沪市特别提示','');">·沪市特别提示</a></p>
            <p><a href="#" onclick="resetCartName('1','zxzx_jysgg_sstbts','深市特别提示','');">·深市特别提示</a></p>
        </td>
      </tr>
      <tr>
      		<td class="wdlc_ltag2" id="hor2" ><a href="#" onclick="selectlMenu('hor2','board2')">投资顾问资讯</a></td>
      </tr>
      <tr id="board2"  style="display:none">
        <td class="font_st welc_subtxt">
        	<p><a href="#" onclick="showDv('1');"><span id="sp1">+</span>市场速递</a></p>
        	    <div id="dv1" style="display:none" style="padding-left:10px">
        	    	  <p><a href="#" onclick="resetCartName('2','nbzx_gftzsd','广发投资速递','1');">·广发投资速递</a></p>
        	    	 <p><a href="#" onclick="resetCartName('2','nbzx_gftzsd_zkb','广发投资速递(周刊版)','1');">·广发投资速递(周刊版)</a></p>
        	    	 <p><a href="#" onclick="resetCartName('2','nbzx_pzbb','盘中播报','1');">·盘中播报</a></p>
        	    </div>
            <p><a href="#" onclick="showDv('2');" ><span id="sp2">+</span>研究内参</a></p>
             	<div id="dv2" style="display:none" style="padding-left:10px">
             		 <p><a href="#" onclick="resetCartName('2','nbzx_gffxszb','广发分析师早报','2');">·广发分析师早报</a></p>
        	    	 <p><a href="#" onclick="resetCartName('2','nbzx_gfmrtznc','广发投资内参','2');">·广发投资内参</a></p>
        	    </div>
            <p><a href="#" onclick="showDv('3');"><span id="sp3">+</span>产品策略</a></p>
             	<div id="dv3" style="display:none" style="padding-left:10px">
        	    	 <p><a href="#"  onclick="showDv('31');"><span id="sp31">+</span>基金投资内参</a></p>
        	    	 	<div id="dv31" style="display:none" style="padding-left:15px">
        	    	 		<p><a href="#" onclick="resetCartName('2','nbzx_sczx','市场资讯','31');">·市场资讯</a></p>
        	    	 		<p><a href="#" onclick="resetCartName('2','nbzx_jjxt','基金学堂','31');">·基金学堂</a></p>
        	    	 		<p><a href="#" onclick="resetCartName('2','nbzx_jjzk','基金投资周刊','31');">·基金投资周刊</a></p>
        	    	 		<p><a href="#" onclick="resetCartName('2','nbzx_jjydbg','基金月度报告','31');">·基金月度报告</a></p>
        	    	 		<p><a href="#" onclick="resetCartName('2','nbzx_jjtzzh','基金季度投资组合分析','31');">·基金季度投资组合分析</a></p>
        	    	 		<p><a href="#" onclick="resetCartName('2','nbzx_dp','年报点评','31');">·年报点评</a></p>
        	    	 		<p><a href="#" onclick="resetCartName('2','nbzx_jjtj','重点基金推荐','31');">·重点基金推荐</a></p>
        	    	 		<p><a href="#" onclick="resetCartName('2','nbzx_jjqt','其他','31');">·其他</a></p>
        	    	 	</div>
        	    	 	<p><a href="#" onclick="resetCartName('2','nbzx_jgjxxpl','金管家基金投资示范组合','3');">·金管家基金投资示范组合</a></p>
        	    	 <p><a href="#" onclick="resetCartName('2','nbzx_jgjgptzzh','金管家股票投资示范组合','3');">·金管家股票投资示范组合</a></p>
        	    	 <p><a href="#" onclick="resetCartName('2','nbzx_scclbg','A股市场策略报告','3');">·A股市场策略报告</a></p>
        	    	 <p><a href="#" onclick="resetCartName('2','nbzx_ysptzzk','衍生品投资周刊','3');">·衍生品投资周刊</a></p>
        	    	  <p><a href="#" onclick="resetCartName('2','nbzx_dfxcpyb','低风险投资月报','3');">·低风险投资月报</a></p>
        	    	  
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
        	    
        	    	 <p><a href="#"  onclick="resetCartName('3','nbzx_gfcb','广发晨间资讯','4');" >·广发晨间资讯</a></p>
        	    	 <p><a href="#" onclick="resetCartName('3','zqyj_yjbg_ch','广发证券晨会纪要','4');" >·广发证券晨会纪要</a></p>
        	    	 <p><a href="#" onclick="resetCartName('3','nbzx_xgcjzx','香港财经资讯','4');" >·香港财经资讯</a></p>
        	    	 <p><a href="#" onclick="resetCartName('3','zqyj_gfyj_qh','广发期货日报','4');" >·广发期货日报</a></p>
        	    	 <p><a href="#" onclick="resetCartName('3','zqyj_gfyj_qhzb','广发期货周报','4');" >·广发期货周报</a></p>
        	    	
        	    	 <p><a href="#" onclick="resetCartName('3','zqyj_yjbg_gsyj','公司类研究报告','4');" >·公司类研究报告</a></p>
		            <p><a href="#" onclick="resetCartName('3','zqyj_yjbg_hgyj','宏观类研究报告','4');" >·宏观类研究报告</a></p>
		            <p><a href="#" onclick="resetCartName('3','zqyj_yjbg_scyj','市场策略研究','4');" >·市场策略研究</a></p>
		            <p><a href="#" onclick="resetCartName('3','zqyj_yjbg_hyyj','行业研究报告','4');" >·行业研究报告</a></p>
		            <p><a href="#" onclick="resetCartName('3','zqyj_yjbg_gdsycy','债券研究报告','4');" >·债券研究报告</a></p>
		            <p><a href="#" onclick="resetCartName('3','zqyj_yjbg_jjyj','基金市场报告','4');" >·基金市场报告</a></p>
		            <p><a href="#" onclick="resetCartName('3','zqyj_yjbg_yspyj','衍生品市场报告','4');" >·衍生品市场报告</a></p>
		            <p><a href="#" onclick="resetCartName('3','zqyj_yjbg_qtzt','广发研究一周回顾','4');" >·广发研究一周回顾</a></p>
        	    	 
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
      <td class="wdlc_ltag2" id="hor6" onclick="selectlMenu('hor6','board6')">
     <a href="#" onclick="resetCartName('6','blcj_nbzx_zgsxcj','中国首席财经','');">博览财经</a></td>
    
      </tr>
      <tr id="board6"  style="display:none">
        <td class="font_st welc_subtxt">
           
           <p><a href="#" onclick="resetCartName('6','blcj_nbzx_zgsxcj','中国首席财经','');">·中国首席财经</a></p>
            <p><a href="#" onclick="resetCartName('6','blcj_nbzx_sxzqcc','首席证券内参','');">·首席证券内参</a></p>
            <p><a href="#" onclick="resetCartName('6','blcj_nbzx_gcjcck','高层决策参考','');">·高层决策参考</a></p>
            <p><a href="#" onclick="resetCartName('6','blcj_nbzx_cyb','创业板','');">·创业板</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/seneschalInfoGusuo.jsp">·股 搜</a></p>
            
        </td>
      </tr>
      
   	   <tr>
      		<td class="wdlc_ltag2" id="hor4" ><a href="#" onclick="resetCartName('4','nbzx_jjgs','基金公司资讯','');">基金公司资讯</a></td>
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
    <div class="right_tit2 red bold"><%=carName %></div>
    <div style=" height:60px;">
      <div style=" height:10px; overflow:hidden"></div>
      <table width="95%" align="center" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
          </td>
         </tr>
      </table>
     
      
    </div>
<jsp:include page="noticeGusuo.jsp">
            <jsp:param name="catName" value="股搜" />
            
    </jsp:include>
  </div>
  
  
   <!--右侧sied结束--> 
    <div class="clearfloat"></div><!--清除浮动--> 
</div>

 <script type="text/javascript">
		document.getElementById('hor1').className =  "wdlc_ltag2";
		document.getElementById('board1').style.display = "none";
		document.getElementById('hor6').className = "wdlc_ltag1 white";
		document.getElementById('board6').style.display = "";
	</script>

<%
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
<jsp:include page="/share/bottom.jsp" />
</body>
<iframe width="174" height="189" name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> </iframe>

</html>
