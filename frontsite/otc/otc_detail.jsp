<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="com.cssweb.otc.service.OtcService"%>
<%@page import="com.cssweb.common.util.DataRow"%>
<%@page import="java.util.List"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券柜台交易产品-产品详情</title>
<link href="${ctx }/css/otc/common.css" rel="stylesheet" type="text/css" />
<style type="text/css">
</style>
</head>
<%
	
	String id = request.getParameter("id");
	//获取产品详细信息
	request.setAttribute("rgfedw","份");//认购份额单位，默认份
	if(Integer.parseInt(id)!=-1){
		OtcService service = new OtcService(request);
		DataRow dr = service.getOtcInfoById(Long.valueOf(id));
		List noticeList = service.getNoticeTop5(dr.getString("code"));
		request.setAttribute("noticeList",noticeList);
		long hetongId = service.getDocumentId("1",dr.getString("code"));
		long shuomingId = service.getDocumentId("2",dr.getString("code"));
		long cpfengxieId = service.getDocumentId("3",dr.getString("code"));
		request.getSession().setAttribute("docHetong",hetongId);
		request.getSession().setAttribute("docShuoming",shuomingId);
		request.getSession().setAttribute("docFengxian",cpfengxieId);
		request.getSession().setAttribute("otcCode",dr.getLong("code"));
		request.getSession().setAttribute("otcId",dr.getLong("id"));
		request.getSession().setAttribute("otcName",dr.getString("name"));
		request.setAttribute("code",dr.getString("code"));
		request.setAttribute("name",dr.getString("name"));
		request.setAttribute("state",dr.getString("state"));
		request.setAttribute("glr",dr.getString("glr"));
		request.setAttribute("money",dr.getString("money"));
		request.setAttribute("producttype",dr.getString("producttype"));
		request.setAttribute("productgc",dr.getString("productgc"));
		request.setAttribute("nhsy",dr.getString("nhsy"));
		request.setAttribute("dates",dr.getString("dates"));
		request.setAttribute("tzfw",dr.getString("tzfw"));
		request.setAttribute("startdate",dr.getString("startdate"));
		request.setAttribute("enddate",dr.getString("enddate"));
		request.setAttribute("tzqx",dr.getString("tzqx"));
		request.setAttribute("rgzl",dr.getString("rgzl"));
		request.setAttribute("fy_tgfl",dr.getString("fy_tgfl"));
		request.setAttribute("fy_xsfl",dr.getString("fy_xsfl"));
		request.setAttribute("fy_glfl",dr.getString("fy_glfl"));
		request.setAttribute("sgsh",dr.getString("sgsh"));
		request.setAttribute("jyzr",dr.getString("jyzr"));
		request.setAttribute("lcsy",dr.getString("lcsy"));
		request.setAttribute("bjsyzf",dr.getString("bjsyzf"));
		request.setAttribute("dzr",dr.getString("dzr"));
		request.setAttribute("fetgr",dr.getString("fetgr"));
		request.setAttribute("xsr",dr.getString("xsr"));
		request.setAttribute("bjs",dr.getString("bjs"));
		request.setAttribute("rgfedw",dr.getString("rgfedw"));
		request.setAttribute("rgqd",dr.getString("rgqd"));
		request.setAttribute("fxpj",dr.getString("fxpj"));
		request.setAttribute("shtzz",dr.getString("shtzz"));
		request.setAttribute("mjq",dr.getString("mjq"));
		request.setAttribute("gmsx",dr.getString("gmsx"));
		request.setAttribute("xsdq",dr.getString("xsdq"));
		request.setAttribute("sk",dr.getString("sk"));
		request.setAttribute("other",dr.getString("other"));
	}
%>
<body>
<br /><jsp:include page="${ctx}/commons/mstop.jsp" />
<div class="main"><!--此处CLASS样式为原网站引用的--> 
	<div class="gtjy_l_t"><span>当前位置：</span><a href="${ctx}/otc/action/OtcAction.go?function=FrontGetOtcList">广发OTC首页 </a> > 产品详情</div>
  <!--请从此处复制代码开始--> 
  <div id="gtjy" class="gtjy">
    <div class="gtjy_01">
      <div class="gtjy_01_l">
        <div class="ny_banner">
          <img alt="热烈庆祝广发证券柜台市场产品正式对外发售" src="${ctx }/images/otc/img_01.jpg"/>
        </div>
      </div>
      <div class="ico_03" style="height: 285px;"><img src="${ctx }/images/otc/ico_03.gif" alt="" border="0" usemap="#Map"/>
        <map name="Map" id="Map">
          <area shape="rect" coords="8,9,239,90" href="${ctx }/front/otcDocumentAction.do?method=getDocInfo2&documentId=${sessionScope.docHetong }"/>
          <area shape="rect" coords="10,100,240,185" href="${ctx }/front/otcDocumentAction.do?method=getDocInfo2&documentId=${sessionScope.docShuoming }"/>
          <area shape="rect" coords="9,194,239,283" href="${ctx }/front/otcDocumentAction.do?method=getDocInfo2&documentId=${sessionScope.docFengxian }"/>
        </map>
      </div>
    </div>
    <div class="dt_t"><img alt="产品详情" src="${ctx }/images/otc/lm_bg5.gif"/></div>
    <div class="detail">
    <div class="dt_1">
    <table border="0" cellpadding="0" cellspacing="1" class="tab_1" style="border-collapse:inherit;border-spacing: 1px;">
  <tr>
    <td id="tab_td" colspan="2">产品概况</td>
    </tr>
    <tr>
      <td class="tab_td2" rowspan="2">产品名称</td>
      <td align="center">${name }</td>
    </tr>
    <tr>
      <td align="center">${code }</td>
    </tr>
    <c:if test="${not empty glr}">
	    <tr>
	      <td class="tab_td2">管理人</td>
	      <td>${glr }</td>
	    </tr>
    </c:if>
    <c:if test="${not empty state}">
	    <tr>
	      <td class="tab_td2">产品状态</td>
	      <td>${state }</td>
	    </tr>
    </c:if>
    <c:if test="${not empty money}">
	    <tr>
	      <td class="tab_td2">投资及收益币种</td>
	      <td>${money }</td>
	    </tr>
    </c:if>
    <c:if test="${not empty producttype}">
	    <tr>
	      <td class="tab_td2">产品类型</td>
	      <td>${producttype }</td>
	    </tr>
	</c:if>
	<c:if test="${not empty productgc}">
	    <tr>
	      <td class="tab_td2">产品结构</td>
	      <td>${productgc }<br></td>
	    </tr>
	</c:if>
	<c:if test="${not empty nhsy}">
	    <tr>
	      <td class="tab_td2">预期年化收益率</td>
	      <td>${nhsy }%</td>
	    </tr>
	</c:if>
	<c:if test="${not empty dates}">
	    <tr>
	      <td class="tab_td2">计算投资收益基础天数</td>
	      <td>${dates }天</td>
	    </tr>
	</c:if>
	<c:if test="${not empty tzfw}">
	    <tr>
	      <td class="tab_td2">产品投资范围</td>
	      <td>${tzfw }</td>
	    </tr>
	</c:if>
	<c:if test="${not empty tzqx}">
	    <tr>
	      <td class="tab_td2">投资期限</td>
	      <td>${tzqx }</td>
	    </tr>
	</c:if>
	<c:if test="${not empty startdate}">
	    <tr>
	      <td class="tab_td2">投资起始日和到期日</td>
	      <td>${startdate } - ${enddate }</td>
	    </tr>
	</c:if>
	<c:if test="${not empty rgzl}">
	    <tr>
	      <td class="tab_td2">认购指令</td>
	      <td>${rgzl }</td>
	    </tr>
	</c:if>
	<c:if test="${not empty sgsh}">
	    <tr>
	      <td class="tab_td2">申购/赎回</td>
	      <td>${sgsh }</td>
	    </tr>
	</c:if>
	<c:if test="${not empty jyzr}">
	    <tr>
	      <td class="tab_td2">交易转让</td>
	      <td>${jyzr }</td>
	    </tr>
	</c:if>
	<c:if test="${not empty lcsy}">
	    <tr>
	      <td class="tab_td2">理财收益</td>
	      <td>${lcsy }</td>
	    </tr>
	</c:if>
	<c:if test="${not empty bjsyzf}">
	    <tr>
	      <td class="tab_td2">本金及收益支付</td>
	      <td>${bjsyzf }</td>
	    </tr>
	</c:if>
	<c:if test="${not empty dzr}">
	    <tr>
	      <td class="tab_td2">到账日</td>
	      <td><br>
	        ${dzr }</td>
	    </tr>
	</c:if>
	<c:if test="${not empty fetgr}">
	    <tr>
	      <td class="tab_td2">产品托管人</td>
	      <td>${fetgr }</td>
	    </tr>
	</c:if>
	<c:if test="${not empty xsr}">
	    <tr>
	      <td class="tab_td2">产品销售人</td>
	      <td>${xsr }</td>
	    </tr>
	</c:if>
	<c:if test="${not empty bjs}">
	    <tr>
	      <td class="tab_td2">报价商</td>
	      <td>${bjs }</td>
	    </tr>
	</c:if>
</table>
<table border="0" cellpadding="0" cellspacing="1" class="tab_1" style="border-collapse:inherit;border-spacing: 1px;">
  <tr>
    <td id="tab_td2" colspan="2">购买说明</td>
    </tr>
    <c:if test="${not empty rgfedw}">
      <tr>
        <td class="tab_td2">认购份额单位</td>
        <td>${rgfedw }</td>
      </tr>
    </c:if>
   	<c:if test="${not empty rgqd}">
      <tr>
        <td class="tab_td2">认购起点</td>
        <td>${rgqd }</td>
      </tr>
    </c:if>
    <c:if test="${not empty fxpj}">
      <tr>
        <td class="tab_td2">产品风险评级</td>
        <td>${fxpj }</td>
      </tr>
    </c:if>
    <c:if test="${not empty shtzz}">
      <tr>
        <td class="tab_td2">适合的投资者</td>
        <td>${shtzz }</td>
      </tr>
    </c:if>
    <c:if test="${not empty mjq}">
      <tr>
        <td class="tab_td2">产品募集期</td>
        <td>${mjq }</td>
      </tr>
    </c:if>
    <c:if test="${not empty gmsx}">
      <tr>
        <td class="tab_td2">计划发行规模上限</td>
        <td>${gmsx }</td>
      </tr>
   </c:if>
   <c:if test="${not empty xsdq}">
      <tr>
        <td class="tab_td2">产品销售地区</td>
        <td>${xsdq }</td>
      </tr>
   </c:if>
   <c:if test="${not empty sk}">
      <tr>
        <td class="tab_td2">税款</td>
        <td>${sk }</td>
      </tr>
   </c:if>
   <c:if test="${not empty other}">
      <tr>
        <td class="tab_td2">其他</td>
        <td>${other }</td>
      </tr>
   </c:if>
   <c:if test="${not empty fy_tgfl || not empty fy_xsfl || not empty fy_glfl}">
      <tr>
        <td class="tab_td2">产品费用</td>
        <td>
          <c:if test="${not empty fy_tgfl}">
          	托管费率：${fy_tgfl }<br />
          </c:if>
          <c:if test="${not empty fy_xsfl}">
          	产品销售费率：${fy_xsfl }<br />
          </c:if>
          <c:if test="${not empty fy_glfl}">
          	产品管理费率：${fy_glfl }
          </c:if>
        </td>
      </tr>
    </c:if>
  </table>


    </div>
    <div class="dt_2">
    <div class="xian_01"></div>
    <div class="dt_2_c">
        <div class="lm_1">
			<span>产品公告</span><a href="${ctx }/otc/action/OtcAction.go?function=GetOtcDocumentNotice&otcCode=${code }" target="_blank">更多></a>
		</div>
		<div class="con_1">
			<table align="center" class="lh25 font_st" width="100%">
			<c:if test="${not empty noticeList}">
			 <logic:iterate id="data" name="noticeList">
			  	<tr class="xuxian">
				    <td width="70%" align="left"><span class="font_8c">·</span>
				      <a href="${ctx }/front/otcDocumentAction.do?method=getDocInfo3&documentId=${data.id }" target=\"_blank\">
						    ${data.title}
				      </a>
				    </td>
				    <td align="right"><span class="font_8c">${data.upddate }</span></td>
				  </tr>
			  </logic:iterate>
			 </c:if>
			 <c:if test="${empty noticeList}">
			 	<tr>
			 		<td colspan="2" align="center">暂无记录...</td>
			 	</tr>
			 </c:if>
			 <%
			 	List noticeList = (List)request.getAttribute("noticeList");
			 	if(noticeList!=null && noticeList.size()<15){ 
			  	for(int i=0;i<(8-noticeList.size());i++){
			  %>
			  		<tr class="xuxian">
				    <td width="70%" align="left"><span class="font_8c">.</span>
				    </td>
				    <td align="right"><span class="font_8c"></span></td>
				  </tr>
			  <%} }%>
			</table>
		</div>
    </div>
    </div>
    </div>
    </div>
    
  
  <!--请从此处复制代码结束--> 
</div>
<div class="foot"><jsp:include page="${ctx }/commons/msbottom.jsp" /></div>
<div style="text-align:center;">
</div>
</body>
</html>