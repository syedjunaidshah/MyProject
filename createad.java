




import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;

public class createad extends HttpServlet{
	private Connection con = null;
	private PrintWriter out = null;
	PreparedStatement ps = null;
	public void doPost(HttpServletRequest req, HttpServletResponse rep) throws IOException, ServletException
	{

		Statement st = null;
		out = rep.getWriter();
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

		
		String f_name = req.getParameter("firstname");
		String l_name = req.getParameter("lastname");
		String edu = req.getParameter("education");
		String  loc = req.getParameter("location");		
		String desc = req.getParameter("description");
		String look = req.getParameter("looking_for");
		String pedu = req.getParameter("peducation" );
		String email = req.getParameter("email" );
		String ph = req.getParameter("phone" );
		String height = req.getParameter("height");
		String eye = req.getParameter("eye_c");
		String sect = req.getParameter("sect");
		String cast = req.getParameter("cast");
		String dob = req.getParameter("dob");
		String user = req.getParameter("user");
		
		
		
		try{
				//String query = "INSERT into signup (fname  ,  lname , email , u_name , l_password  , c_password , dob , sex) VALUES ('"+f_name +"','" + "','"+l_name +"','" + "','"+email+"','"+"','"+user+"','" + "','"+password+"','"+"','"+cpassword+"','" + "','"+dob+"','" + "', '"+sex+"')";
				
				//st.executeUpdate(query);

				String query = "INSERT into ad (fname  ,  lname , education , location , description  , looking , peducation , email , phone , height , eyec , sect , cast, dob , user) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
}