<%-- 
    Document   : CustomerRegisterAction
    Created on : 12-Sep-2023, 5:15:26 pm
    Author     : Kiran
--%>
<%@page import="com.bookMyCar.Customer.GetUser"%>
<%@page import="com.bookMyCar.Customer.CustomerRegister"%>
<%@page import="com.bookMyCar.owner.RegisterOwner"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="com.bookMyCar.beans.Beans"%>
<%@page import="com.bookMyCar.image.DynamicImage"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   
   boolean isMultipart = ServletFileUpload.isMultipartContent(request);
  
    if (isMultipart) {
        // Create a new file upload handler
        DiskFileItemFactory factory = new DiskFileItemFactory();
       
        ServletFileUpload upload = new ServletFileUpload(factory);
        List<FileItem> items = upload.parseRequest(request);
   Beans setter = new Beans();
    for (FileItem item : items) {
            String fieldName = item.getFieldName();
            String fieldValue = item.getString(); // Get the value of the form field 
            if (fieldName.equals("name")) {
               setter.setName(fieldValue);   
            } else if (fieldName.equals("email")) {
                setter.setEmail(fieldValue); 
            } else if (fieldName.equals("mobile")) {
               setter.setPhone(fieldValue);
            }  else if (fieldName.equals("adhar")) {
                setter.setAdhar(fieldValue); 
            }  else if (fieldName.equals("address")) {
                setter.setAddress(fieldValue);
            } else if (fieldName.equals("dob")) {
               setter.setDate(fieldValue);
            } else if (fieldName.equals("profile")) {
               setter.setProfile(DynamicImage.getImage(item));
            }else if (fieldName.equals("license")) {
               setter.setLicence(DynamicImage.getImage(item));
            }
            else if (fieldName.equals("password")) {
               setter.setPassword(fieldValue);
            }         
        }
        ResultSet result=GetUser.get(setter);
        if(!result.next()){
      if(new CustomerRegister().register(setter)){
      session.setAttribute("customer", "Registration Successfuly");
      response.sendRedirect("CustomerLogin.jsp");
    }
    }else{
    session.setAttribute("customer", "User Already Existed");
     response.sendRedirect("customerRegister.jsp");
    
    }
    }
    
%>
