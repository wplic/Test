<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<bean:parameter name="nav" id="nav" value="gsgy"/>
<p><img src="/pic/investorNexus/tzzgx.jpg" /></p>
<div class="sidemenu">
  		<table>
  		         
          <tr>
            <td class="<%="gpxx".equals(nav)?"active sideblue":"link sideblue"%>"><a href="${ctx }/investorNexus/stockInfo.html">股票信息</a></td>
          </tr>
         
          <tr>
            <td class="<%="gsgg".equals(nav)?"active sideblue":"link sideblue"%>"><a href="${ctx }/document/init_doc.do?method=initInfodocument&catname=tzzgx_gsgg">公司公告</a></td>
          </tr>
           <tr>
            <td class="<%="gzpjpf".equals(nav)?"active sideblue":"link sideblue"%>"><a href="${ctx }/financeMsgAction.do?method=getFinanceMessageList&ext3=2">公众评议平台</a></td>
          </tr>
          <tr>
            <td class="<%="tzfdpt".equals(nav)?"active sideblue":"link sideblue"%>"><a href="${ctx }/financeMsgAction.do?method=getFinanceMessageList&ext3=3">投资者互动平台</a></td>
          </tr>
          <tr>
            <td class="<%="hdjl".equals(nav)?"active sideblue":"link sideblue"%>"><a href="${ctx }/investorNexus/activeRecord.jsp">投资者关系活动记录</a></td>
          </tr>
          <tr>
            <td class="<%="lxwm".equals(nav)?"active sideblue":"link sideblue"%>"><a href="${ctx }/investorNexus/contactUs.html">联络我们</a></td>
          </tr>
         
        </table>

  </div>


