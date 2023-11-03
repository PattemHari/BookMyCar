<%-- 
    Document   : ownerRegister.jsp
    Created on : 12-Sep-2023, 2:48:41 pm
    Author     : Kiran
--%>

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

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.all.min.js"></script>
    
    <style>
        body {
            background-image: url('images/bg-5.jpg');
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
    </style>
    
    
     <script>
function validateuser(form) {     
        const name = form.name.value;
        var mobile = form.mobile.value;
        var adhar = form.adhar.value;
       var email = form.email.value;
       var address = form.address.value;
       var dob = form.dob.value;
      var image = form.profile.value;
      var license = form.license.value;
      var password=form.password.value;
       var cpassword=form.cpassword.value;

        var emailpattern = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([com\co\.\in])+$/; // to validate email id
        var letter = /[a-z]/;
        var upper = /[A-Z]/;
        var number = /[0-9]/;
        
        
        if (name===""){  
         Swal.fire({
                icon: 'error',
                title: 'Name Can Not Be Blank!',
                confirmButtonText: 'OK'
            });         
          return false;  
        }
         if (email===""){
           
              Swal.fire({
                icon: 'error',
                title: 'Email cannot be blank!',
                confirmButtonText: 'OK'
            }); 
            return false;
        }
        if(!email.match(emailpattern)){ 
            Swal.fire({
                icon: 'error',
                title: 'Invalid Email format!',
                confirmButtonText: 'OK'
            }); 
            return false;
        }
        if(isNaN(mobile)){
             Swal.fire({
                icon: 'error',
                title: 'Invalid Mobile number!',
                confirmButtonText: 'OK'
            }); 
            return false;
        }
        if(mobile==="" ){
             Swal.fire({
                icon: 'error',
                title: 'Provide Mobile number!',
                confirmButtonText: 'OK'
            }); 
            return false;
        }
        if(mobile.length!==10){
             Swal.fire({
                icon: 'error',
                title: 'Invalid Mobile Number!',
                confirmButtonText: 'OK'
            }); 
            return false;
        }
        if(isNaN(adhar)){
             Swal.fire({
                icon: 'error',
                title: 'Invalid Mobile number!',
                confirmButtonText: 'OK'
            }); 
            return false;
        }
        if(adhar==="" ){
             Swal.fire({
                icon: 'error',
                title: 'Provide Mobile number!',
                confirmButtonText: 'OK'
            }); 
            return false;
        }
        if(adhar.length!==12){
             Swal.fire({
                icon: 'error',
                title: 'Invalid Mobile Number!',
                confirmButtonText: 'OK'
            }); 
            return false;
        }    
        if(address===''){
             Swal.fire({
                icon: 'error',
                title: 'Address should not be empty!',
                confirmButtonText: 'OK'
            }); 
            return false;
        }
         if(dob===''){
             Swal.fire({
                icon: 'error',
                title: 'Provide your Description!',
                confirmButtonText: 'OK'
            }); 
            return false;
        }
        
         if (password===''){  
            Swal.fire({
                icon: 'error',
                title: 'password should not be empty!',
                confirmButtonText: 'OK'
            }); 
            return false;
            }
        
        if (!letter.test(password)) {
            Swal.fire({
                icon: 'error',
                title: 'Please make sure password includes a lowercase letter!',
                confirmButtonText: 'OK'
            }); 
                return false;
            }
        if (!number.test(password)) {
        
             Swal.fire({
                icon: 'error',
                title: 'Please make sure Password Includes a Digit!',
                confirmButtonText: 'OK'
            }); 
                return false;
            }
        if (!upper.test(password)) {
             Swal.fire({
                icon: 'error',
                title: 'Please make sure password includes an uppercase letter!',
                confirmButtonText: 'OK'
            }); 
                return false;
            } 
           if (cpassword !== password) {
                 Swal.fire({
                icon: 'error',
                title: 'The Passwords do not match!',
                confirmButtonText: 'OK'
            }); 
               return false;
            }
        if(image===''){
             Swal.fire({
                icon: 'error',
                title: 'Provide your Profile!',
                confirmButtonText: 'OK'
            }); 
            return false;
        }
        if(license===''){
             Swal.fire({
                icon: 'error',
                title: 'Provide your License!',
                confirmButtonText: 'OK'
            }); 
            return false;
        }
       
       
    }
    </script>
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
	          <li class="nav-item "><a href="index.jsp" class="nav-link">Home</a></li>
	          <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
              <li class="nav-item "><a href="CustomerLogin.jsp" class="nav-link">Customer</a></li>
	          <li class="nav-item active"><a href="ownersLogin.jsp" class="nav-link">Owners</a></li>
	          <li class="nav-item"><a href="adminLogin.jsp" class="nav-link">Admin</a></li>
	          <li class="nav-item"><a href="contact.jsp" class="nav-link">Contact</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->
    
    <div class="hero-wrap ftco-degree-bg" style="background-image: url('images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text justify-content-start align-items-center justify-content-center">
          <div class="col-lg-12 ftco-animate">
          	<div class="text w-100 text-center mb-md-5 pb-md-5">
                <h2 class="text-white">Owner Registation</h2>
                <!-- ... Your existing code ... -->

<div class="login-container">
   <form class="login-form" action="ownerRegistrationAction.jsp" class="row" method="post" name="myform" onsubmit="return validateuser(this);" enctype="multipart/form-data">
 <table>
            <tr>
                <td class="text-white">NAME :</td>
                <td><input type="text" name="name" id="name" placeholder="FULLNAME"  ></td>
                
                <td class="text-white">EMAIL :</td>
                <td><input type="text" name="email" id="email" placeholder="Email" ></td>
            </tr>
            <tr>
                <td class="text-white">MOBILE :</td>
                <td><input type="text" name="mobile" id="mobile" placeholder="MOBILE NO" ></td>
                
                <td class="text-white">ADHAR :</td>
                <td><input type="text" name="adhar" id="adhar" placeholder="ADHAR NO"></td>
            </tr>
            <tr>
                <td class="text-white">ADDRESS :</td>
                <td><input type="text" name="address" id="address" placeholder="ADDRESS" ></td>
                
                <td class="text-white date">Date Of Birth :</td>
                <td><input type="date" name="dob" placeholder="DATE OF BIRTH" id="dob"  class="date-input"></td>
                
            </tr>
            <tr>
              <td class="text-white">PASSWORD :</td>
              <td><input type="password" name="password" id="password" placeholder="PASSWORD" ></td>
              
              <td class="text-white">PASSWORD :</td>
              <td><input type="password" name="cpassword" id="cPassword" placeholder="CONFIRM PASSWORD" ></td>
          </tr>
            <tr>
                <td class="text-white">PROFILE :</td>
                <td><input type="file" name="profile" id="profile" placeholder="PROFILE" ></td>
                  <td class="text-white">LICENSE :</td>
                <td><input type="file" name="license" id="license" placeholder="LICENSE" ></td>
            </tr>
            
            <tr>
                <td colspan="4"><button type="submit">REGISTER</button></td>
            </tr>
            <tr>
                <td colspan="4" class="text-white">Already have an account? <a href="ownersLogin.jsp"><b>LOGIN</b></a></td>
            </tr>
        </table>
    </form>
</div>

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
	                <li><span class="icon icon-map-marker"></span><span class="text">Lb Nagar, Hyderabad</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">9876543219</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">codebook@gmail.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
        
        </div>
      </div>
    </footer>
    
   <script>
        // Check if the "success" attribute is present in the session
        var successMessage = '${sessionScope.owner}';
        if (successMessage !== '') {
            // Display SweetAlert with the success message
            Swal.fire({
                icon: 'error',
                title: 'Failure!',
                text: successMessage,
                confirmButtonText: 'OK'
            });

            // Clear the "success" attribute from the session to avoid showing the alert again
            <% session.removeAttribute("owner"); %>
        }
    </script>

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
