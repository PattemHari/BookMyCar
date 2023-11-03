/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookMyCar.beans;
import java.sql.Blob;

/**
 *
 * @author Kiran
 */
public class Beans {
    private String name="";
    private String CompanyName="";
    private String model="";
    private String transmission="";
    private String Clicence="";
    private String price="";
    private String seats="";
    private String fuel="";
    private String color="";
    private String description="";
    private String email="";
    private String phone="";
    private String address="";
    private String adhar="";
    private String password="";
    private String dob="";
    private Blob profile=null;
    private Blob licence=null;
    private String eDate="";
    
    public void setEdate(String eDate){
       this.eDate=eDate;
    }
    public String getEdate(){
    return eDate;
    }
    
    
    public void setName(String name){
        this.name=name;
    }
    public String getName(){
    return name;
    }
    public void setCompanyName(String CommpanyName){
        this.CompanyName=CommpanyName;
    }
    public String getCompanyName(){
    return CompanyName;
    }
    public void setModel(String model){
    this.model=model;
    }
    public String getModel(){
    return model;
    }
     public void setTransmission(String transmission){
     this.transmission=transmission;
     }
     public String getTransmission(){
         return transmission;
     }
     public void setCLicence(String Clicence){
         this.Clicence=Clicence;
     }
     public String getClicence(){
         return Clicence;
     }
     public void setPrice(String price){
         this.price=price;
     }
     public String getPrice(){
         return price;
     }
     public void setSeats(String seats){
         this.seats=seats;
     }
     public String getSeats(){
         return seats;
     }
     public void setFuel(String fuel){
         this.fuel=fuel;
     }
     public String getFuel(){
         return fuel;
     }
     public void setColor(String color){
         this.color=color;
     }
     public String getColor(){
         return color;
     }
     public void setDescription(String description){
         this.description=description;
     }
     public String getDescription(){
         return description;
     }
    public void setEmail(String email){
        this.email=email;
    }
    public String getEmail(){
        return email;
    }
    public void setPhone(String phone){ 
       this.phone=phone;
    }
    public String getPhone(){
        return phone;
    }
    public void setAddress(String address){
        this.address=address;
    }
    public String getAddress(){
      return address;
    }
    public void setAdhar(String adhar){
        this.adhar=adhar;
    }
    public String getAdhar(){
        return adhar;
    }
    public void setPassword(String password){
        this.password=password;
    }
    public String getPassword(){
       return password;
    }
    public void setDate(String dob){
        this.dob=dob;
    }
    public String getDate(){
        return dob;
    }
    public void setProfile(Blob profile){
        this.profile=profile;
    }
    public Blob getProfile(){
    return profile;
    }
    public void setLicence(Blob licence){
        this.licence=licence;
    }
    public Blob getLicence(){
       return licence;
    }
    
    
}
