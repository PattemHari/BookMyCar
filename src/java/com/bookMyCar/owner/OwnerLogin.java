/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookMyCar.owner;

import com.bookMyCar.Abs.LoginAndViewCar;
import com.bookMyCar.beans.Beans;
import com.bookMyCar.connections.ConnectionCon;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Kiran
 */
public class OwnerLogin extends LoginAndViewCar{
    
      public ResultSet login(Beans getter){
         ResultSet resultSet=null;
        PreparedStatement preparedStatement=null;
         try {
             ConnectionCon.BuildConnection();
             preparedStatement=ConnectionCon.getConnection().prepareStatement("select * from owners where email=? AND password=?");
             preparedStatement.setString(1, getter.getEmail());
             preparedStatement.setString(2, getter.getPassword());
             resultSet=preparedStatement.executeQuery();
         } catch (Exception e) {
             e.printStackTrace();
         }
         return resultSet;
     }
      public ResultSet viewCars(Beans getter){
          ResultSet resultSet=null;
          PreparedStatement preparedStatement=null;
         try {
             preparedStatement=ConnectionCon.getConnection().prepareStatement("select * from cars where email=? ORDER BY id DESC");
             preparedStatement.setString(1, getter.getEmail());
             resultSet=preparedStatement.executeQuery();
         } catch (Exception e) {
             e.printStackTrace();
         }
        return resultSet;
    }
      
       public ResultSet viewCar(Beans getter){
          ResultSet resultSet=null;
          PreparedStatement preparedStatement=null;
         try {
             preparedStatement=ConnectionCon.getConnection().prepareStatement("select * from cars where email=? AND carName=?");
             preparedStatement.setString(1, getter.getEmail());
             preparedStatement.setString(2, getter.getName());
             resultSet=preparedStatement.executeQuery();
         } catch (Exception e) {
             e.printStackTrace();
         }
        return resultSet;
    }
       public ResultSet getOwner(Beans getter){
          ResultSet resultSet=null;
          PreparedStatement preparedStatement=null;
         try {
             preparedStatement=ConnectionCon.getConnection().prepareStatement("select * from owners where email=?");
             preparedStatement.setString(1, getter.getEmail());
             resultSet=preparedStatement.executeQuery();
         } catch (Exception e) {
             e.printStackTrace();
         }
        return resultSet;
    }
    
}
