<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.systemset.service.BranchManagerService"%>
<%@ include file="/commons/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'wjdc.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="${contextPath }/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript">
		function sub(){
			var age_group = getVal("age_group");
			var investment_year = getVal("investment_year");
			var asset_size = getVal("asset_size");
			var province = document.getElementById("province").value;
			var isgf = document.getElementById("isgf").value;
			var client_id = document.getElementById("client_id").value;
			var param = "&age_group="+age_group+"&investment_year="+investment_year+"&asset_size="+asset_size+"&province="+encodeURI(encodeURI(province))+"&isgf="+isgf+"&client_id="+client_id;
			//alert(param);
			$.ajax({ 
				url:'${contextPath }/nxsyRegisterAction.do?method=questionnaire'+param, 
				type: 'GET', 
				error: function(msg){ 
				      alert('数据加载错误!'+msg); 
				}, 
				success: function(msg){
					//隐藏层
					//ClosePop();
					//pop.close();
					alert("提交成功，感谢您的配合!");
					parent.ClosePop();
				} 
			});
		}
		function getVal(str){
		  var value="";
		  var radio=document.getElementsByName(str);
		  for(var i=0;i<radio.length;i++){
			if(radio[i].checked==true){
			  value=radio[i].value;
			  break;
			}
		  }
		  return value;
		} 
	</script>
  </head>
  
  <body>
  	<%
		ServletContext st = this.getServletConfig().getServletContext();
		ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
		
		BranchManagerService branchManagerService =(BranchManagerService)ctx.getBean("branchManagerService");
		List<String> provinces=null;
		//获得全部省份
		provinces= branchManagerService.getProvinces();
		request.setAttribute("provinces",provinces);
	%>
	<div align="center">
		<font style="color: red;font-family: inherit;font-size: 25px;font-weight: bold">
			用户问卷调查
		</font>
	</div>
	<div>
			<div class="nxsyIntro" style="padding-left: 18%">
		        <h4>1、您的年龄段：</h4>
		        <p>&nbsp;&nbsp;<input  type="radio" name="age_group" value="1" checked="checked"/>30岁以下&nbsp;&nbsp;
					<input  type="radio" name="age_group" value="2"/>30岁至40岁&nbsp;&nbsp;
					<input  type="radio" name="age_group" value="3"/>40岁以上&nbsp;</p>
		        <h4>2、您的投资年限：</h4>
		        <p>&nbsp;&nbsp;<input  type="radio" name="investment_year" value="1" checked="checked"/>2年以下&nbsp;&nbsp;
					<input  type="radio" name="investment_year" value="2"/>2年至4年&nbsp;&nbsp;
					<input  type="radio" name="investment_year" value="3"/>4年以上&nbsp;</p>
				<h4>3、您的证券及金融资产规模：</h4>
		        <p>&nbsp;&nbsp;<input  type="radio" name="asset_size" value="1" checked="checked"/>5万以下&nbsp;&nbsp;
					<input  type="radio" name="asset_size" value="2"/>5万至10万&nbsp;&nbsp;
					<input  type="radio" name="asset_size" value="3"/>10万至20万&nbsp;
					<input  type="radio" name="asset_size" value="4"/>20万以上&nbsp;</p>
				<h4>4、您所在地区：</h4>
		        <p>&nbsp;&nbsp;
		        	<select name="province" id="province" style="width: 150px;height: 20px;">
						<c:choose>
							<c:when test="${provinces!=null }">
								<c:forEach items="${provinces }" var="pval">
									<c:choose>
										<c:when test="${province==pval }">
											<option selected="selected" value="${pval }">
												${pval }
											</option>
										</c:when>
										<c:otherwise>
											<option value="${pval }">
												${pval }
											</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
					</select>
		        </p>
		        <h4>5、您是否已经是广发客户：</h4>
		        <p>&nbsp;&nbsp;
		        	<select name="isgf" id="isgf" style="width: 150px;height: 20px;">
						<option value="0">是</option>
						<option value="1">否</option>
					</select>
		        </p>
		        <div style="text-align: center;">
		        	<input type="hidden" name="client_id" id="client_id" value="${client_id }">
		        	<input type="button" value="确认并提交" onclick="sub();"/> 
		         </div>
		    </div>
	</div>
  </body>
</html>
