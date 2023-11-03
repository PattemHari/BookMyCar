/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookMyCar.owner;
import java.sql.*;
import com.bookMyCar.beans.Beans;
import com.bookMyCar.connections.ConnectionCon;

/**
 *
 * @author Kiran
 */
public class UpdateProfile {
    public static boolean update(Beans getter){
        boolean status=false;
        PreparedStatement preparedStatement=null;
        Blob blob=null;
        try {
            if(getter.getProfile().length()==0){
                ResultSet result=new OwnerLogin().login(getter);
                if(result.next()){
                    blob=result.getBlob("profile");
                }
            }else{
                blob=getter.getProfile();
            }
           preparedStatement=   ConnectionCon.getConnection().prepareStatement("update owners set name=?,email=?,mobile=?,address=?,adhar=?,dob=?,profile=? where email='"+getter.getEmail()+"'");
        preparedStatement.setString(1, getter.getName());
        preparedStatement.setString(2, getter.getEmail());
        preparedStatement.setString(3, getter.getPhone());
        preparedStatement.setString(4, getter.getAddress());
        preparedStatement.setString(5, getter.getAdhar());
        preparedStatement.setString(6, getter.getDate());
        preparedStatement.setBlob(7, blob);
        int rowCount=preparedStatement.executeUpdate();
         status=(rowCount>0)?true:false;
        }catch(Exception e){
            e.printStackTrace();
        }
        return status;
       
    }
    
}
