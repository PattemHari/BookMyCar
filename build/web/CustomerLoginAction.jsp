<%-- 
    Document   : CustomerLoginAction
    Created on : 12-Sep-2023, 5:57:30 pm
    Author     : Kiran
--%>

<%@page import="com.bookMyCar.Customer.CustomerLogin"%>
<%@page import="com.bookMyCar.beans.Beans"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   Beans setter=new Beans();
   setter.setEmail(request.getParameter("email"));
   setter.setPassword(request.getParameter("password"));
   // out.println(new CustomerLogin().login(setter).next());
    if(new CustomerLogin().login(setter).next()){
    session.setAttribute("customerEmail", request.getParameter("email"));
    session.setAttribute("customerPassword", request.getParameter("password"));
     session.setAttribute("book", "WelCome to BookMyCar");
    response.sendRedirect("Customers/Customer_index.jsp");
    }else{
     session.setAttribute("fail", "Email/Password Incorrect");
    response.sendRedirect("CustomerLogin.jsp");
    }
%>
