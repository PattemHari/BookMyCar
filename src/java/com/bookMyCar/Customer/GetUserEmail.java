/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookMyCar.Customer;

import com.bookMyCar.connections.ConnectionCon;
import java.sql.*;
/**
 *
 * @author Kiran
 */
public class GetUserEmail {
    public static ResultSet getData(String email){
       ResultSet resultSet=null;
        try {
            PreparedStatement preparedStatement=ConnectionCon.getConnection().prepareStatement("select * from customers where email=?");
            preparedStatement.setString(1, email);
            resultSet=preparedStatement.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
    return resultSet;
    }
    
}
