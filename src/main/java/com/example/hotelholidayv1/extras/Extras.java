package com.example.hotelholidayv1.extras;

public class Extras {

    public int id_extra;
    public double rate;
    public String type_extra;

    public Extras(String id_extra,String rate, String type_extra){
        this.id_extra = id_extra != null ? Integer.parseInt(id_extra) : 0;
        this.rate = rate != null ? Double.parseDouble(rate) : 0  ;
        this.type_extra = type_extra;
    }

}
