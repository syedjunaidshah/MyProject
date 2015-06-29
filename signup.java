import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;

public class signup extends HttpServlet{
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
		String email = req.getParameter("email");
		String user = req.getParameter("uname");		
		String password = req.getParameter("lpassword");
		String cpassword = req.getParameter("cpassword");
		//String year = req.getParameter("year" );
		//String month = req.getParameter("month" );
		//String day = req.getParameter("day" );
		String dob = req.getParameter("year")+"/"+req.getParameter("month")+"/"+req.getParameter("day");
		String sex = req.getParameter("sex");
		
		
		
		try{
			int c = this.checkToDataBase(user , email);
			
			if(c == 0)
				out.print("username already in use\n");
			else if(c == 1)
				out.print("email already registered\n");
			else if (c == 2)
			{
				//String query = "INSERT into signup (fname  ,  lname , email , u_name , l_password  , c_password , dob , sex) VALUES ('"+f_name +"','" + "','"+l_name +"','" + "','"+email+"','"+"','"+user+"','" + "','"+password+"','"+"','"+cpassword+"','" + "','"+dob+"','" + "', '"+sex+"')";
				
				//st.executeUpdate(query);

				String query = "INSERT into signup (fname  ,  lname , email , u_name , l_password  , c_password , dob , sex) VALUES (?,?,?,?,?,?,?,?)";
				ps=con.prepareStatement(query);
				
				
				ps.setString(1,f_name);
				ps.setString(2,l_name);
				ps.setString(3,email);
				ps.setString(4,user);
				ps.setString(5,password);
				ps.setString(6,cpassword);
				ps.setString(7,dob);
				ps.setString(8,sex);

				int i = ps.executeUpdate();

				
				out.println("Sign Up Successful...:D :D :D :D");
			}
			con.close();
		}
		catch(Exception ex){
  		    out.println(ex);
		}
		
		out.close();
	}

	public int checkToDataBase(String user_name , String email) throws Exception
	{
		//out.println("query");
		String selectSQL = "select u_name from signup where u_name='"+user_name+"'";
		String selectSQL1 = "select email from signup where email='"+email+"'";
		Statement st1=con.createStatement();
		ResultSet rs = st1.executeQuery(selectSQL);

		if(!rs.next())   //check the user-name
		{
			rs.close();
			rs = null;
			rs = st1.executeQuery(selectSQL1);

			if(!rs.next())  //check the email
			{
				return 2;
			}
			else{
				return 1;
			}
		}
		return 0;
	}
}