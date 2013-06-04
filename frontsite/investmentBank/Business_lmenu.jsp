<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="/commons/taglibs.jsp"%>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<p><img src="/pic/about/siedban1.jpg" /></p>
<bean:parameter name="nav" id="nav" value="ywfw"/>
<div class="sidemenu">
  		<table>
          <tr>
            <td class="<%="ywfw".equals(nav)?"active sideblue":"link sideblue" %>"><a href="${ctx }/investmentBank/businessYwfw.html">业务范围</a></td>
          </tr>
          <tr>
            <td class="<%="ywys".equals(nav)?"active sideblue":"link sideblue" %>"><a href="${ctx }/investmentBank/businessAdvantage.html">业务优势</a></td>
          </tr>
          <tr>
            <td class="<%="ywlc".equals(nav)?"active sideblue":"link sideblue" %>"><a href="${ctx }/investmentBank/businessLc.html">业务流程</a></td>
          </tr>
        </table>
</div>


