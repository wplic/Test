	<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
							<!-- 温馨提示 -->
		<div class="cont">
			<table width="95%" align="center" border="0" cellspacing="0" cellpadding="0" class=" mt10 lh23">
	          <jsp:include page="${contextPath }/commons/newsInfoContextList.jsp">
		            <jsp:param name="catName" value="新股上市首日市场波动和违规交易风险提示" />
		            <jsp:param name="whichCat" value="sy_wxts_xgssts"/>
		            <jsp:param name="state" value="1"/>
		            <jsp:param name="showSize" value="1"/>
	    	</jsp:include>
         	<jsp:include page="${contextPath }/commons/newsInfoContextList.jsp">
		            <jsp:param name="catName" value="投资者办理创业板交易开通手续公告" />
		            <jsp:param name="whichCat" value="sy_wxts_cyb"/>
		            <jsp:param name="state" value="1"/>
		            <jsp:param name="showSize" value="1"/>
	    	</jsp:include>
	    	<jsp:include page="${contextPath }/commons/newsInfoContextList.jsp">
		            <jsp:param name="catName" value="新股上市首日市场波动和违规交易风险提示" />
		            <jsp:param name="whichCat" value="sy_wxts_xgssts"/>
		            <jsp:param name="state" value="1"/>
		            <jsp:param name="showSize" value="1"/>
	    	</jsp:include>
         	<jsp:include page="${contextPath }/commons/newsInfoContextList.jsp">
		            <jsp:param name="catName" value="严正声明打击盗版" />
		            <jsp:param name="whichCat" value="sy_wxts_djdb"/>
		            <jsp:param name="state" value="1"/>
		            <jsp:param name="showSize" value="1"/>
	    	</jsp:include>

	    	 <jsp:include page="${contextPath }/commons/newsInfoContextList.jsp">
		            <jsp:param name="catName" value="新股上市首日市场波动和违规交易风险提示" />
		            <jsp:param name="whichCat" value="sy_wxts_xgssts"/>
		            <jsp:param name="state" value="1"/>
		            <jsp:param name="showSize" value="1"/>
	    	</jsp:include>
	    	 <jsp:include page="${contextPath }/commons/newsInfoContextList.jsp">
		            <jsp:param name="catName" value="原武汉营业部客户账户批量上线三方" />
		            <jsp:param name="whichCat" value="sy_wxts_whkh"/>
		            <jsp:param name="state" value="1"/>
		            <jsp:param name="showSize" value="1"/>
	    	</jsp:include>
	    	<jsp:include page="${contextPath }/commons/newsInfoContextList.jsp">
		            <jsp:param name="catName" value="致广发证券投资者的一封风险教育信" />
		            <jsp:param name="whichCat" value="sy_wxts_zgfyfxjyx"/>
		            <jsp:param name="state" value="1"/>
		            <jsp:param name="showSize" value="2"/>
	    	</jsp:include>
	    	<jsp:include page="${contextPath }/commons/newsInfoContextList.jsp">
		            <jsp:param name="catName" value="投诉电话一览表" />
		            <jsp:param name="whichCat" value="sy_wxts_telep"/>
		            <jsp:param name="state" value="1"/>
		            <jsp:param name="showSize" value="1"/>
	    	</jsp:include>
	    	<tr>
				<td width="20" align="center">
					<img src="/pic/msindex/list_02.gif">
				</td>
				<td>
					<a target="\"_blank\"" href="http://www.sac.net.cn/hyfw/zqjftj/zxsq/" title="投资者如遇到证券纠纷，可通过协会网站在线提交调解申请"> 投资者如遇到证券纠纷，可通过协会网站在线提交调解申请
 </a>
				</td>
			</tr>
         </table>
          <div class=" blank10"></div>
         <table width="95%" align="center" border="0" cellspacing="0" cellpadding="0">
	  		 <tr>
	            <td colspan="2" width="42%">
	             <table>
			           <jsp:include page="${contextPath }/commons/newsInfoContextList.jsp">
				            <jsp:param name="catName" value="反洗钱法规与小知识" />
				            <jsp:param name="whichCat" value="sy_wxts_fxqfgxzs"/>
				            <jsp:param name="state" value="1"/>
				            <jsp:param name="showSize" value="1"/>
			    	</jsp:include>
	    	</table>
	            </td>
	            <td width="20" align="center"><img src="${contextPath }/pic/msindex/list_02.gif"/></td>
	           <td >
		         <a  href="${contextPath }/commons/infoSanfang.jsp"   >
		                 第三方存管业务动态</a>
		         </td>
	          </tr>
	     </table>
	      <div class=" blank10"></div>
         <table width="95%" align="center" border="0" cellspacing="0" cellpadding="0">
	  		 <tr>
	  		    <td width="20" align="center"><img src="${contextPath }/pic/msindex/list_02.gif"/></td>
	            <td width="38%">

	            <a  href="${contextPath }/mgrInfoAction.do?method=getAll"  target="blank_">
	              投资顾问人员信息查询 </a>

	            </td>
	            <td width="20" align="center"><img src="${contextPath }/pic/msindex/list_02.gif"/></td>
	            <td >
	            <a  href="https://119.145.72.232/ECMMS/www/comjsp/ecmms/questionary/CustFillInfo.do"   >
	           	创业板客户调查表 </a>
	            </td>
	          </tr>
	     </table>

          <div class=" blank10"></div>
         <table width="95%" align="center" border="0" cellspacing="0" cellpadding="0">
	  		 <tr>
	            <td width="20" align="center"><img src="${contextPath }/pic/msindex/list_02.gif"/></td>
	            <td >
	            <a  href="${contextPath }/branches/mgrInfoSearch.jsp?nav=grgf&nav1=mgrInfo"  target="blank_">
	              业务人员执业资格信息查询 </a>

	            </td>
	            <td width="20" align="center"><img src="${contextPath }/pic/msindex/list_02.gif"/></td>
	            <td >
	            <a  href="${contextPath }/tgfFundInfoAction.do?method=getTgfFundInfoAll" target="blank_">
	             基金销售网点及销售人员资格情况公示 </a>
	            </td>
	          </tr>
	     </table>
	     
	      <div class=" blank10"></div>
	     <table width="95%" align="center" border="0" cellspacing="0" cellpadding="0">
	  		 <tr>
	            <td width="20" align="center"><img src="${contextPath }/pic/msindex/list_02.gif"/></td>
	            <td >
	            <a  href="${contextPath }/mgrInfoAction.do?method=getAllJzryxx"  target="blank_">
	              见证开户人员信息查询 </a>

	            </td>
	            <td width="20" align="center"></td>
	            <td >
	            </td>
	          </tr>
	     </table>
	</div>
	