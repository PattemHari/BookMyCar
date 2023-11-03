/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookMyCar.admin;

import com.bookMyCar.Abs.LoginAndViewCar;
import com.bookMyCar.beans.Beans;
import com.bookMyCar.connections.ConnectionCon;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

/**
 *
 * @author Kiran
 */
public class AdminLogin extends LoginAndViewCar {
     public ResultSet login(Beans getter){
         ResultSet resultSet=null;
        PreparedStatement preparedStatement=null;
         try {
             ConnectionCon.BuildConnection();
             preparedStatement=ConnectionCon.getConnection().prepareStatement("select * from admin where name=? AND password=?");
             preparedStatement.setString(1, getter.getName());
             preparedStatement.setString(2, getter.getPassword());
             resultSet=preparedStatement.executeQuery();
         } catch (Exception e) {
             e.printStackTrace();
         }
         return resultSet;
     }
      public static ResultSet viewUsers(){
       ResultSet resultSet=null;
          PreparedStatement preparedStatement=null;
         try {
             preparedStatement=ConnectionCon.getConnection().prepareStatement("select * from customers ORDER BY id DESC");
             resultSet=preparedStatement.executeQuery();
         } catch (Exception e) {
             e.printStackTrace();
         }
        return resultSet;
    }
    
}
