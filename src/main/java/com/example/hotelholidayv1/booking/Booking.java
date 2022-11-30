package com.example.hotelholidayv1.booking;


public class Booking {
    public int id_booking;

    public String firstname;
    public String lastname;
    public String tel;
    public String matricule;
    public String email;
    public String start_date;
    public String end_date;
    public float rate;


    public Booking(String id_booking, String firstname, String lastname, String tel, String matricule, String email, String start_date, String end_date, String rate){
        this.id_booking = id_booking != null ? Integer.parseInt(id_booking):-1;
        this.firstname = firstname != null ? firstname:"";
        this.lastname = lastname != null ? lastname:"";
        this.tel = tel != null ? tel:"";
        this.matricule = matricule != null ? matricule:"";
        this.email = email != null ? email : "";
        this.start_date = start_date != null ? start_date : "";
        this.end_date = end_date != null ? end_date : "";
        this.rate = rate != null ? Float.parseFloat(rate):-1;
    }
}
