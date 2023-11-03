/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookMyCar.connections;
import java.sql.*;
/**
 *
 * @author Kiran
 */
public class ConnectionCon {
    private static Connection connection=null;
    public static void BuildConnection(){
        try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookmycar","root","");
        }catch(Exception e){
            e.printStackTrace();
        }
        
    }
    public static Connection getConnection(){
        return connection;
    }
    public static void closeConnection(){
        try {
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
