<%@ page contentType="image/jpeg"%>
<jsp:directive.page import="java.util.Date"/>
<jsp:directive.page import="java.util.Random"/>
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/>
<jsp:directive.page import="java.awt.image.BufferedImage"/>
<jsp:directive.page import="java.awt.Graphics2D"/>
<jsp:directive.page import="java.awt.Color"/>
<jsp:directive.page import="com.sun.image.codec.jpeg.JPEGImageEncoder"/>
<jsp:directive.page import="com.sun.image.codec.jpeg.JPEGCodec"/>
<jsp:directive.page import="com.sun.image.codec.jpeg.JPEGEncodeParam"/>
<jsp:directive.page import="java.awt.Font"/>
<%!
	Color getRandColor(int fc,int bc){
        Random random = new Random();
        if(fc>255) fc=255;
        if(bc>255) bc=255;
        int r=fc+random.nextInt(bc-fc);
        int g=fc+random.nextInt(bc-fc);
        int b=fc+random.nextInt(bc-fc);
        return new Color(r,g,b);
    }
%>
<%
	response.reset();
	response.setHeader("Pragma","No-cache");
	response.setHeader("Cache-Control","no-cache");
	response.setDateHeader("Expires", 0);

	int length = 4;
	Random random = new Random(new Date().getTime());
	String reqLen=request.getParameter("length");
	if (!StringUtils.isEmpty(reqLen) && StringUtils.isNumeric(reqLen)) {
		try {
			length = Integer.parseInt(reqLen);
		}catch (NumberFormatException e) {
			length = 4;
		}
	}
	int width=70, height=25;
	BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
	Graphics2D g = image.createGraphics();
	g.setColor(getRandColor(230,245));
	g.fillRect(0, 0, width, height);
	g.setFont(new Font("Times New Roman",Font.PLAIN,24));
	g.setColor(getRandColor(150,200));
	for (int i=0;i<80;i++) {
        int x = random.nextInt(width);
        int y = random.nextInt(height);
        int xl = random.nextInt(5);
        int yl = random.nextInt(5);
        g.drawLine(x,y,x+xl,y+yl);
	}
	StringBuffer sb = new StringBuffer();
	String[] ss= {"0","1","2","3","4","5","6","7","8","9"};
	for (int i = 0; i < length; i++) {
		String rand=ss[random.nextInt(ss.length)];
		sb.append(rand);
		g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));
    	g.drawString(rand,16*i+5,21);
	}
	
	request.getSession().setAttribute("jcaptcha",sb.toString()); 
	
	
	JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(response.getOutputStream());
	JPEGEncodeParam param = encoder.getDefaultJPEGEncodeParam(image);
	param.setQuality(1.0f, false);
	encoder.setJPEGEncodeParam(param);
	encoder.encode(image);
	
	response.flushBuffer();
	if(getServletConfig().getServletContext().getServerInfo().indexOf("Apache Tomcat")>=0)
	{
		out.clear();
		out = pageContext.pushBody();
	}
%> 