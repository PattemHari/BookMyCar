/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookMyCar.owner;
import java.sql.*;
import com.bookMyCar.beans.Beans;
import com.bookMyCar.connections.ConnectionCon;
import com.bookMyCar.interfaces.Registrations;

/**
 *
 * @author Kiran
 */
public class RegisterOwner implements Registrations {
    @Override
    public boolean register(Beans getter){
        
        boolean status=false;
        PreparedStatement preparedStatement=null;
        try{
         ConnectionCon.BuildConnection();
        preparedStatement=   ConnectionCon.getConnection().prepareStatement("insert into owners (name,email,mobile,address,adhar,dob,password,profile,licence,status)values(?,?,?,?,?,?,?,?,?,?)");
        preparedStatement.setString(1, getter.getName());
        preparedStatement.setString(2, getter.getEmail());
        preparedStatement.setString(3, getter.getPhone());
        preparedStatement.setString(4, getter.getAddress());
        preparedStatement.setString(5, getter.getAdhar());
        preparedStatement.setString(6, getter.getDate());
        preparedStatement.setString(7, getter.getPassword());
        preparedStatement.setBlob(8, getter.getProfile());
        preparedStatement.setBlob(9, getter.getLicence());
           preparedStatement.setString(10, "Pending");
        int rowCount=preparedStatement.executeUpdate();
         status=(rowCount>0)?true:false;
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try {
                ConnectionCon.closeConnection();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return status;
    }
    
}
