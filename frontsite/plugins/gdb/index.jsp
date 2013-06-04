<%request.setCharacterEncoding ("UTF-8") ;%><%@page import = 
	"com.css.system.* , com.css.util.* , java.util.*, java.util.zip.* , com.css.lopt.*, com.css.sql.*, java.sql.*, java.io.*, java.net.*"  %><%

    final int OK = 0;

    final int SQL_EXCEPTION = -1;

    final int IO_EXCEPTION = -2;

    final int OTHER_EXCEPTION = -3;
    
	OutputStream os = response.getOutputStream () ;
	InputStream in = request.getInputStream () ;
    String mode = request.getParameter("mode");

	try
	{
		Message msg = Message.unpack (in) ;
		in.close () ;
		try
		{
            String gdbName = (String) msg.get(0);
            ParamSql paramSql = (ParamSql) msg.get(1);
            Hashtable params = (Hashtable) msg.get(2);
            int index = ((Integer) msg.get(3)).intValue();
            int count = ((Integer) msg.get(4)).intValue();
            
            GeneralDB gdb = GeneralDBFactory.getGeneralDB(gdbName);
            SqlResult result = gdb.accessDatabase(paramSql, params, index, count);

			msg.clear () ;
			msg.add (OK) ;
			msg.add (result) ;

	 	} 
        catch (FuncSqlException _funce)
	 	{
            _funce.printStackTrace();
	 		msg = new Message () ;
			msg.setEncoding ("GBK") ;
	 		msg.add (OTHER_EXCEPTION) ;
	 		msg.add ("[" + _funce.getClass ().getName () + "] " + _funce.getMessage ()) ;
	 	}
	 	catch (SQLException _sqle)
	 	{
            _sqle.printStackTrace();
	 		msg = new Message () ;
			msg.setEncoding ("GBK") ;
	 		msg.add (SQL_EXCEPTION) ;
	 		msg.add ("[" + _sqle.getClass ().getName () + "] " + _sqle.getMessage ()) ;
	 	}
	 	catch (IOException _ioe)
	 	{
            _ioe.printStackTrace();
	 		msg = new Message () ;
			msg.setEncoding ("GBK") ;
	 		msg.add (IO_EXCEPTION) ;
	 		msg.add ("[" + _ioe.getClass ().getName () + "] " + _ioe.getMessage ()) ;
	 	}
	 	
        if ("httpzip".equalsIgnoreCase(mode))
        {
            os = new GZIPOutputStream(os);
        }

	 	os.write (msg.pack ()) ;
	 	
	 	os.flush () ;
	}
	catch (Throwable _t)
	{
        _t.printStackTrace();
	}
	 	
	os.close () ;
%>