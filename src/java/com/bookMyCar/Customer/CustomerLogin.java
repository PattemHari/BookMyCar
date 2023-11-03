/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookMyCar.Customer;

import com.bookMyCar.Abs.LoginAndViewCar;
import com.bookMyCar.beans.Beans;
import com.bookMyCar.connections.ConnectionCon;
import java.sql.*;

/**
 *
 * @author Kiran
 */
public class CustomerLogin extends LoginAndViewCar {
    public ResultSet login(Beans getter){
        ResultSet resultSet=null;
        PreparedStatement preparedStatement=null;
        try {
            ConnectionCon.BuildConnection();
            preparedStatement=ConnectionCon.getConnection().prepareStatement("select * from customers where email=? AND password=?");
            preparedStatement.setString(1, getter.getEmail());
            preparedStatement.setString(2, getter.getPassword());
               resultSet=preparedStatement.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultSet;
      }  
}
