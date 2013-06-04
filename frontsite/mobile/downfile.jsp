<%@ page language="java" contentType="application/x-msdownload; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@ include file="/commons/taglibs.jsp"%>
<%
     
    String fileName=request.getParameter("fileName");
    //String fileName = "http://www.gf.com.cn/pic/wsyyt/600344/kds_s603_3.0.5_20100115.sisx";
    String[] fileNames = fileName.split("/");
    //File file = new File(fileName);
	URL url = new URL(fileName);
	//System.out.println("-------name--------------------------------------------------"+fileNames[fileNames.length-1]);
	//System.out.println("-------length----------"+file.length());

    // 设置ＨＴＴＰ头：
    response.reset();
    response.setContentType("application/force-download; charset=UTF-8");
    //response.setHeader("Content-disposition","attachment; filename="+URLEncoder.encode(file.getName(), "UTF-8")); 
    response.setHeader("Content-disposition","attachment; filename="+URLEncoder.encode(fileNames[fileNames.length-1], "UTF-8")); 
    //response.setContentLength((int)file.length());

    byte[] buffer = new byte[1024];
    BufferedOutputStream output = null;
    BufferedInputStream input = null;
	//System.out.println("-------start----------");

    // 写缓冲区：
    try
    {
		//System.out.println("-------try-------1---");
        output = new BufferedOutputStream(response.getOutputStream());
		//System.out.println("-------try-------2---");
        //System.out.println("---------------------"+file.getPath());
        //input = new BufferedInputStream(new FileInputStream(file.getPath()));
		//System.out.println("-------try-------3---");
        input = new BufferedInputStream(url.openStream());
		//int i=0;
        int n = input.read(buffer, 0, 1024);
		//System.out.println("-------n----------"+n);
        while(n!=-1)
        {
			//System.out.println("-------i----------"+(i++));
            output.write(buffer, 0, n);
            n = input.read(buffer, 0, 1024);
        }
        response.flushBuffer();
    }
    catch(Exception e) {
		//System.out.println("-------exception----------");
		e.printStackTrace();
    } // maybe user cancelled download
    finally
    {
		//System.out.println("-------finally----------");
        if(input!=null) input.close();
        if(output!=null) output.close();
    }
	//System.out.println("-------end----------");
%>
