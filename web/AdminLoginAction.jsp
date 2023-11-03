<%-- 
    Document   : AdminLoginAction
    Created on : 13-Sep-2023, 2:16:12 pm
    Author     : Kiran
--%>

<%@page import="com.bookMyCar.admin.AdminLogin"%>
<%@page import="com.bookMyCar.beans.Beans"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
Beans setter=new Beans();
   setter.setName(request.getParameter("name"));
   setter.setPassword(request.getParameter("password"));
   // out.println(new CustomerLogin().login(setter).next());
    if(new AdminLogin().login(setter).next()){
    session.setAttribute("Alogin", "Welcome Admin");
    response.sendRedirect("Admin/Admin_index.jsp");
    }else{
     session.setAttribute("Alogin", "UserName/Password Incorrect");
    response.sendRedirect("adminLogin.jsp");
    }
%>
