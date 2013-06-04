<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.cssweb.systemset.pojo.Branch"%>
<%@page import="com.cssweb.common.dictionary.pojo.Dictionary"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"   %>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.gazxfund.pojo.FundGsInfo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/branches/branches.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#pselect").change(function(){
		var pvalue=$("#pselect")[0].value;
		var url= encodeURI("/branchManagerAction.do?method=getCitys&provice="+pvalue);
		//var url= "/branchManagerAction.do?method=getCitys&provice="+pvalue;
		$.getJSON(url,null,
		          function(json){
						citys = json.citys;
						var html = '';
						$.each(citys,function(i,n){
							html += '<option value="'+n+'">'+n+'</option>';
						});
						$("#cselect").html(html);
		          });
	});
});


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

<body >
<jsp:include page="${contextPath }/share/top.jsp" />
<div class="body_bg">
<form action="${contextPath }/branchManagerAction.do?method=getBranchsByMap" id="yybListForm"  name="yybListForm" method="post">
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt; <a  href="${contextPath }/branches/index.jsp?nav=grgf">分支机构</a> &gt; 营业网点</div>
  <div class="left_tit2">营业网点</div>
    <div class="blank10"></div> 
	<div class="serchbg">
	
	  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
	    <tr>
	      <td width="9%">营业部查询：</td>
	      
	      <td width="40%">
		      <select name="province" style="this.width:180px" id="pselect">
	                <option value="">--所有省份--</option>
	                <c:if test="${plist!=null }">
	                	<c:forEach items="${plist }" var="pval">
	                		<c:choose>
	                			<c:when test="${pval==province }">
	                				<option value="${pval }" selected="selected">${pval }</option>
	                			</c:when>
	                			<c:otherwise>
	                				<option value="${pval }">${pval }</option>
	                			</c:otherwise>
	                		</c:choose>
	                	</c:forEach>
	                </c:if>
	          </select>
	          <select name="city" style="this.width:180px" id="cselect">
	                <option value="">--所有城市--</option>
	                <c:if test="${clist!=null }">
	                	<c:forEach items="${clist }" var="cval">
	                		<c:choose>
	                			<c:when test="${cval==city }">
	                				<option value="${cval }" selected="selected">${cval }</option>
	                			</c:when>
	                			<c:otherwise>
	                				<option value="${cval }">${cval }</option>
	                			</c:otherwise>
	                		</c:choose>
	                	</c:forEach>
	                </c:if>
	          </select>
	          <input name="keyword" type="text" style="this.width:180px" value="${keyword }"/>
	          
          </td>
	      <td width="19%" align="left"><input type="submit" name="button" id="button" class="but_01"  value="提交" /></td>
	      <td width="24%" align="right"><a href="http://www.gf.com.cn/branchManagerAdminAction.do?method=getBranchList&nav=grgf&nav1=yywd"><img align="absmiddle" src="/pic/branches/fzlist.gif" /></a></td>
        </tr>
      </table>
    </div>
  <div class="blank10"></div>
  <%--<img src="/pic/building.gif" alt="" />
    --%><table border="1" class="lh30 tab_pl5 f10_tab01" bordercolor="#cccccc" width="100%" align="center">
      <tr>
        <th class="center bold" style="line-height:30px">序号</th>
        <th class="center bold" style="line-height:30px">代码</th>
        <th class="center bold" style="line-height:30px">营业部名称</th>
        <th class="center bold" style="line-height:30px">地址</th>
        <th class="center bold" style="line-height:30px">电话</th>
        <th class="center bold" style="line-height:30px">传真</th>
      </tr>
      <c:choose>
      	<c:when test="${blist!=null }">
      		<c:forEach items="${blist }" var="b">
      			<tr>
			        <td width="5%" class="center">${b.id }</td>
			        <td width="5%" class="center"><a href="${contextPath}/branchManagerAction.do?method=getBranchInfoById&id=${b.id }">${b.branchCode }</a></td>
			         <td width="23%" align="center">
			         <a href="${contextPath}/branchManagerAction.do?method=getBranchInfoById&id=${b.id }">${b.branchName }</a>
			         </td>
			        <td width="35%">${b.address }</td>
			        <td width="15%">${b.zphone }</td>
			        <td width="17%">${b.fax }</td>
		      	</tr>
      		</c:forEach>
      	</c:when>
      	<c:otherwise>
      		<tr>
		        <td class="center bold" style="line-height:30px">序号</td>
	      	</tr>
      	</c:otherwise>
      </c:choose>
      
    
    </table>
    <div class="pageBar">
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
</div>
  
  

</form>
<jsp:include page="${contextPath }/share/bottom.jsp" />
</div>
</body>
<script type="text/javascript"> 
var _aq = _aq || [];
_aq.push(['_setSiteId', 10001]);_aq.push(['_setCatalogId', 49]); _aq.push(['_trackPageview']); (function() {
var ga = document.createElement( 'script'); ga.type = 'text/javascript'; ga.async = true; ga.src='http://121.8.153.59:8080/stat/stat.js'; var s = document.getElementsByTagName( 'script')[0]; s.parentNode.insertBefore(ga, s); })();
</script>
</html>