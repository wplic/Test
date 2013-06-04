<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"   %>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page	import="com.cssweb.video.pojo.TvideoUserExptime"%>
<%@page	import="com.cssweb.video.pojo.TvideoUserStatTraffic"%>
<%@page	import="com.cssweb.video.service.TvideoUserExptimeService"%>
<%@page	import="com.cssweb.common.sequence.service.SequenceService"%>
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<%@page	import="com.cssweb.video.service.TvideoUserStatTrafficService"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<% 
	    TsystemWebuser tsystemWebuser=null;
		if(request.getSession().getAttribute("tsystemWebuser")!=null)
		tsystemWebuser=(TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
		if(tsystemWebuser!=null) {
		   ServletContext st = this.getServletConfig().getServletContext();
		   ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
		   TvideoUserStatTrafficService tvideoUserStatTrafficService = (TvideoUserStatTrafficService)ctx.getBean("tvideoUserStatTrafficService"); 
			SequenceService sequenceService = (SequenceService)ctx.getBean("sequenceService");
			    if(tsystemWebuser.getUserType().equals("2")){
				TvideoUserExptimeService tvideoUserExptimeService = (TvideoUserExptimeService)ctx.getBean("tvideoUserExptimeService");
				if(tvideoUserExptimeService.getTvideoUserExptimeByUserId(tsystemWebuser.getId()))
				{
				  int userVideoTime=0; 
				  //为true 的时候 说明能有这个用户的信息 说明这个用户已经查看过视频信息
				  userVideoTime=tvideoUserExptimeService.getUserExptimeCount(tsystemWebuser.getId());
					  if(userVideoTime<=10)
					  {
					  
						//判断得到体验用户 查看视频统计开始  体验用户要没过期的时候才能统计
						TvideoUserStatTraffic tvideoUserStatTraffic=new TvideoUserStatTraffic();
						tvideoUserStatTraffic.setUserType("2");
						tvideoUserStatTraffic.setStatDate(new Date());
						tvideoUserStatTraffic.setCount(1l);
						tvideoUserStatTraffic.setVideoType("1");
						List list=tvideoUserStatTrafficService.getStatTrafficByUserType(tsystemWebuser.getUserType(),new Date(),"1" );
						//System.out.println("0--------------------"+list);
						if(list!=null&&list.size()>0){
						//System.out.println("tvideoUserStatTraffic--------------------"+tvideoUserStatTraffic);
						 tvideoUserStatTrafficService.upTvideoUserStatTraffic(tvideoUserStatTraffic);
						// System.out.println("wan--------------------"+tvideoUserStatTraffic);
						}else{
						tvideoUserStatTraffic.setId(sequenceService.getNextId("com.cssweb.video.pojo.TvideoUserStatTraffic"));
						tvideoUserStatTrafficService.addTvideoUserStatTraffic(tvideoUserStatTraffic);
						}
				
					   %>
					     <SCRIPT LANGUAGE="JavaScript">
							var ah = 280;
							var aw = 500;
							window.open('${contextPath }/bussinesshall/iptv/tyHple.jsp?userVideoTime=<%=10-userVideoTime%>', 'newwindow', 'height='+ah +', width='+aw+', top=100, left=260, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
						</SCRIPT>
					   <%
					  }else{
					  %>
					     <SCRIPT LANGUAGE="JavaScript">
						   alert(" 请成为广发正式客户可继续收看节目!");
						   window.opener=null;
						   window.open('','_self');
						   window.close() ;
						 </SCRIPT>
					  <%
					  }
				}else{
				 TvideoUserExptime tvideoUserExptime=new TvideoUserExptime();
				 //为false 的时候 说明能没有这个用户的信息 这个用户第一次查看过视频信息 添加该记录到数据库 为他统计
				 tvideoUserExptime.setUserId(tsystemWebuser.getId());
				 tvideoUserExptime.setBeginTime(new Date());
				 tvideoUserExptimeService.addTvideoUserExptime(tvideoUserExptime);
				 %>
					     <SCRIPT LANGUAGE="JavaScript">
							var ah = 280;
							var aw = 500;
							window.open('${contextPath }/bussinesshall/iptv/tyHple.jsp?userVideoTime=<%=10%>', 'newwindow', 'height='+ah +', width='+aw+', top=100, left=260, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
						</SCRIPT>
				<%
				
				//判断得到体验用户 查看视频统计开始  体验用户要没过期的时候才能统计
						TvideoUserStatTraffic tvideoUserStatTraffic=new TvideoUserStatTraffic();
						tvideoUserStatTraffic.setUserType("2");
						tvideoUserStatTraffic.setStatDate(new Date());
						tvideoUserStatTraffic.setCount(1l);
						tvideoUserStatTraffic.setVideoType("1");
						List list=tvideoUserStatTrafficService.getStatTrafficByUserType(tsystemWebuser.getUserType(),new Date(),"1" );
						//System.out.println("0--------------------"+list);
						if(list!=null&&list.size()>0){
						//System.out.println("tvideoUserStatTraffic--------------------"+tvideoUserStatTraffic);
						 tvideoUserStatTrafficService.upTvideoUserStatTraffic(tvideoUserStatTraffic);
						// System.out.println("wan--------------------"+tvideoUserStatTraffic);
						}else{
						tvideoUserStatTraffic.setId(sequenceService.getNextId("com.cssweb.video.pojo.TvideoUserStatTraffic"));
						tvideoUserStatTrafficService.addTvideoUserStatTraffic(tvideoUserStatTraffic);
						}
				}
			}else{
			//判断得到交易用户 查看视频统计开始
			TvideoUserStatTraffic tvideoUserStatTraffic=new TvideoUserStatTraffic();
				tvideoUserStatTraffic.setUserType("1");
				tvideoUserStatTraffic.setStatDate(new Date());
				tvideoUserStatTraffic.setCount(1l);
				tvideoUserStatTraffic.setVideoType("1");
				List list=tvideoUserStatTrafficService.getStatTrafficByUserType(tsystemWebuser.getUserType(),new Date(),"1" );
				if(list!=null&&list.size()>0){
				 tvideoUserStatTrafficService.upTvideoUserStatTraffic(tvideoUserStatTraffic);
				}else{
				tvideoUserStatTraffic.setId(sequenceService.getNextId("com.cssweb.video.pojo.TvideoUserStatTraffic"));
				tvideoUserStatTrafficService.addTvideoUserStatTraffic(tvideoUserStatTraffic);
				}
			}
	}
%>