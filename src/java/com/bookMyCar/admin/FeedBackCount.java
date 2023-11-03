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
public class FeedBackCount {
    public static ResultSet getFeedback(){
        ResultSet resultSet=null;
        try {
            PreparedStatement preparedStatement=ConnectionCon.getConnection().prepareStatement("select * from bookings");
            resultSet=preparedStatement.executeQuery();
                    
        } catch (Exception e) {
        }
    return resultSet;
    }
    
}
