/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookMyCar.Customer;

/**
 *
 * @author Kiran
 */
import com.bookMyCar.beans.Beans;
import com.bookMyCar.connections.ConnectionCon;
import java.sql.*;
public class getBookingCars {
    public static ResultSet getCars(Beans getter){
      
        ResultSet resultSet=null;
        PreparedStatement preparedStatement=null;
        try {
            preparedStatement=ConnectionCon.getConnection().prepareStatement("select * from bookings where email=? AND status=? ORDER BY id DESC");
            preparedStatement.setString(1, getter.getEmail());
            preparedStatement.setString(2, getter.getSeats());
            resultSet=preparedStatement.executeQuery();
        } catch (Exception e) {
            e.getMessage();
        }
        
        return resultSet;
    }
    
}
