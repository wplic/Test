<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>

<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<%@page import="com.css.cms.document.util.DocumentHelper"%>
<%@ page import="com.cssweb.client.pojo.TsystemWebuser"%>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>广发证券</title>
	<script type="text/javascript" src="/js/jsIfUtils.js"></script>
	
</head>
<jsp:directive.page import="com.css.system.Configuration" />
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	if(request.getParameter("nav1")!=null&&!request.getParameter("nav1").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav1"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}
	if(request.getParameter("nav")!=null&&!request.getParameter("nav").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}
 	String hangqingUrl = Configuration.getProperty("hangqingUrl");
	String gfymhq = Configuration.getProperty("gfymhq"); 
	String gfymjy = Configuration.getProperty("gfymjy");
	String yykf= Configuration.getProperty("yykf");
%>

<body>
	<div class="wrap">
		<!-- include index_top.jsp -->
		<jsp:include page="/share/top.jsp" />
	
		<div class="pbd clearfix">
			<div class="part pt-main fr">
			    <!-- 导入广告页面 -->
			 <div class="mod mod-pcont" id="pcont">
			  <jsp:include page="${contextPath }/ad/ad_index1.jsp"/>
			  </div>
			    <!-- mod -->
				
				<!-- 浮动广告位置 -->
		     		 <div class="blank10">
       <jsp:include page="/ad/ad_paintings.jsp">
              <jsp:param name="widths" value="120"/>
			  <jsp:param name="heights" value="250"/>
			  <jsp:param name="subAdCode" value="ad_paintings_index"/>
     </jsp:include>
       <jsp:include page="/ad/ad_pf.jsp">
       <jsp:param name="widths" value="120"/>
	   <jsp:param name="heights" value="100"/>
       <jsp:param name="subAdCode" value="ad_pf_index"/>
	 </jsp:include>
      </div>
		    		 <!-- 浮动广告位置  END-->
		    		 
				<div class="group clearfix">
					<div class="mod mod-main fl">
						  <!--中间内容结束-->
    <div class="subMod subMod-gfyj tabs mb10">
						<div class="subMhd">
								<ul id="gfyjywts" class="tab-menu">
									<li class="hover"><a href="/stockResearch/resrarchReport.html">广发研究</a></li>
								</ul> <!-- tab-menu -->
								<a id="more3" href="/stockResearch/resrarchReport.html" class="more">更多</a>
							</div>
							<div class="subMbd">
							<div class="">
							<!-- 广发研究、财经要闻、温馨提示 -->
							<jsp:include page="/newcommons/index_gfyj.jsp">
							 <jsp:param name="catName" value="研究报告" />
					            <jsp:param name="whichCat" value="zqyj_yjbg_hgyj|zqyj_yjbg_scyj|zqyj_yjbg_yspyj|zqyj_yjbg_hyyj|zqyj_yjbg_gsyj|zqyj_yjbg_jjyj"/>
					            <jsp:param name="state" value="1"/>
					            <jsp:param name="showSize" value="10"/>
					    	</jsp:include>
								 <!-- subMbd -->
							</div> <!-- tab-cont -->
							</div>
							<div class="subMft"></div>
						</div> <!-- subMod -->
			
			<div class="subMod subMod-gfyj tabs mb10">
						<div class="subMhd" >
								<ul id="gfyjywts" class="tab-menu">
									<li class="hover"><a href="/infoCenter/domesticNewsGncj.html">财经要闻</a></li>
								</ul> <!-- tab-menu -->
								<a id="more3" href="/infoCenter/domesticNewsGncj.html" class="more">更多</a>
							</div>
							<div class="subMbd">
							<div class="">
							<!-- 广发研究、财经要闻、温馨提示 -->
								<jsp:include page="/newcommons/index_new.jsp">
								  <jsp:param name="catName" value="国内财经" />
						            <jsp:param name="whichCat" value="zxzx_glcj"/>
						            <jsp:param name="state" value="1"/>
						            <jsp:param name="showSize" value="10"/>
						    	</jsp:include>
								 <!-- subMbd -->
							</div> <!-- tab-cont -->
							</div>
							<div class="subMft"></div>
						</div> <!-- subMod -->
  <%--中间结束 --%>
						 <!-- subMod -->	
					</div> <!-- mod -->
				
					<div class="mod mod-side fr">	
					
					 <!--右侧内容开始-->
    <div class="w204 fright">
        <div class="rightb2">
        	<p align="center"><img src="${contextPath }/pic/index/jgj.jpg" /></p>
        <table align="center" class="mt10">
              <tr align="center">
                <td align="center"><a href="${contextPath }/golden/goldenCjh.html"><img src="pic/index/ricjh.jpg" /></a></td>
                <td align="center"><a href="${contextPath }/golden/goldenCzh.html"><img src="pic/index/riczh.jpg" /></a></td>
                <td align="center"><a href="${contextPath }/golden/goldenCfh.html"><img src="pic/index/ricfh.jpg" /></a></td>
              </tr>
            </table>
	    <table width="73%" align="center" class="mt10 lh27">
              <tr align="center">
                <td  class="blue">广发金管家，系广发证券全新
								推出的投资顾问服务品牌。本
								着以客户为中心的服务理念，
								凭借行业领先的研发实力及丰
								富的投资管理经验，贴心为您
								量身定制最适合的服务平台，
								根据资产量及需求的不同，分
								为金管家财经汇、金管家财智
								汇和金管家财富汇三个服务级
								别，为您提供一站式专属综合
								投资顾问服务。广发金管家，
								您的五星专属财富管家。
				</td>
              </tr>
            </table>
        <table width="73%" align="center">
              <tr>
                <td align="right"><a href="${contextPath }/golden/index.jsp?nav=jgj"><img src="${contextPath }/pic/index/more.jpg"/></a></td>
              </tr>
            </table>
        </div>
        <div class="rightb3"></div>
</div>
    <!--右侧内容结束-->
					 <!-- subMod -->					
					</div> <!-- mod-side -->
				</div>
			</div> <!-- pt-main -->
		
		<%--左侧大框架 --%>	
	<div class="part pt-second">
	<%--左侧内容开始--%> 
	<div class="w198 fleft mr5">
    	 <iframe target="_blank" id="leftlogin" name="leftlogin"  marginWidth="0" marginHeight="0" src="${contextPath }/share/loginTemp.jsp"
						frameBorder="0" noresize width="100%" scrolling="no"></iframe>
        <div class="blank5"></div>
        
        <!-- 新 -->
        <div class="mod mod-tyzx mb10">
				    <!-- ExCenter  体验中心-->
				    <!-- include index_ExCenter.jsp -->
					<jsp:include page="/newcommons/index_ExCenter.jsp"/>
				    <!-- mbd -->
				    <div class="mft">
						<b></b>
					</div><!-- mft -->
				</div> <!-- mod -->
        <div class="letagm1">
          
          <table border="0" cellspacing="0" cellpadding="0" width="185">
            <tr>
              <td class="hq_hov red bold" width="62">大盘行情</td>
              <td class="hq_a">&nbsp;</td>
            </tr>
          </table>
          <div class="blank5"></div>
        
          <table border="0" cellspacing="0" cellpadding="0" width="185">
            <tr>
              <td width="185">
             
         <iframe src="<%=hangqingUrl %>" id="hqIframes" name="hqIframes"  marginWidth="0" marginHeight="0" frameBorder="0" noresize width="100%" scrolling="no"></iframe>
         </td>
             </tr>
          </table>
          <div class="blank5"></div>
          <table border="0" cellspacing="0" cellpadding="0" width="185">
            <tr>
              <td class="hq_hov red bold" width="62" id="tagdp1" onmouseover="SwitchNews('dp', 1, 2,'hq_hov red bold','hq_a bold')"><a href="${contextPath }/infoCenter/future.jsp?nav=zxzx&nav1=qh">全球股指</a></td>
              <td class="hq_a bold" width="62" id="tagdp2" onmouseover="SwitchNews('dp', 2, 2,'hq_hov red bold','hq_a bold')"><a href="${contextPath }/infoCenter/future.jsp?nav=zxzx&nav1=qh">全球期货</a></td>
              <td class="hq_a">&nbsp;</td>
            </tr>
          </table>
          <div class="blank5"></div>
          <div id="dp1">
          <jsp:include page="/share/indexHqgz.jsp"/>
          </div>
          <div id="dp2" style="display:none">
          <jsp:include page="/share/tbbList.jsp">
           <jsp:param name="whichCat" value="cjzx_qh_gzqhxw"/>
           <jsp:param name="showSize" value="4"/>
           <jsp:param name="titleWidth" value="20"/>
    	</jsp:include>
          </div>
        </div>
    <div class="letagb1"></div>
    <div class="blank5"></div>
  </div>
<!--左侧内容结束--><!-- ood -->
			</div> <!-- pt-second -->
		</div> 
	<div align="center">
 	<table align="center">
      <tr align="center">
        <td align="center"><a href="${contextPath }/bussinesshall/95575.jsp?nav=wsyyt&nav1=qwwqw"><img src="${contextPath }/pic/index/botban1.jpg"/></a></td>
        <td align="center"><a href="${contextPath }/bussinesshall/iptv/iptv.html"><img src="${contextPath }/pic/index/botban2.jpg"/></a></td>
        <td align="center"><a href="${contextPath }/branches/goldManager.html"><img src="${contextPath }/pic/index/botban3.jpg"/></a></td>
        <td align="center"><a href="${contextPath }/mobile/index.jsp"><img src="${contextPath }/pic/index/botban4.jpg"/></a></td>
        <td align="center"><a href="${contextPath }/branches/ggpteOne.html"><img src="${contextPath }/pic/index/botban5.jpg"/></a></td>
      </tr>
    </table>
    </div>
		<!-- include index_bottom.jsp -->
		<%--<jsp:include page="/newcommons/index_bottom.jsp"/>
		--%>
		<jsp:include page="/commons/msbottom.jsp" />
		<!-- pft -->
	
	</div>

<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>	
<script type="text/javascript">
$("#pcont").pcont({snum:4, isH:false});
$(".tabs").tabs({meth:"hover"});
$("#picShow").picshow();
var bbb=0;
function updateSzAndSh(){
	var url= encodeURI("/qzhqAction.do?method=getStockInfoForShAndSz");
	$.getJSON(url,null,function(json){
		szAndshs=json.szAndsh;
		
		var html="";
		
		
		if(bbb==0){
			
			//获得上证的涨跌
			var shAndsh=""+szAndshs[1].zjcj;
			var shzd="";
			if(szAndshs[1].zd!=null){
				
			 shzd=""+szAndshs[1].zd;
			}
			var shcjje=""
			if(szAndshs[1].cjje!=null){
				
				shcjje=""+(szAndshs[1].cjje/100000000).toFixed(2);
			}
			var shAndshUpDown=""+szAndshs[1].zf;
			//var rs2=num.toFixed(4);
		     
			var shUpDownPercent=szAndshs[1].zf*100;
			if(shAndshUpDown.substr(0,1)=="-"){
				html="&nbsp;&nbsp;上证指数:<span style='color: green;'>"+szAndshs[1].zjcj+"</span>&nbsp;&nbsp;&nbsp;<span style='color: green;'>"+shzd+"</span>&nbsp;&nbsp;&nbsp;<span style='color: green;'>"+shUpDownPercent.toFixed(2)+"%</span>&nbsp;&nbsp;&nbsp;<span style='color: green;'>"+shcjje+"</span>亿"
			}else{
				html="&nbsp;&nbsp;上证指数:<span style='color: red;'>"+szAndshs[1].zjcj+"</span>&nbsp;&nbsp;&nbsp;<span style='color: red;'>"+shzd+"</span>&nbsp;&nbsp;&nbsp;<span style='color: red;'>"+shUpDownPercent.toFixed(2)+"%</span>&nbsp;&nbsp;&nbsp;<span style='color: red;'>"+shcjje+"</span>亿"
			}
		}
		
		
		if(bbb==1){
			
			//获得深证的涨跌
			
			var szAndsh=""+szAndshs[0].zjcj;
			var szAndshUpDown=""+szAndshs[0].zf;
			var szzd="";
			if(szAndshs[0].zd!=null){
				szzd=""+szAndshs[0].zd;
			}
			var szcjje="";
			if(szAndshs[0].cjje!=null){
				szcjje=""+(szAndshs[0].cjje/100000000).toFixed(2);
			}
			var szUpDownPercent=szAndshs[0].zf*100;
			
			if(szAndshUpDown.substr(0,1)=="-"){
				html+="&nbsp;&nbsp;深圳成指:<span style='color: green;'>"+szAndshs[0].zjcj+"</span>&nbsp;&nbsp;&nbsp;<span style='color: green;'>"+szzd+"</span>&nbsp;&nbsp;&nbsp;<span style='color: green;'>"+szUpDownPercent.toFixed(2)+"%</span>&nbsp;&nbsp;&nbsp;<span style='color: green;'>"+szcjje+"</span>亿";
			}else{
				html+="&nbsp;&nbsp;深圳成指:<span style='color: red;'>"+szAndshs[0].zjcj+"</span>&nbsp;&nbsp;&nbsp;<span style='color: red;'>"+szzd+"</span>&nbsp;&nbsp;&nbsp;<span style='color: red;'>"+szUpDownPercent.toFixed(2)+"%</span>&nbsp;&nbsp;&nbsp;<span style='color: red;'>"+szcjje+"</span>亿";
			}
		}
		
		
		if(bbb==2){
			
			//获得深证的涨跌
			
			var shZxAndsh=""+szAndshs[2].zjcj;
			var shZxAndshUpDown=""+szAndshs[2].zf;
			var shZxzd="";
			if(szAndshs[2].zd!=null){
				shZxzd=""+szAndshs[2].zd;
			}
			var shZxcjje="";
			if(szAndshs[2].cjje!=null){
				shZxcjje=""+(szAndshs[2].cjje/100000000).toFixed(2);;
			}
			var shZxUpDownPercent=szAndshs[2].zf*100;
			
			if(shZxAndshUpDown.substr(0,1)=="-"){
				html+="&nbsp;&nbsp;上证中小:<span style='color: green;'>"+szAndshs[2].zjcj+"</span>&nbsp;&nbsp;&nbsp;<span style='color: green;'>"+shZxzd+"</span>&nbsp;&nbsp;&nbsp;<span style='color: green;'>"+shZxUpDownPercent.toFixed(2)+"%</span>&nbsp;&nbsp;&nbsp;<span style='color: green;'>"+shZxcjje+"</span>亿"
			}else{
				html+="&nbsp;&nbsp;上证中小:<span style='color: red;'>"+szAndshs[2].zjcj+"</span>&nbsp;&nbsp;&nbsp;<span style='color: red;'>"+shZxzd+"</span>&nbsp;&nbsp;&nbsp;<span style='color: red;'>"+shZxUpDownPercent.toFixed(2)+"%</span>&nbsp;&nbsp;&nbsp;<span style='color: red;'>"+shZxcjje+"</span>亿"
			}
		}
		
		
		$("#szAndsh").html(html);
		if(bbb==2){
			bbb=0;
		}else{
			bbb++;	
		}
	});
}

setInterval("updateSzAndSh()",3000);
</script>	
</body>
<script type="text/javascript" > 
var _aq = _aq || [];
_aq.push(['_setSiteId', 10001]);_aq.push(['_setCatalogId', 11]); _aq.push(['_trackPageview']); (function() {
var ga = document.createElement( 'script'); ga.type = 'text/javascript'; ga.async = true; ga.src='http://121.8.153.59:8080/stat/stat.js'; var s = document.getElementsByTagName( 'script')[0]; s.parentNode.insertBefore(ga, s); })();
</script>
</html>
