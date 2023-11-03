/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookMyCar.owner;

import com.bookMyCar.beans.Beans;
import com.bookMyCar.connections.ConnectionCon;
import com.bookMyCar.interfaces.Registrations;
import java.sql.PreparedStatement;

/**
 *
 * @author Kiran
 */
public class OwnerAcceptAction implements Registrations {
    public boolean register(Beans getter){
         boolean status=false;
        PreparedStatement preparedStatement=null;
        try{  
        preparedStatement=   ConnectionCon.getConnection().prepareStatement("update owners set status=? where email='"+getter.getEmail()+"'");
        preparedStatement.setString(1, getter.getName());
        int rowCount=preparedStatement.executeUpdate();
         status=(rowCount>0)?true:false;
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return status;
    }
    
}
