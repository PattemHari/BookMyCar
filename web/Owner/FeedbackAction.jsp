<%-- 
    Document   : FeedbackAction
    Created on : 26-Sep-2023, 11:23:47 am
    Author     : Kiran
--%>
<%@page import="com.bookMyCar.admin.GiveFeedback"%>
<%@page import="com.bookMyCar.owner.OwnerLogin"%>
<%@page import="java.sql.*"%>
<%@page import="com.bookMyCar.beans.Beans"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
Beans setter=new Beans();
 setter.setEmail((String)session.getAttribute("email"));
 setter.setPassword((String)session.getAttribute("password"));
 ResultSet resultSet=new OwnerLogin().login(setter);
 if(resultSet.next()){
setter.setName(resultSet.getString("name"));
setter.setProfile(resultSet.getBlob("profile"));
    }
   setter.setAdhar(request.getParameter("rating"));
   setter.setDescription(request.getParameter("feedback"));
   setter.setAddress("Owner");
 if(GiveFeedback.feedback(setter)){
   session.setAttribute("feed", "Thanks for you feedback");
   response.sendRedirect("Feedbacks.jsp");
    }else{
    session.setAttribute("feedback", "your feedback not Submited");
    response.sendRedirect("Feedbacks.jsp");
    }
  
%>
