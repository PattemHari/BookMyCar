<%-- 
    Document   : UserProfile
    Created on : 21-Sep-2023, 7:54:41 pm
    Author     : Kiran
--%>

<%@page import="com.bookMyCar.image.ImageString"%>
<%@page import="com.bookMyCar.Customer.CustomerLogin"%>
<%@page import="com.bookMyCar.beans.Beans"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <title>Car Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
             background-image: url('images/bg_2.jpg'); /* Add the background image path here */
        background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 110vh;
        }
        .container {
            display: flex;
            align-items: center;
            justify-content: space-around;
            width: 100%;
            max-width: 1000px;
            background-color:none ;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            overflow: hidden;
        }
        .car-image {
            flex: 1;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .car-image img {
            max-width: 100%;
            max-height: 100%;
            border: 2px solid #333;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }
        .car-details {
            flex: 2;
            padding: 20px;
        }
        .car-details h2 {
            font-size: 28px;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #333;
        }
        .car-details p {
            font-size: 18px;
            margin: 10px 0;
        }
        .car-details strong {
            font-weight: bold;
        }
        .car-details ul {
            list-style-type: none;
            padding: 0;
        }
        .car-details li {
            margin-bottom: 5px;
        }
        .car-profile {
    background-color: rgba(255, 255, 255, 0.7); /* Change this to the desired background color */
    color: #333; /* Change this to the desired text color */
    padding: 20px; /* Add padding or other styles as needed */
    border-radius: 10px; /* Add border radius or other styles as needed */
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* Add box shadow or other styles as needed */
}

.edit-button {
    background-color: hsla(118, 100%, 35%, 0.978); /* Change this to the desired button background color */
    color: #fff; /* Change this to the desired button text color */
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}

.edit-button:hover {
    background-color: hsla(0, 0%, 100%, 0.978); /* Change this to the desired button background color on hover */
    color: hsl(0, 100%, 0%);
}

.edit-form {
            position: absolute; /* Add absolute positioning */
            top: 0; /* Position at the top */
            left: 0; /* Position at the left */
            display: none;
         
            max-width: 1000px;
            margin: 0 auto;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: rgba(255, 255, 255, 0);
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
            padding: 8px;
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
            width: 100%; /* Adjust the width as needed */
            max-width: 1000px; /* Limit the maximum width */
            padding: 10px;
            background-color: #fff;
            z-index: 2;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
        }
        
       
    





        .login-form {
    background-color: rgba(255, 255, 255, 0.7); /* Background color with transparency */
    color: #000; /* Text color changed to black */
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
    text-align: center; /* Center-align the content within the form */
}

.login-form table {
    width: 100%;
}

.login-form td {
    padding: 10px;
}

.login-form input[type="text"],
.login-form input[type="password"],
.login-form input[type="email"],
.login-form input[type="date"],
.login-form input[type="file"] {
    width: 100%;
    padding: 8px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

/* Center-align the buttons within the form */
.login-form .button-container {
    text-align: center;
    margin-top: 20px; /* Add some top margin for spacing */
}

.login-form button.edit-button {
    background-color: hsla(118, 100%, 35%, 0.978);
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    margin-right: 10px;
}

.login-form button.cancel {
    background-color: #ccc;
}

.login-form button.edit-button:hover {
    background-color: hsla(0, 0%, 100%, 0.978);
    color: hsl(0, 100%, 0%);
}



       
        
    </style>
    
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.all.min.js"></script>
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
	          <li class="nav-item"><a href="MyBookings.jsp" class="nav-link">My Bookings</a></li>
	          <li class="nav-item active"><a href="UserProfile.jsp" class="nav-link">Profile</a></li>
                  <li class="nav-item "><a href="Feedback.jsp" class="nav-link">Feedback</a></li>
                  <li class="nav-item"><a href="../LogOut.jsp" class="nav-link">LogOut</a></li>
	        </ul>
	      </div>
	    </div>
    </nav>
    
    <%
    Beans setter=new Beans();
    setter.setEmail((String)session.getAttribute("customerEmail"));
    setter.setPassword((String)session.getAttribute("customerPassword"));
    ResultSet resultSet=new CustomerLogin().login(setter);
    if(resultSet.next()){
    %>
    <div class="container car-profile">
        <div class="car-image">
            <img src="data:image/jpeg;base64,<%=ImageString.getImage(resultSet.getBlob("profile"))%>" alt="Car Image" height="300" width="1000">
        </div>
        <div class="car-details">
            <h2>Profile</h2>
            <ul>
                <li><strong>Name :</strong> <%=resultSet.getString("name")%></li>
                <li><strong>Email :</strong> <%=resultSet.getString("email")%></li>
                <li><strong>Date Of Birth :</strong> <%=resultSet.getString("dob")%></li>
                <li><strong>Phone :</strong> <%=resultSet.getString("mobile")%></li>
                <li><strong>Address :</strong> <%=resultSet.getString("address")%></li>
                <li><strong>Adhar :</strong> <%=resultSet.getString("adhar")%></li>
            
                    <button class="edit-button" onclick="showEditForm()">Update</button>
                </ul>
            </ul>
        </div>
    </div>
    
    <div class="edit-form" id="editForm">
       
        <div class="container car-profile">
           
            <div class="car-details">
                <form class="login-form" action="UserUpdate.jsp" class="row" method="post" name="myform" enctype="multipart/form-data">
                    <table height="320px">
                        <tr>
                            
                            <td><input type="text" name="name" value="<%=resultSet.getString("name")%>" required></td>
            
                          
                            <td><input type="text" name="email" value="<%=resultSet.getString("email")%>" readonly></td>
                        </tr>
                        <tr>
                           
                            <td><input type="text" name="mobile" value="<%=resultSet.getString("mobile")%>" required></td>
            
                          
                            <td><input type="text" name="adhar" value="<%=resultSet.getString("adhar")%>" required></td>
                        </tr>
                        <tr>
                           
                            <td><input type="text" name="address" value="<%=resultSet.getString("address")%>" required></td>
            
                            
                            <td><input type="text" name="dob" value="<%=resultSet.getString("dob")%>" required ></td>
                        </tr>
                       
                        <tr>
                         
                            <td><input type="file" name="profile" placeholder="PROFILE"></td>
                        </tr>
                    </table>
            
                        <input type="submit" class="edit-button" value="Save">
                    <button type="button" onclick="cancelEdit()" class="edit-button cancel">Cancel</button>
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

        function saveChanges() {
            // Get values from the form and update the profile details
            const name = document.getElementById("name").value;
            const email = document.getElementById("email").value;
            const location = document.getElementById("location").value;
            const age = document.getElementById("age").value;

            document.getElementsByClassName("user-name")[0].textContent = name;
            document.getElementsByClassName("user-info")[0].textContent = "Email: " + email;
            document.getElementsByClassName("user-info")[1].textContent = "Location: " + location;
            document.getElementsByClassName("user-info")[2].textContent = "Age: " + age;

            // Hide the edit form and show the updated profile details
            document.getElementById("editForm").style.display = "none";
            document.getElementsByClassName("user-details")[0].style.display = "block";
        }

        function cancelEdit() {
            // Hide the edit form and show the profile details without making any changes
            document.getElementById("editForm").style.display = "none";
            document.getElementsByClassName("user-details")[0].style.display = "block";
        }
    </script>
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
</body>
</html>

