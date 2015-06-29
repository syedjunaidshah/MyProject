<html>
<head>
<title>Nikah.jsp</title>
<%@ page language = "java" import = "java.sql.*, java.util.*" %>
</head>
<body>
<%!
	public int checkToDataBase(String u_name , String password1) throws Exception
	{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://127.0.0.1/nikah";
    	Connection con=DriverManager.getConnection(url,"root","root");
    	Statement st=con.createStatement();
		String selectSQL = "select u_name, l_password from signup where u_name='"+u_name+"'";
		ResultSet rs = st.executeQuery(selectSQL);
		if(rs.next())
		{
			String pwd = rs.getString("l_password");
			rs.close();
			if(password1.equals(pwd))
			{
				return 1;
			}
		}
		return 0;
	}
%>

<%
	String user = request.getParameter("uname");
	String password = request.getParameter("lpassword");
	if(session.getAttribute("username") != "" && session.getAttribute("username") != null){
		out.println("<script type='text/javascript'> alert(\"You are already logined...\"); setTimeout(\"document.location.href='home.jsp'\", 2000); </script>");
		return;
	}
	System.out.println(user + password);
	
	try{
		int output = this.checkToDataBase(user , password);
		System.out.println(output);
		if(output == 1){
			session.setAttribute("username", user);
			response.sendRedirect("home.jsp");	
		}
		else if(output == 0)
			out.println("email or password is worng.");
	}
	catch(Exception ex){
		    out.println(ex.getMessage());
	}
%>
</body>
</html>