<%-- 
    Document   : DeleteCar
    Created on : 23-Sep-2023, 12:16:26 pm
    Author     : Kiran
--%>

<%@page import="com.bookMyCar.owner.DeleteCar"%>
<%@page import="com.bookMyCar.beans.Beans"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String encodedCollegeName = request.getParameter("email");
    String encodedDeportment = request.getParameter("car");
 
 String decodedemail = java.net.URLDecoder.decode(encodedCollegeName, "UTF-8");
 String decodedDeportment = java.net.URLDecoder.decode(encodedDeportment, "UTF-8");
Beans setter=new Beans();
setter.setEmail(decodedemail);
setter.setName(decodedDeportment);
if(DeleteCar.deleteCar(setter)){
  session.setAttribute("delete", request.getParameter("car")+" Deletion Success!");
   response.sendRedirect("ViewCars.jsp");
    }else{
    session.setAttribute("delete1", request.getParameter("car")+" Deletion failure!");
   response.sendRedirect("ViewCars.jsp");
    }
%>