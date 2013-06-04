<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<%@page import="java.util.List"%>
<%@page import="org.springframework.context.ApplicationContext"%>

<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.common.dictionary.service.DictionaryService"%>
<%@page import="com.cssweb.common.dictionary.pojo.Dictionary"%>
<%@page import="com.cssweb.systemset.service.BranchManagerService"%>
<%@page import="com.cssweb.friendLink.service.FriendLinkService"%>
<%@page import="com.cssweb.friendLink.pojo.FriendLink"%>
<%@page import="com.cssweb.systemset.pojo.Branch"%>


<jsp:directive.page import="com.css.system.Configuration" />
<%@ include file="/commons/taglibs.jsp"%>



<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>

		<%
			//获得首次登陆的url
			//String mainBeforeLoginUrl = Configuration.getProperty("mainBeforeLoginUrl");
		    String ourl = Configuration.getProperty("OAUTH2_SERVER_DOMAIN") +  Configuration.getProperty("AUTHORIZATION_ENDPOINT") + "?client_id=" +
				Configuration.getProperty("OAUTH2_CLIENT_ID") + "&redirect_uri=" + Configuration.getProperty("OAUTH2_CLIENT_LOCAL") + 
				Configuration.getProperty("CALL_BACK");
			SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
			String url="/bussinesshall/loginLc.jsp";
			if(request.getParameter("url")!=null&&!request.getParameter("url").equals(""))
			{
				url=(String)request.getParameter("url");
				if(sqlInjectValidate.validateSql(url))
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
			}
			String urlError="/share/loginTemp.jsp";	
		 	//String beforeLoginUrl = Configuration.getProperty("beforeLoginUrl");
		 	String verifyCodeUrl =  Configuration.getProperty("OAUTH2_SERVER_DOMAIN") + "Kaptcha.jpg?ran=";
		%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta property="wb:webmaster" content="78374826e01255bf" />
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>广发证券</title>
	<link rel="stylesheet" type="text/css" href="css/basic_new.css" media="all" />
	<link rel="stylesheet" type="text/css" href="css/index_new.css" media="all" />
	<link href="${contextPath }/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/js/csswebutf1.js"></script>
	<style >
	#productInfoList{height:130px;overflow:hidden;}
	#artList2{height:130px;overflow:hidden;}
	
	
	
</style>

<script type="text/javascript">
function iswap(){
	
	var agentcheck=navigator.userAgent.toLowerCase();  
	var chesys=true; 
	var isWAP=false;
	var keywords = ["mobile", "android","gecko",
						"symbianos", "iphone","windows phone",
						"mqqbrowser", "nokia", "samsung", "midp-2",
						"untrusted/1.0", "windows ce", "blackberry","ucweb",
						"brew", "j2me", "yulong", "coolpad", "tianyu", "ty-",
						"k-touch", "haier", "dopod", "lenovo", "huaqin", "aigo-",
						"ctc/1.0", "ctc/2.0", "cmcc", "daxian", "mot-",
						"sonyericsson", "gionee", "htc", "zte", "huawei", "webos",
						"gobrowser", "iemobile", "wap2.0","wapi"];
	//排除 windows,苹果等桌面系统 和ipad 、iPod  
	var rekeywords=["Windows 98", "Windows ME","Windows 2000","Windows XP","Windows NT","Ubuntu","ipad","ipod","macintosh"];
	
	if (agentcheck!=null){
		for (var i = 0; i < rekeywords.length; i++) {
			if ( agentcheck.indexOf(rekeywords[i].toLowerCase())>-1){
			chesys=false;
			}
		}
	}

	if (chesys){
				for (var i = 0; i < keywords.length; i++) {
					if ( agentcheck.indexOf(keywords[i].toLowerCase())>-1) {
						isWAP = true;
						break;
					}
				}
	}
	if (isWAP) {
				window.location.href="http://3g.gf.com.cn";
			}
	
}
window.onload=iswap();
</script>




	<script type="text/javascript">
	 var ourl = "<%= ourl%>";
	 function toLinkURL(value)
	 {
	 	if(value == "")
	 		return;
	 	window.open(value);
	 } 
	function checkLogin(){
	      
		   var serviceName=document.getElementById("serviceName").value;
		   var password=document.getElementById("password").value;
		   var verifyCode= document.getElementById("verifyCode").value;  
		  
		   if(serviceName=="")
		   {
		     alert("用户名不能为空！");
		     document.getElementById("serviceName").value="";
		     document.getElementById("serviceName").focus();
		     return false;
		   }
		   if(password=="")
		   {
		     alert("密码不能为空！");
		     document.getElementById("password").value="";
		     document.getElementById("password").focus();
		     return false;
		   }
		    
		   if(verifyCode=="")
		   {
		     alert("验证码不能为空！");
		     document.getElementById("verifyCode").value="";
		     document.getElementById("verifyCode").focus();
		     return false;
		   }
		    if(verifyCode.length!=4)
		   {
		     alert("验证码应该是4位！");
		     document.getElementById("verifyCode").value="";
		     document.getElementById("verifyCode").focus();
		     return false;
		   }
		    
		    
		   //获取下拉框的值
		   /*
		   var select_name=document.getElementById("select_name").value;
		   */
		    var select_name="1";
			   var radios= document.getElementsByName("select_name");
			   for(var i=0;i<radios.length;i++){
				   var radio=radios[i];
				   if(radio.checked){
					   select_name= ""+radio.value;
				   }
			   }
		   
		   if(select_name=="2")
		   {
		   	   document.getElementById("loginForm").action="/webUser.do?method=loginTx";
		       document.getElementById("loginForm").submit();
		   } else if(select_name=="3"){
			   document.getElementById("loginForm").action="/sunnyCustAction.do?method=login";
		       document.getElementById("loginForm").submit();
		   } else {
			    //交易客户和体验客户通过oauth2服务器验证
			 	document.getElementById("ticket").value = verifyCode;
			 	document.getElementById("user_id").value = serviceName;
			 	document.getElementById("loginForm").action=ourl;
			 	document.getElementById("loginForm").submit();
		    }
	     }
	     
	     function checkJy() {
	         document.location.href="http://store.gf.com.cn/#/home?login_type=trade";
	     }

		function refreshCaptcha(){
			var select_name="1";
		    var radios= document.getElementsByName("select_name");
		    for(var i=0;i<radios.length;i++){
			   var radio=radios[i];
			   if(radio.checked){
				   select_name= ""+radio.value;
			   }
		    }
		    if(select_name=="1" || select_name=="4"){
		    	document.getElementById("captchaImage").src="<%=Configuration.getProperty("OAUTH2_SERVER_DOMAIN") %>Kaptcha.jpg?ran="+Math.random();
		    }else{
		    	document.getElementById("captchaImage").src="${ctx}/share/verifyCodeImage.jsp?ran="+Math.random();
		    }
		}
	    
    
    //探出帮助窗体
    function openHple()
	{
	var ah = 280;
	var aw = 500;
	window.open('${contextPath }/share/beforeHple.jsp', 'newwindow', 'height='+ah +', width='+aw+', top=100, left=260, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
    }
    
    //控制显示
    function changeLoginType(choose){
	  var loginType = choose.value;
	  if(loginType=="1"||loginType=="3")
	  {
	   document.getElementById("sjdl").style.display = "block";	
	   document.getElementById("default_yhm").style.display = "block";	
	   document.getElementById("default_khh").style.display = "none";
	  }else{
	   document.getElementById("default_yhm").style.display = "none";
	   document.getElementById("default_khh").style.display = "block";	
	   document.getElementById("sjdl").style.display = "none";
  			}
	}
    
    
     
	</script>
</head>


<body>

<jsp:include page="/share/cssValidateForJquery.jsp" />
<div class="ad-double" style="display: none;">
			<a href="#" class="close">关闭</a>
		</div>
		<div class="ad-double">
			<a href="#" class="close">关闭</a>
				<div class="floatMenu">
					<a href="/bussinesshall/movetradehall/myJsAdvisory.jsp">在线客服</a>
					<a id="kfjla" href="/bussinesshall/financingCzh.jsp">客服经理</a>
					<a href="/bussinesshall/movetradehall/myAdvisory.jsp">咨询</a>
				</div>
		</div>
	<div class="wrap">
		<jsp:include page="/commons/mstop.jsp" />
	
		<div class="pbd clearfix">
			<div class="part pt-main fr">
			 <div class="mod mod-pcont" id="pcont">
			    <!-- 导入广告页面 -->
			     <jsp:include page="/ad/ad_default.jsp">
		    	      <jsp:param name="width" value="608"/>
					  <jsp:param name="height" value="222"/>
		     </jsp:include>
			  </div>
			    <!-- mod -->
				
				<!-- 浮动广告位置 -->
		     		<jsp:include page="/ad/ad_paintings.jsp">
		              <jsp:param name="widths" value="120"/>
					  <jsp:param name="heights" value="250"/>
					  <jsp:param name="subAdCode" value="ad_paintings_default"/>
		    		 </jsp:include>
		    	<!-- 浮动广告位置  END-->
		    	<div class="group clearfix">
					<div class="mod mod-main fl">
						<div class="subMod subMod-marq mb10">
							<!-- 信息提醒 -->
							
								<jsp:include page="/newcommons/index_xxtx.jsp"/>
						</div> <!-- subMod -->
					
					
						<div class="subMod subMod-zpsd mb10">
						
						<!-- 导入早盘视点 zpsd  include index_zpsd.jsp -->
	<jsp:include page="/newcommons/index_zpsd.jsp">
	 		<jsp:param name="catName" value="" />
            <jsp:param name="whichCat" value="gfsd"/>
            <jsp:param name="state" value="1"/>
            <jsp:param name="showSize" value="1"/>
    	</jsp:include>
							 <!-- subMbd -->
							<div class="subMft"></div>
						</div> <!-- subMod -->
					
						<div class="subMod subMod-gfdt mb10">
							<!-- 导入广发动态 -->
							<!-- include index_gfdt.jsp -->
	<jsp:include page="/newcommons/index_gfdt.jsp">
	  <jsp:param name="catName" value="广发动态" />
            <jsp:param name="whichCat" value="gygf_gsdt"/>
            <jsp:param name="state" value="1"/>
            <jsp:param name="showSize" value="5"/>
            </jsp:include>
							
							<div class="subMft"></div>
						</div> <!-- subMod -->
						
						<div class="subMod subMod-gfyj tabs mb10">
						<div class="subMhd">
								<ul id="gfyjywts" class="tab-menu">
									<li class="hover" onmouseover="gfyjHove()"><a href="/stockResearch/resrarchReport.html">广发研究</a></li>
									<li onmouseover="cjywHove()"><a href="/infoCenter/domesticNewsGncj.html">财经要闻</a></li>
									<li onmouseover="wxtsHove()"><a href="/business/businessWxts.jsp?whichCat=sy_wxts_zgfyfxjyx">温馨提示</a></li>
								</ul> <!-- tab-menu -->
								<a id="more3" href="/stockResearch/resrarchReport.html" class="more">更多</a>
							</div>
							<div class="subMbd">
							<div class="tab-cont">
							<!-- 广发研究、财经要闻、温馨提示 -->
							<jsp:include page="/newcommons/index_gfyj.jsp">
							 <jsp:param name="catName" value="研究报告" />
					            <jsp:param name="whichCat" value="zqyj_yjbg_hgyj|zqyj_yjbg_scyj|zqyj_yjbg_yspyj|zqyj_yjbg_hyyj|zqyj_yjbg_gsyj|zqyj_yjbg_jjyj"/>
					            <jsp:param name="state" value="1"/>
					            <jsp:param name="showSize" value="5"/>
					    	</jsp:include>
								<jsp:include page="/newcommons/index_new.jsp">
								  <jsp:param name="catName" value="国内财经" />
						            <jsp:param name="whichCat" value="zxzx_glcj"/>
						            <jsp:param name="state" value="1"/>
						            <jsp:param name="showSize" value="5"/>
						    	</jsp:include>
								<jsp:include page="/newcommons/index_wxts.jsp"/>
								 <!-- subMbd -->
							</div> <!-- tab-cont -->
							</div>
							<div class="subMft"></div>
						</div> <!-- subMod -->
						<!-- 财经汇、财富汇、财智汇 -->
							<jsp:include page="/newcommons/index_lczx.jsp"/>
						 <!-- subMod -->	
					</div> <!-- mod -->
				
					<div class="mod mod-side fr">	
					<!-- 搜索 -->				
						<jsp:include page="/newcommons/index_search.jsp"/>
						 <!-- subMod -->
						<!--  竞赛榜单 -->
					<iframe style="margin-bottom: 10px;"
								src="http://q.stock.sohu.com/cgds/slice/top10.jsp"
								id="hqIframes" name="hqIframes" marginWidth="0" marginHeight="0"
								frameBorder="0" height="215px" width="100%" scrolling="no"></iframe>
								 <!-- subMod -->
						<div class="subMod subMod-ywdt mb10">
								<!-- 业务动态 -->
								<jsp:include page="/newcommons/index_ywdt.jsp">
								    <jsp:param name="catName" value="业务动态" />
						            <jsp:param name="state" value="1"/>
						            <jsp:param name="showSize" value="3"/>
						    	</jsp:include>
								<!-- subMbd -->

							<div class="subMft">
								<b></b>
							</div>	<!-- subMft -->								
						</div><!-- subMod -->
					
						<!-- subMod -->

						<div class="subMod subMod-sptj">
							<!-- 视频推荐 -->
								<jsp:include page="/newcommons/index_sptj.jsp"/>
							<!-- subMbd -->

							<div class="subMft">							
							</div>	<!-- subMft -->								
						</div> <!-- subMod -->	
						
						<div class="subMod subMod-lccp tabs mb10">
						<div class="subMhd">
								<ul class="tab-menu">
									<li class="hover"><a href="${contextPath}/assetManage/gatherFinancing.html" title="更多……">理财产品</a><b></b></li>
									<li><a href="${contextPath}/tsystemFundSaleFrontAction.do?method=getFundSaleList&nav=zxzx&nav1=jj&nav2=hor1&menu1=hor1&menu2=board1&menu3=dxjj" title="更多……">投资产品</a><b></b></li>
								</ul> <!-- tab-menu -->
							</div>
								<!-- 理财产品、投资产品净值 -->
								<div class="subMbd">
								<div class="tab-cont">
								<jsp:include page="/newcommons/index_lccp.jsp"/>
								<jsp:include page="/newcommons/index_cpjz.jsp">
								 <jsp:param name="beginNum" value="0"/>
						           <jsp:param name="endNum" value="5"/>
						        </jsp:include>
							</div>
							</div>
							<div class="subMft">
								<b></b>
							</div>
						</div> 		
								
					</div> <!-- mod-side -->
				</div>
			</div> <!-- pt-main -->
			<div class="part pt-second">
			
			<!-- include index_login.jsp 用户登陆 -->
				
				<c:choose>
					<c:when test="${tsystemWebuser!=null||assetUser!=null}">
						<c:if test="${assetUser!=null}">
						<div class="mod mod-login mb10" style="height:60px;">
									<div class="loginA" style="display: block;">
										<table width="100%" >
											<tr class="msg">
												<td><span>欢迎您：${assetUser.clientName}</span></td>									
											</tr>
											<tr class="loginArea">
												<td><a href="/bussinesshall/financingCzh.jsp" class="lczx">进入我的理财中心</a></td>
												<td><a href="/webUser.do?method=frontLogoutDefault" class="signOut">安全退出</a></td>
											</tr>
										</table>				
									</div>
									</div>
							</c:if>
						<c:if test="${tsystemWebuser!=null}">
						<div class="mod mod-login mb10" style="height:60px;">
								<div class="loginA" style="display: block;">
									<table width="100%" >
										<tr class="msg">
											<td><span>欢迎您：${tsystemWebuser.realName}</span></td>									
										</tr>
										<tr class="loginArea">
											<td><a href="/bussinesshall/financingCzh.jsp" class="lczx">进入我的理财中心</a></td>
											<td><a href="/webUser.do?method=frontLogoutDefault" class="signOut">安全退出</a></td>
										</tr>
									</table>				
								</div>
								</div>
						</c:if>
					</c:when>
					<c:otherwise>
					<div class="mod mod-login mb10" style="height:38px;">
						<div class="loginB">
							<a href="#" onclick="popBox('#popBox1', this)" title="用户登录">用户登录</a><a href="/share/userApplication.jsp" title="我要注册">我要注册</a>
						</div>
						</div>
					</c:otherwise>
				</c:choose>
				<!-- mod -->
				<div class="mod mod-tyzx mb10">
				    <!-- ExCenter  体验中心-->
				    <!-- include index_ExCenter.jsp -->
					<jsp:include page="/newcommons/index_ExCenter.jsp"/>
				    <!-- mbd -->
					
				    <div class="mft">
						<b></b>
					</div><!-- mft -->
				</div> <!-- mod -->
				<div>
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
					  <tr>
					    <td align="left"><a href="${contextPath }/golden/index.html"><img src="${contextPath }/pic/msindex/new/rban1.jpg" /></a></td>
					    <td align="right"><a href="${contextPath }/bottom/FuturesIBkflc.jsp"><img src="${contextPath }/pic/msindex/new/rban5.jpg" /></a></td>
					  </tr>
					  <tr>
					    <td colspan="2" height="6"></td>
					    </tr>
					  <tr>
					    <td align="left"><a href="${contextPath }/bussinesshall/95575.html"><img src="${contextPath }/pic/msindex/new/rban3.jpg" /></a></td>
					    <td align="right"><a href="${contextPath}/mobile/index.jsp"><img src="${contextPath }/pic/msindex/new/rban4.jpg" /></a></td>
					  </tr>
					  <tr style="height: 40px;">
					    <td align="center" colspan="2"><a href="https://trade.gf.com.cn"><img src="${contextPath }/pic/msindex/new/rban6.jpg" /></a></td>
					  </tr>
					  <tr style="height: 40px;">
					    <td align="center" colspan="2"><a href="${contextPath}/companyDelisting.jsp?whichCat=ts_zl_zl"><img src="${contextPath }/pic/msindex/new/finaly.jpg" /></a></td>
					  </tr>
					  <tr style="height: 40px;">
					    <td align="center" colspan="2"><a href="${contextPath}/otc/action/OtcAction.go?function=FrontGetOtcList"><img src="${contextPath }/pic/msindex/new/otczl.jpg" /></a></td>
					  </tr>
					</table>
				</div>
				<div class="mod mod-gfztt">
					<img src="images/mod-gfzt.png"></img>
				<br/>
				<br />
				</div>
				
				<div class="mod mod-gfzt mb10" id="picShow">
				   
				<!-- include index_GfFeature.jsp 导入广发专题-->
				  
					<jsp:include page="/ad/ad_d_g.jsp">
		              <jsp:param name="width" value="195"/>
					  <jsp:param name="height" value="250"/>
					  <jsp:param name="subAdCode" value="ad_d_g"/>
                	</jsp:include>
               
					
				    <div class="mft">
						<b></b>
					</div><!-- mft -->
				</div> <!-- mod -->
				
				<div class="mod mod-wdcx mb10" >
						<!-- 导入省份、城市 -->

						<%
							ServletContext st = this.getServletConfig().getServletContext();
							ApplicationContext ctx = WebApplicationContextUtils
									.getRequiredWebApplicationContext(st);

							BranchManagerService branchManagerService = (BranchManagerService) ctx
									.getBean("branchManagerService");

							if (branchManagerService != null) {
								//out.println("<script type='text/javascript'> alert('fuck'); </script>");
							}

							List<String> provinces = null;
							List<String> citys = null;
							//获得全部省份
							provinces = branchManagerService.getProvinces();

							//如果选中了省份就获得城市
							String province = null;
							if (request.getParameter("provice") != null
									&& !"".equals(request.getParameter("provice"))) {
								province = request.getParameter("provice");
								citys = branchManagerService.getCitysByProvince(province);
							}
							request.setAttribute("provinces", provinces);
							request.setAttribute("province", province);
						%>
					
						<div class="mhd">
							<h3>
								营业部网点查询
							</h3>
						</div>
						<!-- mhd -->

						<div class="mbd">
							
							<form method="post"
								action="/branchManagerAction.do?method=getBranchsByMap"
								class="search">
								<select name="province" id="pselect" style="width: 150px;height: 20px;">
									<option>
										所有省份
									</option>
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

								<select id="cselect" name="city" style="width: 150px;height: 20px;">
									<option>
										所有城市
									</option>
								</select>

								<input name="keyword" type="text" value=""
									style="margin-left: 20px;margin-bottom:10px;width: 70px;"  />
								<input type="submit" value="搜索" class="btn" />

							</form>

						<!-- 导入分支机构公告 -->
					
						
						<jsp:include page="/newcommons/index_institutions.jsp" />
						
						
						</div>
						<!-- mbd -->

						<div class="mft">
							<b></b>
						</div>
						<!-- mft -->
					</div>
					
					<div class="mod mod-phone">
					<a href="http://www.gf.com.cn/bussinesshall/95575.html"><img src="pic/phone.png" alt="" /></a>
				</div>
				<div style="height: 10px"></div>
				<%
					FriendLinkService friendLinkService = (FriendLinkService) ctx
							.getBean("friendLinkService");
					List links = null;
					List linkList = new ArrayList();
					if (friendLinkService != null) {
						links = friendLinkService.getAllShowFriendLink();
						for (int i = 0; i < links.size(); i++) {
							FriendLink friendLink = (FriendLink) links.get(i);
							Map map = new HashMap();
							map.put("link_url", friendLink.getLinkURL());
							map.put("link_name", friendLink.getLinkName());
							linkList.add(map);
						}

					}
					request.setAttribute("links", linkList);
				%>
				<div>
					<select id="link" style="width:100%; margin-top:10px;" onchange="toLinkURL(this.value)" name="link">
						<option value="">--------友情链接--------</option>
						<c:choose>
							<c:when test="${links!=null }">
								<c:forEach items="${links }" var="item">
									<option value="${item.link_url }"> ${item.link_name } </option>
								</c:forEach>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
					</select>
				</div> <!-- ood -->
				
				
				
			</div> <!-- pt-second -->
		</div> 
		<!-- 登陆探出的div -->
		<div class="mod-pop" id="popBox1">
				<div class="mhd">
					<h4>
						用户登录
						</h3>
						<a href="#" class="close">关闭</a>
						<h3>
							弹出窗口
						</h3>
				</div>
				<div class="mbd">
					<form method="post" action=""
						id="loginForm" name="loginForm">
						<input type="hidden" name="ticket" id="ticket" />
         				<input type="hidden" name="user_id" id="user_id" />
         				<input type="hidden" name="login_type" id="login_type" value="portal" />
						<table align="center" width="100%" class="lh21">
							<tbody >
								<tr>
									
									<td width="20%">
										用户类型：
									</td >
									<td width="80%">
										<input  type="radio" name="select_name" onclick="refreshCaptcha()" value="1" checked="checked"/>交易客户&nbsp;
										<input  type="radio" name="select_name" onclick="refreshCaptcha()" value="2"/>理财客户&nbsp;
										<input  type="radio" name="select_name" onclick="refreshCaptcha()" value="3"/>阳光私募&nbsp;
										<input  type="radio" name="select_name" onclick="refreshCaptcha()" value="4"/>体验客户
										<!-- 
										<select style="width: 100px" id="select_name"
											name="select_name" onchange="changeLoginType(this);">
											<option selected="" value="1">
												交易客户
											</option>
											<option value="2">
												理财客户
											</option>
											<option value="3">
												体验客户
											</option>
										</select>
										 -->
									</td>
								</tr>
								<tr>
									<td >
										<div id="default_yhm">
											用&nbsp;户&nbsp;名：
										</div>
										<div style="display: none" id="default_khh">
											客户号或
											<br>
												身份证：
										</div>
									</td>
									<td>
										<input type="text" style="width: 150px" maxlength="18"
											name="serviceName" id="serviceName" class="input100">
											<input type="hidden" value="/bussinesshall/loginLc.jsp"
												name="url">
												<input type="hidden" value="/default.jsp" name="urlError">
													<input type="hidden" value="" id="callBack" name="callBack">
									</td>
								</tr>
								<tr>
									<td >
										密&nbsp;&nbsp;&nbsp;&nbsp;码：
									</td>
									<td>
										<input type="password" style="width: 150px" maxlength="18"
											name="password" id="password" class="input100">
									</td>
								</tr>
								<tr>
									<td >
										验&nbsp;证&nbsp;码：
									</td>
									<td>
										<input class="input100" size="11" style="width: 50px"
											id="verifyCode" type="text" size="11" 
											name="verifyCode" maxlength="4">
		           						<img id="captchaImage" border=0 
		           							src="<%=verifyCodeUrl %>" width="60" height="28" 
		           							align="absmiddle" border="0"> 
										<a href="javascript:refreshCaptcha();">看不清？换一张</a>
									</td>
								</tr>
								<tr>
									<td align="center" colspan="3">
										<table align="center" width="100%" class="mt5">
											</div>
											</td>
											</tr>
											<tr>
												<td align="center" colspan="3">
													<table align="center" class="mt5">
														<tbody>
															<tr>
																<td>
																	<input type="button" onclick="checkLogin();"
																		class="but01" value="登&nbsp;录" id="button"
																		name="button">
																	首次登陆:<input type="checkbox" name="checkbox"
																			id="checkbox" onclick="checkJy();" />
																</td>
																<td align="left" class="help">
																	<a onclick="openHple();" href="#">帮助</a>
																</td>
																<td align="left">
																	<a class="font_9fu" target="_blank"
																		href="http://store.gf.com.cn/#/register">体验申请</a>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="mft"></div>
					</form>
				</div>

			</div>
	<!-- 以上为添加标记 -->
		<jsp:include page="/commons/msbottom.jsp" />
		<!-- pft -->
		
	</div>

<script type="text/javascript">
            //滚动插件
            (function ($) {
                $.fn.extend({
                    Scroll: function (opt, callback) {
                        //参数初始化
                        if (!opt) var opt = {};
                        var _this = this.eq(0).find("DL:first");
                        var lineH = _this.find("DD:first").height(), //获取行高
                        line = opt.line ? parseInt(opt.line, 12) : parseInt(this.height() / lineH, 10), //每次滚动的行数，默认为一屏，即父容器高度
                        speed = opt.speed ? parseInt(opt.speed, 12) : 5000, //卷动速度，数值越大，速度越慢（毫秒）
                        timer = opt.timer ? parseInt(opt.timer, 15) : 3000; //滚动的时间间隔（毫秒）
                        if (line == 0) line = 1;
                        var upHeight = 0 - line * lineH;
                        //滚动函数
                        scrollUp = function () {
                            _this.animate({
                                marginTop: upHeight
                            }, speed, function () {
                                for (i = 1; i <= line; i++) {
                                    _this.find("DD:first").appendTo(_this);
                                }
                                _this.css({ marginTop: 0 });
                            });
                        }
                        //鼠标事件绑定
                        _this.hover(function () {
                            clearInterval(timerID);
                        }, function () {
                            timerID = setInterval("scrollUp()", timer);
                        }).mouseout();
                    }
                })
            })(jQuery);

                $("#scrollDiv").Scroll({ line: 4, speed: 500, timer: 1000 });



$("#pcont").pcont({snum:4, isH:false});
$(".tabs").tabs({meth:"hover"});
$("#picShow").picshow();


$("#pselect").change(function(){
	var pvalue=$("#pselect")[0].value;
	var url= encodeURI("/branchManagerAction.do?method=getCitys&provice="+pvalue);
	//var url= "/branchManagerAction.do?method=getCitys&provice="+pvalue;
	$.getJSON(url,null,
	          function(json){
					citys = json.citys;
					var html = '<option>所有城市</option>';
					$.each(citys,function(i,n){
						html += '<option value="'+n+'">'+n+'</option>';
					});
					$("#cselect").html(html);
	          });
});

function gfyjHove(){
	$("#more3").attr("href","/stockResearch/resrarchReport.html");
}
function cjywHove(){
	$("#more3").attr("href","/infoCenter/domesticNewsGncj.html");
}
function wxtsHove(){
	$("#more3").attr("href","/business/businessWxts.jsp?whichCat=sy_wxts_zgfyfxjyx");
}

//动态修改连接
/*
$("#gfyjywts > li").mouseover(function(){
	var st=($(this).text()+"");
	var st01=new String(st);
	var st02=new String("广发研究");
	var st03=new String("财经要闻");
	if(st01==st02){
		$("#more3").attr("href","/stockResearch/resrarchReport.html");
	}
	if(st01==st03){
		$("#more3").attr("href","/infoCenter/domesticNewsGncj.html");
	}
	if($(this).text()=="温馨提示"){
		$("#more3").attr("href","/business/businessWxts.jsp?whichCat=sy_wxts_zgfyfxjyx");
	}
});


*/
$("#kfjla").click(function(){
	alert("为财智汇、财富汇客户提供此服务，请先登录");
});

var bbb=0;
function updateSzAndSh(){
	var url= encodeURI("/qzhqAction.do?method=getStockInfoForShAndSz");
	$.getJSON(url,null,function(json){
		szAndshs=json.szAndsh;
		
		var html="";
		
		
		if(bbb==0){
			
			//获得上证的涨跌
			var shAndsh=""+szAndshs[1].zjcj;
			var shzd="";
			if(szAndshs[1].zd!=null){
				
			 shzd=""+szAndshs[1].zd;
			}
			var shcjje=""
			if(szAndshs[1].cjje!=null){
				
				shcjje=""+(szAndshs[1].cjje/100000000).toFixed(2);
			}
			var shAndshUpDown=""+szAndshs[1].zf;
			//var rs2=num.toFixed(4);
		     
			var shUpDownPercent=szAndshs[1].zf*100;
			if(shAndshUpDown.substr(0,1)=="-"){
				html="&nbsp;&nbsp;上证指数:<span style='color: green;'>"+szAndshs[1].zjcj+"</span>&nbsp;&nbsp;&nbsp;<span style='color: green;'>"+shzd+"</span>&nbsp;&nbsp;&nbsp;<span style='color: green;'>"+shUpDownPercent.toFixed(2)+"%</span>&nbsp;&nbsp;&nbsp;<span style='color: green;'>"+shcjje+"</span>亿"
			}else{
				html="&nbsp;&nbsp;上证指数:<span style='color: red;'>"+szAndshs[1].zjcj+"</span>&nbsp;&nbsp;&nbsp;<span style='color: red;'>"+shzd+"</span>&nbsp;&nbsp;&nbsp;<span style='color: red;'>"+shUpDownPercent.toFixed(2)+"%</span>&nbsp;&nbsp;&nbsp;<span style='color: red;'>"+shcjje+"</span>亿"
			}
		}
		
		
		if(bbb==1){
			
			//获得深证的涨跌
			
			var szAndsh=""+szAndshs[0].zjcj;
			var szAndshUpDown=""+szAndshs[0].zf;
			var szzd="";
			if(szAndshs[0].zd!=null){
				szzd=""+szAndshs[0].zd;
			}
			var szcjje="";
			if(szAndshs[0].cjje!=null){
				szcjje=""+(szAndshs[0].cjje/100000000).toFixed(2);
			}
			var szUpDownPercent=szAndshs[0].zf*100;
			
			if(szAndshUpDown.substr(0,1)=="-"){
				html+="&nbsp;&nbsp;深圳成指:<span style='color: green;'>"+szAndshs[0].zjcj+"</span>&nbsp;&nbsp;&nbsp;<span style='color: green;'>"+szzd+"</span>&nbsp;&nbsp;&nbsp;<span style='color: green;'>"+szUpDownPercent.toFixed(2)+"%</span>&nbsp;&nbsp;&nbsp;<span style='color: green;'>"+szcjje+"</span>亿";
			}else{
				html+="&nbsp;&nbsp;深圳成指:<span style='color: red;'>"+szAndshs[0].zjcj+"</span>&nbsp;&nbsp;&nbsp;<span style='color: red;'>"+szzd+"</span>&nbsp;&nbsp;&nbsp;<span style='color: red;'>"+szUpDownPercent.toFixed(2)+"%</span>&nbsp;&nbsp;&nbsp;<span style='color: red;'>"+szcjje+"</span>亿";
			}
		}
		
		
		if(bbb==2){
			
			//获得深证的涨跌
			
			var shZxAndsh=""+szAndshs[2].zjcj;
			var shZxAndshUpDown=""+szAndshs[2].zf;
			var shZxzd="";
			if(szAndshs[2].zd!=null){
				shZxzd=""+szAndshs[2].zd;
			}
			var shZxcjje="";
			if(szAndshs[2].cjje!=null){
				shZxcjje=""+(szAndshs[2].cjje/100000000).toFixed(2);;
			}
			var shZxUpDownPercent=szAndshs[2].zf*100;
			
			if(shZxAndshUpDown.substr(0,1)=="-"){
				html+="&nbsp;&nbsp;上证中小:<span style='color: green;'>"+szAndshs[2].zjcj+"</span>&nbsp;&nbsp;&nbsp;<span style='color: green;'>"+shZxzd+"</span>&nbsp;&nbsp;&nbsp;<span style='color: green;'>"+shZxUpDownPercent.toFixed(2)+"%</span>&nbsp;&nbsp;&nbsp;<span style='color: green;'>"+shZxcjje+"</span>亿"
			}else{
				html+="&nbsp;&nbsp;上证中小:<span style='color: red;'>"+szAndshs[2].zjcj+"</span>&nbsp;&nbsp;&nbsp;<span style='color: red;'>"+shZxzd+"</span>&nbsp;&nbsp;&nbsp;<span style='color: red;'>"+shZxUpDownPercent.toFixed(2)+"%</span>&nbsp;&nbsp;&nbsp;<span style='color: red;'>"+shZxcjje+"</span>亿"
			}
		}
		
		
		$("#szAndsh").html(html);
		if(bbb==2){
			bbb=0;
		}else{
			bbb++;	
		}
	});
}

setInterval("updateSzAndSh()",3000);
</script>
<SCRIPT type=text/javascript>
								//显示/隐藏客户留言信息
								function displayAll(){
									var Comment=document.getElementById("CommentAll");
									var Comment5=document.getElementById("Comment5");
									if(Comment.style.display=="none"){
										Comment.style.display="block";
										Comment5.style.display="none";
									}else{
										Comment.style.display="none";
										Comment5.style.display="block";
									}
								}
								function displayN(){
									var Comment=document.getElementById("CommentAll");
									var Comment5=document.getElementById("Comment5");
									
										Comment5.style.display="block";
										Comment.style.display="none";
									
								}
								</SCRIPT>	
</body>
</html>
