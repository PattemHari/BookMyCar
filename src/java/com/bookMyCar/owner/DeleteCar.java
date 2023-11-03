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
public class DeleteCar {
    public static boolean deleteCar(Beans getter){
        boolean status=false;
        try {
           PreparedStatement preparedStatement=ConnectionCon.getConnection().prepareStatement("delete from cars where email=? AND carName=?");
           preparedStatement.setString(1,getter.getEmail());
           preparedStatement.setString(2, getter.getName());
           int rowCount=preparedStatement.executeUpdate();
           status=(rowCount>0)?true:false;
        } catch (Exception e) {
        }
        return status;
        
    }
    
}
