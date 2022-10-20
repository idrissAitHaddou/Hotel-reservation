package com.example.hotelholidayv1.user;

public class User {
    public int id_admin;
    public String firstname;
    public String lastname;
    public String email;
    public String password;
    public User(String firstname, String lastname, String email, String password) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.password = password;
    }
}
