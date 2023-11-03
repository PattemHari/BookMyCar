/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookMyCar.connections;

import com.bookMyCar.Abs.Bookings;
import com.bookMyCar.beans.Beans;
import java.sql.*;

/**
 *
 * @author Kiran
 */
public class AllBookings extends Bookings {
    public ResultSet getBooking(Beans getter){
    ResultSet resultSet=null;
        try {
            ConnectionCon.BuildConnection();
            PreparedStatement preparedStatement=ConnectionCon.getConnection().prepareStatement("select * from bookings where email=? ORDER BY id DESC");
            preparedStatement.setString(1,getter.getEmail());
            resultSet=preparedStatement.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
    
    return resultSet;
    }
      
    
    
}
