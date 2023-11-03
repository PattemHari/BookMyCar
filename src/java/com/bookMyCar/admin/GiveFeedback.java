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
public class GiveFeedback {
    public static boolean feedback(Beans getter){
        boolean status=false;
                try {
            PreparedStatement preparedStatement=ConnectionCon.getConnection().prepareStatement("insert into feedbacks (email,name,rating,customerType,message,image) values(?,?,?,?,?,?)");
            preparedStatement.setString(1, getter.getEmail());
            preparedStatement.setString(2,getter.getName());
            preparedStatement.setString(3, getter.getAdhar());
            preparedStatement.setString(4,getter.getAddress());
            preparedStatement.setString(5, getter.getDescription());
            preparedStatement.setBlob(6, getter.getProfile());
            int rowCount=preparedStatement.executeUpdate();
            status=(rowCount>0)?true:false;
            
        } catch (Exception e) {
           e.printStackTrace();
        }
        return status;
    }
    
}
