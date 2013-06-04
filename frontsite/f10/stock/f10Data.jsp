<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
			function changeCwbb(ind) {
					if(ind==1){
					     document.getElementById("cwbbTd1").className='down';
						 document.getElementById("cwbbTd2").className='';
						 document.getElementById("cwbbTd3").className='';
						 document.getElementById("columnNum").value="1";
					}
					if(ind==2){
					     document.getElementById("cwbbTd1").className='';
						 document.getElementById("cwbbTd2").className='down';
						 document.getElementById("cwbbTd3").className='';
						 document.getElementById("columnNum").value="2";
					}
					if(ind==3){
					      document.getElementById("cwbbTd1").className='';
						 document.getElementById("cwbbTd2").className='';
						 document.getElementById("cwbbTd3").className='down';
						 document.getElementById("columnNum").value="3";
					}
					
					doSubmit();
			}
			
	    	function doSubmit(){
	    		var startDate = document.getElementById("startDate").value;
	    		var endDate = document.getElementById("endDate").value;
	    		var ifr = document.getElementById('cwbbFrame');
	    		if(ifr){
	    			if(document.getElementById("columnNum").value=="1")
		    			ifr.src='/stock.do?method=getcwbb1&startDate='+startDate+'&endDate='+endDate;
		    		else if(document.getElementById("columnNum").value=="2")
		    			ifr.src='/stock.do?method=getcwbb2&startDate='+startDate+'&endDate='+endDate;
		    		else
		    			ifr.src='/stock.do?method=getcwbb3&startDate='+startDate+'&endDate='+endDate;
	    		}
	    	}
		</script>
<body class="body_bg" onload="javascript:changeCwbb(1);">
<jsp:include page="/share/top.jsp?nav=zxzx" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 个股 > 财务数据</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="/f10/stock/stockF10_lmenu.jsp">
			<jsp:param name="menu" value="6" />
	  </jsp:include>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  <div class="left_tit2">${name}(${stockCode})财务数据</div> 
    <div class="blank5"></div>
    <div class="kline">
      <div class="qieh">
        <ul>
        	<span style="float:right; width:330px;">日期：从
        	<html:select property="startDate" styleId="startDate" value="${startDate}">
          		<c:forEach var="dateString" items="${dateList}">
          			<html:option value="${dateString}">${dateString}</html:option>
          		</c:forEach>
          	</html:select>
          	到
          	<html:select property="endDate" styleId="endDate" value="${endDate}">
          		<c:forEach var="dateString" items="${dateList}">
          			<html:option value="${dateString}">${dateString}</html:option>
          		</c:forEach>
          	</html:select>
          	<img src="/pic/news/query.gif" onmouseover="this.src='/pic/news/query_s.gif'" onmouseout="this.src='/pic/news/query.gif'" style="cursor: hand" onclick="doSubmit();"/>
            
          	</span>
          <li class="down" id="cwbbTd1" onclick="changeCwbb(1)">资产负债表</li>
          <li id="cwbbTd2" onclick="changeCwbb(2)">利润分配表</li>
          <li id="cwbbTd3" onclick="changeCwbb(3)">现金流量表</li>
        </ul>
      </div>
      <div class="qiebg">
        <div class="blank10"></div>
        <div id="tabs1" style="display:">
          <table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#F2F2F2" style="border: 0px solid #CCCCCC;">
			<tr>
				<td width="100%" valign="top" align="center" bgcolor="#ffffff">
					<iframe id="cwbbFrame" name="cwbbFrame"
						src="/stock.do?method=getcwbb1" frameborder="0" marginheight="0"
						marginwidth="0" width="100%" scrolling="no"></iframe>
				</td>
			</tr>
		</table>
		<input type="hidden" id="columnNum" value="1"/>
        </div>
        

          <div class="clearfloat"></div>
      </div>
    </div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
<script src="/js/setTab.js"></script></body>
</html>