<%-- 
    Document   : FeedbackAction
    Created on : 26-Sep-2023, 10:45:18 am
    Author     : Kiran
--%>
<%@page import="com.bookMyCar.admin.GiveFeedback"%>
<%@page import="com.bookMyCar.Customer.CustomerLogin"%>
<%@page import="java.sql.*"%>
<%@page import="com.bookMyCar.beans.Beans"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
Beans setter=new Beans();
 setter.setEmail((String)session.getAttribute("customerEmail"));
 setter.setPassword((String)session.getAttribute("customerPassword"));
 ResultSet resultSet=new CustomerLogin().login(setter);
 if(resultSet.next()){
setter.setName(resultSet.getString("name"));
setter.setProfile(resultSet.getBlob("profile"));
    }
   setter.setAdhar(request.getParameter("rating"));
  
   setter.setDescription(request.getParameter("message"));
   setter.setAddress("Customer");
   if(GiveFeedback.feedback(setter)){
   session.setAttribute("feed", "Thanks for you feedback");
   response.sendRedirect("Feedback.jsp");
    }else{
    session.setAttribute("feedback", "your feedback not Submited");
    response.sendRedirect("Feedback.jsp");
    }
   
%>