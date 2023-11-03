/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookMyCar.Customer;
import com.bookMyCar.beans.Beans;
import com.bookMyCar.connections.ConnectionCon;
import com.bookMyCar.interfaces.Registrations;
import java.sql.PreparedStatement;
/**
 *
 * @author Kiran
 */
public class CustomerRegister implements Registrations{
  @Override
    public boolean register(Beans getter){
        
        boolean status=false;
        PreparedStatement preparedStatement=null;
        try{
         ConnectionCon.BuildConnection();
        preparedStatement=   ConnectionCon.getConnection().prepareStatement("insert into customers (name,email,mobile,adhar,address,dob,password,profile,license)values(?,?,?,?,?,?,?,?,?)");
        preparedStatement.setString(1, getter.getName());
        preparedStatement.setString(2, getter.getEmail());
        preparedStatement.setString(3, getter.getPhone());
        preparedStatement.setString(4, getter.getAdhar());
        preparedStatement.setString(5, getter.getAddress());
        preparedStatement.setString(6, getter.getDate());
        preparedStatement.setString(7, getter.getPassword());
        preparedStatement.setBlob(8, getter.getProfile());
          preparedStatement.setBlob(9, getter.getLicence());
       
        int rowCount=preparedStatement.executeUpdate();
         status=(rowCount>0)?true:false;
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try {
                ConnectionCon.closeConnection();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return status;
    }
        
    
}
