<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
	
	<input type="hidden" id="pageNumber" name="pageNumber" value="1" />
	<input type="hidden" id="pageNumber" name="pageNumber" value="1" />
	<input type="hidden" name="max_entrust_price_Rose"
		id="max_entrust_price_Rose" value="${data2.max_entrust_price_Rose}" />
	<input type="hidden" name="min_entrust_price_Rose"
		id="min_entrust_price_Rose" value="${data2.min_entrust_price_Rose}" />
	<input type="hidden" name="max_entrust_price_Drop"
		id="max_entrust_price_Drop" value="${data2.max_entrust_price_Drop}" />
	<input type="hidden" name="min_entrust_price_Drop"
		id="min_entrust_price_Drop" value="${data2.min_entrust_price_Drop}" />
	<!-- 股票 -->
	<!-- 股票 -->
	<input type="hidden" name="canuse_balance_1002"
		id="canuse_balance_1002" value="${data2.canuse_balance_1002}" />
	<input type="hidden" name="canuse_balance_1001"
		id="canuse_balance_1001" value="${data2.canuse_balance_1001}" />
					


<div id="sell_1001" style="float:left; margin-right:10px;  width:265; font-size: 12px">
		<table width="265" height="144" border="0.1" cellpadding="0" cellspacing="0" bordercolor="#8DB2E3" style="font-size: 12px" class="tablebbr">
		  <tr>
		    <td  height="60" style="padding:2px;" align="center" class="tablebtl">
			<code class="red_bold">看涨份额转换申报(单位:千份)</code>
			<br/>
				<c:choose>
						<c:when test="${not empty page2}">
						
					<bean:size id="page2size" name="page2"/>
						<c:set var="step" value="${5-page2size}"></c:set>
						  	<c:if test="${page2size<5}">
							  	<c:forEach end="${4-page2size}" step="1" begin="0"  varStatus="index">
							  		<table width="100%" border="0" cellspacing="0" style="margin-bottom:1px;">
								  <tr>
									<td width="38" style="font-size: 12px" >转出${fn:substring("1一2二3三4四5五",fn:indexOf("1一2二3三4四5五",5-index.index)+1 , fn:indexOf("1一2二3三4四5五",5-index.index)+2)}</td>
									<td width="43" align="right" height="16px"><div  style="color:green; height:14px; font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" >0.000</div></td>
									<td width="102" align="right">
									<table  border="0" cellpadding="0" cellspacing="0"  style=" background-color:green;height:3px;  width:0px; " ><tr><td></td></tr></table>
									</td>
									<td width="45" align="right"><div  style="color:blue; font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" >0</div></td>
								  </tr>
							  	</table>
							  	</c:forEach>
						  	</c:if>
						  	
							<c:forEach var="item" items="${page2}" varStatus="index">
							<table width="100%" border="0" cellspacing="0" style="margin-bottom:1px;">
							  <tr>
								<td width="38" style="font-size: 12px" >转出${fn:substring("1一2二3三4四5五",fn:indexOf("1一2二3三4四5五",5-index.index-step)+1 , fn:indexOf("1一2二3三4四5五",5-index.index-step)+2)}</td>
								<td width="43" align="right" height="16px"><div  style="color:red; height:14px; font-size:12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" onclick="radio_click(1001,${item.remain_amount},${item.entrust_price},'in')" ext:qtip="转出${5-index.index}比例<br/>单击：自动填充转换比例"><f:formatNumber value="${item.entrust_price }" pattern="#,##0.000#" /></div></td>
								<td width="102" align="right">
								<c:if test="${(101.1/data2.maxamount*item.remain_amount/1000)>0 and (101.1/data2.maxamount*item.remain_amount/1000)<1}">
									<c:set var="tablewidth" value="1"/>
									</c:if>
									<c:if test="${(101.1/data2.maxamount*item.remain_amount/1000)>1}">
									<c:set var="tablewidth" value="${(101./data2.maxamount*item.remain_amount/1000)}"/>
									</c:if>
								<table  border="0" cellpadding="0" cellspacing="0"  style=" background-color:green;height:8px;  width:${tablewidth}px; "><tr><td></td></tr></table>
								</td>
								<td width="45" align="right"><div  style="color:blue; font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" onclick="radio_click(1001,${item.remain_amount},${item.entrust_price},'in')" ext:qtip="转出${5-index.index}比例<br/>单击：自动填充转换比例">${item.remain_amount/1000}</div></td>
							  </tr>
						  	</table>
						  	<c:if test="${index.last}">
						  	<input type="hidden" id="frist_out_entrust_price_rose" name="frist_out_entrust_price_rose" value="${item.entrust_price}"/>
						  	<input type="hidden" id="frist_out_remain_amount_rose" name="frist_out_remain_amount_rose" value="${item.remain_amount}"/>
						  	</c:if>
						  	</c:forEach>
			  	
						</c:when>
						<c:otherwise>
							
									<c:forEach end="5" step="1" begin="1"  varStatus="index">
							  		<table width="100%" border="0" cellspacing="0" style="margin-bottom:1px;">
									  <tr>
										<td width="38" style="font-size: 12px" >转出${fn:substring("1一2二3三4四5五",fn:indexOf("1一2二3三4四5五",6-index.index)+1 , fn:indexOf("1一2二3三4四5五",6-index.index)+2)}</td>
										<td width="43" align="right" height="16px"><div  style="color:green; height:14px; font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" >0.000</div></td>
										<td width="102" align="right">
										<table  border="0" cellpadding="0" cellspacing="0"  style=" background-color:red;height:13px;  width:0px; " ><tr><td></td></tr></table>
										</td>
										<td width="45" align="right"><div  style="color:blue; font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" >0</div></td>
									  </tr>
								  	</table>
							  	</c:forEach>
								
						</c:otherwise>
					</c:choose>
			</td>
		  </tr>
		  
		  <tr>
		    <td height="21" class="tablebtl">
		   			<table  width="100%" border="0" cellspacing="0">
					  <tr>
						<td width="29" height="17" style="font-size: 12px">最新</td>		
						<input type="hidden" id="inp_entrust_deliver_price_Rose" value="${data2.entrust_deliver_price_Rose}"></input>	
						<input type="hidden" id="inp_entrust_net_price_Rose" value="${data2.entrust_net_price_Rose}"></input>											
						<td width="41"><div  style="color:red; font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" ext:qtip="最新比例<br/>单击：自动填充转换比例" onclick="radio_click(1001,1000,$d('inp_entrust_deliver_price_Rose').value,'in')"><f:formatNumber value="${data2.entrust_deliver_price_Rose }" pattern="#,##0.000#" /></div></td>
						<td width="50" style="font-size: 12px">最新净值</td>
						<td width="41" ><div  style="color:red; font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" ext:qtip="最新净值比例<br/>单击：自动填充转换比例" onclick="radio_click(1001,1000,$d('inp_entrust_net_price_Rose').value,'in')"><f:formatNumber value="${data2.entrust_net_price_Rose }" pattern="#,##0.000#" /></div></td>
						<td width="30" style="font-size: 12px">涨幅</td>
						<td width="50" ><div  style="color:red; font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" ext:qtip="涨幅比例<br/>单击：自动填充转换比例" onclick="radio_click(1001,1000,$d('inp_entrust_deliver_price_Rose').value,'in')"><f:formatNumber type="number" value="${data2.increase_amount_Rose*100 }" maxFractionDigits="3"/>%</div></td>
					  </tr>
					</table>
			
			</td>
		  </tr>
		  
		  <tr>
		    <td height="34"  class="tablebtl">
		   <c:choose>
						<c:when test="${not empty page1}">
							<c:forEach var="item" items="${page1}" varStatus="index">
				<table width="100%" border="0" cellspacing="0" style="margin-bottom:1px;">
				  <tr>
					<td width="38" style="font-size: 12px" >转入${fn:substring("1一2二3三4四5五",fn:indexOf("1一2二3三4四5五",index.index+1)+1 , fn:indexOf("1一2二3三4四5五",index.index+1)+2)}</td>
					<td width="43" align="right" height="16px"><div  style="color:red; height:14px; font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" onclick="radio_click(1001,${item.remain_amount},${item.entrust_price},'out')" ext:qtip="转入${index.index+1}比例<br/>单击：自动填充转换比例"><f:formatNumber value="${item.entrust_price }" pattern="#,##0.000#" /></div></td>
					<td width="102" align="right">
					<c:if test="${(101.1/data2.maxamount*item.remain_amount/1000)>0 and (101.1/data2.maxamount*item.remain_amount/1000)<1}">
									<c:set var="tablewidth" value="1"/>
									</c:if>
									<c:if test="${(101.1/data2.maxamount*item.remain_amount/1000)>1}">
									<c:set var="tablewidth" value="${(101.1/data2.maxamount*item.remain_amount/1000)}"/>
									</c:if>
					<table  border="0" cellpadding="0" cellspacing="0"  style=" background-color:red;height:8px;  width:${tablewidth}px; " ><tr><td></td></tr></table>
					</td>
					<td width="45" align="right"><div  style="color:blue; font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" onclick="radio_click(1001,${item.remain_amount},${item.entrust_price},'out')" ext:qtip="转出${index.index+1}比例<br/>单击：自动填充转换比例">${item.remain_amount/1000}</div></td>
				  </tr>
			  	</table>
			  	<c:if test="${index.index==0}">
						  	<input type="hidden" id="frist_in_entrust_price_rose" name="frist_in_entrust_price_rose" value="${item.entrust_price}"/>
						  	<input type="hidden" id="frist_in_remain_amount_rose" name="frist_in_remain_amount_rose" value="${item.remain_amount}"/>
						  	</c:if>
			  	</c:forEach>
			  	<bean:size id="page1size" name="page1"/>
						  	<c:if test="${page1size<5}">
							  	<c:forEach end="5" step="1" begin="${page1size+1}"  varStatus="index">
							  		<table width="100%" border="0" cellspacing="0" style="margin-bottom:1px;">
								  <tr>
									<td width="38" style="font-size: 12px" >转入${fn:substring("1一2二3三4四5五",fn:indexOf("1一2二3三4四5五",index.index)+1 , fn:indexOf("1一2二3三4四5五",index.index)+2)}</td>
									<td width="43" align="right" height="16px"><div  style="color:green; height:14px; font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" >0.000</div></td>
									<td width="102" align="right">
									<table  border="0" cellpadding="0" cellspacing="0"  style=" background-color:red;height:13px;  width:0px; " ><tr><td></td></tr></table>
									</td>
									<td width="45" align="right"><div  style="color:blue; font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" >0</div></td>
								  </tr>
							  	</table>
							  	</c:forEach>
						  	</c:if>
						</c:when>
						<c:otherwise>
							
									<c:forEach end="5" step="1" begin="1"  varStatus="index">
							  		<table width="100%" border="0" cellspacing="0" style="margin-bottom:1px;">
									  <tr>
										<td width="38" style="font-size: 12px" >转入${fn:substring("1一2二3三4四5五",fn:indexOf("1一2二3三4四5五",index.index)+1 , fn:indexOf("1一2二3三4四5五",index.index)+2)}</td>
										<td width="43" align="right" height="16px"><div  style="color:green; height:14px; font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" >0.000</div></td>
										<td width="102" align="right">
										<table  border="0" cellpadding="0" cellspacing="0"  style=" background-color:red;height:13px;  width:0px; " ><tr><td></td></tr></table>
										</td>
										<td width="45" align="right"><div  style="color:blue; font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" >0</div></td>
									  </tr>
								  	</table>
							  	</c:forEach>
								
						</c:otherwise>
					</c:choose>
			</td>
		  </tr>
		  
		  <tr>
		    <td height="28" class="tablebtl">
			  <table width="100%" border="0" cellspacing="0">
					  <tr>
					  <input type="hidden" id="inp_max_entrust_price_Rose" value="${data2.max_entrust_price_Rose}"></input>	
						<input type="hidden" id="inp_min_entrust_price_Rose" value="${data2.min_entrust_price_Rose}"></input>											
						<td  width="49" style="font-size: 12px">上限</td>
						<td width="43" align="center" ><div  style="color:red;font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" ext:qtip="上限比例<br/>单击：自动填充转换比例" onclick="radio_click(1001,1000,$d('inp_max_entrust_price_Rose').value,'in')">${data2.max_entrust_price_Rose }</div></td>
						<td width="85" style="font-size: 12px">下限</td>
						<td width="43" align="center" ><div  style="color:green;font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" ext:qtip="下限比例<br/>单击：自动填充转换比例" onclick="radio_click(1001,1000,$d('inp_min_entrust_price_Rose').value,'in')">${data2.min_entrust_price_Rose }</div></td>
					  </tr>
			  </table>
			
			</td>
		  </tr>
		</table>
</div>

<div id="sell_1002" style="float:left; width:265; font-size: 12px">
		<table width="265" height="144" border="0.1" cellpadding="0" cellspacing="0" bordercolor="#8DB2E3" style="font-size: 12px" class="tablebbr">
		  <tr>
		    <td  style="padding:2px;" align="center" class="tablebtl">
			<code class="red_bold">看跌份额转换申报(单位:千份)</code>
			<br/>
				<c:choose>
						<c:when test="${not empty page4}">
						<bean:size id="page4size" name="page4"/>
							<c:set var="step4" value="${5-page4size}"></c:set>
						  	<c:if test="${page4size<5}">
							  	<c:forEach end="${4-page4size}" step="1" begin="0"  varStatus="index">
							  		<table width="100%" border="0" cellspacing="0" style="margin-bottom:1px;">
								  <tr>
									<td width="38" style="font-size: 12px" >转出${fn:substring("1一2二3三4四5五",fn:indexOf("1一2二3三4四5五",5-index.index)+1 , fn:indexOf("1一2二3三4四5五",5-index.index)+2)}</td>
									<td width="43" align="right" height="16px"><div  style="color:green; height:14px; font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" >0.000</div></td>
									<td width="102" align="right">
									<table  border="0" cellpadding="0" cellspacing="0"  style=" background-color:red;height:13px;  width:0px; " ><tr><td></td></tr></table>
									</td>
									<td width="45" align="right"><div  style="color:blue; font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" >0</div></td>
								  </tr>
							  	</table>
							  	</c:forEach>
						  	</c:if>
							<c:forEach var="item" items="${page4}" varStatus="index">
							<table width="100%" border="0" cellspacing="0" style="margin-bottom:1px;">
							  <tr>
								<td width="38" style="font-size: 12px" >转出${fn:substring("1一2二3三4四5五",fn:indexOf("1一2二3三4四5五",5-index.index-step4)+1 , fn:indexOf("1一2二3三4四5五",5-index.index-step4)+2)}</td>
								<td width="43" align="right" height="16px" ><div  style="color:red; height:14px; font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" onclick="radio_click(1002,${item.remain_amount},${item.entrust_price},'in')" ext:qtip="转出${5-index.index}比例<br/>单击：自动填充转换比例"><f:formatNumber value="${item.entrust_price }" pattern="#,##0.000#" /></div></td>
								<td width="102" align="right">
								<c:if test="${(101.1/data2.maxamount*item.remain_amount/1000)>0 and (101.1/data2.maxamount*item.remain_amount/1000)<1}">
									<c:set var="tablewidth" value="1"/>
									</c:if>
									<c:if test="${(101.1/data2.maxamount*item.remain_amount/1000)>1}">
									<c:set var="tablewidth" value="${(101.1/data2.maxamount*item.remain_amount/1000)}"/>
									</c:if>
								<table  border="0" cellpadding="0" cellspacing="0"  style=" background-color:green;height:8px;  width:${tablewidth}px; " ><tr><td></td></tr></table>
								<td width="45" align="right"><div  style="color:blue; font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" onclick="radio_click(1002,${item.remain_amount},${item.entrust_price},'in')" ext:qtip="转出${5-index.index}比例<br/>单击：自动填充转换比例">${item.remain_amount/1000}</div></td>
							  </tr>
						  	</table>
						  	<c:if test="${index.last}">
						  	<input type="hidden" id="frist_out_entrust_price_drop" name="frist_out_entrust_price_drop" value="${item.entrust_price}"/>
						  	<input type="hidden" id="frist_out_remain_amount_drop" name="frist_out_remain_amount_drop" value="${item.remain_amount}"/>
						  	</c:if>
						  	</c:forEach>
			  	
						</c:when>
						<c:otherwise>
							
									<c:forEach end="5" step="1" begin="1"  varStatus="index">
							  		<table width="100%" border="0" cellspacing="0" style="margin-bottom:1px;">
									  <tr>
										<td width="38" style="font-size: 12px" >转出${fn:substring("1一2二3三4四5五",fn:indexOf("1一2二3三4四5五",6-index.index)+1 , fn:indexOf("1一2二3三4四5五",6-index.index)+2)}</td>
										<td width="43" align="right" height="16px"><div  style="color:green; height:14px; font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" >0.000</div></td>
										<td width="102" align="right">
										<table  border="0" cellpadding="0" cellspacing="0"  style=" background-color:red;height:13px;  width:0px; " ><tr><td></td></tr></table>
										</td>
										<td width="45" align="right"><div  style="color:blue; font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" >0</div></td>
									  </tr>
								  	</table>
							  	</c:forEach>
								
						</c:otherwise>
					</c:choose>
			</td>
		  </tr>
		  
		  <tr>
		    <td height="21" class="tablebtl">
		   			 <table  width="100%" border="0" cellspacing="0">
					  <tr>
					  <input type="hidden" id="inp_entrust_deliver_price_Drop" value="${data2.entrust_deliver_price_Drop}"></input>	
					  <input type="hidden" id="inp_entrust_net_price_Drop" value="${data2.entrust_net_price_Drop}"></input>											
						<td width="29" height="17" style="font-size: 12px">最新</td>
						<td width="41"><div  style="color:red; font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" ext:qtip="最新比例<br/>单击：自动填充转换比例" onclick="radio_click(1002,1000,$d('inp_entrust_deliver_price_Drop').value,'in')"><f:formatNumber value="${data2.entrust_deliver_price_Drop }" pattern="#,##0.000#" /></div></td>
						<td width="50" style="font-size: 12px">最新净值</td>
						<td width="41" ><div  style="color:red; font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" ext:qtip="最新净值比例<br/>单击：自动填充转换比例" onclick="radio_click(1002,1000,$d('inp_entrust_net_price_Drop').value,'in')"><f:formatNumber value="${data2.entrust_net_price_Drop }" pattern="#,##0.000#" /></div></td>
						<td width="30" style="font-size: 12px">涨幅</td>
						<td width="60" ><div  style="color:red; font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" ext:qtip="涨幅比例<br/>单击：自动填充转换比例" onclick="radio_click(1002,1000,$d('inp_entrust_deliver_price_Drop').value,'in')"><f:formatNumber type="number" value="${data2.increase_amount_Drop*100 }" maxFractionDigits="3"/>%</div></td>
					  </tr>
					</table>
			
			</td>
		  </tr>
		  
		  <tr>
		    <td height="34"  class="tablebtl">
		   <c:choose>
						<c:when test="${not empty page3}">
						<c:forEach var="item" items="${page3}" varStatus="index">
				<table width="100%" border="0" cellspacing="0" style="margin-bottom:1px;">
				  <tr>
					<td width="38" style="font-size: 12px" >转入${fn:substring("1一2二3三4四5五",fn:indexOf("1一2二3三4四5五",index.index+1)+1 , fn:indexOf("1一2二3三4四5五",index.index+1)+2)}</td>
					<td width="43" align="right" height="16px"><div  style="color:red; height:14px; font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" onclick="radio_click(1002,${item.remain_amount},${item.entrust_price},'out')" ext:qtip="转入${1+index.index}比例<br/>单击：自动填充转换比例"><f:formatNumber value="${item.entrust_price }" pattern="#,##0.000#" /></div></td>
					<td width="102" align="right">
					<c:if test="${(101.1/data2.maxamount*item.remain_amount/1000)>0 and (101.1/data2.maxamount*item.remain_amount/1000)<1}">
									<c:set var="tablewidth" value="1"/>
									</c:if>
									<c:if test="${(101.1/data2.maxamount*item.remain_amount/1000)>1}">
									<c:set var="tablewidth" value="${(101.1/data2.maxamount*item.remain_amount/1000)}"/>
									</c:if>
					<table  border="0" cellpadding="0" cellspacing="0"  style=" background-color:red;height:8px;  width:${tablewidth}px; " ><tr><td></td></tr></table>
					</td>
					<td width="45" align="right"><div  style="color:blue; font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" onclick="radio_click(1002,${item.remain_amount},${item.entrust_price},'out')" ext:qtip="转入${1+index.index}比例<br/>单击：自动填充转换比例">${item.remain_amount/1000}</div></td>
				  </tr>
			  	</table>
			  	<c:if test="${index.index==0}">
						  	<input type="hidden" id="frist_in_entrust_price_drop" name="frist_in_entrust_price_drop" value="${item.entrust_price}"/>
						  	<input type="hidden" id="frist_in_remain_amount_drop" name="frist_in_remain_amount_drop" value="${item.remain_amount}"/>
						  	</c:if>
			  	</c:forEach>
			  				<bean:size id="page3size" name="page3"/>
						  	<c:if test="${page3size<5}">
							  	<c:forEach end="5" step="1" begin="${page3size+1}"  varStatus="index">
							  		<table width="100%" border="0" cellspacing="0" style="margin-bottom:1px;">
								  <tr>
									<td width="38" style="font-size: 12px" >转入${fn:substring("1一2二3三4四5五",fn:indexOf("1一2二3三4四5五",index.index)+1 , fn:indexOf("1一2二3三4四5五",index.index)+2)}</td>
									<td width="43" align="right" height="16px"><div  style="color:green; height:14px; font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" >0.000</div></td>
									<td width="102" align="right">
									<table  border="0" cellpadding="0" cellspacing="0"  style=" background-color:red;height:13px;  width:0px; " ><tr><td></td></tr></table>
									</td>
									<td width="45" align="right"><div  style="color:blue; font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" >0</div></td>
								  </tr>
							  	</table>
							  	</c:forEach>
						  	</c:if>
						</c:when>
						<c:otherwise>
							
								<c:forEach end="5" step="1" begin="1"  varStatus="index">
							  		<table width="100%" border="0" cellspacing="0" style="margin-bottom:1px;">
									  <tr>
										<td width="38" style="font-size: 12px" >转入${fn:substring("1一2二3三4四5五",fn:indexOf("1一2二3三4四5五",index.index)+1 , fn:indexOf("1一2二3三4四5五",index.index)+2)}</td>
										<td width="43" align="right" height="16px"><div  style="color:green; height:14px; font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" >0.000</div></td>
										<td width="102" align="right">
										<table  border="0" cellpadding="0" cellspacing="0"  style=" background-color:red;height:13px;  width:0px; " ><tr><td></td></tr></table>
										</td>
										<td width="45" align="right"><div  style="color:blue; font-size: 12px" onMouseOver="this.className='onover'"   onMouseOut="this.className=''" >0</div></td>
									  </tr>
								  	</table>
							  	</c:forEach>
								
						</c:otherwise>
					</c:choose>
			</td>
		  </tr>
		  
		  <tr>
		    <td height="28" class="tablebtl">
			  <table width="100%" border="0" cellspacing="0">
					  <tr>
					  <input type="hidden" id="inp_max_entrust_price_Drop" value="${data2.max_entrust_price_Drop}"></input>	
						<input type="hidden" id="inp_min_entrust_price_Drop" value="${data2.min_entrust_price_Drop}"></input>											
						<td width="49" style="font-size: 12px">上限</td>
						<td width="43" align="center" ><div  style="color:red;font-size: 12px" onMouseOver="this.className='onover'" ext:qtip="上限比例<br/>单击：自动填充转换比例" onclick="radio_click(1002,1000,$d('inp_max_entrust_price_Drop').value,'in')"  onMouseOut="this.className=''" >${data2.max_entrust_price_Drop }</div></td>
						<td width="85" style="font-size: 12px">下限</td>
						<td width="43" align="center" ><div  style="color:green;font-size: 12px" onMouseOver="this.className='onover'" ext:qtip="下限比例<br/>单击：自动填充转换比例" onclick="radio_click(1002,1000,$d('inp_min_entrust_price_Drop').value,'in')"   onMouseOut="this.className=''" >${data2.min_entrust_price_Drop }</div></td>
					  </tr>
			  </table>
			
			</td>
		  </tr>
		</table>
</div>
