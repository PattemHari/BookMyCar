<%-- 
    Document   : UpdateOwnerProfile
    Created on : 27-Sep-2023, 11:10:22 am
    Author     : Kiran
--%>

<%@page import="com.bookMyCar.owner.UpdateProfile"%>
<%@page import="com.bookMyCar.image.DynamicImage"%>
<%@page import="com.bookMyCar.beans.Beans"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
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
            }else if (fieldName.equals("password")) {
               setter.setPassword(fieldValue);
            }         
        }
        setter.setPassword((String)session.getAttribute("password"));
       if(UpdateProfile.update(setter)){
       session.setAttribute("update", "Updation SuccessFull");
      response.sendRedirect("OwnerProfile.jsp");
    }
    }
    
%>
