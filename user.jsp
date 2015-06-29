<html>
<head>
<title>Information</title>
</head>
<%@ page language = "java" import="java.sql.*, javax.swing.*" %>
<body>
<%

String n = request.getParameter("uname");

    Class.forName("com.mysql.jdbc.Driver");
   	
	String url = "jdbc:mysql://127.0.0.1/nikah";
   	Connection con=DriverManager.getConnection(url, "root", "root");

	Statement stmt = con.createStatement();
	String query = "select u_name from signup where u_name='" +n+ "' ";
	String query1 = "select email from signup where u_name='" +n+ "' ";
	ResultSet rs=stmt.executeQuery(query);


		if(!rs.next())   //check the user-name
		{
			rs.close();
			rs = null;
			rs = stmt.executeQuery(query1);

			if(!rs.next())  //check the email
			{
				out.println("Name is available. You may proceed.....");}

			else{
				out.println("Name already Exist. Please choose another");}
	
		}
		else{
		out.println("Name already Exist. Please choose another");}

	
stmt.close();
con.close();
%>

</body>
</html>