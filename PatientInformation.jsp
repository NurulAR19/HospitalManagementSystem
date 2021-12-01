<%@ page import = "java.sql.*"%>
<%
	//Create an empty new variable
	String message = null;
	String PATIENT_ID = null;
	String FULL_NAME = null;
	String IC_NO = null;
	String AGE = null;
	String ADDRESS= null;
	String DOB = null;
	String CONTACT_NO= null;
	String GENDER = null;
	String MARITAL_STATUS = null;
	String NATIONALITY = null;
	String RACE = null;
	String RELIGION = null;
	String JOB_PATIENT= null;
	String DATE_ADMITTED= null;
	String DATE_DISCHARGED= null;
	
	

//If everything�s OK
 	PreparedStatement stmt = null;
 	Connection conn = null;

 	if (PATIENT_ID!=null && FULL_NAME!=null && IC_NO!=null && AGE!=null && ADDRESS!=null && DOB!=null && CONTACT_NO!=null && GENDER!=null && MARITAL_STATUS!=null && NATIONALITY!=null && RACE!=null && RELIGION!=null && JOB_PATIENT!=null && DATE_ADMITTED!=null && DATE_DISCHARGED!=null) {

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
 	stmt=conn.prepareStatement("insert into user_s values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	stmt.clearParameters();
	stmt.setString(1,PATIENT_ID);
	stmt.setString(2,FULL_NAME);
 	stmt.setString(3,IC_NO);
 	stmt.setString(4,AGE);
 	stmt.setString(5,ADDRESS);
	stmt.setString(6,DOB);
	stmt.setString(7,CONTACT_NO);
 	stmt.setString(8,GENDER);
 	stmt.setString(9,MARITAL_STATUS);
 	stmt.setString(10,NATIONALITY);
	stmt.setString(11,RACE);
	stmt.setString(12,RELIGION);
 	stmt.setString(13,JOB_PATIENT);
 	stmt.setString(14,DATE_ADMITTED);
 	stmt.setString(15,DATE_DISCHARGED);




//Run the query
 	stmt.executeUpdate();
	conn.commit();
 	message = "<p> <b> You have been registered !</b></p>";

//Close the database connection
 	stmt.close();
 	conn.close();
} catch (SQLException ex) {
 	message = "<p><b> You could not be registered due to a system error. We apologize for any inconvenience. </b></p><p>" + ex.getMessage()+ "</p>";
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
<head>
<center>
<title> Patient Information </title>

<body>
<br>
<img style="position:center; top:100px; left:170px; width:135px; height:60px" src="upm.png"/>
<h1> HOSPITAL PENGAJAR UPM (HPUPM SERDANG)</h1>

<p align="center">
<input type="submit" name ="submit" form= "myHosp"  value="Patient Information" style=" background-color : white; color: darkRed; font-family: calibri; font-size: 18px; border: none" /> 

<input type="submit" name ="submit" form= "myHosp"  value="Ward Information" style=" background-color : black; color: white; font-family: calibri; font-size: 18px; border: none" /> 

<input type="submit" name ="submit" form= "myHosp"  value="Medicine Prescription" style=" background-color : black; color: white; font-family: calibri; font-size: 18px; border: none" /> 

<input type="submit" name ="submit" form= "myHosp"  value="Health Record" style=" background-color : black; color: white; font-family: calibri; font-size: 18px; border: none" /> 
</p>

<style>
html { 
    height: 100%;
    margin:0px;
    background-image: url("hupm.png") no-repeat center center;
    background-size: cover;
    background-attachment: fixed;
}
body {
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
   border-radius: 5px;
}
p, p1 {
  font-family: calibri;
  font-size: 18px;
  color: black;
}
</style>

<style type="text/css">
  table {background-color: #F5F5F5; }
  h1{color: white;}
  h1{background-color:black;}
  h1{font-size: 40px;}
  h1{font-family: calibri;}
</style> 


<table style= "height:50%; width:65%" >
<tr>
<th>


<body>
<form name="myHosp" id ="myHosp" action="" onSubmit="return validateForm()"  method ="post">
<p4  style= "font-size:20px; font-family: calibri; color: darkRed"> PATIENT'S PERSONAL DETAILS </p4>
<p align="left">
<br>
FULL NAME  : </> <input type="text" name="fname"  style="font-size:15px" maxlength="50" size="73">
<br>
<br>
PATIENT ID   : </> <input type="text" name="patientID"  style="font-size:15px" size="12">
&emsp; &emsp;  
NRIC. NO : </> <input type="text" name="icnum"  style="font-size:15px" maxlength="12" size="12">
&emsp; &emsp;  
AGE : </> <input type="text" name="age"  style="font-size:15px" maxlength="3" size="5">
<br>
<br>
DATE OF BIRTH : </> <input type="text" name="dob"  style="font-size:15px"  size="12">
<br>
<br>
ADDRESS  : </> <input type="text" name="address"  style="font-size:15px" size="76">
<br>
<br>
EMAIL ADDRESS  : </> <input type="text" name="email"  style="font-size:15px" maxlength="30" size="30">
&emsp; 
CONTACT NUMBER  : </> <input type="text" name="cnum"  style="font-size:15px" maxlength="15" size="15">
<br>
<br>
GENDER       : </> <input type="radio" name="gender" value="male" > Male
	       <input type="radio" name="gender" value="female" > Female
&emsp; &emsp;  
MARITAL STATUS : </> 
<select style="font-size:15px;" name="status">
<option style="font-size:15px;" value="">Select status:</option>
<option style="font-size:15px;"  value="status">Single</option>  
<option style="font-size:15px;"  value="status">Married</option>
<option style="font-size:15px;"  value="status">Divorced</option>
<option style="font-size:15px;"  value="status">Widowed</option>

</select>
<br>
<br>
NATIONALITY  : </>
<select style="font-size:15px;" name="nationality">
<option style="font-size:15px;" value="">Select one:</option>
<option style="font-size:15px;"  value="nationality">Malaysian</option>  
<option style="font-size:15px;"  value="nationality">Non-Malaysian</option>
</select>
&emsp; &emsp;  
RACE: </>
<select style="font-size:15px;" name="race">
<option style="font-size:15px;" value="">Select race:</option>
<option style="font-size:15px;"  value="race">Malay</option>  
<option style="font-size:15px;"  value="race">Chinese</option>
<option style="font-size:15px;"  value="race">Indian</option>
<option style="font-size:15px;"  value="race">Kadazandusun</option>
<option style="font-size:15px;"  value="race">Iban</option>
<option style="font-size:15px;"  value="race">Others</option>
</select>
&emsp; &emsp;  
RELIGION  : </>
<select style="font-size:15px;" name="religion">
<option style="font-size:15px;" value="">Select religion:</option>
<option style="font-size:15px;"  value="religion">Islam</option>  
<option style="font-size:15px;"  value="religion"> Buddhism</option>
<option style="font-size:15px;"  value="religion">Hinduism</option>
<option style="font-size:15px;"  value="religion"> Christian</option>
<option style="font-size:15px;"  value="religion">No Religion</option>
</select>
<br>
<br>
ADMITTED DATE  : </> <input type="text" name="dadmit"  style="font-size:18px"  size="12">
&emsp; &emsp;  
DISCHARGED DATE  : </> <input type="text" name="ddisc"  style="font-size:18px"  size="12">
<br>
<br>
</form>
</body>

<body>
<p align="right">
<input type="submit"  onclick="" value="Save"  style="background-color :forestGreen; color: white; font-family: calibri; font-size: 20px;  border-radius: 5px"/> 
<input type="submit" name ="submit" form= "myHosp"  value="Next" style=" background-color : black; color: white; font-family: calibri; font-size: 20px; border-radius: 5px" /> 

</p>

</body>
</table>

