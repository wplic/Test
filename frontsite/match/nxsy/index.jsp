<%@ include file="/commons/taglibs.jsp"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<script type="text/javascript" src="js/popup.js"></script>  
<script type="text/javascript" src="js/popupclass.js"></script>
<jsp:include page="${ctx }/match/nxsy/commons/head.jsp"></jsp:include>
<jsp:include page="${ctx }/match/nxsy/login_ok.jsp"></jsp:include>
<body style="overflow-y:hidden;overflow-x:hidden;">
<table style="width:100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td id="menuTD" class="menu_bg" valign="top" >
      

<div id="gpBox" class="menu" style="disply:none;">
    <ul>
        <li><a href="javascript:void(0);" id="gp_buy"  >单向申报</a></li>
        <li><a href="javascript:void(0);" id="gp_arbitrage" >双向申报</a></li>
        <li><a href="javascript:void(0);" id="gp_cancel" >撤单</a></li>
        <li><a href="javascript:void(0);" id="gp_search">当日查询</a>
            <ul>
                <li><a href="javascript:void(0);" id="gp_search_zqzc" >证券资产</a></li>
                <li><a href="javascript:void(0);" id="gp_search_drwt" >当日委托</a></li>
                <li><a href="javascript:void(0);" id="gp_search_drcj" >当日转换</a></li>
                <!-- 
                <li><a href="javascript:void(0);" id="gp_search_zcpm" >资产排名</a></li>
                 -->
            </ul> 
        </li>
        <li><a href="javascript:void(0);" id="gp_history">历史查询</a>
        	<ul>
                <li><a href="javascript:void(0);" id="gp_history_lswt" >历史委托</a></li>
				<li><a href="javascript:void(0);" id="gp_history_lscj" >历史成交</a></li>				
				<li><a href="javascript:void(0);" id="gp_history_price" >历史净值</a></li>
				<li><a href="javascript:void(0);" id="gp_stockjour" >股份流水</a></li>
				<li><a href="javascript:void(0);" id="gp_fundjour" >资金流水</a></li>
            </ul>
        </li>
        <!-- 
        <li><a href="javascript:void(0);" id="gp_syl">资产收益率</a>
        	<ul>
                <li><a href="javascript:void(0);" id="gp_asset_day" >日收益率</a></li>
				<li><a href="javascript:void(0);" id="gp_asset_week" >周收益率</a></li>
				<li><a href="javascript:void(0);" id="gp_asset_month" >月收益率</a></li>
				
            </ul>
        </li>
		-->
         <li><a href="javascript:void(0);" id="gp_matchinfo" >竞赛榜单</a>
         <ul>
				<li><a href="javascript:void(0);" id="gp_asset_month_order" >月收益率排名</a></li>
				<li><a href="javascript:void(0);" id="gp_asset_total_order" >总收益率排名</a></li>
            </ul>
         </li>
         
        <li><a href="javascript:void(0);" id="gp_userinfo" >资料修改</a></li>
        <li><a href="javascript:void(0);" id="gp_pwd" >密码重置</a></li>
        <!-- 
        <li><a href="javascript:void(0);" id="gp_feedback" >问题反馈</a></li>
        -->
        <li><a href="#" id="gp_logout" onclick="top.logout()">退出</a></li>
    </ul>
</div>
      </td>
      <td id="arrowTd" valign="middle"><img id="arrowImg" src="${ctx }/match/nxsy/mncg/skin/default/pic/arrow_left.gif"/> </td>
      <td valign="top">
		<jsp:include page="${ctx }/match/nxsy/topNav.jsp" />        
       <!-- 这里装载对应的iframe文件 --> 
      <iframe id='mainFrame' src='about:blank' frameborder="0" scrolling="auto" style="width:100%;"></iframe>
      <input type="hidden" id="QUESTIONNAIRE" value="${QUESTIONNAIRE }"> 
      <input type="hidden" id="branch_no" value="${branch_no }">
      <input type="hidden" id="recommend" value="${recommend }">      
      <input type="hidden" id="hs300_price_init" value="${hs300_price_init }">
      </td>  
    </tr>      
  </table>  
  <script type="text/javaScript">
	window.onload = function(){
		var msgFlag = ${msgFlag };
		if(msgFlag!=null && parseInt(msgFlag)==0){
			//弹出消息列表，且弹出窗体不可被用户关闭
			ShowIframe('来自管理员的消息','/match/nxsy/msgInfo.jsp',700,490);
		}
		//首先加载问卷调查弹窗
		var qval = document.getElementById("QUESTIONNAIRE").value;
		var recommend = document.getElementById("recommend").value;
		var branch_no = document.getElementById("branch_no").value;
		//alert(qval);
		if(qval==1){
			ShowIframe('用户问卷调查','/match/nxsy/wjdc.jsp',600,490);
		}
		//alert(recommend+"  "+branch_no);
		if(recommend=="" || recommend==null || branch_no=="" || branch_no==null){
			ShowIframe('完善用户信息','/match/nxsy/wjdc2.jsp',700,190);
		}
	}
   </script>	
</body>
</html>