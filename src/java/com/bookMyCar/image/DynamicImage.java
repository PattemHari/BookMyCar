/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookMyCar.image;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.*;
import org.apache.commons.fileupload.FileItem;


/**
 *
 * @author Kiran
 */
public class DynamicImage {
    
    public static Blob getImage(FileItem item){
    Blob blob=null;
         byte[] fileData=null;
        try {
                if (!item.isFormField()) { 
                        InputStream inputStream = item.getInputStream();
                        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                        byte[] buffer = new byte[4096];
                        int bytesRead;
                        while ((bytesRead = inputStream.read(buffer)) != -1) {
                            outputStream.write(buffer, 0, bytesRead);
                        }
                         fileData = outputStream.toByteArray();
          
                        // Create a Blob object from the byte array
                         blob= new javax.sql.rowset.serial.SerialBlob(fileData);
                } 
            }catch(Exception e){
                    e.printStackTrace();
                   }
          return blob;
         }
}
