<%-- 
    Document   : Customer_index.jsp
    Created on : 15-Sep-2023, 3:02:08 pm
    Author     : Kiran
--%>
<%@page import="com.bookMyCar.image.ImageString"%>
<%@page import="com.bookMyCar.Customer.CustomerLogin"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Carbook - Free Bootstrap 4 Template by Colorlib</title>

    <!-- Stylesheets -->
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
        .hero-wrap-3{
            height: 400px;
        }
        .f{
            height: 350px    
        }
        .breadcrumbs,
           .bread {
          color: white;
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
                    <li class="nav-item active"><a href="Customer_index.html" class="nav-link">Home</a></li>
                    <li class="nav-item"><a href="MyBookings.jsp" class="nav-link">My Bookings</a></li>
                    <li class="nav-item"><a href="UserProfile.jsp" class="nav-link">Profile</a></li>
                      <li class="nav-item "><a href="Feedback.jsp" class="nav-link">Feedback</a></li>
                      <li class="nav-item"><a href="../LogOut.jsp" class="nav-link">LogOut</a></li>
                </ul>
            </div>
        </div>
    </nav>
    
    <section class="hero-wrap hero-wrap-3 justify-content-start" style="background-image: url('images/bg_2.jpg'); " data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters  f  align-items-end justify-content-start">
                <div class="col-md-6 ftco-animate pb-1">
                    <p class="breadcrumbs">
                        <span class="mr-2"><a href="Customer_index.jsp">Home <i class="ion-ios-arrow-forward"></i></a></span>
                        <span>Cars <i class="ion-ios-arrow-forward"></i></span>
                    </p>
                    <h1 class="mb-3 bread">Choose Your Car</h1>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-section bg-light">
        <div class="container">
            <div class="row">
                <%
                ResultSet resultSet = new CustomerLogin().viewCars();
                int carCount = 0;
                while (resultSet.next()) {
                    if (carCount % 3 == 0) {
                %>
            </div>
            <div class="row">
                <%
                    }
                %>
                <div class="col-md-4">
                    <div class="car-wrap rounded ftco-animate">
                        <div class="img rounded d-flex align-items-end" style="background-image: url(data:image/jpeg;base64,<%=ImageString.getImage(resultSet.getBlob("image"))%>);">
                        </div>
                        <div class="text">
                            <h2 class="mb-0"><a href="CarBooking.jsp?email=<%=resultSet.getString("email")%>&car=<%=resultSet.getString("carName")%>"><%=resultSet.getString("carName")%></a></h2>
                            <div class="d-flex mb-3">
                                <span class="cat">Company :</span>&nbsp;&nbsp; 
                                <span ><%=resultSet.getString("carCompany")%></span>
                            </div>
                            <div class="d-flex mb-3">
                                <span class="cat">Price</span>
                                <p class="price ml-auto">₹<%=resultSet.getString("price")%> <span>/day</span></p>
                            </div>
                            <p class="d-flex mb-0 d-block"><a href="CarBooking.jsp?email=<%=resultSet.getString("email")%>&car=<%=resultSet.getString("carName")%>&price=<%=resultSet.getString("price")%>" class="btn btn-primary py-2 mr-1">Details</a> </p>
                        </div>
                    </div>
                </div>
                <%
                    carCount++;
                }
                %>
            </div>
            
        </div>
    </section>

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
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">8555887986</span></a></li>
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
        var successMessage = '${sessionScope.book}';
        if (successMessage !== '') {
            // Display SweetAlert with the success message
            Swal.fire({
                icon: 'success',
                title: 'Success!',
                text: successMessage,
                confirmButtonText: 'OK'
            });

            // Clear the "success" attribute from the session to avoid showing the alert again
            <% session.removeAttribute("book"); %>
        }
    </script>

    <!-- JavaScript Files -->
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
    <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&sensor=false"></script>
    <script src="js/google-map.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
