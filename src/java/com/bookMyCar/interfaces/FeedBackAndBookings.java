/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.bookMyCar.interfaces;

import com.bookMyCar.beans.Beans;
import java.sql.*;

/**
 *
 * @author Kiran
 */
public interface FeedBackAndBookings {
   ResultSet feedBacks();
   ResultSet ViewBookings();
    
}
