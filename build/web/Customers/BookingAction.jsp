<%-- 
    Document   : BookingAction
    Created on : 16-Sep-2023, 12:48:48 pm
    Author     : Kiran
--%>


<%@page import="java.util.Properties"%>
<%@page import="com.bookMyCar.Customer.Bookings"%>
<%@page import="com.bookMyCar.beans.Beans"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
Beans setter=new Beans();
setter.setName(request.getParameter("name"));
setter.setEmail(request.getParameter("email"));
setter.setModel((String)session.getAttribute("emailD"));
setter.setFuel((String)session.getAttribute("carD"));
setter.setPhone(request.getParameter("mobile"));
setter.setAdhar(request.getParameter("adhar"));
setter.setAddress(request.getParameter("address"));
setter.setDate(request.getParameter("fDate"));
setter.setEdate(request.getParameter("toDate"));
setter.setPrice(request.getParameter("amount"));
setter.setCLicence(request.getParameter("days"));
if(new Bookings().register(setter)){
    session.setAttribute("book", "Your Request is sent to Owner");
    response.sendRedirect("Customer_index.jsp");
    }else{
    out.println("hello");
    }


%>