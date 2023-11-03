/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookMyCar.Customer;

import com.bookMyCar.beans.Beans;
import com.bookMyCar.connections.ConnectionCon;
import java.sql.*;
/**
 *
 * @author Kiran
 */
public class BookingCancel {
    
    public static boolean cancel(Beans getter){
        boolean status=false;
       
        try {
            ConnectionCon.BuildConnection();
            PreparedStatement preparedStatement=ConnectionCon.getConnection().prepareStatement("delete from bookings where email=? AND OwnerEmail=? AND carName=? AND FromDate=? AND ToDate=?");
            preparedStatement.setString(1, getter.getEmail());
            preparedStatement.setString(2, getter.getName());
            preparedStatement.setString(3, getter.getPhone());
            preparedStatement.setString(4, getter.getDate());
            preparedStatement.setString(5, getter.getEdate());
            int rowCount=preparedStatement.executeUpdate();
            status=(rowCount>0)?true:false;
        } catch (Exception e) {
           e.getMessage();
        }
        return status;
    }
    
}
