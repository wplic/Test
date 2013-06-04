<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:directive.page import="com.css.system.Configuration" />
<jsp:directive.page import="java.text.DateFormat" />
<jsp:directive.page import="java.text.SimpleDateFormat" />
<jsp:directive.page import="java.util.Calendar" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
</head>
<% 
String yykf= Configuration.getProperty("yykf");
String userVideoTime="10";
if(request.getParameter("userVideoTime")!=null&&!request.getParameter("userVideoTime").equals("")&&!request.getParameter("userVideoTime").equals("null"))
    userVideoTime=request.getParameter("userVideoTime");
%>
<body>
<div class="main">
  <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">
  广发证券网站体验用户</div>
  <div style="padding:12px 12px 12px 24px;line-height:20px;font-size:12px; ">
  <strong>
    尊敬的广发证券网站体验用户，很抱歉地通知您，您的体验天数只剩下<%=userVideoTime %>天，到期时间为<%
      if(userVideoTime!=null&&!userVideoTime.equals("") ){
      DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	  Calendar c = Calendar.getInstance();
	  c.setTimeInMillis(System.currentTimeMillis());
	  //System.out.println(df.format(c.getTime()));
	  c.add(Calendar.DATE, Integer.valueOf(userVideoTime));
	  out.print(df.format(c.getTime()));
	   }
    %>，为了不影响您的正常使用，建议您成为广发证券的正式客户，永久免费享受我们为您提供的专属尊贵服务！ 
   <br/>尊敬的客户您好，广发证券财富频道已经升级，如果您看不到视频节目，请下载安装广发财富频道视频插件——为您提供更加稳定的，基于p2p技术的视频流，欢迎下载使用。
	 <br/><a href='${ctx}/front/softInfo.do?method=getSoftListByCategoryId&tabtagsId=4&category_id=400' >
  <font class="bold" style="color:#2c5ea3;cursor:hand;">
 <p>  下载地址&gt;&gt;</font></a>
	 <br/>安装说明：请下载该插件，安装前用winrar解压缩，然后运行解压缩包中的gftv_setup.exe，可安装于电脑任何位置，安装完毕后即可观看广发财富频道直播节目。
	 <br/>winrar下载地址： <a href='http://winrar.softonic.cn/' > http://winrar.softonic.cn/</a>
   </strong>
  <p>
  <strong>
   <a href="#" onclick="javascript:window.open('<%=yykf %>');">
      我要开户</a>
  </strong>
  </p>
    
  </div>
    <div class="blank10"></div>

</div>
</body>

</html>