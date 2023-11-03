<%-- 
    Document   : BookingConform
    Created on : 15-Sep-2023, 3:56:04 pm
    Author     : Kiran
--%>
<%@page import="com.bookMyCar.Customer.GetAvailableDates"%>
<%@page import="com.bookMyCar.beans.Beans"%>
<%@page  import="com.bookMyCar.Customer.CustomerLogin"%>
<%@page  import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Carbook - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">

    <style>
        body {
            background-image: url('images/bg-4.jpg');
            background-size: cover;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
    
        .login-container {
            background: none(255, 255, 255, 0.8);
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
            text-align: center;
        }
    
        .login-container h2 {
            margin-bottom: 20px;
        }
    
        .login-form table {
            width: 100%;
        }
       
    
        .login-form table tr {
            margin-bottom: 15px;
        }
    
        .login-form table td {
            padding: 10px;
            text-align: center;
        }
    
        .login-form input[type="text"],
        .login-form input[type="password"],
        .login-form textarea {
          color: white;
            width: 100%;
            padding: 10px;
            border: none;
            border-bottom: 2px solid #fff;
            caret-color: #fff;
            background-color: transparent;
        }
    
        .login-form textarea {
            border: 2px solid #fff;
            border-radius: 5px;
        }
    
        .login-form button {
            width: 100%;
            padding: 10px;
            background-color: transparent; /* Set the button to be transparent */
            color: #fff; /* Set button text color to white */
            font-weight: bold;
            border: 2px solid #fff;
         
            cursor: pointer;
        }
    
        .login-form button:hover {
            background-color: transparent; /* Set hover background to transparent */
            color: #fff; 
        }
        .date-input {
    width: 100%;
    padding: 10px;
    border: none;
    border-bottom: 2px solid #fff;
    caret-color: #fff;
    background-color: transparent;
    /* Add any additional styles you want for the "Date of Birth" input field here */
}
.date-input::-webkit-datetime-edit-fields-wrapper,
    .date-input::-webkit-inner-spin-button,
    .date-input::-webkit-clear-button,
    .date-input::-webkit-calendar-picker-indicator {
        color: white; /* Set the text color to white */
    }
    .confirm-button {
    background-color: white;
    color: black;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
   
}

    </style>
  </head>
  <body>
    
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="#">Book<span>MyCar</span></a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

          <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item active"><a href="Customer_index.jsp" class="nav-link">Home</a></li>
	          <li class="nav-item"><a href="MyBookings.jsp" class="nav-link">My Bookings</a></li>
                  <li class="nav-item "><a href="UserProfile.jsp" class="nav-link">Profile</a></li>
                  <li class="nav-item "><a href="Feedback.jsp" class="nav-link">Feedback</a></li>
                  <li class="nav-item"><a href="../LogOut.jsp" class="nav-link">LogOut</a></li>
	        </ul>
	      </div>
	    </div>
	   
	  </nav>
    <!-- END nav -->
    
    <div class="hero-wrap ftco-degree-bg" style="background-image: url('images/bg_5.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text justify-content-start align-items-center justify-content-center">
          <div class="col-lg-12 ftco-animate">
          	<div class="text w-100 text-center mb-md-5 pb-md-5">
                <h2 class="text-white">Car Booking Conformation</h2>
                <!-- ... Your existing code ... -->
  <%
     String s1=request.getParameter("sdate");
     String s2=request.getParameter("edate");
     String sDate[]=s1.split("-");
    String eDate[]=s2.split("-");
    
     int days=0;
    int sYear=Integer.parseInt(sDate[0]);
    int eYear=Integer.parseInt(eDate[0]);
    int sMonth=Integer.parseInt(sDate[1]);
    int eMonth=Integer.parseInt(eDate[1]);
    int sDays=Integer.parseInt(sDate[2]);
    int eDays=Integer.parseInt(eDate[2]);
    Beans set=new Beans();
    set.setCompanyName((String)session.getAttribute("emailD"));
    set.setName((String)session.getAttribute("carD"));
    
    ResultSet result=GetAvailableDates.getDate(set);
    int startYear=0;
    int endYear=0;
    int sDMonth=0;
    int eDMonth=0;
    int sDDays=0;
    int eDDays=0;
      int count=0;
    while(result.next()){
    String startDate[]=result.getString("FromDate").split("-");
     String endDate[]=result.getString("ToDate").split("-");
     startYear=Integer.parseInt(startDate[0]);
     sDMonth=Integer.parseInt(startDate[1]);
     sDDays=Integer.parseInt(startDate[2]);
     
     endYear=Integer.parseInt(endDate[0]);
     eDMonth=Integer.parseInt(endDate[1]);
     eDDays=Integer.parseInt(endDate[2]);
          
     if(sYear<=startYear && eYear>=endYear && sMonth<=sDMonth && eMonth>=eDMonth && sDays<=sDDays  && eDays<=eDDays){
        count++;
      }
      }
     
     if(count==0){
  
    if(sYear<eYear){
      eMonth+=12;
      }
      if(sMonth<eMonth){
      eDays+=30;
      }
      int month=0;
    if(sYear<=eYear && sMonth<=eMonth && sDays<eDays){
    if(eMonth>sMonth){
         while(sDays<30){
           days++;
          sDays++;
        }
      }else{
      while(sDays<=eDays){
           days++;
           sDays++;
        }
      }
        if(sMonth+1<eMonth){
           if(sYear<eYear){
             eMonth-=sMonth;
           }
        days+=30*(eMonth-1);
       }
         if(eMonth>sMonth){
            eDays-=30;
             if(eDays<=30){
             days+=eDays;
            }
         }
      } else{
      session.setAttribute("date","Invalid Date");
      response.sendRedirect("CarBooking.jsp");
      }
      }else{
       session.setAttribute("date","In this Date the car is Already booked can you choose another Date.");
      response.sendRedirect("CarBooking.jsp");
      }
      ResultSet resultSet=null;
        Beans setter=new Beans();
      setter.setEmail((String)session.getAttribute("customerEmail"));
      setter.setPassword((String)session.getAttribute("customerPassword"));
      resultSet=new CustomerLogin().login(setter);
     
      if(resultSet.next()){
  %>
      <div class="login-container">
        <form action="BookingAction.jsp" class="login-form" method="post">

        <table>
            <tr>
                <td class="text-white">NAME :</td>
                <td><input type="text" name="name"  value="<%=resultSet.getString("name")%>" required></td>
                
                <td class="text-white">EMAIL :</td>
                <td><input type="text" name="email" value="<%=resultSet.getString("email")%>" required></td>
            </tr>
            <tr>
                <td class="text-white">MOBILE :</td>
                <td><input type="text" name="mobile" value="<%=resultSet.getString("mobile")%>" required></td>
                
                <td class="text-white">ADHAR :</td>
                <td><input type="text" name="adhar" value="<%=resultSet.getString("adhar")%>" required></td>
            </tr>
            <tr>
                <td class="text-white">From Date :</td>
                <td><input type="text" name="fDate" value="<%=request.getParameter("sdate")%>" required></td>
                
                <td class="text-white date"> To Date:</td>
                <td><input type="text" name="toDate" value="<%=request.getParameter("edate")%>" required class="date-input"></td>
                
            </tr>
            <tr>
                <td class="text-white">Total Amount :</td>
                <td><input type="text" name="amount" value="<%=Integer.parseInt((String)session.getAttribute("price"))*days%>" required></td>
                
                <td class="text-white">Number Of Days :</td>
                <td><input type="Text" name="days" value="<%=days%>" required></td>
            </tr>
            <tr>
                <td class="text-white">ADDRESS :</td>
                <td><input type="text" name="address" value="<%=resultSet.getString("address")%>" required></td>   
            </tr>
            
            <tr>
                <td colspan="4"></td>
            </tr>
          
        </table>
           <input type="submit" value="Confirm Booking" class="confirm-button">

    </form>
</div>
<%
    }
%>
<!-- ... Your existing code ... -->

            </div>
          </div>
        </div>
      </div>
    </div>
    <footer class="ftco-footer ftco-bg-dark ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2"><a href="#" class="logo">Book<span>MyCar</span></a></h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-5">
              <h2 class="ftco-heading-2">Information</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">About</a></li>
                <li><a href="#" class="py-2 d-block">Services</a></li>
                <li><a href="#" class="py-2 d-block">Term and Conditions</a></li>
                <li><a href="#" class="py-2 d-block">Best Price Guarantee</a></li>
                <li><a href="#" class="py-2 d-block">Privacy &amp; Cookies Policy</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Customer Support</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">FAQ</a></li>
                <li><a href="#" class="py-2 d-block">Payment Option</a></li>
                <li><a href="#" class="py-2 d-block">Booking Tips</a></li>
                <li><a href="#" class="py-2 d-block">How it works</a></li>
                <li><a href="#" class="py-2 d-block">Contact Us</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
        
        </div>
      </div>
    </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
    
  </body>
</html>