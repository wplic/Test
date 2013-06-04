<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.enterprisesell.service.EnterpriseSellService"/>
<jsp:directive.page import="java.util.List"/>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<jsp:directive.page import="com.cssweb.enterprisesell.pojo.EnterpriseSell"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/investmentBank/investmentBank.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	.tlbgaa{ background:#ffffff; border:0px solid #cccccc; padding:0px}
</style>
</head>
<%
		String category = "tzyh_thgg";
		ServletContext sc = this.getServletConfig().getServletContext();
		ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(sc);
		EnterpriseSellService service = (EnterpriseSellService)ctx.getBean("enterpriseSellService");
		Map map=new HashMap();
		map.put("type","1");
		map.put("sortName", "code");
		map.put("dir", "asc");
		List list = service.selectAll(map);
 %>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
<div class="blank10"></div>
<div>
		<div class="tlbgaa">
		
<table width="920" align="center">
  <tr>
    <td><img src="/pic/investmentBank/banner1.jpg"/></td>
    <td width="234" valign="top">
    	<div class="gg_top">投行公告</div>
        <div class="gg_mid">
        <marquee scrollamount="3" direction="up" onmouseover="this.stop()" onmouseout="this.start()" height="120">
        	<table width="95%" align="center" border="0" cellspacing="0" cellpadding="0" class="lh24">
          	<paging:page count="false" row="20" provider="<%= new com.css.cms.document.model.DocumentFrontListProvider(category,request)%>" tableId="doclist">
		          <paging:pageRow id="doc" type="com.css.cms.document.Document"> 
		          	 <tr>
		              <td width="7%" valign="top"><img class="pt7" src="/pic/msindex/list_02.gif"/></td>
		              <td><a href="${contextPath }/commons/infoList.jsp?docId=<%=doc.getId()%>" target=\"_blank\"><%=DocumentHelper.getTitle(doc ,60)%></a></td>
		            </tr>
		          </paging:pageRow>
          	</paging:page>
            </table>
          </marquee>
        
        
        </div>
        <div class="gg_bot"></div>
    </td>
  </tr>
</table>
<div class="blank8"></div>
<table width="920" align="center">
  <tr>
    <td valign="top">
    	<div id="ywfw">
        	<h3>我们的业务范围</h3>
            <ul>
           	  <li class="active blue3" id="tagtabs1" onmouseover="SwitchNews('tabs', 1, 5,'active blue3','')"><a href="#">股权融资业务</a></li>
                <li id="tagtabs2" onmouseover="SwitchNews('tabs', 2, 5,'active blue3','')"><a href="#">财务顾问业务</a></li>
                <li id="tagtabs3" onmouseover="SwitchNews('tabs', 3, 5,'active blue3','')"><a href="#">债权融资业务</a></li>
                <li id="tagtabs4" onmouseover="SwitchNews('tabs', 4, 5,'active blue3','')"><a href="#">兼并收购业务</a></li>
                <li id="tagtabs5" onmouseover="SwitchNews('tabs', 5, 5,'active blue3','')"><a href="#">其他业务</a></li>
            </ul>
          <div class="blank10"></div>
            <table width="95%" align="center" class="lh25 font_st font_43" id="tabs1">
              <tr>
                <td width="57%">·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">IPO保荐与承销 </a></td>
                <td width="43%">·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">上市公司公募增发保荐与承销</a></td>
              </tr>
              <tr>
                <td>·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">上市公司定向增发保荐与承销 </a></td>
                <td>·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">上市公司配股保荐与承销</a></td>
              </tr>
              <tr>
                <td>·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">上市公司可转换债券/分离交易债券保荐与承销</a></td>
                <td>·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">上市公司股东可交换公司债券保荐与承销</a></td>
              </tr>
              <tr>
                <td>·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">股票衍生产品研究开发，如认股权证等</a></td>
                <td>&nbsp;</td>
              </tr>
            </table>
            
            <table width="95%" align="center" class="lh25 font_st font_43" id="tabs2" style="display:none">
              <tr>
                <td width="57%">·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">企业股份制改造顾问</a></td>
                <td width="43%">·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">上市辅导顾问</a></td>
              </tr>
              <tr>
                <td>·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">私募融资顾问</a></td>
                <td>·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">资本投资顾问</a></td>
              </tr>
              <tr>
                <td>·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">公司治理与规范顾问</a></td>
                <td>·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">管理层收购、员工持股与股权激励计划顾问</a></td>
              </tr>
              <tr>
                <td>·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">信息披露顾问</a></td>
                <td>·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">海外上市服务</a></td>
              </tr>
            </table>
            
            <table width="95%" align="center" class="lh25 font_st font_43" id="tabs3" style="display:none">
              <tr>
                <td width="57%">·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">企业债券发行与承销</a></td>
                <td width="43%">·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">公司债券发行与承销</a></td>
              </tr>
              <tr>
                <td>·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">次级债券发行与承销</a></td>
                <td>·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">短期融资券发行与承销 <font color="red">New!</font></a></td>
              </tr>
              <tr>
                <td>·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">可转换债券发行与承销</a></td>
                <td>·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">债券融资新品种研究开发</a></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>
            
            <table width="95%" align="center" class="lh25 font_st font_43" id="tabs4" style="display:none">
              <tr>
                <td width="57%">·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">上市公司控制权的收购与反收购</a></td>
                <td width="43%">·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">上市公司资产收购、出售或置换</a></td>
              </tr>
              <tr>
                <td>·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">大型企业行业整合</a></td>
                <td>·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">引进境内外战略投资者／战略联盟</a></td>
              </tr>
              <tr>
                <td>·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">上市公司股权结构优化</a></td>
                <td>·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">企业跨境并购</a></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>
            
            <table width="95%" align="center" class="lh25 font_st font_43" id="tabs5" style="display:none">
              <tr>
                <td width="57%">·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">保荐恢复上市</a></td>
                <td width="43%">·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">资产证券化</a></td>
              </tr>
              <tr>
                <td>·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">推荐挂牌转让</a></td>
                <td>·<a href="${ctx }/investmentBank/business.jsp?nav=ywfw">股权分置改革</a></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>




            <div class="blank10" style="height:11px"></div>
        </div>
    </td>
    <td width="234" valign="top"><div class="gg_top">我们的业务优势</div>
      <div class="gg_mid">
        <table width="95%" align="center" class="lh22 font_st">
          <tr>
            <td><a href="${ctx }/investmentBank/businessAdvantage.jsp?nav=ywys">·专业团结的人才队伍</a></td>
          </tr>
          <tr>
            <td><a href="${ctx }/investmentBank/businessAdvantage.jsp?nav=ywys">·全国性的服务网络</a></td>
          </tr>
          <tr>
            <td><a href="${ctx }/investmentBank/businessAdvantage.jsp?nav=ywys">·全方位资本市场服务</a></td>
          </tr>
          <tr>
            <td><a href="${ctx }/investmentBank/businessAdvantage.jsp?nav=ywys">·强大的定价销售能力</a></td>
          </tr>
          <tr>
            <td><a href="${ctx }/investmentBank/businessAdvantage.jsp?nav=ywys">·缜密的风控机制</a></td>
          </tr>
          <tr>
            <td><a href="${ctx }/investmentBank/businessAdvantage.jsp?nav=ywys">·领先行业的创新实力</a></td>
          </tr>
        </table>
      </div>
      <div class="gg_bot"></div></td>
  </tr>
</table>
<div class="blank8"></div>
<div class="main">
	<div class="cxb_top">中小板企业承销名列榜首</div>
    <div class="cxb_mid blue">
    <marquee scrollamount="3" onmouseover="this.stop()" onmouseout="this.start()" width="860" height="125">
    		<table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0">
    				<tr>
    							<%
						    	    if(list!=null && list.size()>0){
							    	EnterpriseSell sell = null;
							    	for(int j=0;j<list.size();j++){
							    		sell = (EnterpriseSell)list.get(j);
						    		%>
						    		<td align="center">
						    		<span class="mr26"><a href="/investmentBank/featQycx.jsp?nav=zxqycx"><img src="${ctx}/share/showUploadImage.jsp?id=<%=sell.getPicId()%>" width="115" height="90"/>
							    	<%=sell.getName() %><b>(</b><%=sell.getCode() %><b>)</b></a></span></td>
							    	<%
							    	}
							    } %>
    				</tr>
    		</table>
    </marquee>
  </div>
    <div class="cxb_bot"></div>
</div>
<div class="blank8"></div>

		</div>
</div>
</div>
<jsp:include page="/commons/msbottom.jsp" />
<script src="/js/setTab.js"></script>
</body>
<script type="text/javascript"> 
var _aq = _aq || [];
_aq.push(['_setSiteId', 10001]);_aq.push(['_setCatalogId', 14]); _aq.push(['_trackPageview']); (function() {
var ga = document.createElement( 'script'); ga.type = 'text/javascript'; ga.async = true; ga.src='http://121.8.153.59:8080/stat/stat.js'; var s = document.getElementsByTagName( 'script')[0]; s.parentNode.insertBefore(ga, s); })();
</script>
</html>