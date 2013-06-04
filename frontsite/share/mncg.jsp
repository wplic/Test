<%@page import="com.cssweb.client.pojo.TsystemWebuser"%>
<%@page import="com.cssweb.util.ThreeDes"%><%request.setCharacterEncoding ("UTF-8") ;%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="com.css.encrypt.Base64"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.citics.util.DiscuzPassport"%>
<%@ include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="com.css.system.Configuration" />
<%String mncgurl = Configuration.getProperty("mncg.url");%>
<!-- 
页面功能：进入模拟炒股的入口
 -->
<%
	String userId = null;
	String userName = null;
	String userType = "1";
	String url = null;
	String realName = null;
	String phone = null;
	String sex = null;
	String email = null;
	String fundCode = null;
	

//取值
	try{
		TsystemWebuser tsystemWebuser=null;
		if(request.getSession().getAttribute("tsystemWebuser")!=null)
		tsystemWebuser=(TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
		if(tsystemWebuser!=null) {
			userId = tsystemWebuser.getId()+"";
			userName = tsystemWebuser.getServiceName();
			
			if(userName==null||userName.equals("")){
				userName=tsystemWebuser.getUserName();
			}
			if(tsystemWebuser.getUserType()!=null){
				userType=tsystemWebuser.getUserType();
			}
			realName=tsystemWebuser.getRealName();
			phone = tsystemWebuser.getMobile();
			sex = tsystemWebuser.getSex();
			fundCode = tsystemWebuser.getUserName();
			if("1".equals(sex)){
				sex="0";
			}else{
				sex="1";
			}
			email = tsystemWebuser.getEmail();
			
			
		}
//验证
		if(userId == null || "".equals(userId)){
		%>
			<script language="javascript">
				alert("请先登录再访问");
				window.location.href='${ctx}/share/login.jsp?url=/share/mncg.jsp';
		    </script>
			<%
			return;
		}
//加密 fundCode

		String key = Configuration.getProperty("mncg.key");//"pk%mncg@htsc#cssweb";
		String loginmncgStr = "userId="+userId+"&userName="+userName+"&userType="+userType
		+"&realName="+realName
		+"&phone="+phone
		+"&sex="+sex
		+"&email="+email
		+"&fundCode="+fundCode;
		//String loginmncg = URLEncoder.encode(DiscuzPassport.encrypt(loginmncgStr, key), "utf-8");
		String loginmncg = new String(Base64.encode(loginmncgStr.getBytes("utf-8"))); 
		loginmncg = ThreeDes.spDowith(loginmncg);
		String tmpStr = mncgurl+"/login/savSession.jsp?loginmncg="+loginmncg;
		response.sendRedirect(tmpStr);
	}catch(Exception e) {
	%>
	<script language="javascript">
		alert("请先登录再访问");
		window.location.href='${ctx}/share/login.jsp?url=/share/mncg.jsp';
    </script>
	<% 
		return;
	}
%>
