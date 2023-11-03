/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookMyCar.image;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.*;
import java.util.Base64;

/**
 *
 * @author Kiran
 */
public class ImageString {
    
    public static String getImage(Blob image1)throws Exception{
        InputStream inputStream1=image1.getBinaryStream();
               ByteArrayOutputStream outputStream=new ByteArrayOutputStream();
               byte[] arr=new byte[4096];
               int ch;
               while((ch=inputStream1.read(arr))!=-1){
                outputStream.write(arr, 0, ch);
    }
      
    return Base64.getEncoder().encodeToString(outputStream.toByteArray());
    }
    
}
