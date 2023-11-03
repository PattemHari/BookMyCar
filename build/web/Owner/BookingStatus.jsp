<%-- 
    Document   : OwnerAcceptAction
    Created on : 15-Sep-2023, 11:50:43 am
    Author     : Kiran
--%>

<%@page import="java.util.Properties"%>
<%@page import="com.bookMyCar.owner.BookingAccepting"%>
<%@page import="com.bookMyCar.owner.OwnerAcceptAction"%>
<%@page import="com.bookMyCar.owner.OwnerLogin"%>
<%@page import="com.bookMyCar.beans.Beans"%>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   Beans setter=new Beans();
   setter.setEmail(request.getParameter("email"));
   setter.setName(request.getParameter("status"));
   setter.setEdate(request.getParameter("Oemail"));
   setter.setCompanyName(request.getParameter("car"));
   setter.setDate(request.getParameter("date"));
   if(request.getParameter("status").equals("Accepted")){
    if(BookingAccepting.Accept(setter)){
     try {
       
        String name = request.getParameter("name");
        String email=request.getParameter("Oemail");
      String cemail=request.getParameter("email");
        

        // Create the SQL query
         
            final String fromEmail = "projects@codebook.in";
          final String senderPassword = "frwqvhawrnsxetyk"; 
     


            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.ssl.protocols", "TLSv1.2");

            Session esession = Session.getInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, senderPassword);
                }
            });

            // Prepare the email message
            MimeMessage message = new MimeMessage(esession);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(cemail));
            message.setSubject("Car Booking Details");
           message.setText("Hi " + name + "\n\n"
               + "Your Booking has comfirmed . \n Below are the Driver's contact details \n"
               + "Driver Email : " + email+"\n"
               +"Thanks For booking the car .Enjoy your trip \n"
               +"For any other queries feel free to contack us 8555887996");

            Transport.send(message);

            // Redirect with success message
           // session.setAttribute("email", email);

           } catch (Exception e) {
        out.println("Exception: " + e.getMessage());
        }
    response.sendRedirect("ViewBookings.jsp");
    }else{
    response.sendRedirect("ViewBookings.jsp");
    }
    }else if(BookingAccepting.Accept(setter)){
     response.sendRedirect("ViewBookings.jsp");
    }

%>