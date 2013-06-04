<%@ page contentType="text/html; charset=utf-8" language="java"%>
<jsp:directive.page
	import="com.cssweb.common.web.filter.SqlInjectValidate" />
<jsp:directive.page import="java.util.*" />

<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.rzrq.service.ClientPmService"%>
<%@page import="com.cssweb.rzrq.pojo.ClientPm"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.common.util.PageUtil"%>


<%
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	ClientPmService clientPmService  = (ClientPmService)ctx.getBean("clientPmService");
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
	DecimalFormat mdf = new DecimalFormat("#0.00");

	//System.out.println("---------开始时间----------"+startDate);
	List<ClientPm> assureList =	null;
	if (request.getAttribute("assureList") != null)
	{
	//	assureList =	assureService.getAssureByStartDate(sdf1.format(assure.getStartDate()));
		assureList =	(List)request.getAttribute("assureList");
	}
	
	
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>竞赛榜单-广发证劵_2012年广发证券“融智杯”融资融券仿真交易竞赛</title>
<link href="${contextPath }/css/community.css" rel="stylesheet" type="text/css" />
<link href="${contextPath }/css/financing/rongzhi/rongzhi.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${ctx }/infoCenter/goldmoney/css/inner.css" media="all" />

	<script src="${contextPath }/financing/My97DatePicker/WdatePicker.js"
			type="text/javascript"></script>
			
			<script type="text/javascript">

function gotoSelectedPage()  
{  
    var x = document.getElementById("yybListForm");  
     //alert("Original action: " + x.action)  
     x.submit();  
}

function clickPageBtn(val){
	 var x = document.getElementById("yybListForm");  
     //alert("Original action: " + x.action)  
     
	if(val=="firstPage"){
		var pNum=document.getElementById("pageNumber");
		pNum.value=1;
		x.submit();
	}
	if(val=="nextPage"){
		var pNum=document.getElementById("pageNumber");
		var i=parseInt(pNum.value)+1;
		pNum.value=i;
		x.submit();
	}
	if(val=="previous"){
		var pNum=document.getElementById("pageNumber");
		var i=pNum.value-1;
		pNum.value=i;
		x.submit();
	}
	if(val=="lastPage"){
		var pNum=document.getElementById("pageNumber");
		pNum.value=${totalPages};
		x.submit();
	}
}


</script>	
			
</head>

<body>
	<jsp:include page="/share/top.jsp" />
	<!-- header end -->
	<div id="subbanner">
		<img src="${contextPath }/pic/financing/rongzhi/rongzhi_banner.jpg" />
	</div>
	<div class="subMainconter" style="display: block;">
	<form action="${contextPath }/adviceAction.do?method=getlistETF" id="yybListForm"  name="yybListForm" method="post">
	
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="layout">
			<tr>
				<th valign="top" class="wrapleft">
					<div class="navLeft">
						<h3>
							<img src="${contextPath }/images/rongzhi/rongzhi_btn.jpg" style="margin-left: 10px;" />
						</h3>
						<jsp:include page="sideMenu.jsp" />
					</div></th>
				<td valign="top" class="wrapright">
					<div class="columnOut">
						<div class="columnTitle">
							<h3>竞赛榜单</h3>
							<span><b>首页</b>><b>2012年广发证券“融智杯”融资融券仿真交易竞赛</b>><strong>竞赛榜单</strong>
							</span>
						</div>
						<div class="columnMain summary">
							
							  <h3 class="dbzqggTitle">竞赛榜单</h3>
							  <div class="serchbg">
	
	  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
	    <tr>
	      <td width="9%">按日期查询：</td>
	      
	      <td width="40%">
		  
	         <c:choose>
																		<c:when test="${endDate!=null }">
																			<input class="Wdate" name="endDate"
																				id="endDate" value="${endDate }" type="text"
																				onfocus="WdatePicker({minDate:'2012-07-02',maxDate:'%y-%M-{%d-1}'})">
																		</c:when>
																		<c:otherwise>
																			<input class="Wdate" name="endDate"
																				id="endDate" type="text" onfocus="WdatePicker({minDate:'2012-07-02',maxDate:'%y-%M-{%d-1}'})">
																		</c:otherwise>
																	</c:choose>
	          
          </td>
	      <td width="19%" align="left"><input type="submit" name="button" id="button" class="but_01"  value="提交" /></td>
        </tr>
      </table>
    </div>
							  <div class="tableBar">
							<ul class="tab-menu">
								<li><a href="${contextPath }/adviceAction.do?method=getList">收益排名</a><b></b></li>
								<li><a href="${contextPath }/adviceAction.do?method=getlistTO">“T+0”排名</a><b></b></li>
								<li class="hover"><a href="${contextPath }/adviceAction.do?method=getlistETF">“ETF”排名</a><b></b></li>															
							</ul>
							<div class="tab-cont">
						
								
								<div class="cont hover">
								 <table border="1" class="lh30 tab_pl5 f10_tab01" bordercolor="#cccccc" width="100%" align="center">
      <tr>
        <th class="center bold" style="line-height:30px">排名</th>
        <th class="center bold" style="line-height:30px">营业部</th>
        <th class="center bold" style="line-height:30px">参赛编号</th>
        <th class="center bold" style="line-height:30px">昵称</th>
        <th class="center bold" style="line-height:30px">ETF指标得分</th>
        <th class="center bold" style="line-height:30px">日期</th>
      </tr>
      <c:choose>
      	<c:when test="${listETF!=null }">
      		<c:forEach items="${listETF }" var="e">
      			<tr>
			        <td width="10%" class="center">
			        ${e.pm }
			        </td>
			        <td width="25%" class="center">
			        ${e.yyb }
			        </td>
			         <td width="15%">
			        ${e.csbh}
			        </td>
			         <td width="20%" align="center">
			        ${e.petName}
			         </td>
			        <td width="15%">
			        ${e.etfzb }
			        </td>
			        <td width="15%">
			        ${e.rq }
			        </td>
			       
		      	</tr>
      		</c:forEach>
      	</c:when>
      	<c:otherwise>
      		<tr>
		        <td class="center bold" style="line-height:30px">暂无排名</td>
	      	</tr>
      	</c:otherwise>
      </c:choose>
      
    
    </table>
   
								</div>
								 <div>
					总共${totalPages }页，每页20条&nbsp;&nbsp;&nbsp;
				    <input id="firstPage" type="button" value="首页" onclick="clickPageBtn('firstPage')"/>   
				    <c:if test="${pageNumber>1}">  
				        <input id="previous" type="button" value="上一页" onclick="clickPageBtn('previous')"/>  
				    </c:if>   
				    跳转到第 <select id="pageNumber" name="pageNumber" onchange="gotoSelectedPage();">  
				    <c:forEach begin="1" end="${totalPages}" step="1" var="pageIndex">  
				        <c:choose>  
				            <c:when test="${pageIndex eq pageNumber}">  
				                <option value="${pageIndex}" selected="selected">${pageIndex}</option>  
				            </c:when>  
				            <c:otherwise>  
				                <option value="${pageIndex}">${pageIndex}</option>  
				            </c:otherwise>  
				        </c:choose>  
				    </c:forEach>  
				    </select>页   
				    <c:if test="${pageNumber<totalPages}">  
				        <input id="nextPage" type="button" value="下一页" onclick="clickPageBtn('nextPage')"/>
				    </c:if>   
				    <input id="lastPage" type="button" value="末页" onclick="clickPageBtn('lastPage')"/>
				
			</div>					
							</div> <!-- tab-cont -->
						</div><!-- mbd -->
   
						</div>
						<div class="columnButtom">
							<img src="${contextPath }/gyjj/images/columnButtom.jpg" />
						</div>
					</div></td>
			</tr>
		</table>
		</form>
	</div>
<script type="text/javascript" src="${contextPath }/js/jquery-1.3.2.min.js"></script>	
<script type="text/javascript" src="${contextPath }/js/common.js"></script>	
<script type="text/javascript">
$("#pcont").pcont({snum:4, isH:false});
$(".tableBar").tabs({meth:"click"});

$("#picShow").picshow();
</script>
	<div class="clear"></div>
	<jsp:include page="${ctx }/share/bottom.jsp" />
</body>
</html>
