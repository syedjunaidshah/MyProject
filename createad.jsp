<html>
<head>
	<title>Create Ad.jsp</title>
<%@ page language = "java" import = "java.sql.*, java.util.*" %>
</head>

<body>


<%!
public int saveToDataBase() throws Exception
	{

		Statement st = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1/nikah";
   			con=DriverManager.getConnection(url,"root","root");	
   			st=con.createStatement();	
   			PreparedStatement ps = null;
		}
		catch(Exception ex1){
			out.println(ex1);
		}		

		
		String f_name = request.getParameter("firstname");
		String l_name = request.getParameter("lastname");
		String edu = request.getParameter("education");
		String  loc = request.getParameter("location");		
		String desc = request.getParameter("description");
		String look = request.getParameter("looking_for");
		String pedu = request.getParameter("peducation" );
		String email = request.getParameter("email" );
		String ph = request.getParameter("phone" );
		String height = request.getParameter("height");
		String eye = request.getParameter("eye_c");
		String sect = request.getParameter("sect");
		String cast = request.getParameter("cast");
		String dob = request.getParameter("dob");
		String user = request.getParameter("user");
		
		
		
		try{
				//String query = "INSERT into signup (fname  ,  lname , email , u_name , l_password  , c_password , dob , sex) VALUES ('"+f_name +"','" + "','"+l_name +"','" + "','"+email+"','"+"','"+user+"','" + "','"+password+"','"+"','"+cpassword+"','" + "','"+dob+"','" + "', '"+sex+"')";
				
				//st.executeUpdate(query);

				String query = "insert into ad (fname  ,  lname , education , location , description  , looking , peducation , email , phone , height , eyec , sect , cast, dob , user) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				ps=con.prepareStatement(query);
				
				
				ps.setString(1,f_name);
				ps.setString(2,l_name);
				ps.setString(3,edu);
				ps.setString(4,loc);
				ps.setString(5,desc);
				ps.setString(6,look);
				ps.setString(7,pedu);
				ps.setString(8,email);
				ps.setString(9,ph);
				ps.setString(10,height);
				ps.setString(11,eye);
				ps.setString(12,sect);
				ps.setString(13,cast);
				ps.setString(14,dob);
				ps.setString(15,user);
				int i = ps.executeUpdate();

				
				out.println("Sign Up Successful...:D :D :D :D");
			con.close();
		}
		catch(Exception ex){
  		    out.println(ex);
		}
		
		out.close();
	}

!%>

<%
<%
		
		out.println("Ad Created");
	
%>
</body>
</html>