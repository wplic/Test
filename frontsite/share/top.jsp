<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="com.css.cms.document.util.DocumentHelper"%>
<%@ page import="com.cssweb.client.pojo.TsystemWebuser"%>
<%@ include file="/commons/taglibs.jsp"%>
<jsp:include page="${contextPath }/commons/SingleSignOnCheck.jsp"/>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link rel="stylesheet" type="text/css" href="${contextPath }/css/index_new.css" media="all" />
<link rel="stylesheet" type="text/css" href="${contextPath }/css/basic_new.css" media="all" />
<link href="${contextPath }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath }/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>
<script type="text/javascript">
		function changeLoginLj(){
		  var loginType=document.getElementById("selectLj").value;
		  window.open(loginType);
		}
</script>
<!-- 4月21日为全国哀悼日，将网站变灰。
	为方便站点哀悼，特提供css滤镜代码，以表哀悼。以下为全站CSS代码。 -->
<!-- <style>
html{filter:progid:DXImageTransform.Microsoft.BasicImage(grayscale=1);}
</style>
 -->
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

<style type="text/css">
	th {
	    font: bold 11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
	    color: #4f6b72;
	    border-right: 1px solid #C1DAD7;
	    border-bottom: 1px solid #C1DAD7;
	    border-top: 1px solid #C1DAD7;
	    letter-spacing: 2px;
	    text-transform: uppercase;
	    text-align: left;
	    padding: 6px 6px 6px 12px;
	    background: #CAE8EA;
	}
	.gflogo{padding:25px 0 0 40px;}
	.fl {float:left;}
	.gflogo a{background:url(${contextPath }/pic/logo.png) no-repeat;width:361px;height:46px;display:block;}
</style>
<%
    TsystemWebuser tsystemWebuser = (TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
    if(tsystemWebuser!=null) {
    %>
    <script type="text/javascript">

    </script>
    <%
    }
%>
<script type="text/javascript" src="/js/codeSuggest.js"></script>
<script type="text/javascript">

    function openMain()
	{
			var ah = screen.availHeight - 30;
			var aw = screen.availWidth - 10;
			window.open('${contextPath }/bussinesshall/index.jsp?nav=wsyyt', 'newwindow', 'height='+ah +', width='+aw+', top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');

	}

</script>


<script type="text/javascript" src="${contextPath }/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="${contextPath }/js/common.js"></script>
<script src="${contextPath }/js/topmenu.js"></script>
<div class="wrap" style="width:982px; margin:0 auto 0;">
<div class="phd mb10">
			<div class="logoBar clearfix">
				<div class="logo fl"><a href="${contextPath }/default.html" title="广发证券">广发证券</a></div>

				<div class="toolMenu fl">
					<div class="topMsg mb10">
						<div class="weibo fl">
							<a class="sina db" href="http://weibo.com/gfsecurities/" target="_Blank" title="新浪微博">关注</a>
							<a class="tencent db" href="http://t.qq.com/gfsecurities" target="_Blank" title="腾讯微博">关注</a>
						</div> <!-- weibo -->

						<div class="xglink fl">
								<p class="tr par15"><select name="selectLj" id="selectLj" onchange="changeLoginLj();">
          <option value="#">子公司网站</option>
          <option value="http://www.gfgroup.com.hk/index.shtml">广发控股(香港)</option>
          <option value="http://www.gfqh.com.cn/">广发期货</option>
          <option value="http://www.gffunds.com.cn/">广发基金</option>
          <option value="http://www.gfinvestment.cn">广发信德</option>
        </select>
        </p>
						 </div>
						<div class="en fl">
								<a href="${contextPath }/en/index.html"><font color="#225C85">English</font></a>
							</div>
						<div class="subLogo fl"><a href="${contextPath }/default.html" title="返回广发展">返回广发展</a></div>
					</div> <!-- topMsg -->
					<div class="clear"></div>
					<div class="site" style="padding-left: 0px;">
						<a href="http://store.gf.com.cn/" style="background: url('../pic/gf_store.png') no-repeat;margin-top: -12px;width: 140px;height: 35px;" target="_blank" 
								title="广发证券金融超市">
							</a>
						<a href="${contextPath }/gyjj/index.jsp" target="_Blank" title="广发证券社会公益基金">广发证券社会公益基金</a>
						<a href="http://20.gf.com.cn/gf20/index.xhtml" target="_Blank" title="广发证券20周年网站">广发证券20周年网站</a>
					</div>
				</div> <!-- toolMenu -->
			</div>
<div class="clear"></div>
<table  border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td align="left"><img src="/pic/share/top/menu_bgl.png"></td>
    <td align="left">
<table  border="0" cellspacing="0" cellpadding="0" class="topmenu">
  <tr>
    <td class="font14 white topmenu_hover" id="index" onmouseover="selectMenu(this.id)"><a href="/index.html">首  页</a></td>
    <td width="5"><img src="/pic/share/top/menu_line.jpg"></td>
    <td class="font14 white topmenu_a" id="wsyyt" onmouseover="selectMenu(this.id)"><a href="#"  onclick="openMain();">网上营业厅</a></td>
    <td width="5"><img src="/pic/share/top/menu_line.jpg"></td>
    <td class="font14 white topmenu_a" id="jgj" onmouseover="selectMenu(this.id)"><a href="/golden/index.jsp">金管家服务</a></td>
    <td width="5"><img src="/pic/share/top/menu_line.jpg"></td>
    <td class="font14 white topmenu_a" id="zxzx" onmouseover="selectMenu(this.id)"><a href="/infoCenter/index.html">资讯中心</a></td>
    <td width="5"><img src="/pic/share/top/menu_line.jpg"></td>
    <td class="font14 white topmenu_a" id="tzzyd" onmouseover="selectMenu(this.id)"><a href="/investorEdu/investorSchool.html">投资者园地</a></td>
    <td width="5"><img src="/pic/share/top/menu_line.jpg"></td>
    <td class="font14 white topmenu_a" id="grgf" onmouseover="selectMenu(this.id)"><a href="/branches/index.html">分支机构</a></td>
  </tr>
</table>
  </td>
      <td align="right"><img src="/pic/share/top/menu_bgr.png"></td>
</tr>
</table>
<div class="topsubmenu" align="center">
       <table align="center" border="0" cellspacing="0" cellpadding="0" id="index_con" style="display:none">
          <tr>
            <td>&nbsp;</td>
          </tr>
        </table>

	    <table align="center" border="0" cellspacing="0" cellpadding="0" id="wsyyt_con" style="display:none">
          <tr>
            <td>
        	<ul>

                <li class="al"><a id="yykh" href="#" onclick="javascript:window.open('<%=yykf %>');">预约开户</a></li>
                <li class="al"><a id="jygg" href="${contextPath }/bussinesshall/tradeAffiche.html" >交易公告</a></li>
				<li class="al"><a id="ymhq" href="#" onclick="javascript:window.open('<%=gfymhq %>');">页面行情</a></li>
                <li class="al" ><a id="rjxz" href="${contextPath }/bussinesshall/softDownload.html">软件下载</a></li>
                <li class="al">
                <a href="#" onclick="javascript:window.open('<%=gfymjy %>');">
                页面交易</a></li>
                <li class="al"><a id="iptvsp" href="${contextPath }/bussinesshall/iptv/iptv.html">财富频道</a></li>
                <li class="al" ><a id="gfydjyt" href="${contextPath }/mobile/index.jsp">金管家手机证券</a></li>
                <li class="al"><a id="qwwqw" href="${contextPath }/bussinesshall/95575.html">95575</a></li>
                <li class="al">
                <%
                  String wdlczxPathUrl="/bussinesshall/movetradehall/financingCenter.html";
                  if(session.getAttribute("tsystemWebuser")!=null)
                  {
                   wdlczxPathUrl="/bussinesshall/financingCzh.jsp";
                  }
                 %>
                <a id="wdlczx" href="${contextPath }<%=wdlczxPathUrl %>" >
                    我的理财中心</a>
                 </li>
            </ul>
            </td>
          </tr>
        </table>

        <table align="center" border="0" cellspacing="0" cellpadding="0" id="jgj_con" style="display:none">
          <tr>
            <td>
        	<ul>

        	 <li class="al"><a id="cjh" href="${contextPath } /golden/index.jsp">金管家资讯套餐介绍</a></li>
                <li class="al">
			  <a id="zzfwdypr" href="${contextPath }/Subscribe/zzdy1.jsp?xkxx=1">自助定阅首页</a>
               </li>
				<li class="al"><a id="dcxdz" href="${contextPath } /golden/dcxdz/index.jsp">短彩信定制</a></li>
               <!--
              </li>
               <li class="al"><a id="cjh" href="${contextPath }/golden/goldenCjh.html">财经汇</a></li>
                <li class="al"><a id="czh" href="${contextPath }/golden/goldenCzh.html">财智汇</a></li>
                <li class="al"><a id="cfh" href="${contextPath }/golden/goldenCfh.html">财富汇</a></li>
                -->
            </ul>
            </td>
          </tr>
        </table>

        <table align="center" border="0" cellspacing="0" cellpadding="0" id="zxzx_con" style="display:none">
          <tr>
            <td>
        	<ul>
                <li class="al"><a id="gfsd" href="${contextPath }/infoCenter/gfView.html">广发视点</a></li>
                <li class="al"><a id="xw" href="${contextPath }/infoCenter/news.html">新闻</a></li>
                <li class="al"><a id="gp" href="${contextPath }/infoCenter/stock.html">股票</a></li>
                <li class="al"><a id="xg" href="${contextPath }/infoCenter/newStockIndex.html">新股</a></li>
                <li class="al"><a id="jj" href="${contextPath }/infoCenter/fund.html">基金</a></li>
                <li class="al"><a id="qz" href="${contextPath }/infoCenter/warrantIndex.html">权证</a></li>
                <li class="al"><a id="zxb" href="${contextPath }/infoCenter/zxmarketzxbxw.html">中小板</a></li>
                <li class="al"><a id="sb" href="${contextPath }/infoCenter/thmarketsb.html">三板</a></li>
                <li class="al"><a id="zq" href="${contextPath }/infoCenter/bondzq.html">债券</a></li>
                <li class="al"><a id="bg" href="${contextPath }/infoCenter/bstockbg.html">B股</a></li>
                <li class="al"><a id="gg" href="${contextPath }/infoCenter/hkstockgg.html">港股</a></li>
                <li class="al"><a id="qh" href="${contextPath }/infoCenter/forexqh.html">期货 </a></li>
                <li class="al"><a id="wh" href="${contextPath }/infoCenter/forexwh.html">外汇</a></li>
    		</ul>
            </td>
          </tr>
        </table>

        <table align="center" border="0" cellspacing="0" cellpadding="0" id="tzzyd_con" style="display:none">
          <tr>
            <td>
        	<ul>
                <li class="al"><a id="tzzydzxdt" href="${contextPath }/investorEdu/investorNew.html">最新公告</a></li>
                <li class="al"><a id="tzschool" href="${contextPath }/investorEdu/investorSchool.html">投资教育学院</a></li>
                <li class="al"><a id="zcfg" href="${contextPath }/investorEdu/investorZcfg.html">政策法规</a></li>
                <li class="al"><a id="spxx" href="${contextPath }/investorEdu/investorVideofxsp.html">视频学习</a></li>
            </ul>
            </td>
          </tr>
        </table>

        <table align="center" border="0" cellspacing="0" cellpadding="0" id="grgf_con" style="display:none">
          <tr>
            <td>
        	<ul>
                <li class="al"><a id="jjywjs" href="${contextPath }/branches/index.html">经纪业务介绍</a></li>
                <li class="al"><a id="jjywcredit" href="${contextPath }/branches/indexCredit.html">经纪业务荣誉</a></li>
                <li class="al"><a id="khfwtx" href="${contextPath }/branches/customerService.html">客户服务体系</a></li>
                <li class="al"><a id="cpyfw" href="${contextPath }/branches/productsServices.html">产品与服务</a></li>
                <li class="al"><a id="yywd" href="${contextPath }/branches/yywdServices.html">营业网点</a></li>
                <li class="al"><a id="mgrInfo" href="${contextPath }/branches/mgrInfoSearch.jsp?nav=grgf&nav1=mgrInfo">业务人员执业资格信息查询</a> </li>
            </ul>
            </td>
          </tr>
        </table>
</div>

<div id="light" class="white_content" style="display:none">
    	<div class="top"><span><a href="#" onclick = "document.getElementById('light').style.display='none';"><img src="../pic/mobile/zxpop4.gif" /></a></span>页面交易升级公告</div>
        <div class="con">
       	  <div style=" width:440px; margin:0 auto">
       	  <p style=" height:20px"><font color="red"> </font>尊敬的客户：</p>
		   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;为保护投资者利益，加强客户交易账户安全管理，我司对页面交易系统提供了安全保护控件，请点击以下“新页面交易”按钮进入，如果您的系统无法自动下载安装该控件，请手工点击下载控件后再安装；如果您的系统无法正常安装该控件，请点击以下“旧页面交易”按钮进入。旧页面交易将在2011年1月15日后停用，如有疑问请拨打我司客户服务热线95575。
		  新版页面交易建议选用IE浏览器。
		   <br /> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;由此给您带来的不便，敬请谅解。
		   <br /> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;特此公告。

		<p align="right">广发证券股份有限公司</p>
		<p align="right">2010年12月28日</p>
		<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="javascript:window.open('https://121.14.6.135');">

		<input type="button" value="新页面交易" class="but01"/></a>
		&nbsp;&nbsp;&nbsp;<a href="#" onclick="javascript:window.open('<%=gfymjy %>');">
		<input type="button" value="旧页面交易" class="but01"/></a>
		<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="javascript:window.open('${contextPath }/cms/showDocumentFile.jsp?id=674231');">页面交易控件使用指引&gt;&gt;</a>

            </div>
            <div class="blank10"></div><br />

        </div>
        <div class="bottom">

        </div>
  </div>
  </div>
  </div>
<script type="text/javascript">
var stock = new StockSuggest();
	stock.registById('searchgpdm');
	stock.registForm('frmZqjs');
</script>
<div style=" height:2px; overflow:hidden"></div>
<%
	String nav =	request.getParameter("nav");
	String nav1 = request.getParameter("nav1");
	if (nav != null && !"".equals(nav))
	{
			%>
					<script type="text/javascript">
						document.getElementById('index').className = "font14 white topmenu_a";
						document.getElementById('<%=nav%>').className = "font14 white topmenu_hover";
						document.getElementById("<%=nav%>_con").style.display = "block";
					</script>

			<%
	}
	if (nav1 != null && !"".equals(nav1))
	{
			%>

					<script type="text/javascript">
						document.getElementById('<%= nav1 %>').className = "active red";

					</script>
			<%
	}
%>

</body>
</html>
