<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="java.util.List"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx }/js/ofc2/json/json2.js"></script>
<script type="text/javascript" src="${ctx }/js/ofc2/swfobject.js"></script>
</head>
<script type="text/javascript">
			swfobject.embedSWF("/f10/stock/open-flash-chart.swf", "my_chart", "389", "160", "9.0.0");
			
			function open_flash_chart_data()
			{
			    return JSON.stringify(data);
			}
			function findSWF(movieName) {
			  if (navigator.appName.indexOf("Microsoft")!= -1) {
			    return window[movieName];
			  } else {
			    return document[movieName];
			  }
			}
			
			var data = ${pie};
			
			function doSubmit(){
			
			
			//document.f2.submit();
			document.getElementById("f2").submit();
			
			}
		</script>
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=zxzx" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 个股 > 股本股东</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	 <jsp:include page="/f10/stock/stockF10_lmenu.jsp">
			<jsp:param name="menu" value="4" />
	  </jsp:include>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  <div class="left_tit2">${name}(${stockCode})股本股东</div> 
    <div class="blank5"></div>
    <div class="kline">
      <div class="qieh">
        <ul>
          <li class="down">股本情况</li>
        </ul>
      </div>
      <div class="qiebg">
      		<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td valign="top">
                <table width="100%" border="0" class="tab_pl5" >
                  <tr class="red">
                    <th class="f10_tab02 pl5">股份类型</th>
                    <th class="f10_tab02 pl5">股数（万股）</th>
                  </tr>
                  
                  <c:if test="${stru.noMarketOfTotalShares!=null}">
					<tr class="tab_xuxian25">
						<td>
							股改限售股份
						</td>
						<td>
							${stru.noMarketOfTotalShares }&nbsp;
						</td>
					</tr>
				</c:if>
				<tr class="tab_xuxian25">
						<td>
							流通A股
						</td>
						<td>
							<c:if test="${stru.anOfTotalShares==null}">0</c:if>
							${stru.anOfTotalShares }&nbsp;
						</td>
					</tr>
					<tr class="tab_xuxian25">
						<td>
							总股本
						</td>
						<td>
							${stru.totalShares }&nbsp;
						</td>
					</tr>
                 
                </table>
                <p class="mt5"></p>
                </td>
                <td width="300" align="right">
                <table border="1" cellspacing="0" cellpadding="0">
												<tr>
													<td>
														<div id="my_chart"></div>
													</td>
												</tr>
											</table>
                </td>
              </tr>
        </table>
      <div class="blank10"></div>
      <div class="qieh">
        <ul>
          <span style="float:right; width:230px;"> 
          <%
             List dateList=(List)request.getAttribute("dateList");
             String date=request.getParameter("startDate");
           %>
           <form name="f2" id="f2" action="${contextPath}/stock.do?method=getEquityShareholders" method="post">
           <input type="hidden" name="code" value="${stockCode}" />
           截止日期：
           <select name="startDate" id="startDate">
			 <%
			    if(dateList!=null&&dateList.size()>0){
			        for(int i=0;i<dateList.size();i++){
			   if(dateList.get(i).equals(date)){
			   %>
			     <option value="<%=dateList.get(i)%>" selected="selected"><%=dateList.get(i) %></option>
			   <%
			  }else{
			  %>
			    <option value="<%=dateList.get(i)%>"><%=dateList.get(i) %></option>
			  <% }} }%>
			</select>
			<img src="/pic/news/query.gif" onmouseover="this.src='/pic/news/query_s.gif'" onmouseout="this.src='/pic/news/query.gif'" style="cursor: hand" onclick="doSubmit();" />
           </form>
            </span>
          <li class="down">股东情况</li>
        </ul>
      </div>
      <div class="qiebg">
        <table width="100%" border="0" class="tab_pl5" >
          <tr class="red">
            <th class="f10_tab02 pl5">股东名称</th>
            <th class="f10_tab02 pl5">股东类别</th>
            <th class="f10_tab02 pl5">持股数量(万股)</th>
            <th class="f10_tab02 pl5">占总股本比例</th>
            <th class="f10_tab02 pl5">股份类别</th>
          </tr>
          <c:forEach var="top" items="${majo}">
			<tr class="tab_xuxian25">
				<td>
					${top.shareholderName }&nbsp;
				</td>
				<td>
					${top.shareholderType }&nbsp;
				</td>
				<td>
					<fmt:formatNumber value="${top.numberOfShares/10000 }"
						type="currency" pattern="0" />
					&nbsp;
				</td>
				<td>
					<fmt:formatNumber
						value="${top.proportionOfShareCapital }" type="currency"
						pattern="0.00" />
					&nbsp;
				</td>
				<td>
					${top.shareholderxz }&nbsp;
				</td>
			</tr>
		</c:forEach>
          
        </table>
      </div>
    </div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
<script src="/js/show.js"></script>
</body>
</html>