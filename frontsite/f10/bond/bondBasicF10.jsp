<%@ page contentType="text/html; charset=utf-8" language="java" %>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />

<div class="left_tit2">
	<jsp:include flush="true" page="bondCodeSearch.jsp"></jsp:include>
</div> 
<div class="blank5"></div>
	<div class="f10_tab03 textcenter">
		<span class="red font14 bold ml32">${bondCodeBondInfo.bondShortName}</span>
	    <span class="font14 ml10"> (${bondCodeBondInfo.bondCode})</span>
	
</div>
<div class="blank5"></div>
	<table border="1" class="lh30 tab_pl5 f10_tab01" bordercolor="#cccccc" width="100%">
		  <tr>
		    <th width="15%">债券代码</th>
		    <td width="30%">${bondCodeBondInfo.bondCode}</td>
		    <th width="15%">债券简称</th>
		    <td width="30%">${bondCodeBondInfo.bondShortName} </td>
		  </tr>
		  <tr>
		    <th>债券类型</th>
		    <td>
		    	<c:choose>
					<c:when test="${empty bondCodeBondInfo.bondType}">&nbsp;</c:when>
					<c:otherwise>
						&nbsp;&nbsp;${bondCodeBondInfo.bondType}
					</c:otherwise>
				</c:choose>
			</td>
		    <th>拼音简称</th>
		    <td>
				<c:choose>
					<c:when test="${empty bondCodeBondInfo.bondPY}">&nbsp;</c:when>
					<c:otherwise>
						&nbsp;&nbsp;${bondCodeBondInfo.bondPY}
					</c:otherwise>
				</c:choose>
			</td>
		  </tr>
		  <tr>
		    <th>回购品种</th>
		    <td>
				<c:choose>
					<c:when test="${empty bondCodeBondInfo.buyBackBreed}">&nbsp;</c:when>
					<c:otherwise>
						&nbsp;&nbsp;${bondCodeBondInfo.buyBackBreed}
					</c:otherwise>
				</c:choose>
			</td>
		    <th>交易场所</th>
		    <td>
		    		<c:choose>
						<c:when test="${empty bondCodeBondInfo.bondPlace}">&nbsp;</c:when>
						<c:otherwise>
							&nbsp;&nbsp;${bondCodeBondInfo.bondPlace}
						</c:otherwise>
					</c:choose>
		    </td>
		  </tr>
		</table>