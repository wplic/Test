<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/>
		<script type="text/javascript">
	var XMLHttpReq_invest;
    var completeDiv_invest;
    var inputField_invest;
    var completeTable_invest;
    var completeBody_invest;
 	//创建XMLHttpRequest对象       
    function createXMLHttpRequest_invest() {
		if(window.XMLHttpRequest) { //Mozilla 浏览器
			XMLHttpReq_invest = new XMLHttpRequest();
		}
		else if (window.ActiveXObject) { // IE浏览器
			try {
				XMLHttpReq_invest = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					XMLHttpReq_invest = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {}
			}
		}
		
	}
	//发送匹配请求函数
    function getSearchList_invest(str) {
        inputField_invest = document.getElementById("searchgpdm_invest");            
        completeTable_invest = document.getElementById("complete_table_invest");
        completeDiv_invest = document.getElementById("popup_invest");
        completeBody_invest = document.getElementById("complete_body_invest");
        document.getElementById("gpdm_invest").value=inputField_invest.value;
        if (inputField_invest.value.length > 0) {
            createXMLHttpRequest_invest();   
            var url = "${contextPath}/f10.do?method=searchSecuritiesList&type=gp&gpdm=" + encodeURIComponent(str);  
            XMLHttpReq_invest.open("GET", url, true);
            
            XMLHttpReq_invest.onreadystatechange = processMatchResponse_invest;//指定响应函数
            XMLHttpReq_invest.send(null); // 发送请求
        } else {
            clearNames_invest();
        }
    }
	// 处理返回匹配信息函数
    function processMatchResponse_invest() {
    	if (XMLHttpReq_invest.readyState == 4) { // 判断对象状态
        	if (XMLHttpReq_invest.status == 200) { // 信息已经成功返回，开始处理信息
        	
                    setNames_invest(XMLHttpReq_invest.responseXML.getElementsByTagName("gpjj"));
            }else { //页面不正常
                window.alert("您所请求的页面有异常。");
            }
        }
    }
	//生成与输入内容匹配行
    function setNames_invest(names) {            
       clearNames_invest();
       var size = names.length;
       setOffsets_invest();
       var row, cell, txtNode;
       for (var i = 0; i < size; i++) {
           var nextNode = names[i].firstChild.data;
           row = document.createElement("tr");
           cell = document.createElement("td");
           cell.onmouseout = function() {this.style.backgroundColor ='#FFFAFA';};
           cell.onmouseover = function() {this.style.backgroundColor ='#f4a460';};
           cell.onmousedown = function() { completeField_invest(this); } ;                         
           txtNode = document.createTextNode(nextNode);
           cell.appendChild(txtNode);
           row.appendChild(cell);
           completeBody_invest.appendChild(row);
       }
   }
	//设置显示位置                
   function setOffsets_invest() {
       completeTable_invest.style.width = "230px";
       var left = calculateOffset_invest(inputField_invest, "offsetLeft")-200;
       var top = calculateOffset_invest(inputField_invest, "offsetTop") + inputField_invest.offsetHeight;
       completeDiv_invest.style.border = "black 1px solid";
       completeDiv_invest.style.left = left -80 + "px";
       completeDiv_invest.style.top = top -180+ "px";
   }
 	//计算显示位置       
    function calculateOffset_invest(field, attr) {
      var offset = 0;
      while(field) {
        offset += field[attr]; 
        field = field.offsetParent;
      }
      return offset;
    }
	//填写输入框
    function completeField_invest(cell) {
    	inputField_invest.value = cell.firstChild.nodeValue.split(" ")[0];
    	document.getElementById("gpdm_invest").value=cell.firstChild.nodeValue.split(" ")[0];
    	
        clearNames_invest();
    }
	//清除自动完成行
    function clearNames_invest() {
        var ind = completeBody_invest.childNodes.length;
        for (var i = ind - 1; i >= 0 ; i--) {
             completeBody_invest.removeChild(completeBody_invest.childNodes[i]);
        }
        completeDiv_invest.style.border = "none";
    }
    function clearDiv_invest(obj){
    	if(obj.value==''){
    		obj.value='';
    	}else{
    		clearNames_invest();
    	}
    }
</script>


<style>
body {
	margin: 0px;
	
}
</style>
<head>
<%
// 如果url传了股票代码，则用url的股票代码，否则用session中的股票代码
	String zqdm=request.getParameter("zqdm")==null?"":request.getParameter("zqdm");
	if(!zqdm.equals("")) session.setAttribute("stockCode", zqdm);
	
	if(session.getAttribute("stockCode")==null||session.getAttribute("stockCode").equals("")) session.setAttribute("stockCode", "600001");

	zqdm=(String)session.getAttribute("stockCode");
	
	String menu = request.getParameter("menu")==null?"1":request.getParameter("menu");

%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />

</head>
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=zxzx" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 资讯中心 > 个股资料
  </div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="/f10/stock/stockF10_lmenu.jsp">
			<jsp:param name="zqdm" value="<%=zqdm%>" />
			<jsp:param name="menu" value="1" />
	  </jsp:include>
  </div>
  <div class="iptvside_bot"></div>
  </div>
<input type="hidden" id="columnNum1" value="${stockCode}" />
<input type="hidden" id="columnNum2" value="${name}" />
<div class="w706 fright"> 
  <!--右侧sied开始-->
   <!--右侧个股价格开始-->
  <div class="ggxx"> <div class="ggxx_l"></div>
  <div class="ggxx_m">
 <div class="gpx"><h1>${name}</h1><h2>${stockCode}</h2></div>
 <div class="jiag"><ul>
   <li class="red bold font16 lh24">
   <fmt:formatDate value="<%=new java.util.Date() %>" pattern="yyyy-MM-dd" />
   </li>
   <li class="red lh21">+${quote.zf}&nbsp;&nbsp;&nbsp;&nbsp;-${quote.zd}</li></ul>
   <p class="red bold font14 mt8">&nbsp;<a href="javascript:document.location.reload()"><img src="../pic/infoCenter/f10/dot_fresh.jpg" align="absmiddle" />刷新</a></p>
</div>
<div style="position:absolute;z-index:200; left:138px; top:12px; width:550px;">
 <form name="frm" method="post" action="${contextPath}/f10.do?method=check" target="_parent">
<table width="100%" border="0">
  <tr>
    <td width="15" class="zqcx_l">&nbsp;</td>
    <td width="259" class="zqcx_m">证券查询：      
       <input name="searchgpdm" id="searchgpdm_invest" class="font_73" onmouseover="this.focus()" onfocus="this.select()"
													autocomplete="off" type="text" size="20" maxlength="6" 
													value="请输入股票代码"
													onblur="javascript:clearDiv_invest(this);"
													onkeyup="javascript:getSearchList_invest(this.value);this.value=this.value.replace(/\D/g,'');"
													onclick="javascript:this.value='';" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
		<div style="position: absolute; z-index:10100; width: 185px" id="popup_invest">
			<table id="complete_table_invest" bgcolor="#FFFAFA" border="0" cellspacing="0" cellpadding="0" style="border-left:1px solid #C1DAD7;border-top:1px solid #C1DAD7;border-bottom:1px solid #C1DAD7;border-right:1px solid #C1DAD7"/>
				<tbody id="complete_body_invest"></tbody>
			</table>
		</div>
		<input type="hidden" name="gpdm" id="gpdm_invest" />
        <input name="button" type="submit" class="button_xcx" id="button" value="查询" />
      </td>
    <td width="225" class="zqcx_m">实时行情截止： 
        <fmt:formatDate value="${quote.quoteTime}" pattern="yyyy-MM-dd" />
     </td>
    <td width="15" class="zqcx_r">&nbsp;</td>
  </tr>
</table>
 </form>
</div>
<div style="position:absolute;z-index:100; left:138px; top:47px; width:548px;background:url(/pic/infoCenter/f10/tab_bg114.jpg) repeat-x left bottom; border:1px solid #CCCCCC; height:114px;" align="center">
<table width="96%" border="0" class="lh25 mt6 textleft">
  <tr>
    <td>昨收盘</td>
    <td class="red">${quote.zrsp}元</td>
    <td>成交量</td>
    <td><fmt:formatNumber value="${quote.cjsl/10000 }" pattern="0" />万股</td>
    <td>市盈率</td>
    <td>${quote.syl1}倍</td>
  </tr>
  <tr>
    <td>开　盘</td>
    <c:if test='${quote.jrkp>quote.zrsp}'>								
		<td class="red">
		 ${quote.jrkp}元 
		</td>
	</c:if>
	<c:if test='${quote.jrkp<=quote.zrsp}'>								
		<td>
			<font color='green'>${quote.jrkp}</font>元
		</td>
	</c:if>

    <td>成交金额</td>
    <td><fmt:formatNumber value="${quote.cjje/10000 }" pattern="0" />万元</td>
    <td>总股本</td>
    <td>${quote.gb}万股</td>
  </tr>
  <tr>
    <td>最　高</td>
     <c:if test='${quote.zgcj>quote.zrsp}'>							
		<td class="red">
		 ${quote.zgcj}元 
		</td>
	</c:if>
	<c:if test='${quote.zgcj<=quote.zrsp}'>								
		<td>
			<font color='green'>${quote.zgcj}</font>元
		</td>
	</c:if>
    <td>涨幅%</td>
    <td class="red"><fmt:formatNumber value="${quote.zf*100}" pattern="0.00" />%</td>
    <td>总市值</td>
    <td>${quote.jz}亿元</td>
  </tr>
  <tr>
    <td>最　低</td>
     <c:if test='${quote.zdcj>quote.zrsp}'>								
		<td class="red">
		 ${quote.zdcj}元 
		</td>
	</c:if>
	<c:if test='${quote.zdcj<=quote.zrsp}'>								
		<td>
			<font color='green'>${quote.zdcj}</font>元
		</td>
	</c:if>
    <td>振　幅</td>
    <td><fmt:formatNumber value="${quote.amp*100}" pattern="0" />%</td>
    <td>流通市值</td>
    <td>${quote.sy}亿元</td>
  </tr>
</table>
</div>

  </div>
  <div class="ggxx_r"></div><!--右侧个股价格结束-->
   <div class="blank5"></div>
       <!--日K线开始-->
<div class="kline">
<div class="qiebg">
<iframe src="http://121.14.21.4/_gfflash.php?code=${stockCode}" id="fundIframe" marginheight="0" marginwidth="0" frameborder="0" scrolling="auto" width="660" style="height: 492px" ></iframe>
<div class="clearfloat"></div>
</div>
<!--五档买卖结束-->
<div class="clearfloat"></div>
</div><!--日K线结束-->
<div class="blank5"></div>

<!--下部div开始-->
<div class="width100">
<div class="f_left">
<table class="tab_cwzb">
  <tr>
    <th class="bcolor"><ul><li class="cwzb_qh">主要财务指标</li></ul></th>
  </tr>
  <tr>
    <td height="2"></td>
  </tr>
  <tr>
    <td class="nbord">
    <table width="100%" border="0" class="tab_xuxian25 textcenter" >
      <tr class="red">
        <td>主要财务指标(元)</td>
         <c:forEach var="financialAnalysis" items="${financialAnalysisList}">
		   <td >
			&nbsp;
		 <fmt:formatDate value="${financialAnalysis.endDate}" pattern="yyyy-MM-dd" />
	     </td>
	  </c:forEach>
      </tr>
      <tr>
        <td>每股收益</td>
        <c:forEach var="financialAnalysis" items="${financialAnalysisList}">
			<td>
				&nbsp;
		<fmt:formatNumber value="${financialAnalysis.earnings}" pattern="0.0#" />
			</td>
		</c:forEach>
      </tr>
      <tr>
        <td>扣除后每股收益</td>
        <c:forEach var="financialAnalysis" items="${financialAnalysisList}">
			<td>
				&nbsp;
			<fmt:formatNumber value="${financialAnalysis.earningsAfterAdjusting}" pattern="0.0#" />
			</td>
		</c:forEach>
      </tr>
      <tr>
        <td>每股净资产</td>
       <c:forEach var="financialAnalysis" items="${financialAnalysisList}">
		<td>
		&nbsp;
		<fmt:formatNumber value="${financialAnalysis.net}" pattern="0.0#" />
	 </td>
	</c:forEach>
      </tr>
      <tr>
        <td>每股现金流</td>
        <c:forEach var="financialAnalysis" items="${financialAnalysisList}">
			<td>
				&nbsp;
			<fmt:formatNumber value="${financialAnalysis.netFlow}" pattern="0.0#" />
			</td>
		</c:forEach>
      </tr>
      <tr>
        <td>每股资本公积金</td>
        <c:forEach var="financialAnalysis" items="${financialAnalysisList}">
			<td>
			&nbsp;
			<fmt:formatNumber value="${financialAnalysis.capitalFund}" pattern="0.0#" />
			</td>
		</c:forEach>
      </tr>
      <tr>
        <td>每股未分配利润</td>
        <c:forEach var="financialAnalysis" items="${financialAnalysisList}">
			<td>
				&nbsp;
			<fmt:formatNumber value="${financialAnalysis.profit}" pattern="0.0#" />
			</td>
		</c:forEach>
      </tr>
    </table></td>
  </tr>
</table>
<div class="blank5"></div>
<table class="tab_cwzb">
  <tr>
    <th class="bcolor"><ul>
      <li class="cwzb_qh" id="tagtabs01" onmouseover="SwitchNews('tabs0', 1, 4,'cwzb_qh','')">公司公告</li>
      <li id="tagtabs02" onmouseover="SwitchNews('tabs0', 2, 4,'cwzb_qh','')">公司新闻</li>
      <li id="tagtabs03" onmouseover="SwitchNews('tabs0', 3, 4,'cwzb_qh','')">市场评述</li>
      <li id="tagtabs04" onmouseover="SwitchNews('tabs0', 4, 4,'cwzb_qh','')">研究报告</li>
    </ul></th>
  </tr>
  <tr>
    <td height="2"></td>
  </tr>
  <tr>
    <td class="nbord">
    <table width="100%" border="0" class="lh25 textleft font_st" id="tabs01" style="display:">
      <c:forEach var="companyNotify" items="${companyNotifyList}">
		<tr>
			<td><span class="font_a8">·</span>
				<a
					href="${ctx }/cms/newsContentGazx.jsp?table=${companyNotifyTable}&guid=${companyNotify.guid}"
					title='${companyNotify.title}' target="_blank">${companyNotify.title}</a>
			</td>
			<td class="font_73">
				<fmt:formatDate value="${companyNotify.publishDate}" pattern="yyyy-MM-dd" />
			</td>
		</tr>
	</c:forEach>
      </table>
      <table width="100%" border="0" class="lh25 textleft font_st" id="tabs02" style="display:none">

		<c:forEach var="companyNews" items="${companyNewsList}">
			<tr>
				<td><span class="font_a8">·</span>
					<a
						href="${ctx }/cms/newsContentGazx.jsp?table=${companyNewsTable}&guid=${companyNews.guid}"
						title='${companyNews.title}' target="_blank">${companyNews.title}</a>
				</td>
				<td class="font_73">
					<fmt:formatDate value="${companyNews.publishDate}"
						pattern="yyyy-MM-dd" />
				</td>
			</tr>
		</c:forEach>
	 </table>
      <table width="100%" border="0" class="lh25 textleft font_st" id="tabs03" style="display:none">
        <c:forEach var="companyReviews" items="${companyReviewsList}">
			<tr>
				<td><span class="font_a8">·</span>
					<a
						href="${ctx }/cms/newsContentGazx.jsp?table=${companyReviewsTable}&guid=${companyReviews.guid}"
						title='${companyReviews.title}' target="_blank">${companyReviews.title}</a>
				</td>
				<td class="font_73">
					<fmt:formatDate value="${companyReviews.publishDate}"
						pattern="yyyy-MM-dd" />
				</td>
			</tr>
		</c:forEach>
      </table>
      <table width="100%" border="0" class="lh25 textleft font_st" id="tabs04" style="display:none">
        <c:forEach var="companyReports" items="${companyReportsList}">
			<tr>
				<td><span class="font_a8">·</span>
					<a href="${ctx }/cms/newsContentGazx.jsp?table=${companyReportsTable}&guid=${companyReports.guid}"
						title='${companyReports.title}' target="_blank">${companyReports.title}</a>
				</td>
				<td class="font_73">
					<fmt:formatDate value="${companyReports.publishDate}"
						pattern="yyyy-MM-dd" />
				</td>
			</tr>
		</c:forEach>
      </table></td>
  </tr>
</table>
</div>
<div class="f_right bcolor pd6">
  <table width="100%" border="0" class="tab_sdgd">
    <tr>
      <td class="pl10 plr13 thtt"><p class="red bold fleft" >十大股东</p></td>
    </tr>
    <tr>
      <td class="bcolor_white pd6">
      <table width="100%" border="0" class="textleft font_st">
       <c:forEach var="shareholderName" items="${majorShareholdersList}">
		<tr>
          <td height="20px"><font color="red">·</font>
          
			</td>
			<td>
			${shareholderName.shareholderName}
			</td>
		</tr>
	</c:forEach>
      </table></td>
    </tr>
  </table><div class="blank5"></div>
  <table width="100%" border="0" class="tab_sdgd">
    <tr>
      <td class="pl10 plr13 thtt"><p class="red bold fleft">限售股份公司解锁流程</p>
        <p class="red fright" ><a href="#">更多</a></p></td>
    </tr>
    <tr>
      <td class="bcolor_white pd6"><table width="100%" border="0" class="tab_xuxian25 textcenter">
            <tr>
          <th width="30%" valign="top">解锁日期</th>
          <th width="34%">解锁股份<br />
            （万股）</th>
          <th width="36%">占已流通股份比例(%)</th>
        </tr>
        <c:forEach var="limitedShares" items="${limitedSharesList}">
		<tr>
			<td>
				<fmt:formatDate value="${limitedShares.listingDate}" pattern="yyyy-MM-dd" />
			</td>
			<td align="center">
				<fmt:formatNumber value="${limitedShares.addListingShares/10000}" pattern="###,##0" />
			</td>
			<td>
				<fmt:formatNumber value="${limitedShares.addListingShares/(limitedShares.addListingShares+limitedShares.unlimitedShares)*100}" pattern="##0.00" />
			</td>
		</tr>
		</c:forEach>
		<c:if test="${limitedSharesSize<6}">
			<c:forEach var="i" begin="${limitedSharesSize}" end="5"
				step="1">
				<tr>
					<td>
						&nbsp;
					</td>
					<td align=center>
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
			</c:forEach>
		</c:if>
              
      </table></td>
    </tr>
  </table>
</div>
</div>
<!--下部div结束-->
</div> 
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div> 
</div>
<jsp:include page="/share/bottom.jsp" />
<script src="/js/setTab.js"></script>
</body>
</html>