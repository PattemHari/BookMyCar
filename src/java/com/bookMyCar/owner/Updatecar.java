/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookMyCar.owner;

import com.bookMyCar.beans.Beans;
import com.bookMyCar.connections.ConnectionCon;
import com.bookMyCar.interfaces.Registrations;
import java.sql.*;

/**
 *
 * @author Kiran
 */
public class Updatecar implements Registrations {
   @Override
    public boolean register(Beans getter){
        boolean status=false;
        PreparedStatement preparedStatement=null;
        Blob blob=null;
        try{
            if(getter.getProfile().length()==0){
           ResultSet result=new OwnerLogin().viewCar(getter);
               if(result.next()){
                   blob=result.getBlob("image");
               }
            }else{
              blob=getter.getProfile();
            }
  preparedStatement=ConnectionCon.getConnection().prepareStatement("update cars set email=?,carName=?,carCompany=?,model=?,transmission=?,licence=?,price=?,seats=?,fuel=?,color=?,image=?,description=? where email='"+getter.getEmail()+"' AND carName='"+getter.getName()+"'");
        preparedStatement.setString(1, getter.getEmail());
        preparedStatement.setString(2, getter.getName());
        preparedStatement.setString(3, getter.getCompanyName());
        preparedStatement.setString(4, getter.getModel());
        preparedStatement.setString(5, getter.getTransmission());
        preparedStatement.setString(6, getter.getClicence());
        preparedStatement.setString(7, getter.getPrice());
        preparedStatement.setString(8, getter.getSeats());
        preparedStatement.setString(9, getter.getFuel());
        preparedStatement.setString(10, getter.getColor());
        preparedStatement.setBlob(11, blob);
        preparedStatement.setString(12, getter.getDescription());
        int rowCount=preparedStatement.executeUpdate();
         status=(rowCount>0)?true:false;
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return status;
    }    
}
