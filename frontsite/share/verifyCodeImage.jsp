<%@ page contentType="image/jpeg"%>
<jsp:directive.page import="java.util.Date"/>
<jsp:directive.page import="java.util.Random"/>
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/>
<jsp:directive.page import="java.awt.image.BufferedImage"/>
<jsp:directive.page import="java.awt.Graphics2D"/>
<jsp:directive.page import="java.awt.Color"/>
<jsp:directive.page import="java.awt.Font"/>
<jsp:directive.page import="java.awt.BasicStroke"/>
<jsp:directive.page import="java.awt.Transparency"/>
<jsp:directive.page import="javax.imageio.ImageIO"/>
<%
	//Solves on weblogic the response already committed question
	response.reset();

	//set no cache
	response.setHeader("Pragma","No-cache");
	response.setHeader("Cache-Control","no-cache");
	response.setDateHeader("Expires", 0);

	int length = 4;
	Random random = new Random(new Date().getTime());
	//get verify code length
	String reqLen=request.getParameter("length");
	if (!StringUtils.isEmpty(reqLen) && StringUtils.isNumeric(reqLen)) {
		try {
			length = Integer.parseInt(reqLen);
		}catch (NumberFormatException e) {
			System.out.println(e);
			length = 4;
		}
	}
	//get image
	int width=33, height=15;
	BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
	Graphics2D g = image.createGraphics();

	// ---------- 增加下面的代码使得背景透明 -----------------
	image = g.getDeviceConfiguration().createCompatibleImage(width, height, Transparency.TRANSLUCENT);
	g.dispose();
	g = image.createGraphics();
	// ---------- 背景透明代码结束 -----------------

	// 画图
	g.setColor(new Color(255, 0, 0));
	g.setStroke(new BasicStroke(1));
		
	//get verify code
	StringBuffer sb = new StringBuffer();
	String[] ss= {"0","1","2","3","4","5","6","7","8","9"};
	for (int i = 0; i < length; i++) {
		String rand=ss[random.nextInt(ss.length)];
		sb.append(rand);
		//font color and location
		g.setColor(new Color(0,0,0));
    	g.drawString(rand,7*i+3,11);
	}
	
	//set verifyCode to session attribute
	request.getSession().setAttribute("verifyCode",sb.toString());   
	
	//out image
	//if deviant show ,use follow on the heels of code (now annotated)
	ImageIO.write(image, "PNG", response.getOutputStream());
	//complete out
	response.flushBuffer();
	// 由于生成的servlet代码会调用response.writer(),所以要加上这两句
	if(getServletConfig().getServletContext().getServerInfo().indexOf("Apache Tomcat")>=0)
	{
		out.clear();
		out = pageContext.pushBody();
	}
%> 