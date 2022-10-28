package com.example.hotelholidayv1.promotion;

import com.example.hotelholidayv1.room.Room;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Promotion {
    public int id_promo;
    public int percentage;
    public String image_src;
    public boolean status;
    public String start_date;
    public String end_date;
    public Date created_at;

    public Promotion(int percentage, String image_src, String start_date, String end_date){
        this.percentage = (int)percentage;
        this.image_src = image_src;
        this.status = false;
        this.start_date = start_date;
        this.end_date = end_date;
    }
}
