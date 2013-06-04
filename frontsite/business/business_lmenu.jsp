<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<%@ include file="/commons/taglibs.jsp"%>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script src="/js/about_lmenu.js"></script>
<bean:parameter name="nav" id="nav" value="tzyh"/>
<bean:parameter name="nav1" id="nav1" value="gplz"/>
<p><img src="/pic/business/ywjs.jpg" /></p>
<div class="sidemenu">
  		<table>
          <tr>
            <td class="<%="tzyh".equals(nav)?"active sideblue":"link sideblue"%>" id="hor1" onclick="selectlMenu('hor1','board1')"><a href="#">投资银行业务</a></td>
          </tr>
          <tr>
            <td class="submenu" id="board1" style="<%="tzyh".equals(nav)?"":"display:none" %>">
            	<ul>
                	<li><a href="${ctx }/business/businessIntro.html"><span class="<%="gprz".equals(nav1)?"font_a9":"font_43"%>">·股票融资业务</span></a></li>
                    <li><a href="${ctx }/business/mergersAndAcquisitions.html"><span class="<%="jbsg".equals(nav1)?"font_a9":"font_43"%>">·兼并收购业务</span></a></li>
                    <li><a href="${ctx }/business/financialAdviser.html"><span class="<%="cwgw".equals(nav1)?"font_a9":"font_43"%>">·财务顾问业务</span></a></li>
                    <li><a href="${ctx }/business/bondUnderwriting.html"><span class="<%="zqcx".equals(nav1)?"font_a9":"font_43"%>">·债券承销业务</span></a></li>
                    <li><a href="${ctx }/business/non-listedCompanies.html"><span class="<%="fssgs".equals(nav1)?"font_a9":"font_43"%>">·非上市公司业务</span></a></li>
                    <li><a href="${ctx }/business/structuredFinance.html"><span class="<%="jgrz".equals(nav1)?"font_a9":"font_43"%>">·结构融资业务</span></a></li>
                </ul>
            </td>
          </tr>
          <tr>
            <td class="<%="jjdl".equals(nav)?"active sideblue":"link sideblue"%>"><a href="${ctx }/business/brokerAgent.html">经纪代理业务</a></td>
          </tr>
           <tr>
            <td class="<%="rzrq".equals(nav)?"active sideblue":"link sideblue"%>"><a href="${ctx }/business/businessRzrq.jsp">融资融券业务</a></td>
          </tr>
          <tr>
            <td class="<%="zcgl".equals(nav)?"active sideblue":"link sideblue"%>"><a href="${ctx }/business/assetManagement.html">资产管理业务</a></td>
          </tr>
          <tr>
            <td class="<%="tzzy".equals(nav)?"active sideblue":"link sideblue"%>" id="hor2" onclick="selectlMenu('hor2','board2')"><a href="#">投资自营业务</a></td>
          </tr>
          <tr>
            <td class="submenu" id="board2" style="<%="tzzy".equals(nav)?"":"display:none" %>">
            	<ul>
                	<li><a href="${ctx }/business/securitiesInvestment.html"><span class="<%="qylzq".equals(nav1)?"font_a9":"font_43"%>">·权益类证券投资业务</span></a></li>
                    <li><a href="${ctx }/business/financialDerivatives.html"><span class="<%="jrys".equals(nav1)?"font_a9":"font_43"%>">·金融衍生产品业务</span></a></li>
                    <li><a href="${ctx }/business/fixedIncome.html"><span class="<%="gdsy".equals(nav1)?"font_a9":"font_43"%>">·固定收益业务</span></a></li>
                </ul>
            </td>
          </tr>
          <tr>
            <td class="<%="yjjgw".equals(nav)?"active sideblue":"link sideblue"%>"><a href="${ctx }/business/researchAndConsult.html">研究及顾问服务</a></td>
          </tr>
          <tr>
            <td class="<%="ywgg".equals(nav)?"active sideblue":"link sideblue"%>"><a href="${ctx }/business/businessYwgg.html">业务公告</a></td>
          </tr>
        </table>

  </div>


