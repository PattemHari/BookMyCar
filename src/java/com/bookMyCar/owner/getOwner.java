/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookMyCar.owner;
import com.bookMyCar.beans.Beans;
import com.bookMyCar.connections.ConnectionCon;
import java.sql.*;
/**
 *
 * @author Kiran
 */
public class getOwner {
    public static ResultSet get(String email){
        ResultSet resultSet=null;
        try {
            ConnectionCon.BuildConnection();
               PreparedStatement preparedStatement=ConnectionCon.getConnection().prepareStatement("select * from owners where email=?");
            preparedStatement.setString(1, email);
            resultSet=preparedStatement.executeQuery();
            
        } catch (Exception e) {
        }
      return resultSet;  
    }
    
}
