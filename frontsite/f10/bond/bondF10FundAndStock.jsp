<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<div class="left_tit2">
	<jsp:include flush="true" page="bondCodeSearch.jsp"></jsp:include>
</div> 
<div class="font14 bold lh30 font_st red">·国债发行</div>
		<table border="1" class="lh30 tab_pl5 f10_tab01" bordercolor="#cccccc" width="100%">
		  <tr>
		    <th width="15%">发行主体</th>
		    <td width="30%">
					<c:choose>
						<c:when test="${empty nationalDebtIssueInfo.companyName}">&nbsp;</c:when>
						<c:otherwise>
							&nbsp;&nbsp;${nationalDebtIssueInfo.companyName}
						</c:otherwise>
					</c:choose>				
			</td>
		    <th width="15%">国债名称</th>
		    <td width="30%">
					<c:choose>
						<c:when test="${empty nationalDebtIssueInfo.bondName}">&nbsp;</c:when>
						<c:otherwise>
							&nbsp;&nbsp;${nationalDebtIssueInfo.bondName}
						</c:otherwise>
					</c:choose>	
			</td>
		  </tr>
		  <tr>
		    <th>国债类型</th>
		    <td>
				<c:choose>
					<c:when test="${empty nationalDebtIssueInfo.bondType}">&nbsp;</c:when>
					<c:otherwise>
						&nbsp;&nbsp;${nationalDebtIssueInfo.bondType}
					</c:otherwise>
				</c:choose>
			</td>
		    <th>国债期限(年)</th>
		    <td>
				<c:choose>
					<c:when test="${empty nationalDebtIssueInfo.maturity}">&nbsp;</c:when>
					<c:otherwise>
						&nbsp;&nbsp;${nationalDebtIssueInfo.maturity}
					</c:otherwise>
				</c:choose>	
			</td>
		  </tr>
		  <tr>
		    <th>国债面值(元)</th>
		    <td>
					<c:choose>
						<c:when test="${empty nationalDebtIssueInfo.parValue}">&nbsp;</c:when>
						<c:otherwise>
							&nbsp;&nbsp;<bean:write name="nationalDebtIssueInfo" property="parValue" format="0.00" />
						</c:otherwise>
					</c:choose>	
			</td>
		    <th>发行对象</th>
		    <td>
					<c:choose>
						<c:when test="${empty nationalDebtIssueInfo.issueObject}">&nbsp;</c:when>
						<c:otherwise>
							&nbsp;&nbsp;${nationalDebtIssueInfo.issueObject}
						</c:otherwise>
					</c:choose>
			</td>
		  </tr>
		  <tr>
		    <th>票面利率(%)</th>
		    <td>
					<c:choose>
						<c:when test="${empty nationalDebtIssueInfo.couponRate}">&nbsp;</c:when>
						<c:otherwise>
							&nbsp;&nbsp;<bean:write name="nationalDebtIssueInfo" property="couponRate" format="0.00" />
						</c:otherwise>
					</c:choose>
			</td>
		    <th>基本利差(%)</th>
		    <td>
		    		<c:choose>
						<c:when test="${empty nationalDebtIssueInfo.FRNMargin}">&nbsp;</c:when>
						<c:otherwise>
							&nbsp;&nbsp;<bean:write name="nationalDebtIssueInfo" property="FRNMargin" format="0.00" />
						</c:otherwise>
					</c:choose>
		    </td>
		  </tr>
		  <tr>
		    <th>发行期_开始日期</th>
		    <td>
					<c:choose>
						<c:when test="${empty nationalDebtIssueInfo.listedDate}">&nbsp;</c:when>
						<c:otherwise>
							&nbsp;&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${nationalDebtIssueInfo.listedDate}" />
						</c:otherwise>
					</c:choose>
			</td>
		    <th>发行期_结束日期 </th>
		    <td>
					<c:choose>
						<c:when test="${empty nationalDebtIssueInfo.delistDate}">&nbsp;</c:when>
						<c:otherwise>
							&nbsp;&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${nationalDebtIssueInfo.delistDate}" />
						</c:otherwise>
					</c:choose>
			</td>
		  </tr>
		  <tr>
		    <th>发行对象</th>
		    <td colspan="3">
					<c:choose>
						<c:when test="${empty nationalDebtIssueInfo.issueObject}">&nbsp;</c:when>
						<c:otherwise>
							&nbsp;&nbsp;${nationalDebtIssueInfo.issueObject}
						</c:otherwise>
					</c:choose>
			</td>
		    </tr>
		  <tr>
		    <th>预计发行额(元)</th>
		    <td>
					<c:choose>
						<c:when test="${empty nationalDebtIssueInfo.issueSize}">&nbsp;</c:when>
						<c:otherwise>
							&nbsp;&nbsp;<bean:write name="nationalDebtIssueInfo" property="issueSize" format="###,###" />
						</c:otherwise>
					</c:choose>
			</td>
		    <th>发行额(元)</th>
		    <td>
					<c:choose>
						<c:when test="${empty nationalDebtIssueInfo.actualIssueSize}">&nbsp;</c:when>
						<c:otherwise>
							&nbsp;&nbsp;<bean:write name="nationalDebtIssueInfo" property="actualIssueSize" format="###,###" />
						</c:otherwise>
					</c:choose>	
			</td>
		  </tr>
		  <tr>
		    <th>发行价格(元)</th>
		    <td>
					<c:choose>
						<c:when test="${empty nationalDebtIssueInfo.issurePrice}">&nbsp;</c:when>
						<c:otherwise>
							&nbsp;&nbsp;<bean:write name="nationalDebtIssueInfo" property="issurePrice" format="0.00" />
						</c:otherwise>
					</c:choose>
			</td>
		    <th>发行方式</th>
		    <td>
					<c:choose>
						<c:when test="${empty nationalDebtIssueInfo.issueMode}">&nbsp;</c:when>
						<c:otherwise>
							&nbsp;&nbsp;${nationalDebtIssueInfo.issueMode}
						</c:otherwise>
					</c:choose>	
			</td>
		  </tr>
		  <tr>
		    <th>承销方式</th>
		    <td>
					<c:choose>
						<c:when test="${empty nationalDebtIssueInfo.underwritingMode}">&nbsp;</c:when>
						<c:otherwise>
							&nbsp;&nbsp;${nationalDebtIssueInfo.underwritingMode}
						</c:otherwise>
					</c:choose>
			</td>
		    <th>国债到期日</th>
		    <td>
					<c:choose>
						<c:when test="${empty nationalDebtIssueInfo.endDate}">&nbsp;</c:when>
						<c:otherwise>
							&nbsp;&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${nationalDebtIssueInfo.endDate}"/>
						</c:otherwise>
					</c:choose>
			</td>
		  </tr>
		  <tr>
		    <th>付息日</th>
		    <td>
		    					<c:choose>
									<c:when test="${empty nationalDebtIssueInfo.intPaymentDate}">&nbsp;</c:when>
									<c:otherwise>
										&nbsp;&nbsp;${nationalDebtIssueInfo.intPaymentDate}
									</c:otherwise>
								</c:choose>
			</td>
		    <th>起息日期</th>
		    <td>
							<c:choose>
									<c:when test="${empty nationalDebtIssueInfo.valueDate}">&nbsp;</c:when>
									<c:otherwise>
										&nbsp;&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${nationalDebtIssueInfo.valueDate}" />
									</c:otherwise>
								</c:choose>	
			</td>
		  </tr>
		  <tr>
		    <th>利息递进方式</th>
		    <td>
						<c:choose>
							<c:when test="${empty nationalDebtIssueInfo.compoundMethod}">&nbsp;</c:when>
							<c:otherwise>
								&nbsp;&nbsp;${nationalDebtIssueInfo.compoundMethod}
							</c:otherwise>
						</c:choose>
			</td>
		    <th>发生日期</th>
		    <td>
					<c:choose>
						<c:when test="${empty nationalDebtIssueInfo.pulishDate}">&nbsp;</c:when>
						<c:otherwise>
							&nbsp;&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${nationalDebtIssueInfo.pulishDate}" />
						</c:otherwise>
					</c:choose>	
			</td>
		  </tr>
		</table>
<div class="font14 bold lh30 font_st red">·国债上市</div>
	  <table border="1" class="lh30 tab_pl5 f10_tab01" bordercolor="#cccccc" width="100%">
	    <tr>
	      <th width="15%">国债全称</th>
	      <td width="30%">
		  			<c:choose>
						<c:when test="${empty nationalDebtTradeInfo.bondName}">&nbsp;</c:when>
						<c:otherwise>
							&nbsp;&nbsp;${nationalDebtTradeInfo.bondName}
						</c:otherwise>
					</c:choose>	
		  </td>
	      <th width="15%">交易地点</th>
	      <td width="30%">
					<c:choose>
						<c:when test="${empty nationalDebtTradeInfo.tradeAddr}">&nbsp;</c:when>
						<c:otherwise>
							&nbsp;&nbsp;${nationalDebtTradeInfo.tradeAddr}
						</c:otherwise>
					</c:choose>
		 </td>
	    </tr>
	    <tr>
	      <th>上市开始日</th>
	      <td>
				<c:choose>
					<c:when test="${empty nationalDebtTradeInfo.beginDate}">&nbsp;</c:when>
					<c:otherwise>
						&nbsp;&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${nationalDebtTradeInfo.beginDate}" />
					</c:otherwise>
				</c:choose>
		  </td>
	      <th>上市截止日</th>
	      <td>
		  		<c:choose>
					<c:when test="${empty nationalDebtTradeInfo.endDate}">&nbsp;</c:when>
					<c:otherwise>
						&nbsp;&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${nationalDebtTradeInfo.endDate}" />
					</c:otherwise>
				</c:choose>
		  </td>
	    </tr>
	    <tr>
	      <th>上市总额(元)</th>
	      <td>
		  		<c:choose>
					<c:when test="${empty nationalDebtTradeInfo.tradeAmount}">&nbsp;</c:when>
					<c:otherwise>
						&nbsp;&nbsp;<bean:write name="nationalDebtTradeInfo" property="tradeAmount" format="###,###" />
					</c:otherwise>
				</c:choose>	
		  </td>
	      <th>退市日期</th>
	      <td>
				<c:choose>
					<c:when test="${empty nationalDebtTradeInfo.delistingDate}">&nbsp;</c:when>
					<c:otherwise>
						&nbsp;&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${nationalDebtTradeInfo.delistingDate}" />
					</c:otherwise>
				</c:choose>
		  </td>
	    </tr>
	    <tr>
	      <th>交易单位</th>
	      <td>
		  		<c:choose>
					<c:when test="${empty nationalDebtTradeInfo.tradingUnit}">&nbsp;</c:when>
					<c:otherwise>
						&nbsp;&nbsp;${nationalDebtTradeInfo.tradingUnit}
					</c:otherwise>
				</c:choose>	
		  </td>
	      <th>发生日期</th>
	      <td>
				<c:choose>
					<c:when test="${empty nationalDebtTradeInfo.publishDate}">&nbsp;</c:when>
					<c:otherwise>
						&nbsp;&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${nationalDebtTradeInfo.publishDate}" />
					</c:otherwise>
				</c:choose>	
		  </td>
	    </tr>
	  </table>
</div> 
</div>
