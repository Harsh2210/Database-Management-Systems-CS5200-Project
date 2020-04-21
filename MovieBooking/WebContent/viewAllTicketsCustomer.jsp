<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<html>
<head>
 <link rel="stylesheet" href="commonBody.css">
 <link rel="stylesheet" href="login.css">
</head>
<body>

	<ul class="Navbar">
	
		<li><a  href="Home.html">HOME</a></li>
		<li><a href="showtimes.jsp">NOW SHOWING</a></li>
		<li><a class="active" href="login.html">LOG IN</a></li>
    	<li><a  href="reviews.jsp">REVIEWS</a></li>
		<li><a href="about.jsp">ABOUT US</a></li>
    
	</ul>

<%
String id = request.getParameter("id");
String userName = (String)session.getAttribute("SessionUserName");
Connection conn = null;
ResultSet rs = null;
Statement stmt = null;
PreparedStatement statement = null;
ResultSetMetaData rsmd ;

Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://cs5200-spring2020-janyani.cdgopduo2pce.us-east-2.rds.amazonaws.com/MovieBooking";
conn = DriverManager.getConnection(url,"Harsh2297","Devil2297");
stmt=conn.createStatement();

%>

<h1>My Tickets</h1>
<table border="1">
<tr>
	<th>id</th>
	<th>User name</th>
	<!--  <th>Number of Tickets</th>-->
	<th>Ticket Type</th>
    <th>Seat number</th>
    <th>Section</th>
    <th>Movie Name</th>
    <th>Showtime</th>
	<th>Update</th>
	<th>Delete</th>
</tr>
<%
try{

String sql ="select * from tickets where user_name='"+userName+"';";
rs = stmt.executeQuery(sql);
while(rs.next()){
%>
<tr>
	<td><%=rs.getString("id") %></td>
	<td><%=rs.getString("user_name") %></td>
	<!--  <td><%=rs.getString("no_of_tickets") %></td>-->
	<td><%=rs.getString("ticket_type")%></td>
	<td><%=rs.getString("seat_no")%></td>
	<td><%=rs.getString("section")%></td>
	<td><%=rs.getString("movie_name") %></td>
	<td><%=rs.getString("movie_time") %></td>
    <td><button class="button button5" onclick="window.location.href = 'updateTicketCustomer.jsp?id=<%=rs.getString("id")%>'" value="Add" id="addToTable;">update</button></td>
    <td><button class="button button5" onclick="window.location.href = 'deleteTicketCustomer.jsp?id=<%=rs.getString("id")%>'" value="Add" id="addToTable;">delete</button></td>
    
</tr>
<%
}
conn.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>