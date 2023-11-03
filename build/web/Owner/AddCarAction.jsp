<%-- 
    Document   : AddCarAction
    Created on : 13-Sep-2023, 3:34:14 pm
    Author     : Kiran
--%>

<%@page import="com.bookMyCar.owner.AddCar"%>
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
      if(AddCar.addcars(setter)){
      session.setAttribute("car", "Car Added Successfuly!");
      response.sendRedirect("AddCars.jsp");
    }else{
    session.setAttribute("car1", "Car Add Failure!");
      response.sendRedirect("AddCars.jsp");
    }
    }
    %>
