<%-- 
    Document   : MyBookings
    Created on : 16-Sep-2023, 3:07:58 pm
    Author     : Kiran
--%>
<%@page import="com.bookMyCar.image.ImageString"%>
<%@page import="com.bookMyCar.owner.OwnerLogin"%>
<%@page import="com.bookMyCar.beans.Beans"%>
<%@page import="com.bookMyCar.connections.AllBookings"%>
<%@page import="java.sql.*" %>
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
        /* Style for the table cell containing status and the "ACCEPT" link */
          td.status-accept-cell {
    background-color: #f7f7f7;
    padding: 10px; /* Adjust padding as needed */
}

/* Style for the "ACCEPT" link within the cell */
a.edit-button {
    background-color: red;
    color: #FFFFFF;
    padding: 5px 10px;
    text-decoration: none;
    border-radius: 3px;
    font-weight: bold;
}

/* Hover effect for the "ACCEPT" link */
a.edit-button:hover {
    background-color: red;
}
.status-accepted {
            color: green;
        }

        /* Text color for Rejected status */
        .status-rejected {
            color: red;
        }

        /* Text color for Pending status */
        .status-pending {
            color: #0056b3;
        }
        .hero-wrap-3{
            height: 300px;
        }
        .f{
            height: 300px    
        }
        .breadcrumbs,
           .bread {
          color: white;
         }
         .ftco-section.ftco-cart {
    background-color: #fff;
}
        
        </style>
  </head>
  <body>
    
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
        <div class="container">
            <a class="navbar-brand" href="index.html">Book<span>MyCar</span></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="oi oi-menu"></span> Menu
            </button>
            <div class="collapse navbar-collapse" id="ftco-nav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item "><a href="Customer_index.jsp" class="nav-link">Home</a></li>
                    <li class="nav-item active"><a href="MyBookings.jsp" class="nav-link">My Bookings</a></li>
                    <li class="nav-item"><a href="UserProfile.jsp" class="nav-link">Profile</a></li>
                      <li class="nav-item "><a href="Feedback.jsp" class="nav-link">Feedback</a></li>
                      <li class="nav-item"><a href="../LogOut.jsp" class="nav-link">LogOut</a></li>
                </ul>
            </div>
        </div>
    </nav>
    
    <section class="hero-wrap hero-wrap-3 justify-content-start" style="background-image: url('images/bg_3.jpg'); " data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters  f  align-items-end justify-content-start">
                <div class="col-md-6 ftco-animate pb-1">
                    <p class="breadcrumbs">
                        <span class="mr-2"><a href="Customer_index.jsp">Home <i class="ion-ios-arrow-forward"></i></a></span>
                        <span>MyBookings <i class="ion-ios-arrow-forward"></i></span>
                    </p>
                    <h1 class="mb-3 bread">My Bookings</h1>
                </div>
            </div>
        </div>
    </section>
	

    <section class="ftco-section ftco-cart">
			<div class="container">
				<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark heading"  id="ftco-navbar">
					<div class="container">
						<a class="navbar-brand" href="index.html">Book<span>MyCar</span></a>
						<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
						  <span class="oi oi-menu"></span> Menu
						</button>
			
					  <div class="collapse navbar-collapse" id="ftco-nav">
						<ul class="navbar-nav ml-auto">
						  <li class="nav-item active"><a href="MyBookings.jsp" class="nav-link">ALL</a></li>
						  <li class="nav-item"><a href="UserPendingBookings.jsp" class="nav-link">Pending</a></li>
						  <li class="nav-item"><a href="UserAcceptedBookings.jsp" class="nav-link">Accepted</a></li>
						  <li class="nav-item"><a href="UserDeclinedBookings.jsp" class="nav-link">Declined</a></li>
						</ul>
					  </div>
					</div>
				  </nav>
				<div class="row">
    			<div class="col-md-12 ftco-animate">
    				<div class="car-list">
	    				<table class="table">
						    <thead class="thead-primary">
						      <tr class="text-center">
						        
						        <th class="bg-black heading">Car Image</th>
						        <th class="bg-black heading">Vehicle</th>
						        <th class="bg-black heading">BookIng Date</th>
								<th class="bg-black heading">Return Date</th>
								<th class="bg-black heading">Price(Per Day)</th>
								<th class="bg-black heading">Number Of days</th>
								<th class="bg-black heading">Total Amount</th>
								<th class="bg-black heading">Request Status</th>
						      </tr>
						    </thead>
                                                    
                                      <%
                                          Beans setter=new Beans();
                                          setter.setEmail((String)session.getAttribute("customerEmail"));
                                        
                                      ResultSet resultSet=new AllBookings().getBooking(setter);
                                   
                                      while(resultSet.next()){
                                      Beans setter1=new Beans();
                                    setter.setEmail(resultSet.getString("OwnerEmail"));
                                    setter.setName(resultSet.getString("carName"));
                        
                                ResultSet resultSet1=new OwnerLogin().viewCar(setter);
                                      if(resultSet1.next()){
                                      %>
                                                    
                                                    
						    <tbody>
						      <tr class="text-center ">
                                                          <td class="car-image "><div class="img" style="background-image:url(data:image/jpeg;base64,<%=ImageString.getImage(resultSet1.getBlob("image"))%>);"></div></td>
						        <td class="price"><%=resultSet.getString("carName")%></td>
						        
						        <td class="price">
						        	<%=resultSet.getString("FromDate")%>
						        </td>
						        
						        <td class="price">
						        	<%=resultSet.getString("ToDate")%>
						       
						        </td>

						        <td class="price">
                                                            ₹<%=Integer.parseInt(resultSet.getString("Amount"))/Integer.parseInt(resultSet.getString("days"))%>
						        </td>
								<td class="price">
						        	<%=resultSet.getString("days")%>
						        </td>
                                                        
								<td      class="price">
						        	₹<%=resultSet.getString("Amount")%></td>
                                                                <%
                                  if(resultSet.getString("status").equals("Accepted")){
                              %>
                              <td class="status-accepted"><%=resultSet.getString("status")%></td>
                              <%
                                  }else if(resultSet.getString("status").equals("Rejected")){
                                %>
                                <td class="status-rejected"><%=resultSet.getString("status")%></td>
                                <%
                                    }else{
                               %>
                                <td class="status-accept-cell status-pending">
                                                                    <%=resultSet.getString("status")%>
                              
                        
  <a href="#" onclick="showCancelBookingConfirmation('<%=resultSet.getString("email")%>','<%=resultSet.getString("OwnerEmail")%>','<%=resultSet.getString("carName")%>','<%=resultSet.getString("FromDate")%>','<%=resultSet.getString("ToDate")%>')" class="edit-button">Cancel</a>

                                                        </td>
                                <%
                                    }
                                %>
						       
<!-- END TR-->
						
						    </tbody>
                                                    <%
                                                        }
                                                        }
                                                    %>
						  </table>
					  </div>
    			</div>
    		</div>
			</div>
		</section>


    <footer class="ftco-footer ftco-bg-dark ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2"><a href="#" class="logo">Car<span>book</span></a></h2>
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
function showCancelBookingConfirmation(email, ownerEmail, carName, fromDate, toDate) {
  Swal.fire({
    title: "Are you sure?",
    text: "This action cannot be undone.",
    icon: "warning",
    showCancelButton: true,
    confirmButtonText: "Cancel Booking",
    cancelButtonText: "Cancel",
    confirmButtonColor: "#d33",
    cancelButtonColor: "#3085d6"
  }).then((result) => {
    if (result.isConfirmed) {
      // Encode the values for the URL
      var encodedEmail = encodeURIComponent(email);
      var encodedOwnerEmail = encodeURIComponent(ownerEmail);
      var encodedCarName = encodeURIComponent(carName);
      var encodedFromDate = encodeURIComponent(fromDate);
      var encodedToDate = encodeURIComponent(toDate);
      
      // Create the anchor tag with the encoded parameters
      var cancelLink = document.createElement("a");
      cancelLink.href = "cancelBooking.jsp?email=" + encodedEmail +
        "&oemail=" + encodedOwnerEmail +
        "&car=" + encodedCarName +
        "&fdate=" + encodedFromDate +
        "&tdate=" + encodedToDate;
      
      // Simulate clicking the link to trigger the redirect
      document.body.appendChild(cancelLink); // Append the link to the body
      cancelLink.click();
      
      // Clean up by removing the link from the body
      document.body.removeChild(cancelLink);
    }
  });
}
</script>
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
