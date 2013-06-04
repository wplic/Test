<%@page import="com.cssweb.client.pojo.CrmWebuser"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.cssweb.client.service.CrmWebuserService"%>
<%@page import="com.css.system.Configuration"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.citics.util.AES"%>
<%@page import="com.citics.util.Base64"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwcpcx"%>
<%@page import="com.cssweb.subscribe.service.TcsswebFwcpcxService"%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.common.sequence.service.SequenceService"%>
<%@page import="com.cssweb.client.service.TsystemWebuserService"%>
<%@page
	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.cssweb.client.pojo.TsystemWebuser"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	//set no cache
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<%!String decodeZjzh(String zjzh) {
		StringBuffer stb = new StringBuffer();
		stb.append(zjzh.subSequence(0, 4));
		stb.append(zjzh.subSequence(6, 10));
		stb.append(zjzh.subSequence(12, 16));
		return stb.reverse().toString();
	}

	String decodeCiphertext(String ciphertext) {
		
		String aesKey = Configuration.getProperty("clientApp.key");
		System.out.println("aesKey = "+aesKey);
		String str = "";
		try {
			ciphertext = ciphertext.replace("*", "+");
			System.out.println("ciphertext = "+ciphertext);
			byte[] msgby = Base64.decode(ciphertext.toCharArray());
			System.out.println("11");
			System.out.println(new String(msgby));
			//byte[] keyby = aesKey.getBytes();
			System.out.println("22");
			//byte[] debyt = AES.decrypt(msgby, keyby);
			str = AES.decrypt(new String(msgby), aesKey);
			System.out.println("33");
			System.out.println(str);
			//str = new String(debyt);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return str;
	}

	String checkInfo(String info) {
		String str = info;
		str = decodeCiphertext(info);
		System.out.println("str = "+str);
		if("error".equals(str)){
			return "error";
		}
		//str = "001001234001234005678009abc0000201100040010001001234005678009abc00037100";
		if (str == null || str.length() < 27) {
			return "error";
		}
		String loginFlag = str.substring(2, 3);//是否登录
		if (!"1".equals(loginFlag)) {
			return "error";
		}
		System.out.println("是否登录 = " + loginFlag);

		String yyb = str.substring(5, 9);//营业部
		System.out.println("营业部 = " + yyb);

		String zjzh = str.substring(11, 27);//资金账号
		if (zjzh.length() != 16) {
			System.out.println("资金账号数据长度不足16");
			return "error";
		}
		System.out.println("资金账号= " + zjzh);
		zjzh = decodeZjzh(zjzh);
		System.out.println("资金账号(解密后)= " + zjzh);

		str = str.substring(29);
		String level = str.substring(str.length() - 3, str.length() - 2);//用户等级
		System.out.println("用户等级= " + level);
		String lpLeght = str.substring(str.length() - 6, str.length() - 3);//令牌长度
		System.out.println("令牌长度= " + lpLeght);
		if (Integer.parseInt(lpLeght) < 35) {
			System.out.print("令牌长度不足35位");
			return "error";
		}
		String lp = str.substring(0, Integer.parseInt(lpLeght));//令牌
		System.out.println("令牌 = " + lp);
		lp = decodeCiphertext(lp);
		if("error".equals(lp)){
			return "error";
		}
		System.out.println("令牌(解密后) = " + lp);
		String year = lp.substring(2, 6);//令牌中的年
		System.out.println("年= " + year);
		String month = lp.substring(8, 10);//令牌中的月
		System.out.println("月= " + month);
		String day = lp.substring(12, 14);//令牌中的天
		System.out.println("天= " + day);
		String hour = lp.substring(16, 18);//令牌中的天
		System.out.println("小时= " + hour);
		String minute = lp.substring(20, 22);//令牌中的天
		System.out.println("分钟= " + minute);
		
		String uuidTimeStr = year+"-"+month+"-"+day+" "+hour+":"+minute;
		
		DateFormat df  = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		try{
			Date uuidTime = df.parse(uuidTimeStr);
			long sc=new Date().getTime()-uuidTime.getTime();
			if(sc<0||sc>60000){
				System.out.println("令牌中日期错误");
				return "error";
			}
		}catch(Exception ex){
			System.out.println("令牌中日期格式错误");
			return "error";
		}

		String lpLevel = lp.substring(24, 25);//令牌中的用户等级
		System.out.println("令牌中的用户等级 = " + lpLevel);
		if (!level.equals(lpLevel)) {
			System.out.println("令牌中的用户等级与密文中的用户等级不一致");
			return "error";
		}
		String LpZjzh = lp.substring(27, 43);//令牌中的资金账号
		if (LpZjzh.length() != 16) {
			System.out.print("令牌中的资金账号不足16位");
			return "error";
		}
		System.out.println("令牌中的资金账号= " + LpZjzh);
		LpZjzh = decodeZjzh(LpZjzh);
		System.out.println("令牌中的资金账号(解密后)= " + LpZjzh);
		if (!zjzh.equals(LpZjzh)) {
			System.out.println("令牌中的资金账号与密文中的资金账号不一致");
			return "error";
		}
		String returnStr = zjzh + "," + level + "," + yyb;
		return returnStr;
	}%>

<%
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils
			.getRequiredWebApplicationContext(st);
	TsystemWebuserService tsystemWebuserService = (TsystemWebuserService) ctx
			.getBean("tsystemWebuserService");
	SequenceService sequenceService = (SequenceService) ctx
			.getBean("sequenceService");
	TcsswebFwcpcxService tcsswebFwcpcxService = (TcsswebFwcpcxService) ctx
			.getBean("tcsswebFwcpcxService");
	CrmWebuserService crmWebuserService = (CrmWebuserService)ctx.getBean("crmWebuserService");

	String info = (String) request.getParameter("info");//加密用户信息
	String from = (String) request.getParameter("clientFrom");//请求来源
	String url_error = request.getContextPath()+"/index.jsp";
	String url_sucse = request.getContextPath()
			+ "/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount"; //请求访问的页面

	//账户检测
	String zjzh = checkInfo(info);
	if ("error".equals(zjzh)) {
		//ERROR
		response.sendRedirect(url_error);
	} else {
		String[] loginStr = zjzh.split(",");
		if (loginStr.length != 3) {
			response.sendRedirect(url_error);
		}
		//根据资金帐号获取客户号。
		int  zjzhInt = Integer.parseInt(loginStr[0]);
		String khbh = crmWebuserService.getKhbhByZjzh(String.valueOf(zjzhInt));
		if (StringUtils.isEmpty(khbh)) {
			//ERROR
			response.sendRedirect(url_error);
			return;
		} 
		//获取用户等级信息
		String level = loginStr[1];
		List zcglWebuserListLev=crmWebuserService.getLevelByClientId(khbh);
		if (zcglWebuserListLev != null && zcglWebuserListLev.size()>0) {
			for (int i=0; i < zcglWebuserListLev.size(); i++) {
				CrmWebuser zcglWebuser = (CrmWebuser)zcglWebuserListLev.get(i);
				if(zcglWebuser!=null){
					if(zcglWebuser.getKhjb()!=null&&!zcglWebuser.getKhjb().equals(""))
					{
						level=zcglWebuser.getKhjb();
						break;
					}
				}
			}
		}
		//获取营业部编码
		String branchCode = loginStr[2];
		//先清空登陆后首页缓存信息
		session.removeAttribute("tsystemWebuser");
		TsystemWebuser tuser = tsystemWebuserService
				.getTsystemWebuserByUserName(khbh);
		if (tuser == null) {
			tuser = tsystemWebuserService.getTsystemWebuserByServiceName(khbh);
			String serviceName = khbh;
			int i = 1;
			while(tuser!=null){
				serviceName=khbh+"_"+i;
				tuser = tsystemWebuserService.getTsystemWebuserByServiceName(serviceName);
				
			}
			
			tuser = new TsystemWebuser();
			long id = sequenceService
					.getNextId("com.cssweb.client.pojo.TsystemWebuser");
			tuser.setId(id);
			tuser.setUserName(khbh);
			tuser.setUserType("1");//设置用户类型  用户类型 1:交易用户 2:体验用户
			tuser.setServiceName(serviceName);
			tuser.setBranchCode(branchCode);
			System.out.println("serviceName = "+serviceName);
			tsystemWebuserService.addTsystemWebuser(tuser);
		}

		//		System.out.println("==============11111=============");

		//		System.out.println("==============2222=============");
		//记录登陆次数 和 登陆时间记录
		tsystemWebuserService.addWebUserlonginCount(tuser.getId());
		//		System.out.println("==============3333=============");
		tuser = tsystemWebuserService.getTsystemWebuserById(tuser
				.getId());
		//System.out.println("==============start setAttribute=============");
		tuser.setLevel(level); //保存用户等级信息
		tuser.setBranchCode(branchCode);//保存用户营业部信息
		request.getSession(false).setAttribute("tsystemWebuser", tuser);

		//删除权限控制
		String packageId = "8";
		List list = null;
		list = tcsswebFwcpcxService.getTcsswebFwcpcxListByAccount(tuser
				.getUserName());
		;
		if (list != null && list.size() > 0) {
			TcsswebFwcpcx tcsswebFwcpcx = (TcsswebFwcpcx) list.get(0);
			packageId = String.valueOf(tcsswebFwcpcx.getProductId());

			request.getSession().removeAttribute("packageId");
			//在权限控制的地方用到
			request.getSession().setAttribute("packageId", packageId);

			System.out
					.println("   oooopackageId======================= "
							+ packageId);
		}

		response.sendRedirect(url_sucse);
	}
%>