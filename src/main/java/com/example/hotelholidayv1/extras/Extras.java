package com.example.hotelholidayv1.extras;

public class Extras {
    public enum Types {
        breakfast, lunch, dinner, fruits, musique, spa, message, soin, excurion
    }
    public int id_extra;
    public double rate;
    public Types type_extra;

    public Extras(double rate, Types type_extra){
        this.rate = rate;
        this.type_extra = type_extra;
    }

}
