<%-- 
    Document   : AddCars
    Created on : 13-Sep-2023, 3:00:48 pm
    Author     : Kiran
--%>

<%@page import="com.bookMyCar.image.ImageString"%>
<%@page import="com.bookMyCar.beans.Beans"%>
<%@page import="java.sql.*"%>
<%@page import="com.bookMyCar.owner.OwnerLogin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Owner</title>
    <!-- HTML5 Shim and Respond.js IE10 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 10]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
      <!-- Meta -->
      <meta charset="utf-8">
      
      <!-- Favicon icon -->
      <link rel="icon" href="assets/images/logoBookMyCar.png" type="image/x-icon">
    <!-- Google font-->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet">
    <!-- waves.css -->
    <link rel="stylesheet" href="assets/pages/waves/css/waves.min.css" type="text/css" media="all">
      <!-- Required Fremwork -->
      <link rel="stylesheet" type="text/css" href="assets/css/bootstrap/css/bootstrap.min.css">
      <!-- waves.css -->
      <link rel="stylesheet" href="assets/pages/waves/css/waves.min.css" type="text/css" media="all">
      <!-- themify icon -->
      <link rel="stylesheet" type="text/css" href="assets/icon/themify-icons/themify-icons.css">
      <!-- Font Awesome -->
      <link rel="stylesheet" type="text/css" href="assets/icon/font-awesome/css/font-awesome.min.css">
      <!-- scrollbar.css -->
      <link rel="stylesheet" type="text/css" href="assets/css/jquery.mCustomScrollbar.css">
        <!-- am chart export.css -->
        <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
      <!-- Style.css -->
      <link rel="stylesheet" type="text/css" href="assets/css/style.css">



      <!--Adding the form styles-->

      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Car Details Form</title>
      <!-- Add Bootstrap CSS link -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
      
      <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.all.min.js"></script>
      <style>
          /* Custom CSS styles */
          .container {
              max-width: 1000px; /* Increase the max-width to your desired width */
              margin: 5 auto;
              padding: 20px;
              background-color: #f8f9fa; /* Light gray background color */
              border-radius: 10px;
              box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); /* Add a subtle box shadow */
          }
          .form-group {
              margin-bottom: 20px;
          }
          /* Custom styling for form inputs */
          label {
              font-weight: bold;
          }
          input[type="text"],
          input[type="number"] {
              width: 100%;
              padding: 10px;
              border: 1px solid #ccc;
              border-radius: 5px;
          }
          button[type="submit"] {
              background-color: #007bff;
              color: #fff;
              padding: 10px 20px;
              border: none;
              border-radius: 5px;
              cursor: pointer;
          }
          button[type="submit"]:hover {
              background-color: #0056b3;
          }
      </style>
      
        <script>
function validateuser(form) {     
        const name = form.name.value;
        var Cname = form.Cname.value;
        var model = form.model.value;
       var transmission = form.transmission.value;
       var licence = form.licence.value;
       var price = form.price.value;
      var seats = form.seats.value;
      var fuel = form.fuel.value;
      var color=form.color.value;
       var image=form.image.value;
       var description=form.description.value;

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
         if (Cname===""){
           
              Swal.fire({
                icon: 'error',
                title: 'Company Name cannot be blank!',
                confirmButtonText: 'OK'
            }); 
            return false;
        }
       
        if(model==="" ){
             Swal.fire({
                icon: 'error',
                title: 'Model cannot be blank!',
                confirmButtonText: 'OK'
            }); 
            return false;
        }
        if(transmission==="" ){
             Swal.fire({
                icon: 'error',
                title: 'Transmission cannot be blank!',
                confirmButtonText: 'OK'
            }); 
            return false;
        }
        if(licence===''){
             Swal.fire({
                icon: 'error',
                title: 'Provide your License!',
                confirmButtonText: 'OK'
            }); 
            return false;
        }
         if(price===''){
             Swal.fire({
                icon: 'error',
                title: 'Price cannot be blank!',
                confirmButtonText: 'OK'
            }); 
            return false;
        }
        
         if (seats===''){  
            Swal.fire({
                icon: 'error',
                title: 'Seats should not be empty!',
                confirmButtonText: 'OK'
            }); 
            return false;
            }
        
        
           if (fuel ==='') {
                 Swal.fire({
                icon: 'error',
                title: 'Fuel should not be empty!',
                confirmButtonText: 'OK'
            }); 
               return false;
            }
            if (color ==='') {
                 Swal.fire({
                icon: 'error',
                title: 'Color should not be empty!',
                confirmButtonText: 'OK'
            }); 
               return false;
            }
        if(image===''){
             Swal.fire({
                icon: 'error',
                title: 'Provide your Car Image!',
                confirmButtonText: 'OK'
            }); 
            return false;
        }
        if(description===''){
             Swal.fire({
                icon: 'error',
                title: 'Provide your Description!',
                confirmButtonText: 'OK'
            }); 
            return false;
        }
       
       
    }
    </script>
  </head>

  <body>
      
      
      <%
         Beans setter=new Beans();
         setter.setEmail((String)session.getAttribute("email"));
         setter.setPassword((String)session.getAttribute("password"));
         ResultSet resultSet=new OwnerLogin().login(setter);
          String name="",image="";
         if(resultSet.next()){
           name=resultSet.getString("name");
           image=ImageString.getImage(resultSet.getBlob("profile"));
          }
      %>
  <!-- Pre-loader start -->
  <div class="theme-loader">
      <div class="loader-track">
          <div class="preloader-wrapper">
              <div class="spinner-layer spinner-blue">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
              <div class="spinner-layer spinner-red">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
            
              <div class="spinner-layer spinner-yellow">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
            
              <div class="spinner-layer spinner-green">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
          </div>
      </div>
  </div>
  <!-- Pre-loader end -->
  <div id="pcoded" class="pcoded">
      <div class="pcoded-overlay-box"></div>
      <div class="pcoded-container navbar-wrapper">
          <nav class="navbar header-navbar pcoded-header">
              <div class="navbar-wrapper">
                  <div class="navbar-logo">
                      <a class="mobile-menu waves-effect waves-light" id="mobile-collapse" href="#!">
                          <i class="ti-menu"></i>
                      </a>
                      <div class="mobile-search waves-effect waves-light">
                          <div class="header-search">
                              <div class="main-search morphsearch-search">
                                  <div class="input-group">
                                      <span class="input-group-addon search-close"><i class="ti-close"></i></span>
                                      <input type="text" class="form-control" placeholder="Enter Keyword">
                                      <span class="input-group-addon search-btn"><i class="ti-search"></i></span>
                                  </div>
                              </div>
                          </div>
                      </div>
                      <a href="#">
                          <img class="img-fluid" src="assets/images/logoBookMyCar.png" height="30" width="100" alt="Theme-Logo" />
                      </a>
                      <a class="mobile-options waves-effect waves-light">
                          <i class="ti-more"></i>
                      </a>
                  </div>
                
                  <div class="navbar-container container-fluid">
                      <ul class="nav-left">
                          <li>
                              <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="ti-menu"></i></a></div>
                          </li>
                        
                          <li>
                              <a href="#!" onclick="javascript:toggleFullScreen()" class="waves-effect waves-light">
                                  <i class="ti-fullscreen"></i>
                              </a>
                          </li>
                      </ul>
                      <ul class="nav-right">
                          
                          <li class="user-profile header-notification">
                              <a href="#!" class="waves-effect waves-light">
                                  <img src="data:image/jpeg;base64,<%=image%>" class="img-radius" alt="User-Profile-Image">
                                  <span><%=name%></span>
                                  <i class="ti-angle-down"></i>
                              </a>
                              <ul class="show-notification profile-notification">
                                 
                                  <li class="waves-effect waves-light">
                                      <a href="OwnerProfile.jsp">
                                          <i class="ti-user"></i> Profile
                                      </a>
                                  </li>
                                  <li class="waves-effect waves-light">
                                      <a href="../LogOut.jsp">
                                          <i class="ti-layout-sidebar-left"></i> Logout
                                      </a>
                                  </li>
                              </ul>
                          </li>
                      </ul>
                  </div>
              </div>
          </nav>

          <div class="pcoded-main-container">
              <div class="pcoded-wrapper">
                  <nav class="pcoded-navbar">
                      <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
                      <div class="pcoded-inner-navbar main-menu">
                          <div class="">
                              <div class="main-menu-header">
                                  <img class="img-80 img-radius" src="data:image/jpeg;base64,<%=image%>" alt="User-Profile-Image">
                                  <div class="user-details">
                                      <span id="more-details"><%=name%><i class="fa fa-caret-down"></i></span>
                                  </div>
                              </div>
        
                              <div class="main-menu-content">
                                  <ul>
                                      <li class="more-details">
                                          <a href="OwnerProfile.jsp"><i class="ti-user"></i>View Profile</a>
                                      
                                          <a href="../LogOut.jsp"><i class="ti-layout-sidebar-left"></i>Logout</a>
                                      </li>
                                  </ul>
                              </div>
                          </div>
                          <div class="p-15 p-b-0">
                            
                          </div>
                          <div class="pcoded-navigation-label" data-i18n="nav.category.navigation"></div>
                          <ul class="pcoded-item pcoded-left-item">
                              
                             
                          </ul>
                          <div class="pcoded-navigation-label" data-i18n="nav.category.forms">Layout</div>
                          <ul class="pcoded-item pcoded-left-item">
                            <li >
                                <a href="Owner_index.jsp" class="waves-effect waves-dark">
                                    <span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
                                    <span class="pcoded-mtext" data-i18n="nav.dash.main">Dashboard</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                            </li>
                              <li class="active">
                                  <a href="AddCars.jsp" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="bi bi-align-center"></i><b>FC</b></span>
                                      <span class="pcoded-mtext" data-i18n="nav.form-components.main">Add Cars</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                              </li>
                              <li>
                                <a href="ViewCars.jsp" class="waves-effect waves-dark">
                                    <span class="pcoded-micon"><i class="bi bi-car-front-fill"></i><b>FC</b></span>
                                    <span class="pcoded-mtext" data-i18n="nav.form-components.main">View Cars</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                            </li>
                              <li>
                                  <a href="ViewBookings.jsp" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="bi bi-book"></i><b>FC</b></span>
                                      <span class="pcoded-mtext" data-i18n="nav.form-components.main">View Bookings</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                              </li>
                              <li>
                                <a href="Feedbacks.jsp" class="waves-effect waves-dark">
                                    <span class="pcoded-micon"><i class="bi bi-chat-text-fill"></i><b>FC</b></span>
                                    <span class="pcoded-mtext" data-i18n="nav.form-components.main">Feedback</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                            </li>
        
                          </ul>
        
                      </div>
                  </nav>
                                 
                  <div class="pcoded-content">
                      <!-- Page-header start -->
                      <div class="page-header">
                          <div class="page-block">
                              <div class="row align-items-center">
                                  <div class="col-md-8">
                                      <div class="page-header-title">
                                          <h5 class="m-b-10">ADD CAR</h5>
                                          <p class="m-b-0">Welcome to BookMyCar</p>
                                      </div>
                                  </div>
                                  <!--Page names-->
                                  <div class="col-md-4">
                                      <ul class="breadcrumb-title">
                                          <li class="breadcrumb-item">
                                              <a href="Owner_index.jsp> <i class="fa fa-home"></i> </a>
                                          </li>
                                          <li class="breadcrumb-item"><a href="#!">Add Cars</a>
                                          </li>
                                      </ul>
                                  </div>
                              </div>
                          </div>
                      </div><br><br>
                      <!-- Page-header end -->


                      <div class="container">
                        <h1 style="text-align: center;">Add Car Details</h1>
                        <form action="AddCarAction.jsp" class="row" method="post" name="myform" onsubmit="return validateuser(this);" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="make">vehicle Name :</label>
                                <input type="text" id="name" name="name" class="form-control" >
                            </div>
                    
                            <div class="form-group">
                                <label for="model">Company Name :</label>
                                <input type="text" id="Cname" name="Cname" class="form-control">
                            </div>
                    
                            <div class="form-group">
                                <label for="year">Model :</label>
                                <input type="text" id="model" name="model" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label for="year">Transmission :</label>
                                <input type="text" id="transmission" name="transmission" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label for="year">License Plate number :</label>
                                <input type="text" id="licence" name="licence" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label for="year">Price per Day :</label>
                                <input type="number" id="price" name="price" class="form-control">
                            </div>
                           
                            <div class="form-group">
                                <label for="year">Number Of Seats :</label>
                                <input type="number" id="seats" name="seats" class="form-control" >
                            </div>
                             <div class="form-group">
                                <label for="year">Fuel Type :</label>
                                <input type="text" id="fuel" name="fuel" class="form-control" >
                            </div>
                               <div class="form-group">
                                <label for="year">Color :</label>
                                <input type="text" id="color" name="color" class="form-control">
                            </div>
                             <div>
                            <label class="form-label" for="customFile">Car Image :</label>
                              <input type="file" class="form-control" id="image" name="image" />
                            </div>
                               <div class="form-group">
                                <label for="year">Description :</label>
                                <textArea type="text" id="description" name="description" class="form-control"  ></textarea>
                            </div>
                            <!-- Add more input fields for other details -->
                    
                            <button type="submit" class="btn btn-primary btn-block">Submit</button>
                        </form>
                    </div>
                    
                    <!-- Add Bootstrap JS and jQuery scripts (optional) -->
                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js"></script>
                     
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
   
                                  
                                   <script>
        // Check if the "success" attribute is present in the session
        var successMessage = '${sessionScope.car}';
        if (successMessage !== '') {
            // Display SweetAlert with the success message
            Swal.fire({
                icon: 'success',
                title: 'Success!',
                text: successMessage,
                confirmButtonText: 'OK'
            });

            // Clear the "success" attribute from the session to avoid showing the alert again
            <% session.removeAttribute("car"); %>
        }
    </script>
    <script>
        // Check if the "success" attribute is present in the session
        var successMessage = '${sessionScope.car1}';
        if (successMessage !== '') {
            // Display SweetAlert with the success message
            Swal.fire({
                icon: 'error',
                title: 'Success!',
                text: successMessage,
                confirmButtonText: 'OK'
            });

            // Clear the "success" attribute from the session to avoid showing the alert again
            <% session.removeAttribute("car1"); %>
        }
    </script>
    <!-- Required Jquery -->
    <script type="text/javascript" src="assets/js/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery-ui/jquery-ui.min.js "></script>
    <script type="text/javascript" src="assets/js/popper.js/popper.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap/js/bootstrap.min.js "></script>
    <script type="text/javascript" src="assets/pages/widget/excanvas.js "></script>
    <!-- waves js -->
    <script src="assets/pages/waves/js/waves.min.js"></script>
    <!-- jquery slimscroll js -->
    <script type="text/javascript" src="assets/js/jquery-slimscroll/jquery.slimscroll.js "></script>
    <!-- modernizr js -->
    <script type="text/javascript" src="assets/js/modernizr/modernizr.js "></script>
    <!-- slimscroll js -->
    <script type="text/javascript" src="assets/js/SmoothScroll.js"></script>
    <script src="assets/js/jquery.mCustomScrollbar.concat.min.js "></script>
    <!-- Chart js -->
    <script type="text/javascript" src="assets/js/chart.js/Chart.js"></script>
    <!-- amchart js -->
    <script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
    <script src="assets/pages/widget/amchart/gauge.js"></script>
    <script src="assets/pages/widget/amchart/serial.js"></script>
    <script src="assets/pages/widget/amchart/light.js"></script>
    <script src="assets/pages/widget/amchart/pie.min.js"></script>
    <script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
    <!-- menu js -->
    <script src="assets/js/pcoded.min.js"></script>
    <script src="assets/js/vertical-layout.min.js "></script>
    <!-- custom js -->
    <script type="text/javascript" src="assets/pages/dashboard/custom-dashboard.js"></script>
    <script type="text/javascript" src="assets/js/script.js "></script>
</body>

</html>

