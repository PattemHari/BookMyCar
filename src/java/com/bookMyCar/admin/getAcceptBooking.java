/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookMyCar.admin;
import com.bookMyCar.connections.ConnectionCon;
import java.sql.*;
/**
 *
 * @author Kiran
 */
public class getAcceptBooking {
    public static ResultSet getBookings(){
        ResultSet resultSet=null;
        try {
            ConnectionCon.BuildConnection();
            PreparedStatement preparedStatement=ConnectionCon.getConnection().prepareStatement("select * from bookings where status='Accepted' ORDER BY id DESC");
           resultSet=preparedStatement.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }     
        return resultSet;
    }
    
}
