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
	<link type="text/css" rel="stylesheet" href="../../css/wsyyt/wsyyt.css"/>
	<script type="text/javascript" src="${ctx }/match/nxsy/mncg/js/commons.js"></script>
	<script type="text/javascript" src="${contextPath }/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript">
		$.ajaxSetup ({  
		      cache: false //关闭AJAX相应的缓存  
		});
		function sub(){
			var province = document.getElementById("province").value;
			if(province=="" || province=="0"){
				alert("请选择营业部");
				return;
			}
			var branch = document.getElementById("branch").value;
			var recommend = document.getElementById("recommend").value;
			if(recommend == null || recommend.trim().length == 0){
				alert("推荐人不能为空");
				document.getElementById("recommend").value = "";
				document.getElementById("recommend").focus();
				return;
			}
			var param = "&client_id="+document.getElementById("client_id").value+"&recommend="+encodeURI(encodeURI(recommend))+"&branch="+branch;
			//alert(param);
			$.ajax({ 
				url:'${contextPath }/nxsyRegisterAction.do?method=bcUserInfo'+param, 
				type: 'GET', 
				error: function(msg){ 
				      alert('数据加载错误!'+msg); 
				}, 
				success: function(msg){
					//隐藏层
					alert("提交成功，您的信息已完善!");
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
		
		function Change_Select(){
			var val = document.getElementById("province").value;
			if(val=="0"){
				document.getElementById("div_").style.display="";
				document.getElementById("div_gncj").style.display="none";
				return;
			}
			$.ajax({ 
				url:'${contextPath }/nxsyRegisterAction.do?method=getBranchProvince&province='+encodeURI(encodeURI(val)), 
				type: 'GET', 
				error: function(msg){ 
				      alert('数据加载错误!'+msg); 
				}, 
				success: function(msg){
					var div_ = document.getElementById("div_");
					var div_gncj = document.getElementById("div_gncj");
					if(div_.style.display==""){
						div_.style.display="none";
					}
					if(div_gncj.style.display=="none"){
						div_gncj.style.display="";
					}
					$("#div_gncj").load("${ctx}/match/nxsy/branchs.jsp");//这里必须关闭ajax缓存，否则联动加载第二个营业部下拉框将不会产生变化
				} 
			});
		}
	</script>
  </head>
  
  <body>
  	<jsp:include page="${contextPath }/nxsyRegisterAction.do?method=getProvince"></jsp:include>
	<div align="center">
		<font style="color: red;font-family: inherit;font-size: 25px;font-weight: bold">
			请完善营业部和推荐人信息
		</font>
	</div>
	<div>
			<div class="nxsyIntro">
		       <table width="100%" class="moblietd mt10 ">
				  <tr>
				    <td class="title">营业部：</td>
				    <td>
						<select name="province" id="province" onChange="Change_Select()" style="width: 120px">
						　　<!--第一个下拉菜单-->
						　　<option value="0" selected>--请选择省份--</option>
							<logic:iterate id="data" name="listProvince">
						　 		<option value="${data.province }">${data.province }</option>
						    </logic:iterate>
						</select>
						<div id="div_gncj" style="display: none;">
							<jsp:include page='${ctx}/match/nxsy/branchs.jsp'></jsp:include>
						</div>
						<div id="div_">
							<select style="width: 200px">
						     <option value="0">--请选择对应省份营业部--</option>
							</select>
						</div>
				    </td>
				    <td><span class="font_73"><span style="color: red;">*</span>请如实选择您所在地营业部</span></td>
				  </tr> 
				  <tr>
				    <td class="title">推荐人：</td>
				    <td><input type="text" name="recommend" id="recommend" /></td>
				    <td><span class="font_73"><span style="color: red;">*</span>请填写您的推荐人姓名</span></td>
				  </tr> 
				</table>
		        <div style="text-align: center;padding-top: 30px;">
		        	<input type="hidden" name="client_id" id="client_id" value="${client_id }">
		        	<input type="button" value="确认并提交" onclick="sub();"/> 
		         </div>
		    </div>
	</div>
  </body>
</html>
