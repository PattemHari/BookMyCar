/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookMyCar.owner;
import com.bookMyCar.connections.ConnectionCon;
import java.sql.*;

/**
 *
 * @author Kiran
 */
public class OwnerApplications {
    public static ResultSet getOwners(){
         ResultSet resultSet=null;
        PreparedStatement preparedStatement=null;
         try {
           
             preparedStatement=ConnectionCon.getConnection().prepareStatement("select * from owners ORDER BY id DESC");
             resultSet=preparedStatement.executeQuery();
         } catch (Exception e) {
             e.printStackTrace();
         }
         return resultSet;
    } 
}
