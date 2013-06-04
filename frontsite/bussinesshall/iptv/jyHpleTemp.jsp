<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"   %>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page	import="com.cssweb.video.pojo.TvideoUserExptime"%>
<%@page	import="com.cssweb.video.pojo.TvideoUserStatTraffic"%>
<%@page	import="com.cssweb.video.service.TvideoUserExptimeService"%>
<%@page	import="com.cssweb.common.sequence.service.SequenceService"%>
<jsp:directive.page import="java.text.DateFormat"/>
<%@page	import="com.cssweb.video.service.TvideoUserStatTrafficService"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.common.util.MD5"%>
<%@page import="java.text.SimpleDateFormat"%>
<% 

           String md5time="";
           boolean flag=false;
           if(request.getParameter("tsetup")!=null&&!request.getParameter("tsetup").equals(""))
				md5time=request.getParameter("tsetup").trim();
			
				
           String gmy="dgfZQm2X86d03XOJU6G4h";//	根密钥，一般为足够长度的字符串 定义好的
			String md5="";
			if(request.getParameter("md5")!=null&&!request.getParameter("md5").equals(""))
				md5=request.getParameter("md5").trim();
			//System.out.println("      md5============request.getParameter========================      "+md5);
			//我们根据约定生成出md5 跟接受到的md5比较  做验证<根密钥> + <客户号>+<时间>
			if(!md5time.equals("")&&md5!=null&&!md5.equals("")&&(MD5.encrypt(md5time).toUpperCase()).indexOf(md5.toUpperCase())>=0)
			{
			 
			 
			 //判断是否是在 5分钟之内
			 DateFormat dfs = new SimpleDateFormat("yyyyMMddHHmm");
		     long newtime=Long.parseLong(dfs.format(new Date()));
		     long newmd5time=0l;
		     try{
		      newmd5time=Long.parseLong(md5time);
		     }catch(Exception e){
		      
		     }
		     if(newtime-newmd5time<6)
		     flag=true;
			}
			String mkb=gmy;
			if(md5!=null&&!md5.equals("")&&(MD5.encrypt(mkb).toUpperCase()).indexOf(md5.toUpperCase())>=0)
			{
			ServletContext st = this.getServletConfig().getServletContext();
		   ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
		   TvideoUserStatTrafficService tvideoUserStatTrafficService = (TvideoUserStatTrafficService)ctx.getBean("tvideoUserStatTrafficService"); 
			SequenceService sequenceService = (SequenceService)ctx.getBean("sequenceService");
		
				//判断得到交易用户 查看视频统计开始
			TvideoUserStatTraffic tvideoUserStatTraffic=new TvideoUserStatTraffic();
				tvideoUserStatTraffic.setUserType("1");
				tvideoUserStatTraffic.setStatDate(new Date());
				tvideoUserStatTraffic.setCount(1l);
				tvideoUserStatTraffic.setVideoType("3");
				List list=tvideoUserStatTrafficService.getStatTrafficByUserType(tvideoUserStatTraffic.getUserType(),new Date(),"3" );
				if(list!=null&&list.size()>0){
				 tvideoUserStatTrafficService.upTvideoUserStatTraffic(tvideoUserStatTraffic);
				}else{
				tvideoUserStatTraffic.setId(sequenceService.getNextId("com.cssweb.video.pojo.TvideoUserStatTraffic"));
				tvideoUserStatTrafficService.addTvideoUserStatTraffic(tvideoUserStatTraffic);
				}
			}else{
			 out.println(" 统计参数有误！");
			}
	   
%>