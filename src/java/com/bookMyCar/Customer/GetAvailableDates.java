/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookMyCar.Customer;

/**
 *
 * @author Kiran
 */
import com.bookMyCar.beans.Beans;
import com.bookMyCar.connections.ConnectionCon;
import java.sql.*;
public class GetAvailableDates {
    public static ResultSet getDate(Beans getter){
        ResultSet resultSet=null;
        try {
            PreparedStatement preparedStatement=ConnectionCon.getConnection().prepareStatement("select * from bookings where OwnerEmail=? AND carName=?");
            preparedStatement.setString(1, getter.getCompanyName());
            preparedStatement.setString(2,getter.getName());
           resultSet= preparedStatement.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultSet;
    }
    
}
