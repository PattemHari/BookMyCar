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
            width: 400%;
            max-width: 700px;
            background-color:transparent;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            overflow: hidden;
        }
       
        .feedback-form {
    background-color: rgba(255, 255, 255, 0.7); /* Change this to the desired background color */
    color: #333; /* Change this to the desired text color */
    padding: 20px; /* Add padding or other styles as needed */
    border-radius: 10px; /* Add border radius or other styles as needed */
     width: 600px; 
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* Add box shadow or other styles as needed */
}



 h1 {
            text-align: center;
            color: #007BFF;
        }

        .rating {
            text-align: center;
            font-size: 40px;
            margin-bottom: 20px;
        }

        .star {
            color: white; /* Default gray color */
            cursor: pointer;
            transition: color 0.2s ease; /* Smooth color transition */
        }

        .star:hover {
            color: #FFD700; /* Gold color on hover */
        }

        textarea {
            width: 100%;
            padding: 10px;
            height: 1000%;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            resize: none; /* Prevent textarea resizing */
        }

        button {
            background-color: #007BFF;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            transition: background-color 0.2s ease; /* Smooth background color transition */
        }

        button:hover {
            background-color: #0056b3;
        }
        
    .rating {
      font-size: 60px;
      cursor: pointer;
    }

    .star {
      padding: 5px;
    }

    .star:hover {
      color: gold;
    }

    .star.active {
      color: gold;
    }


    /* Adjust the width of the breadcrumb list */
    #breadcrumb-list {
        width: 600px; /* You can change the width to your desired value */
    }
     .navbar .container {
        max-width: 1200px; /* You can change the width to your desired value */
    }
    .button{
        
    }
    

       
        
    </style>
    
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.all.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="#">Book<span>MyCar</span></a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto" id="breadcrumb-list">
	          <li class="nav-item "><a href="Customer_index.jsp" class="nav-link">Home</a></li>
	          <li class="nav-item"><a href="MyBookings.jsp" class="nav-link">My Bookings</a></li>
	          <li class="nav-item "><a href="UserProfile.jsp" class="nav-link">Profile</a></li>
                  <li class="nav-item active"><a href="hello.jsp" class="nav-link">Feedback</a></li>
                  <li class="nav-item"><a href="../LogOut.jsp" class="nav-link">LogOut</a></li>
	        </ul>
	      </div>
	    </div>
    </nav>
    
    
             <div class="container">
                      <div class="feedback-form" >
                    <h1 class="color-primary">Feedback Form</h1>
      
            <form action="FeedbackAction.jsp">
          
           <div class="rating">
            <span class="star" data-value="1">&#9733;</span>
            <span class="star" data-value="2">&#9733;</span>
            <span class="star" data-value="3">&#9733;</span>
            <span class="star" data-value="4">&#9733;</span>
            <span class="star" data-value="5">&#9733;</span>
          </div>
    
          <!-- You can use an input field to store the rating value -->
          <input type="hidden" id="ratingValue" name="rating" value="0">
      
          <p>Selected rating: <span id="selectedRating">0</span></p>
       
      
        
        
          <textarea name="message" id="message"  class="form-control mb-3" placeholder="Your Message"></textarea>
          <button type="submit" value="send" class="btn btn-primary">SEND MESSAGE</button>
        </form>
             </div>
             </div>
  
        
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      
        <!-- Bootstrap JS -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script>
          $(document).ready(function() {
            $(".star").click(function() {
              var value = parseInt($(this).attr("data-value"));
              $("#ratingValue").val(value);
              $(".star").removeClass("active");
              $(this).prevAll().addBack().addClass("active");
              $("#selectedRating").text(value);
            });
          });
        </script>
       <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        
     <script>
        // Check if the "success" attribute is present in the session
        var successMessage = '${sessionScope.feed}';
        if (successMessage !== '') {
            // Display SweetAlert with the success message
            Swal.fire({
                icon: 'success',
                title: 'Success!',
                text: successMessage,
                confirmButtonText: 'OK'
            });

            // Clear the "success" attribute from the session to avoid showing the alert again
            <% session.removeAttribute("feed"); %>
        }
    </script>
    <script>
        // Check if the "success" attribute is present in the session
        var successMessage = '${sessionScope.feedback}';
        if (successMessage !== '') {
            // Display SweetAlert with the success message
            Swal.fire({
                icon: 'error',
                title: 'Failure!',
                text: successMessage,
                confirmButtonText: 'OK'
            });

            // Clear the "success" attribute from the session to avoid showing the alert again
            <% session.removeAttribute("feedback"); %>
        }
    </script>
</body>
</html>

