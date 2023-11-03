<%-- 
    Document   : CarUpdateAction
    Created on : 14-Sep-2023, 2:38:15 pm
    Author     : Kiran
--%>
<%@page import="com.bookMyCar.owner.Updatecar"%>
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
            } else if (fieldName.equals("Cname")) {
                setter.setCompanyName(fieldValue); 
            } else if (fieldName.equals("model")) {
               setter.setModel(fieldValue);
            }  else if (fieldName.equals("transmission")) {
                setter.setTransmission(fieldValue); 
            }  else if (fieldName.equals("licence")) {
                setter.setCLicence(fieldValue);
            } else if (fieldName.equals("price")) {
               setter.setPrice(fieldValue);
            } else if (fieldName.equals("image")) {
               setter.setProfile(DynamicImage.getImage(item));
            }else if (fieldName.equals("seats")) {
               setter.setSeats(fieldValue);
            }else if (fieldName.equals("fuel")) {
               setter.setFuel(fieldValue);
            }else if (fieldName.equals("color")) {
               setter.setColor(fieldValue);
            }else if (fieldName.equals("description")) {
               setter.setDescription(fieldValue);
            }    
        }
        setter.setEmail((String)session.getAttribute("email"));
    if(new Updatecar().register(setter)){
      response.sendRedirect("ViewCars.jsp");
    }

    }
    
%>


