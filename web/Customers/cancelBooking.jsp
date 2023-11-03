<%-- 
    Document   : cancelBooking
    Created on : 22-Sep-2023, 4:55:40 pm
    Author     : Kiran
--%>

<%@page import="com.bookMyCar.Customer.BookingCancel"%>
<%@page import="com.bookMyCar.beans.Beans"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
Beans setter=new Beans();
setter.setName(request.getParameter("oemail"));
setter.setEmail(request.getParameter("email"));
setter.setPhone(request.getParameter("car"));
setter.setDate(request.getParameter("fdate"));
setter.setEdate(request.getParameter("tdate"));


if(BookingCancel.cancel(setter)){
 session.setAttribute("book", request.getParameter("car")+"   Booking Canceled");
    response.sendRedirect("MyBookings.jsp");
    }else{
    out.println("not Deleted");
    }


%>
