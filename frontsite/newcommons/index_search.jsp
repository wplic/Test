<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
	<div class="subMod subMod-pbdSearch mb10">
	<%
		//获得当前日期
		Date now=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String nowStr=sdf.format(now);
		
		//通过万年历获取6个月前的日期
		Calendar cal=Calendar.getInstance();
		cal.setTime(now);
		cal.add(cal.MONTH,-6);
		now=cal.getTime();
		String oldTimeStr=sdf.format(now);
	%>
							<form class="search" action="/infoCenter/QueryNewsList.jsp" method="get">
								<input type="text" name="title" value="请输入关键字"  class="txt" maxlength="8" />
								<input type="hidden" name="StartDate" value="<%=oldTimeStr %>"/>
								<input type="hidden" name="EndDate" value="<%=nowStr %>"/>
								<input type="hidden" name="whichCat" value="zxzx|zqyj|tzzyd">
								<input type="submit" value="搜索" class="btn" />
							</form>	
						</div>