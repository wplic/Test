<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<jsp:directive.page import="com.cssweb.hr.pojo.HrUser"/>
<jsp:directive.page import="com.cssweb.gxcp.pojo.Question"/>
<jsp:directive.page import="com.cssweb.gxcp.pojo.Option"/>
<jsp:directive.page import="java.util.*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
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
	Question question = null;
	if(null!=request.getAttribute("question"))
		question = (Question)request.getAttribute("question");
	List optionlist = null;
	if(null!=request.getAttribute("optionlist"))
		optionlist = (List)request.getAttribute("optionlist");
	String begintime = (String)request.getAttribute("begintime");
	String questionno = (String)request.getAttribute("questionno");
	String maxno = (String)request.getAttribute("maxno");
	int dotime = 0;
	if(null!=request.getAttribute("dotime"))
		dotime = ((Integer)request.getAttribute("dotime")).intValue();
 %>
 
 <script>
 
 	function subToPage(){
 		//var name = document.hrForm.name.value;
 		//var idcard = document.hrForm.idcard.value;
 		//var sexc = document.hrForm.sexc;
 		//var marriagec = document.hrForm.marriagec;
 		//document.hrForm.submit();
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
   				<form name="mantest" action="/gxcpAnswerAction.do?method=saveAnswer" method="post">
				<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
			     	<tr> 
						<td align="left">做答说明：</td>
			  		</tr>
			         <tr>
			              <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=null==question?"":question.getQuestiondesc() %></td>
			        </tr>
			         <tr> 
			              <td align="left" class="bold">试题 <%=questionno%>。 </td>
			         </tr>
					<tr> 
						<td align="center">
							<table align="center" border="1" width="96%" cellpadding="2" cellspacing="0" class="lh30" bgcolor="#fafafa" bordercolor="#cccccc">
								<%if(null!=optionlist && optionlist.size()>0){
									int optionsize = optionlist.size();
									for(int i=0;i<(optionsize<4?optionsize:4);i++){
										Option option = (Option)optionlist.get(i);%>
								<tr> 
			                       <td align="left" colspan="6"><%=0==i?"A":1==i?"B":2==i?"C":"D"%>：<%=option.getOptiondesc() %></td>
							  	</tr>
				              	<tr>
				                	<td align="center" width="30%"> &nbsp;<input type="hidden" name="option<%=0==i?"a":1==i?"b":2==i?"c":"d"%>" value=""/>  </td>
				                	<td align="center" width="10%">1&nbsp;<input type="radio" name="option<%=i+1%>" value="1" onClick="checkOpSelect(<%=i+1%>,0);"/></td>
				                	<td align="center" width="10%">2&nbsp;<input type="radio" name="option<%=i+1%>" value="2" onClick="checkOpSelect(<%=i+1%>,1);"/></td>
				                	<td align="center" width="10%">3&nbsp;<input type="radio" name="option<%=i+1%>" value="3" onClick="checkOpSelect(<%=i+1%>,2);"/></td>
				                	<td align="center" width="10%">4&nbsp;<input type="radio" name="option<%=i+1%>" value="4" onClick="checkOpSelect(<%=i+1%>,3);"/></td>
				                	<td align="center" width="30%">&nbsp; </td>
			                  	</tr>
			                  	<%	}
			                  	}%>
							</table>
						</td>                      
					</tr>
			        <tr> 
			              <td align="center" >												
				  			<input name="Submit" type="button" class="bu08" value=" <%=Long.parseLong(questionno)<Long.parseLong(maxno)?"下一题":"交 卷"%> "  onClick="next();"/>
					  		<input type="hidden" name="begintime" value="<%=begintime %>"/>
					 		<input type="hidden" name="submittype" value="0"/>
					  		<input type="hidden" name="questionid" value="<%=null==question?"0":question.getId()%>"/>
					  		<input type="hidden" name="questionno" value="<%=questionno %>"/>
					  		<input type="hidden" name="maxno" value="<%=maxno %>"/>
					  		<input type="hidden" name="isanswered" value="0"/>
					  		<input type="hidden" name="dotime" value="<%=dotime %>"/>
			   		 	</td>
			         </tr>
			         <tr> 
			            <td align="center">
			            	<table border="0" width="60%">
			            		<tr>
			            			<td width="20%" align="right">已答：</td>
			            			<td width="40%" align="left"><%=Long.parseLong(questionno)-1%> 题</td>
			            			<td width="20%" align="right">未答：</td>
			            			<td width="20%" align="left"><%=Long.parseLong(maxno)-(Long.parseLong(questionno)-1)%> 题</td>
			            		</tr>
			            		<tr>
			            			<td width="20%" align="right">已用时间：</td>
			            			<td width="40%" align="left"><font id="calendarClock3" style="color:#100080">00分00秒</font></td>
			            			<td width="20%" align="right">剩余时间：</td>
			            			<td width="20%" align="left"><font id="calendarClock4" style="color:#100080">40分00秒</font></td>
			            		</tr>
			            	</table>
						</td>                      
					</tr>
			        </table>
			       </form>
     		</div>
			<p class="newstextAreabottom"></p>
		</div>
	</div>
</div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
<script language="javascript">
function no_check()
{    
	if (document.mantest.option1[0].checked==false
		&&document.mantest.option1[1].checked==false
		&&document.mantest.option1[2].checked==false
		&&document.mantest.option1[3].checked==false)
	{
		if (document.mantest.option2[0].checked==false
			&&document.mantest.option2[1].checked==false
			&&document.mantest.option2[2].checked==false
			&&document.mantest.option2[3].checked==false)
		{
			if (document.mantest.option3[0].checked==false
				&&document.mantest.option3[1].checked==false
				&&document.mantest.option3[2].checked==false
				&&document.mantest.option3[3].checked==false)
			{
				if (document.mantest.option4[0].checked==false
					&&document.mantest.option4[1].checked==false
					&&document.mantest.option4[2].checked==false
					&&document.mantest.option4[3].checked==false)
				{
					return false;
				}	
			}
		}
	}	
	return true ;	    
}		
function check()
{    
	if (document.mantest.option1[0].checked==false
		&&document.mantest.option1[1].checked==false
		&&document.mantest.option1[2].checked==false
		&&document.mantest.option1[3].checked==false)
	{
		alert("请确定选项A的顺序！");				
		return false;
	}
	if (document.mantest.option2[0].checked==false
		&&document.mantest.option2[1].checked==false
		&&document.mantest.option2[2].checked==false
		&&document.mantest.option2[3].checked==false)
	{
		alert("请确定选项B的顺序！");				
		return false;
	}
	if (document.mantest.option3[0].checked==false
		&&document.mantest.option3[1].checked==false
		&&document.mantest.option3[2].checked==false
		&&document.mantest.option3[3].checked==false)
	{
		alert("请确定选项C的顺序！");				
		return false;
	}
	if (document.mantest.option4[0].checked==false
		&&document.mantest.option4[1].checked==false
		&&document.mantest.option4[2].checked==false
		&&document.mantest.option4[3].checked==false)
	{
		alert("请确定选项D的顺序！");				
		return false;
	}	
	var v1,v2,v3,v4 ;
	for(i=0;i<4;i++)
	{
		if(document.mantest.option1[i].checked)
	  	{
	    	v1=(i+1) ;
	    	document.mantest.optiona.value=document.mantest.option1[i].value;
			break ;
	  	}
	}
	for(i=0;i<4;i++)
	{
	  	if(document.mantest.option2[i].checked)
	  	{
	    	v2=(i+1) ;
	    	document.mantest.optionb.value=document.mantest.option2[i].value;
			break ;
	  	}
	}	
	for(i=0;i<4;i++)
	{
	  	if(document.mantest.option3[i].checked)
	  	{
	    	v3=(i+1) ;
	    	document.mantest.optionc.value=document.mantest.option3[i].value;
			break ;
	  	}
	}	
	for(i=0;i<4;i++)
	{
	  	if(document.mantest.option4[i].checked)
	  	{
	    	v4=(i+1) ;
	    	document.mantest.optiond.value=document.mantest.option4[i].value;
			break ;
	  	}
	}	
	if(v1==v2)	
	{
        alert("请选择A,B顺序不能一样！")+v1+"/"+v2;				
		return false;
	}
	if(v1==v3)	
	{
        alert("请选择A,C顺序不能一样！");				
		return false;
	}
	if(v1==v4)	
	{
        alert("请选择A,D顺序不能一样！");				
		return false;
	}
	if(v2==v3)	
	{
        alert("请选择B,C顺序不能一样！");				
		return false;
	}
	if(v2==v4)	
	{
		alert("请选择B,D顺序不能一样！");				
		return false;
	}
	if(v3==v4)	
	{
        alert("请选择C,D顺序不能一样！");				
		return false;
	}
	return true ;			
}
function priv()
{
	//document.mantest.act.value = "1" ;
	//document.mantest.doTime.value = doTime ;
 	//var privNo =parseInt(document.mantest.questionNo.value)-1 ;
	// if(privNo<1)
	//    privNo = 1 ;
	// document.mantest.questionNo.value = privNo ;
	if(no_check())
	{
 		if(check())
 		{
  			document.mantest.isanswered.value = "1" ;
 		}else{
  			document.mantest.isanswered.value = "0" ;
  			return ;
 		}
	}else{
  		document.mantest.isanswered.value = "0" ;
	} 
 	document.mantest.submit();
}
function next()
{
	//document.mantest.act.value = "2" ;
 	//document.mantest.doTime.value = doTime ;
 	//document.mantest.submittype.value = "0" ;
 	document.mantest.isanswered.value = "1" ;
 	//var nextNo =parseInt(document.mantest.questionNo.value)+1 ;
 	//if(nextNo>40)
	//   nextNo = 40 ;
	// document.mantest.questionNo.value = nextNo ;
	//if(no_check())
	//{
	var optionsize = <%=null==optionlist?0:optionlist.size()%>;
	if(optionsize>1){
	 	if(check())
	 	{
	  		document.mantest.isanswered.value = "1" ;
	 	}else{
	  		document.mantest.isanswered.value = "0" ;
	  		return ;
		}
		//}
		//else{
		//  document.mantest.isanswered.value = "0" ;
		//} 
 	}
	 document.mantest.submit();
}
function select_question()
{
	//document.mantest.act.value = "3" ;
 	document.mantest.doTime.value = doTime ;
	if(no_check())
	{
 		if(check())
 		{
  			document.mantest.isanswered.value = "1" ;
 		}else{
  			document.mantest.isanswered.value = "0" ;
  			return ;
 		}
	}else{
  		document.mantest.isanswered.value = "0" ;
	}
 	document.mantest.action ="select_question.jsp" ;
 	document.mantest.submit();
}
function submit_question()
{
	//document.mantest.act.value = "4" ;
  	document.mantest.doTime.value = doTime ;
 	if(check())
 	{
  		document.mantest.isanswered.value = "1" ;
 	}else{
  		document.mantest.isanswered.value = "0" ;
  		return ;
 	}
  	if(0==0){
   		if(confirm("还没有回答完(请看选题)，你确认交卷吗？"))
      		document.mantest.submit();
   		else
     		return ;
 	}else{
 		if(confirm("你确认交卷吗？"))
    		document.mantest.submit();
 		else
    		return ;	
 	}
}
function checkOpSelect(obj_i,op_i)
{
	var frm =document.mantest ;
 		if(frm.elements["option"+obj_i][op_i].disabled==false)
       		frm.elements["option"+obj_i][op_i].checked=true ;
	for(i=1;i<=4;i++){
   		for(j=0;j<4;j++)
   		{
     		frm.elements["option"+i][j].disabled=false ;
   		}
	}
  	for(i=1;i<=4;i++){
	    for(j=0;j<4;j++)
	    {
	      if(frm.elements["option"+i][j].checked) 
		   {
		     for(k=i+1;k<=4;k++)
			  {
			    frm.elements["option"+k][j].checked=false ;
				frm.elements["option"+k][j].disabled=true ;
			  }
		   }
	    }
	}
}
</script>
<script language="javascript">
var dotime=<%=dotime%> ;
document.all.calendarClock3.innerHTML = getMin_Sec(dotime); 
document.all.calendarClock4.innerHTML = getMin_Sec(40*60-dotime); 

function refreshCalendarClock(){ 
	dotime = dotime +1 ;
	if(dotime>40*60)  //系统交卷
	{
  		//document.mantest.act.value = "4" ;
  		document.mantest.submittype.value = "2" ;
  		document.mantest.dotime.value = dotime ;
  		if(no_check())
		{
   			if(check_ok())
      			document.mantest.isanswered.value = "1" ;
			else  
				document.mantest.isanswered.value = "0" ;
		}else{
			document.mantest.isanswered.value = "0" ;
		}
  		document.mantest.submit();
	}
	document.all.calendarClock3.innerHTML = getMin_Sec(dotime); 
	document.all.calendarClock4.innerHTML = getMin_Sec(40*60-dotime); 
}

function getMin_Sec(sec_n)
{
   var min = Math.floor(sec_n/60) ;
   var sec = (sec_n-min *60)
   if(min<10)
       min ='0'+min ;
   if(sec<10)
       sec='0'+sec ;
   return (min+'分'+sec+'秒')
}

setInterval('refreshCalendarClock()',1000);
</script>
</html>