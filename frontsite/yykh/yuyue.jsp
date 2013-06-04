<%@page import="java.util.List"%>
<%@page import="com.cssweb.yykh.service.LinkBoxService"%>
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>广发证券见证开户惊艳亮相！</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

		<link rel="stylesheet" href="css/cssgrids-min.css">
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/main-min.css">
        <!--[if lt IE 9]>
		<script src="js/html5.js"></script>
		<![endif]-->
		<style type="text/css">
			body { font-family: "Microsoft yahei","微软雅黑","Tahoma","Verdana","Arial","sans-serif"; }
			h1, h2, h3, h4 {font-family: "Microsoft yahei","微软雅黑","Tahoma","Verdana","Arial","sans-serif";}					
		</style>
		<script type="text/javascript" src="${ctx }/match/nxsy/mncg/js/commons.js"></script>
	    <script type="text/javascript" src="${ctx }/js/jquery-1.7.2.min.js"></script>
	    <script type="text/javascript" src="${ctx }/financing/My97DatePicker/WdatePicker.js" ></script>
	    <script type="text/javascript" src="${ctx }/js/ofc2/json/json2.js"></script>
	    <script type="text/javascript" src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js"></script>
	    <script type="text/javascript">
	    	
		    var errorMsg="${err_msg}";
		  	if(errorMsg!=""){
		  		alert(errorMsg);
		  	}
		  	var data;
		  	function setDefaultByAddr(){
		        var tmp_province = "广东";
		        var tmp_city = "广州";
		        var tmp_yyb = "";
		        if(remote_ip_info == null || remote_ip_info==undefined){
		        	var remote_ip_info = {};
		        	remote_ip_info.province = "广东";
		        	remote_ip_info.city = "广州";
		        }
		        for(var i=0;i<data.length;i++){
		            if(remote_ip_info.province.indexOf(data[i].province)!= -1 || data[i].province.indexOf(remote_ip_info.province) != -1){
		                tmp_province = data[i].province;
		                tmp_city = data[i].city;
		                tmp_yyb = data[i].branch_code;
		                if(remote_ip_info.city.indexOf(data[i].city)!= -1 || data[i].city.indexOf(remote_ip_info.city) != -1){
		                    tmp_city =  data[i].city;
		                    tmp_yyb = data[i].branch_code;
		                    break;
		                }
		            }
		        }
		        setSelect(tmp_province,tmp_yyb);
		    }

		    function setSelect(province,yyb){
		        var ctl_province = document.getElementById("province");
		        //设置省份
		        for(var i=0;i< ctl_province.options.length;i++) {
		            var tmp = ctl_province.options[i].text;
		            if(tmp == province){
		                ctl_province.options[i].selected = true;
		            }
		        };
		        initSelectBranch(province);
		        //设置营业部
		        var ctl_yyb = document.getElementById("yyb");
		        for(var i=0;i< ctl_yyb.options.length;i++) {
		            var tmp = ctl_yyb.options[i].value;
		            if(tmp == yyb){
		                ctl_yyb.options[i].selected = true;
		            }
		        };
		    }
		    function initSelectProvince(){
		        var province =  document.getElementById('province');
		        province.options.length=0;
		        var tmp = "";
		        for(var i=0;i<data.length;i++){
		            if(tmp != data[i].province){
		                tmp = data[i].province;
		                var opp = new Option(tmp,tmp);
		                province.add(opp);
		            }
		        }
		    }

		    function initSelectBranch(province){
		        var branch = document.getElementById('yyb');
		        branch.options.length = 0;
		        for(var i=0;i<data.length;i++){
		            if(province == data[i].province){
		                var opp = new Option(data[i].branch_name,data[i].branch_code);
		                branch.add(opp);
		            }
		        }
		    }

		    function changeProvince(){
		        var select_province = $("#province").val();
		        initSelectBranch(select_province);
		    }
		    
	    	function doSmt(){
	    		var yyb = document.getElementById("yyb");
	    		var strMsg = "";
	    		strMsg += checkValid("khxm", "客户姓名", "NotEmpty");
	    		strMsg += checkValid("sj", "手机号码", "NotEmpty");
	    		strMsg += checkValid("verifyCode", "验证码", "NotEmpty");
	    		strMsg += checkValid("yyb", "营业部", "NotEmpty");
	    		strMsg += checkValid("sj", "手机号码", "Mobile");
	    		if(!isEmpty(strMsg))
	    		{
	    			alert(strMsg);
	                return false;
	    		}
	    		document.getElementById("loginForm").submit();
	    	}
	    	
	    	$.ajaxSetup ({  
		  	      cache: false //关闭AJAX缓存,否则在使用ajax数据联动时不一定能达到应用效果  
		  	});
	    	
	    	$(function(){ 
	   		　　$.ajax({
		           url: "${contextPath }/yykh/action/LinkBoxAction.go?function=GetBranch",
		           type: "get",
		           contentType:"application/json",
		           dataType: "json",
		           // cache: false,
		           complete: function(return_data) {
		        	   if(return_data.responseText!=null){
		        		   data = JSON.parse(return_data.responseText);
		        		   initSelectProvince();
		        		   setDefaultByAddr();
		        	   }
		           },
		           error:function(mm){
				        // alert("message error");
				   }
	   			})
	   		}); 
	    	
	    </script>
    </head>
    <body>
        <header class="clearfix">
			<div class="phone">客服热线：95575</div>
			<hgroup>
				<h1 class="ir logo" onclick="location.href='http://www.gf.com.cn';">广发证券，网上开户、自助服务</h1>
				<h2 class="title">见证开户</h2>
			</hgroup>
		</header>
		<section id="content" class="yue">
			<h3 class="sect">预约上门开户</h3>
			<div class="pad">&nbsp</div>
			<div class="yui3-g lr">
				<div class="yui3-u-1-2 sep">
					<form name="form1" id="form1" action="${ctx}/yykh/YuyueAction.go" method="post"  onsubmit="return doSmt();">
						<div class="control error">
							<label for="khxm">
								<span class="red">*</span>
								用户姓名：
							</label>
							<input type="text" id="khxm" name="khxm">
						</div>
						<div class="control error">
							<label for="sj">
								<span class="red">*</span>
								手机号码：
							</label>
							<input type="text" id="sj" name="sj">
						</div>
						<div class="control">
							<label for="sf">
								<span class="red">*</span>
								省份：
							</label>
							 <select name="province" id="province" onChange="changeProvince();" style="width: 189px;">
							　　<!--第一个下拉菜单-->
							　　<option value="0" selected>--请选择省份--</option>
							</select>
						</div>
						
						<div class="control">
							<label for="sf">
								<span class="red">*</span>
								营业部：
							</label>
							 <select name="yyb" id="yyb"style="width: 189px;">
							　　<!--第一个下拉菜单-->
							　　<option value="0" selected>--请选择营业部--</option>
							</select>
						</div>
						
						<div class="control">
							<label for="xxdz">
								上门服务地址：
							</label>
							<input type="text" id="xxdz" name="xxdz">
						</div>
						
						<div class="control">
							<label for="xxdz">
								预计开户日期：
							</label>
							<input class="Wdate" name="khrq" id="khrq" type="text" onClick="WdatePicker()"></td>
						</div>
						<div class="control error">
							<label for="shengfen">
								<span class="red">*</span>
								验证码：
							</label>
							<input size="11" id="verifyCode" type="text" class="input108" name="verifyCode"/>
							<img id="captchaImage" border=0 src="${ctx}/share/verifyCodeImage.jsp" width="70" height="28" align="absmiddle" border="0"/>
						</div>
						<div class="control">
							<input type="submit" value="提交" class="submit">
						</div>
					</form>
				</div><div class="yui3-u-1-2 tac">
					<div style="margin-top:50px;">
						<!--[if IE 6]>
						<img src="img/yuyue2.jpg">
						<![endif]-->
						<!--[if gt IE 6]><!-->
						<img src="img/yuyue2.jpg">
						<!--<![endif]-->
					</div>
					<p class="mt30">
						预约提交之后，将由我司见证人员为您提供见证开户服务。
					</p>
					<p class="mt30">
						<a href='${ctx}/branches/mgrInfoSearch.jsp?nav=grgf&nav1=mgrInfo' class="link" target="_blank">>>查询工作人员信息</a>
					</p>
				</div>
			</div>
		</section>
		<footer class="tac other">
			<div class="ib">
				<div class="icon"><div class="inner"></div></div>
				<a href='http://flash.gf.com.cn/'>高速行情</a>
			</div>
			<div class="ib">
				<div class="icon"><div class="inner speech"></div></div>
				<a href='http://www.gf.com.cn/bussinesshall/softDownload.html'>软件下载</a>
			</div>
			<div class="ib">
				<div class="icon"><div class="inner inbox"></div></div>
				<a href='http://www.gf.com.cn/mobile/index.jsp' class="last">手机证券</a>
			</div>
		</footer>
    </body>
    
</html>
