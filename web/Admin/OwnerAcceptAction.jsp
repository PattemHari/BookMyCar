<%-- 
    Document   : OwnerAcceptAction
    Created on : 15-Sep-2023, 11:50:43 am
    Author     : Kiran
--%>

<%@page import="com.bookMyCar.owner.OwnerAcceptAction"%>
<%@page import="com.bookMyCar.owner.OwnerLogin"%>
<%@page import="com.bookMyCar.beans.Beans"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   Beans setter=new Beans();
   setter.setEmail(request.getParameter("email"));
   setter.setName(request.getParameter("status"));
   
    if(new OwnerAcceptAction().register(setter)){
    response.sendRedirect("Admin_OwnerApplications.jsp");
    }else{
    response.sendRedirect("ownersLogin.jsp");
    }

%>