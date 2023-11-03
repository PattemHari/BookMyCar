/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookMyCar.Customer;

/**
 *
 * @author Kiran
 */
import java.sql.*;
import com.bookMyCar.beans.Beans;
import com.bookMyCar.connections.ConnectionCon;
import com.bookMyCar.interfaces.Registrations;
public class Bookings implements Registrations {
    public  boolean register(Beans getter){
        boolean status=false;
        try {
           PreparedStatement preparedStatement=ConnectionCon.getConnection().prepareStatement("insert into bookings (name,email,OwnerEmail,carName,mobile,adhar,address,FromDate,ToDate,Amount,days,status) values(?,?,?,?,?,?,?,?,?,?,?,?)");
           preparedStatement.setString(1,getter.getName());
           preparedStatement.setString(2, getter.getEmail());
           preparedStatement.setString(3,getter.getModel());
           preparedStatement.setString(4, getter.getFuel());
           preparedStatement.setString(5, getter.getPhone());
           preparedStatement.setString(6, getter.getAdhar());
           preparedStatement.setString(7, getter.getAddress());
           preparedStatement.setString(8, getter.getDate());
           preparedStatement.setString(9, getter.getEdate());
           preparedStatement.setString(10, getter.getPrice());
           preparedStatement.setString(11, getter.getClicence());
           preparedStatement.setString(12, "Pending");
           int rowCount=preparedStatement.executeUpdate();
           status=(rowCount>0)?true:false;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return status;
    }
    
}