<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<%@ include file="/commons/taglibs.jsp"%>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<p><img src="/pic/about/siedban1.jpg" /></p>
<bean:parameter name="nav" id="nav" value="yjgl"/>
<div class="sidemenu">
  		<table width="198">
          <tr>
            <td class="<%="yjgl".equals(nav)?"active sideblue":"link sideblue" %>"><a href="${ctx }/investmentBank/featYjgl.html">业绩概览</a></td>
          </tr>
          <tr>
            <td class="<%="zxqycx".equals(nav)?"active sideblue":"link sideblue" %>"><a href="${ctx }/investmentBank/featQycx.html">中小企业承销</a></td>
          </tr>
            <td class="<%="cxhyfb".equals(nav)?"active sideblue":"link sideblue" %>"><a href="${ctx }/investmentBank/featCxfb.html">承销行业分布</a></td>
          </tr>
          <tr>
            <td class="<%="ryjl".equals(nav)?"active sideblue":"link sideblue" %>"><a href="${ctx }/investmentBank/featHonor.html">荣誉与奖励</a></td>
          </tr>
          
          <tr>
            <td class="<%="jbsgyw".equals(nav)?"active sideblue":"link sideblue" %>"><a href="${ctx }/investmentBank/b_jbsg.jsp?nav=jbsgyw">兼并收购业务</a></td>
          </tr>
           <tr>
            <td class="<%="zjrzyw".equals(nav)?"active sideblue":"link sideblue" %>"><a href="${ctx }/investmentBank/b_zqrz.jsp?nav=zjrzyw">债权融资业务</a></td>
          </tr>
          <tr>
            <td class="<%="swrzyw".equals(nav)?"active sideblue":"link sideblue" %>"><a href="${ctx }/investmentBank/b_smrz.jsp?nav=swrzyw">私募融资业务</a></td>
          </tr>
        </table>
</div>


