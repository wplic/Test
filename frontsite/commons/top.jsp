<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<div class="top">
<script src="/js/topmenu.js"></script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><a href="/index.jsp" onfocus="this.blur()"><img src="/pic/share/top/logo.gif" /></a></td>
    <td valign="top">
    <table width="200" align="right" class="mt6">
    <tr>
      <td width="18" height="21" align="right"><a href="#"><img src="/pic/share/top/list_01.jpg"/></a></td>
      <td width="63" align="center" class="red2 bold"><a href="new.gf.com.cn">返回主站</a></td>
    </tr>
    <tr>
      <td colspan="5">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="5"><table width="167" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="56">证券检索:</td>
          <td><input type="text" name="textfield4" id="textfield4" class="input108" style=" width:85px" /></td>
          <td align="center"><a href="/infoCenter/stockF10.jsp"><img src="/pic/index/list_02.gif" /></a></td>
        </tr>
      </table></td>
    </tr>
  </table></td>
  </tr>
</table>
</div>
<table width="921" border="0" cellspacing="0" cellpadding="0" class="topmenu">
  <tr>
    <td align="left"><img src="/pic/share/top/menu_bgl.jpg"></td>
    <td class="font14 white topmenu_hover" id="index" onmouseover="selectMenu(this.id)"><a href="/index.jsp">首  页</a></td>
    <td width="5"><img src="/pic/share/top/menu_line.jpg"></td>
    <td class="font14 white topmenu_a" id="wsyyt" onmouseover="selectMenu(this.id)"><a href="/wsyyt/index.jsp">网上营业厅</a></td>
    <td width="5"><img src="/pic/share/top/menu_line.jpg"></td>
    <td class="font14 white topmenu_a" id="jgj" onmouseover="selectMenu(this.id)"><a href="/wsyyt/financingCenter.jsp">金管家服务</a></td>
    <td width="5"><img src="/pic/share/top/menu_line.jpg"></td>
    <td class="font14 white topmenu_a" id="zxzx" onmouseover="selectMenu(this.id)"><a href="/infoCenter/index.jsp">资讯中心</a></td>
    <td width="5"><img src="/pic/share/top/menu_line.jpg"></td>
    <td class="font14 white topmenu_a" id="tzzyd" onmouseover="selectMenu(this.id)"><a href="/investorEdu/investorSchool.html">投资者园地</a></td>
    <td width="5"><img src="/pic/share/top/menu_line.jpg"></td>
    <td class="font14 white topmenu_a" id="grgf" onmouseover="selectMenu(this.id)"><a href="#">分支机构</a></td>
    <td align="right"><img src="/pic/share/top/menu_bgr.jpg"></td>
  </tr>
</table>
<div class="topsubmenu">
       <table align="center" border="0" cellspacing="0" cellpadding="0" id="index_con" style="display:none">
          <tr>
            <td>&nbsp;</td>
          </tr>
        </table>

	    <table align="center" border="0" cellspacing="0" cellpadding="0" id="wsyyt_con" style="display:none">
          <tr>
            <td>
        	<ul>
                <li class="al"><a href="#">预约开户</a></li>
                <li class="al"><a href="/wsyyt/tradeAffiche.jsp">交易公告</a></li>
                <li class="al"><a href="/wsyyt/quotes.jsp">页面行情</a></li>
                <li class="al"><a href="/wsyyt/softDownload.jsp">软件下载</a></li>
                <li class="al"><a href="#">页面交易</a></li>
                <li class="al"><a href="/wsyyt/iptv.jsp" class="active red">IPTV视频</a></li>
                <li class="al"><a href="/wsyyt/mobileDeal.jsp">广发移动交易厅</a></li>
                <li class="al"><a href="#">95575</a></li>
                <li class="al"><a href="/wsyyt/financingCenter.jsp">我的理财中心</a></li>       
            </ul>
            </td>
          </tr>
        </table>
        
        <table align="center" border="0" cellspacing="0" cellpadding="0" id="jgj_con" style="display:none">
          <tr>
            <td>&nbsp;</td>
          </tr>
        </table>
        
        <table align="center" border="0" cellspacing="0" cellpadding="0" id="zxzx_con" style="display:none">
          <tr>
            <td>
        	<ul>
                <li class="al"><a href="/infoCenter/gfView.jsp">广发视点</a></li>
                <li class="al"><a href="/infoCenter/news.jsp">新闻</a></li>
                <li class="al"><a href="/infoCenter/stock.jsp">股票</a></li>
                <li class="al"><a href="/infoCenter/newStock.jsp">新股</a></li>
                <li class="al"><a href="/infoCenter/fund.jsp">基金</a></li>
                <li class="al"><a href="/infoCenter/warrant.jsp">权证</a></li>
                <li class="al"><a href="/infoCenter/zxmarket.jsp">中小板</a></li>
                <li class="al"><a href="/infoCenter/thmarket.jsp">三板</a></li>
                <li class="al"><a href="/infoCenter/bond.jsp">债券</a></li>
                <li class="al"><a href="/infoCenter/bstock.jsp">B股</a></li>
                <li class="al"><a href="/infoCenter/hkstock.jsp">港股</a></li>
                <li class="al"><a href="/infoCenter/future.jsp">期货 </a></li>
                <li class="al"><a href="/infoCenter/forex.jsp">外汇</a></li>
                <li class="al"><a href="/infoCenter/stockF10.jsp">个股f10</a></li>
                         
            </ul>
            </td>
          </tr>
        </table>
        
        <table align="center" border="0" cellspacing="0" cellpadding="0" id="tzzyd_con" style="display:none">
          <tr>
            <td>
        	<ul>
                <li class="al"><a href="/investorEdu/investorNew.jsp">投资教育最新动态</a></li>
                <li class="al"><a href="/investorEdu/investorRisk.jsp">风险教育</a></li>
                <li class="al"><a href="#">股民学校</a></li>
                <li class="al"><a href="#">投资经验谈</a></li>
                <li class="al"><a href="#">政策法规</a></li>
                <li class="al"><a href="/investorEdu/investorBaseStock.jsp?nav=tzzyd&nav1=spjy1&nav2=gpsrx">视频教育</a></li>
                <li class="al"><a href="/investorEdu/investorSurvey.jsp">调查问卷</a></li>       
            </ul>
            </td>
          </tr>
        </table>
        
        <table align="center" border="0" cellspacing="0" cellpadding="0" id="grgf_con" style="display:none">
          <tr>
            <td>
        	<ul>
                <li class="al"><a href="#">经纪业务介绍</a></li>
                <li class="al"><a href="#">组织架构</a></li>
                <li class="al"><a href="#">经纪业务荣誉</a></li>
                <li class="al"><a href="#">客户服务体系</a></li>
                <li class="al"><a href="#">产品与服务</a></li>
                <li class="al"><a href="#">营业网点</a></li>     
            </ul>
            </td>
          </tr>
        </table>       
</div>
<div style=" height:2px; overflow:hidden"></div>

