<%-- 
    Document   : OwnerProfile
    Created on : 26-Sep-2023, 12:42:54 pm
    Author     : Kiran
--%>
<%@page import="com.bookMyCar.image.ImageString"%>
<%@page import="java.sql.*"%>
<%@page import="com.bookMyCar.owner.OwnerLogin"%>
<%@page import="com.bookMyCar.beans.Beans"%>
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
      <style>
        /* Profile container styles */
        .profile-container {
            position: relative; /* Add relative positioning */
            display: flex;
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        .user-photo img {
            max-width: 1000px;
            border-radius: 50%;
            margin-right: 150px;
        }

        .user-details {
            flex-grow: 5;
        }

        .user-name {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .user-info {
            font-size: 16px;
            margin-bottom: 5px;
        }

        /* Style for the Edit button */
        .edit-button {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .edit-button:hover {
            background-color: #0056b3;
        }

        /* Style for the edit form */
        .edit-form {
            position: absolute; /* Add absolute positioning */
            top: 0; /* Position at the top */
            left: 0; /* Position at the left */
            display: none;
            max-width: 1000px;
            margin: 0 auto;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #fff;
            overflow: hidden;
            z-index: 2; /* Set a higher z-index to overlay the profile container */
        }

        .edit-form .user-photo {
            float: left;
            width: 40%;
            padding: 20px;
        }

        .edit-form .user-photo img {
            max-width: 100%;
        }

        .edit-form .user-form {
            float: left;
            width: 60%;
            padding: 20px;
        }

        .edit-form label {
            display: block;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .edit-form input[type="text"],
        .edit-form input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        .edit-form button {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .edit-form button.cancel {
            background-color: #ccc;
        }

        .edit-form button:hover {
            background-color: #0056b3;
        }
        .edit-form {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%; /* Expand to full width */
            padding: 20px;
            background-color: #fff;
            z-index: 2;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2); /* Add a shadow */
        }
        .edit-form {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 80%; /* Adjust the width as needed */
            max-width: 1000px; /* Limit the maximum width */
            padding: 20px;
            background-color: #fff;
            z-index: 2;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
        }
    </style>
    
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.all.min.js"></script>
  </head>

  <body>
      
       <%
         Beans set=new Beans();
         set.setEmail((String)session.getAttribute("email"));
         set.setPassword((String)session.getAttribute("password"));
         ResultSet result=new OwnerLogin().login(set);
          String name="",image="";
         if(result.next()){
           name=result.getString("name");
           image=ImageString.getImage(result.getBlob("profile"));
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
                              <li >
                                  <a href="AddCars.jsp" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="bi bi-align-center"></i><b>FC</b></span>
                                      <span class="pcoded-mtext" data-i18n="nav.form-components.main">Add Cars</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                              </li>
                              <li >
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
                              <li >
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
                                          <h5 class="m-b-10">User profile</h5>
                                        
                                      </div>
                                  </div>
                                  <!--Page names-->
                                  <div class="col-md-4">
                                      <ul class="breadcrumb-title">
                                          <li class="breadcrumb-item">
                                              <a href="Owner_index.jsp"> <i class="fa fa-home"></i> </a>
                                          </li>
                                          <li class="breadcrumb-item"><a href="#!">User Profile</a>
                                          </li>
                                      </ul>
                                  </div>
                              </div>
                          </div>
                      </div><br><br>
                      <!-- Page-header end -->
                     <%
                      Beans setter=new Beans();
                      setter.setEmail((String)session.getAttribute("email"));
                      setter.setPassword((String)session.getAttribute("password"));
                    ResultSet resultSet=new OwnerLogin().login(setter);
                    if(resultSet.next()){
                     %>

                      <div class="profile-container">
                        <div class="user-photo">
                            <img src="data:image/jpeg;base64,<%=ImageString.getImage(resultSet.getBlob("profile"))%>" alt="User Photo" height="250" width="250">
                        </div>
                        <div class="user-details">
                            <div class="user-name"><%=resultSet.getString("name")%></div>
                            <div class="user-info"><strong>Email: </strong><%=resultSet.getString("email")%></div>
                            <div class="user-info"><strong>Mobile:</strong> <%=resultSet.getString("mobile")%></div>
                            <div class="user-info"><strong>Date Of Birth:</strong><%=resultSet.getString("dob")%></div>
                            <div class="user-info"><strong>Adhar: </strong><%=resultSet.getString("adhar")%></div>
                            <div class="user-info"><strong>Location:</strong> <%=resultSet.getString("address")%></div>
                             
                            <!-- Add more user details here -->
                            <button class="edit-button" onclick="showEditForm()">Edit</button>
                        </div>
                    </div><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                
                    <!-- Edit Profile Form -->
                    <div class="edit-form" id="editForm">
                        <div class="user-photo">
                            <img src="data:image/jpeg;base64,<%=ImageString.getImage(resultSet.getBlob("profile"))%>" alt="User Photo">
                        </div>
                        <div class="user-form">
                            <form class="login-form" action="UpdateOwnerProfile.jsp" class="row" method="post" name="myform" enctype="multipart/form-data">
                                <label for="name">Name:</label>
                                <input type="text" id="name" name="name" value="<%=resultSet.getString("name")%>"><br>
                                
                                <label for="email">Email:</label>
                                <input type="email" id="email" name="email" value="<%=resultSet.getString("email")%>" readonly><br>
     
                                <label for="adhar">Adhar :</label>
                                <input type="text" id="adhar" name="adhar" value="<%=resultSet.getString("adhar")%>"><br>
                            
                                  <label for="mobile">Mobile:</label>
                                <input type="text" id="mobile" name="mobile" value="<%=resultSet.getString("mobile")%>"><br>
                                
                                  <label for="dob">Date Of Birth:</label>
                                <input type="text" id="dob" name="dob" value="<%=resultSet.getString("dob")%>"><br>
                                
                                  <label for="address">Location:</label>
                                <input type="text" id="address" name="address" value="<%=resultSet.getString("address")%>"><br>
                                <label for="profile">Profile:</label>
                                <input type="file" id="profile" name="profile" ><br><br>
                                <!-- Add more input fields for additional user details here -->
                
                                <input  type="submit" value="Update" style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer;">
                                <button type="button" class="cancel" onclick="cancelEdit()">Cancel</button>
                            </form>
                        </div>
                    </div>
                <%
                    }               
                %>
                    <script>
                        function showEditForm() {
                            // Hide the profile details and show the edit form
                            document.getElementById("editForm").style.display = "block";
                            document.getElementsByClassName("user-details")[0].style.display = "none";
                        }
                        function cancelEdit() {
                            // Hide the edit form and show the profile details without making any changes
                            document.getElementById("editForm").style.display = "none";
                            document.getElementsByClassName("user-details")[0].style.display = "block";
                        }
                    </script>
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
        var successMessage = '${sessionScope.update}';
        if (successMessage !== '') {
            // Display SweetAlert with the success message
            Swal.fire({
                icon: 'success',
                title: 'Success!',
                text: successMessage,
                confirmButtonText: 'OK'
            });

            // Clear the "success" attribute from the session to avoid showing the alert again
            <% session.removeAttribute("update"); %>
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

