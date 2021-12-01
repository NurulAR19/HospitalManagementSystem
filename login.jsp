<%@ page import = "java.sql.*"%>
<%
	//Create an empty new variable
	String message = null;
	String STAFF_ID = null;
	String PASSWORD = null;
	
	//Handle the form
	if (request.getParameter("submit")!= null)
	{
 		//Check for a staff ID
 	if (request.getParameter("staff_ID").equals("")){
 		message = "<p> Your forgot to enter your staff ID!</p>";
 		STAFF_ID = null;
		 }
 		else {
 			STAFF_ID = request.getParameter("staff_ID");
 		} 

	

	//Check for a password
		 if (request.getParameter("pword").equals("")){
 			message = "<p> Your forgot to enter your password!</p>";
 			PASSWORD = null;
 		}
 		else {
 			PASSWORD = request.getParameter("pword");
		 }
	 

//If everything�s OK
 	PreparedStatement stmt = null;
 	Connection conn = null;

 	if (STAFF_ID!=null && PASSWORD!=null) {

 	//Call method to register student
	 try {
		 //Connect to the database
 		Class.forName("oracle.jdbc.driver.OracleDriver");
		String hostname = "";
		int port = ;
		String sid = "";
 		String oracleURL = "jdbc:oracle:thin:@"+hostname+":"+port+":"+sid;
 		String user = "";
 		String pass = "";
 		conn = DriverManager.getConnection(oracleURL, user, pass);
		conn.setAutoCommit(false);

// Make the query
 	stmt=conn.prepareStatement("insert into LOGIN_PAGE values(?,?)");
	stmt.clearParameters();
	stmt.setString(1,STAFF_ID);
	stmt.setString(2,PASSWORD);
 	
//Run the query
 	stmt.executeUpdate();
	conn.commit();
 	message = "<p> <b> You have been logged in!</b></p>";

//Close the database connection
 	stmt.close();
 	conn.close();
} catch (SQLException ex) {
 	message = "<p><b> You could not be logged in due to a system error. </b></p><p>" + ex.getMessage()+ "</p>";
 	stmt.close();
 	conn.close();
 	}
 }
else {
 	message = message + "<p> Please try again </p>";
 }
}
%> 

<html>
<head><title>Login Page</title></head>
<body>

<html>
<head>
<center>
<title>Hospital Management</title>

<body>
<br>
<img style="position:center; top:100px; left:170px; width:135px; height:60px" src="upm.png"/>

<h1> HOSPITAL PENGAJAR UPM (HPUPM SERDANG) </h1>

<style>
body, html {
  height: 100%;
  margin: 0;
  background-image: url("hpupm.png");
  
  background-color: white;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
table, th, td {
   padding: 30px;
   
   border-collapse: collapse;
   border-radius: 10px;
}
p, p1 {
  font-family: calibri;
  font-size: 20px;
}
p2{
  font-family: calibri;
  font-size: 10px;
  color: red;
  text-align:left;
}
</style>

<style type="text/css">
table {background-color: white;}
h1{color: white;}
h1{background-color: black;}
h1{font-size: 45px;}
h1{font-family: calibri;}
</style> 


<table style= "height:15%; width:28%" >
<tr>
<th>

<script type="text/javascript">

function resetForm(){
    document.getElementById("myHosp").reset();
}

function goBack(){
    window.history.back();
}

</script>

<% if (message!=null) { %>
 	<p5 > <%=message%></p5>
<% } %>
<body>
<form name="myHosp"  id ="myHosp"   method ="post">
<p align="center">
 Staff ID   &emsp;&emsp;:   </> <input type="text" name="staff_ID"  style="font-size:18px" size="10">
<br>
<br>
Password&emsp;:  </> <input type="text" name="pword"  style="font-size:18px" maxlength="10" size="10">
<br>
<br>

<p2> Enter your password. (max 8 characters only)</p2>
<br>
</form>
</body>
  
<body>
<p align="center">
<input type="submit"  onclick="resetForm()" value="Reset"  style="background-color :darkRed; color: white; font-family: calibri; font-size: 18px; border: none; border-radius: 5px"/> 
<input type="submit" name ="submit" form= "myHosp"  onclick= "location.href = 'www.youtube.com';" value="Log in" style=" background-color : black; color: white; font-family: calibri; font-size: 18px; border: none; border-radius: 5px" /> 

</p>
</body>
</body>
</html>

