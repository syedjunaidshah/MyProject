<html>

<head>
	<link rel="stylesheet" href="styles.css" type="text/css" />
	<%@ page language = "java" import = "java.sql.*, java.util.*" %>
	<title> Home </title>

	<style>
		table, th, td {
			border: 1px solid white;
			border-collapse: collapse;}
		</style>

	</head>

	<body>

		<body bgcolor = "#8A2BE2" >
			<img src = "web.jpg"  height="200" width="100%">

			<div id="tabs">
				<ul>
					<li><a rel="nofollow" href = "logout.jsp" title="explodingboy"><span>Log Out</span></a></li>
					<li><a href="contact us.html"><span>Contact Us</span></a></li>
					<li><a href="form.html"><span>Create Ad</span></a></li>
					<li><a href="url.html"><span>Message</span></a></li>
					<li><a href="url.html"><span>Profile</span></a></li>
					<li><a href="home.jsp"><span>Home</span></a></li>
					<li><a href="about us.html"><span>About Us</span></a></li>
				</ul>
			</div>
			<%
			String description = "";
			ResultSet rs = null;
				try{
					Class.forName("com.mysql.jdbc.Driver");
					String url = "jdbc:mysql://127.0.0.1/nikah";
			    	Connection con=DriverManager.getConnection(url,"root","root");
			    	Statement st=con.createStatement();

					String sql1 = "select description from ad limit 2,4";
					
					rs = st.executeQuery(sql1);
					
				}catch(Exception ex){
					out.println(ex);
				}
			%>
			<table width = "900" align = "center" border = '3' bordercolor = "white" Vspace = "50">
			<%
				for(int i=2 ; i < 4 ; i++)
				{
					try{
						if(rs.next()){
							description = rs.getString("description");
						}
						else{
							break;
						}
					}
					catch(Exception ex1){
						out.println(ex1);
					}
					String imageName = (i+1)+".jpg";
			%>
				<tr>
					<td>
						<a href = "url.html">
							<img src="<% out.println(imageName); %>" Vspace = "30" Hspace ="30" height="150" width="150">
						</a>
					</td>
					<td>
						<h3>
							<a href = "url.html" style = 'color : white ; text-decoration : none' > 
								<% out.println(description); %>
							</a>
						</h3>
					</td>
				</tr>
			<% } %>

							</table>

							<table width = "100" align = "center" border = '3' cellspacing = "10"  bordercolor = "white" Vspace = "50">
								<tr>
									<td align = "center">
										<a href = "home.jsp" style = 'color : white ; text-decoration : none' Vspace = "30" > 1 
										</a> 
									</td>
									<td align = "center">
										<a href = "home2.jsp" style = 'color : white ; text-decoration : none' Vspace = "30" > 2 
										</a> 
									</td>
									<td align = "center">
										<a href = "url.html" style = 'color : white ; text-decoration : none' Vspace = "30" > 
											3 
										</a> 
									</td>
								</tr>
							</table>


						</body>
						</html>