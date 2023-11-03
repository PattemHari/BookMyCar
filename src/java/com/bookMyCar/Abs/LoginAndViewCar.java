/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookMyCar.Abs;

import com.bookMyCar.beans.Beans;
import com.bookMyCar.connections.ConnectionCon;
import java.sql.*;


/**
 *
 * @author Kiran
 */
public abstract class LoginAndViewCar {
   public abstract ResultSet login(Beans getter);
    public ResultSet viewCars(){
       ResultSet resultSet=null;
          PreparedStatement preparedStatement=null;
         try {
             preparedStatement=ConnectionCon.getConnection().prepareStatement("select * from cars");
             resultSet=preparedStatement.executeQuery();
         } catch (Exception e) {
             e.printStackTrace();
         }
        return resultSet;
    }
    
}
