package com.example.hotelholidayv1.promotion;

import com.example.hotelholidayv1.room.Room;

import java.util.Date;

public class Promotion {
    public int id_promo;
    public int room_number;
    public int percentage;
    public String image_src;
    public boolean status;
    public Date start_date;
    public Date end_date;
    public Date created_at;

    public Promotion(int room_number,int percentage, String image_src, boolean status, Date start_date, Date end_date){
        this.room_number = room_number;
        this.percentage = percentage;
        this.image_src = image_src;
        this.status = status;
        this.start_date = start_date;
        this.end_date = end_date;
    }
}
