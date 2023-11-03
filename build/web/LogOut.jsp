<%-- 
    Document   : LogOut
    Created on : 27-Sep-2023, 12:07:11 pm
    Author     : Kiran
--%>

<%@page import="com.bookMyCar.connections.ConnectionCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ConnectionCon.closeConnection();
    response.sendRedirect("index.jsp");
%>
