<%-- 
    Document   : OwnerLoginAction
    Created on : 13-Sep-2023, 2:30:10 pm
    Author     : Kiran
--%>
<%@page import="java.sql.*" %>
<%@page import="com.bookMyCar.owner.OwnerLogin"%>
<%@page import="com.bookMyCar.beans.Beans"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   Beans setter=new Beans();
   setter.setEmail(request.getParameter("email"));
   setter.setPassword(request.getParameter("password"));
   setter.setName("Accepted");
   // out.println(new CustomerLogin().login(setter).next());
   ResultSet resultSet=new OwnerLogin().login(setter);
    if(resultSet.next()){
    if(resultSet.getString("status").equals("Accepted")){
    session.setAttribute("Ologin", "WelCome");
    session.setAttribute("email", request.getParameter("email"));
    session.setAttribute("password", request.getParameter("password"));
    response.sendRedirect("Owner/Owner_index.jsp");
    }else{
    session.setAttribute("status", "You Application Was " +resultSet.getString("status"));
     response.sendRedirect("ownersLogin.jsp");
    }
    }else{
     session.setAttribute("status1", "Email/Password Incorrect");
    response.sendRedirect("ownersLogin.jsp");
    }
%>