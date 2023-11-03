<%-- 
    Document   : Admin_viewCars
    Created on : 15-Sep-2023, 12:40:54 pm
    Author     : Kiran
--%>
<%@page import="com.bookMyCar.owner.OwnerLogin"%>
<%@page import="java.sql.*" %>
<%@page import="com.bookMyCar.image.ImageString"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Mega Able bootstrap admin template by codedthemes </title>
    <!-- HTML5 Shim and Respond.js IE10 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 10]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
      <!-- Meta -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="description" content="Mega Able Bootstrap admin template made using Bootstrap 4 and it has huge amount of ready made feature, UI components, pages which completely fulfills any dashboard needs." />
      <meta name="keywords" content="bootstrap, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
      <meta name="author" content="codedthemes" />
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

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }
    
            h1 {
                text-align: center;
                margin-top: 20px;
                color: #333;
            }
    
            table {
                width: 95%;
                margin: 20px auto;
                border-collapse: collapse;
                background-color: #fff;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
                border-radius: 5px;
                overflow: hidden;
            }
    
            th, td {
                padding: 15px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
    
            th {
                background-color: #609ff8;
                color: #333;
                text-transform: uppercase;
            }
    
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
    
            tr:hover {
                background-color: #ddd;
            }
    
            a {
                text-decoration: none;
                color: #007bff;
            }
    
            a:hover {
                text-decoration: underline;
            }
    
           
    
            .edit-button:hover, .delete-button:hover {
                background-color: #0056b3;
            }
    
            .edit-button {
                margin-right: 5px;
            }
          
    /* Style for the "Car Details" button */
    .car-details-button {
        display: inline-block;
        padding: 10px 20px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 25px;
        text-decoration: none;
        transition: background-color 0.3s ease;
        font-weight: bold;
        cursor: pointer;
        /* Add a box-shadow */
        box-shadow: 0px 10px 6px rgba(0, 0, 0, 0.1);
    }

    .car-details-button:hover {
        background-color: #0056b3;
    }

    /* Optional: Add a margin to the button for spacing */
    .car-details-button {
        margin: 5px;
    }
</style>

            
        
      <!-- Style.css -->
      <link rel="stylesheet" type="text/css" href="assets/css/style.css">
  </head>

  <body>
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
                          <img class="img-fluid" src="assets/images/logoBookMyCar.png" alt="Theme-Logo" height="150" width="150"/>
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
                                  <img src="assets/images/avatar-4.jpg" class="img-radius" alt="User-Profile-Image">
                                  <span>John Doe</span>
                                  <i class="ti-angle-down"></i>
                              </a>
                              <ul class="show-notification profile-notification">
                                  
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
                                  <img class="img-80 img-radius" src="assets/images/avatar-4.jpg" alt="User-Profile-Image">
                                  <div class="user-details">
                                      <span id="more-details">John Doe<i class="fa fa-caret-down"></i></span>
                                  </div>
                              </div>
        
                              <div class="main-menu-content">
                                  <ul>
                                      <li class="more-details">
                                         
                                          <a href="../LogOut.jsp"><i class="ti-layout-sidebar-left"></i>Logout</a>
                                      </li>
                                  </ul>
                              </div>
                          </div><br><br>
                         
                          <div class="pcoded-navigation-label" data-i18n="nav.category.navigation">Layout</div>
                          <ul class="pcoded-item pcoded-left-item">
                              <li >
                                  <a href="Admin_index.jsp" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
                                      <span class="pcoded-mtext" data-i18n="nav.dash.main">Dashboard</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                              </li>
                              <li >
                                <a href="Admin_ViewBookings.jsp" class="waves-effect waves-dark">
                                    <span class="pcoded-micon"><i class="bi bi-book-half"></i><b>B</b></span>
                                    <span class="pcoded-mtext" data-i18n="nav.dash.main">View Bookings</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                            </li>
                            <li >
                                <a href="Admin_ViewUsers.jsp" class="waves-effect waves-dark">
                                    <span class="pcoded-micon"><i class="bi bi-universal-access"></i><b>U</b></span>
                                    <span class="pcoded-mtext" data-i18n="nav.dash.main">View Users</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                            </li>
                            <li >
                                <a href="Admin_OwnerApplications.jsp" class="waves-effect waves-dark">
                                    <span class="pcoded-micon"><i class="bi bi-person-fill"></i><b>O</b></span>
                                    <span class="pcoded-mtext" data-i18n="nav.dash.main">Owner Applications</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                            </li>
                            <li class="active">
                                <a href="Admin_ViewCars.jsp" class="waves-effect waves-dark">
                                    <span class="pcoded-micon"><i class="bi bi-car-front"></i><b>C</b></span>
                                    <span class="pcoded-mtext" data-i18n="nav.dash.main">View Cars</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                            </li>
                            <li >
                                <a href="Admin_Feedbacks.jsp" class="waves-effect waves-dark">
                                    <span class="pcoded-micon"><i class="bi bi-chat-left-text-fill"></i><b>F</b></span>
                                    <span class="pcoded-mtext" data-i18n="nav.dash.main">Owner Feedback</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                            </li>
                            <li>
                                <a href="Admin_UserFeedback.jsp" class="waves-effect waves-dark">
                                    <span class="pcoded-micon"><i class="bi bi-chat-left-text-fill"></i><b>Q</b></span>
                                    <span class="pcoded-mtext" data-i18n="nav.dash.main">User Feedback</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                            </li>               
                      </div>
                  </nav>
                  <div class="pcoded-content">
                      <!-- Page-header start -->
                      <div class="page-header">
                          <div class="page-block">
                              <div class="row align-items-center">
                                  <div class="col-md-8">
                                      <div class="page-header-title">
                                          <h5 class="m-b-10">View Cars</h5>
                                          <p class="m-b-0">Welcome to BookMyCar</p>
                                      </div>
                                  </div>
                                  <div class="col-md-4">
                                      <ul class="breadcrumb-title">
                                          <li class="breadcrumb-item">
                                              <a href="Admin_index.jsp"> <i class="fa fa-home"></i> </a>
                                          </li>
                                          <li class="breadcrumb-item"><a href="#!">View Cars</a>
                                          </li>
                                      </ul>
                                  </div>
                              </div>
                          </div>
                      </div>
                      <!-- Page-header end -->
                      <body>
                        <h1>Cars Details</h1>
                        <div class="table-container">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Car</th> <!-- New column for images -->
                                        <th>Owner ID</th>
                                        <th>Plate Number</th>
                                        <th>Name</th>
                                        <th>Model</th>
                                        <th>Price</th>
                                        <th>Car Detals</th>
                                        
                                    </tr>
                                </thead>
                                <%
                                ResultSet resultSet=new OwnerLogin().viewCars();
                                while(resultSet.next()){
                                %>
                                <tbody>
                                    <tr>
                                      
                                        <td><img src="data:image/jpeg;base64,<%=ImageString.getImage(resultSet.getBlob("image"))%>"  class="car-image" height="100" width="100" style="border: 2px solid #609ff8;margin: 10px;"></td> <!-- Image example -->
                                        <td><%=resultSet.getString("id")%></td>
                                        <td><%=resultSet.getString("licence")%></td>
                                        <td><%=resultSet.getString("carName")%></td>
                                        <td><%=resultSet.getString("model")%></td>
                                        <td><%=resultSet.getString("price")%></td>
                                        <td>
                                            <a href="Admin_CarDetails.jsp?email=<%=resultSet.getString("email")%>&car=<%=resultSet.getString("carName")%>" class="btn btn-primary car-details-button">Car Details</a>
                                        </td>
                                      
                                    </tr>
                                   
                                    <!-- Add more rows as needed -->
                                </tbody>
                                <%
                                    }
                                %>
                            </table>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
  
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

