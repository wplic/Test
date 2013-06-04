<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<jsp:directive.page import="com.cssweb.hr.pojo.HrUser"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<bean:parameter name="nav" id="nav" value="apply"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/job/job.css" rel="stylesheet" type="text/css" />

<c:if test="${message!=null }">
	<script>
		alert("${message}");
	</script>
</c:if>
<%
	HrUser hrUser = (HrUser)request.getSession().getAttribute("hrUser");
	if(hrUser==null){
%>
	<script>
		alert("登陆超时,请重新登陆");
		window.location="${ctx }/job/index.jsp";
	</script>
<%
	}
 %>
 
 <script>
 
 	function subToPage(){
 		window.location="${ctx }/gxcpAction.do?method=updateBeginTime";
 	}
 </script>
</head>
<body oncontextmenu="return false" onselectstart="return false">
<noscript>
<iframe src="*.htm"></iframe>
</noscript>

<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页 </a> - <a href="${contextPath }/job/index.html">人才招聘</a> - 个性测评</div>
</div>
<div class="warp">
	<div class="bg_f5">
   		<div class="newstextArea">
   			<p class="newstextAreatop"></p>
   			<div class="lh24">
				<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
			     	<tr> 
						<td align="center" class="bold">测试说明</td>
			  		</tr>
			           	<tr>
			              <td align="left">一、 本测试时间为40分钟。</td>
			        </tr>
			         <tr> 
			               <td align="left">二、 本测试共有40道题，主要用于对你的个性特征进行简单的区分。测试结果无所谓好坏之分，不同于智力测验。</td>
			         </tr>
			         <tr> 
			               <td align="left">三、 请你根据自己的实际情况来做答。（测试中包含了测谎试题）</td>                      
					</tr>
			     	<tr> 
						<td align="left">四、 做答说明：</td>
			  		</tr>
			         <tr>
			              <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请根据自己对个人实际情况的自我感知、或者自己最亲近的人（比如父母、朋友、爱人或子女等）对自己的评价； 或者人们对自己小时候的评价对每道试题的四个选项进行排序。 序号“1”表示所描述的选项最符合自己的实际情况，序号越大表示跟自己的实际情况相差越远。 </td>
			        </tr>
			         <tr> 
			               <td align="left">范例： </td>
			         </tr>
			         <tr> 
			               <td align="left">一．</td>                      
					</tr>
					<tr> 
						<td align="center">
							<table align="center" border="1" width="96%" cellpadding="2" cellspacing="0" class="lh30" bgcolor="#fafafa" bordercolor="#cccccc">
								<tr> 
			                       <td align="left" colspan="6">A：我最喜欢吃葡萄。</td>
							  	</tr>
				              	<tr>
				                	<td align="center" width="30%">&nbsp;  </td>
				                	<td align="center" width="10%">1<input type="radio" name="like1" value="0" checked/></td>
				                	<td align="center" width="10%">2<input type="radio" name="like1" value="0"/></td>
				                	<td align="center" width="10%">3<input type="radio" name="like1" value="0"/></td>
				                	<td align="center" width="10%">4<input type="radio" name="like1" value="0"/></td>
				                	<td align="center" width="30%">&nbsp; </td>
			                  	</tr>
				              	<tr>
				                	<td align="left" colspan="6">B：我最喜欢吃哈密瓜。 </td>
			                  	</tr>
				              	<tr>
				                	<td align="center" width="30%">&nbsp;  </td>
				                	<td align="center" width="10%">1<input type="radio" name="like2" value="0"/></td>
				                	<td align="center" width="10%">2<input type="radio" name="like2" value="0"/></td>
				                	<td align="center" width="10%">3<input type="radio" name="like2" value="0"/></td>
				                	<td align="center" width="10%">4<input type="radio" name="like2" value="0" checked/></td>
				                	<td align="center" width="30%">&nbsp; </td>
			                  	</tr>
			                   	<tr> 
			                       <td align="left" colspan="6">C：我最喜欢吃香蕉。 </td>
			                    </tr>
				              	<tr>
				                	<td align="center" width="30%">&nbsp;  </td>
				                	<td align="center" width="10%">1<input type="radio" name="like3" value="0"/></td>
				                	<td align="center" width="10%">2<input type="radio" name="like3" value="0" checked/></td>
				                	<td align="center" width="10%">3<input type="radio" name="like3" value="0"/></td>
				                	<td align="center" width="10%">4<input type="radio" name="like3" value="0"/></td>
				                	<td align="center" width="30%">&nbsp; </td>
			                  	</tr>
			                    <tr> 
			                       <td align="left" colspan="6">D：我最喜欢吃芒果。 </td>
								</tr>
				              	<tr>
				                	<td align="center" width="30%">&nbsp;  </td>
				                	<td align="center" width="10%">1<input type="radio" name="like4" value="0"/></td>
				                	<td align="center" width="10%">2<input type="radio" name="like4" value="0"/></td>
				                	<td align="center" width="10%">3<input type="radio" name="like4" value="0" checked/></td>
				                	<td align="center" width="10%">4<input type="radio" name="like4" value="0"/></td>
				                	<td align="center" width="30%">&nbsp; </td>
			                  	</tr>
			                    <tr> 
			                       <td align="left" colspan="6">（做答者的实际情况：最喜欢吃的水果依次为葡萄、香蕉、芒果、哈密瓜，故其排序号为1，4，2，3） </td>
								</tr>
							</table>
						</td>                      
					</tr>
			         <tr> 
			               <td align="center">（请确认对上述信息进行了充分理解，然后按确认键进入测试）</td>                      
					</tr>
			        <tr> 
			              <td align="center" >												
				  			<input name="Submit" type="button" class="bu08" value=" 确 认 " onclick="subToPage()"/>					   
			   		 	</td>
			         </tr>
			        </table>
     		</div>
			<p class="newstextAreabottom"></p>
		</div>
	</div>
</div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>