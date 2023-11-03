/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookMyCar.admin;
import com.bookMyCar.beans.Beans;
import com.bookMyCar.connections.ConnectionCon;
import java.sql.*;
/**
 *
 * @author Kiran
 */
public class GetFeedback {
    public static ResultSet feedback(Beans getter){
        ResultSet resultSet=null;
        try {
            PreparedStatement preparedStatement=ConnectionCon.getConnection().prepareStatement("select * from feedbacks where customerType=?");
            preparedStatement.setString(1,getter.getName());
            resultSet=preparedStatement.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return resultSet;
    }
    
}
