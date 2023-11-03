/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookMyCar.Customer;

import com.bookMyCar.beans.Beans;
import com.bookMyCar.connections.ConnectionCon;
import com.bookMyCar.interfaces.Registrations;
import java.sql.*;
/**
 *
 * @author Kiran
 */
public class UserUpdate implements Registrations {
     public boolean register(Beans getter){
      boolean status=false;
      Blob blob=null;
      try {
          if(getter.getProfile().length()==0){
              ResultSet resultSet=new CustomerLogin().login(getter);
              if(resultSet.next()){
                blob=resultSet.getBlob("profile");
              }
          }else{
              blob=getter.getProfile();
          }
          PreparedStatement preparedStatement=ConnectionCon.getConnection().prepareStatement("update customers set name=?,mobile=?,adhar=?,address=?,dob=?,profile=? where email='"+getter.getEmail()+"'");
          preparedStatement.setString(1, getter.getName());
          preparedStatement.setString(2, getter.getPhone());
          preparedStatement.setString(3, getter.getAdhar());
          preparedStatement.setString(4, getter.getAddress());
          preparedStatement.setString(5, getter.getDate());
          preparedStatement.setBlob(6, blob);
          int rowCount=preparedStatement.executeUpdate();
          status=(rowCount>0)?true:false;
          } catch (Exception e) {
              e.printStackTrace();
          }
         return status;
     }
}
