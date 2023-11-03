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
public class OwnerCars {
    public ResultSet getCar(Beans getter){
        ResultSet resultSet=null;
        PreparedStatement preparedStatement=null;
        try {
           preparedStatement=ConnectionCon.getConnection().prepareStatement("select * from bookings where OwnerEmail=? ORDER BY id DESC");
           preparedStatement.setString(1,getter.getEmail());
           resultSet=preparedStatement.executeQuery();
        } catch (Exception e) {
        }
        return resultSet; 
    }
    
}
