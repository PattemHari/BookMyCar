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
public class GetUser {
    public static ResultSet get(Beans getter){
        ResultSet resultSet=null;
        try {
            ConnectionCon.BuildConnection();
            PreparedStatement preparedStatement=ConnectionCon.getConnection().prepareStatement("select * from customers where email=?");
            preparedStatement.setString(1,getter.getEmail());
            resultSet=preparedStatement.executeQuery();   
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultSet;
    }
    
}
