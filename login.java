import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;

public class login extends HttpServlet{

	public void doPost(HttpServletRequest req, HttpServletResponse rep) throws IOException, ServletException
	{
		PrintWriter out = rep.getWriter();

		String user = req.getParameter("uname");
		String password = req.getParameter("lpassword");
		
		System.out.println(user + password);
		
		try{
			String output = this.checkToDataBase(user , password);
			System.out.println(output);
			out.println(output);
			req.getSession().setAttribute("username", user);
			rep.sendRedirect("home.jsp");
		}
		catch(Exception ex){
  		    out.println(ex.getMessage());
		}
		
		out.close();
	}

	public String checkToDataBase(String u_name , String password1) throws Exception
	{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://127.0.0.1/nikah";
    	Connection con=DriverManager.getConnection(url,"root","root");
    	Statement st=con.createStatement();

		String selectSQL = "select u_name, l_password from signup where u_name = '"+u_name+"' ";
		
		//PreparedStatement preparedStatement = con.prepareStatement(selectSQL);
		//preparedStatement.setString(1, u_name);
		ResultSet rs = st.executeQuery(selectSQL);
		if(rs.next())
		{
			String pwd = rs.getString("l_password");
			rs.close();
			if(password1.equals(pwd))
			{
				return "Welcome";
			}
			else
				return "Wrong password";
		}
		else
			return "user not found";
	}
}