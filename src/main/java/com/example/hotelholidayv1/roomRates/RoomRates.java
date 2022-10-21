package com.example.hotelholidayv1.roomRates;

import java.util.Date;

public class RoomRates {
    public int id_room_rate;
    public int room_id;
    public Date start_date;
    public Date end_date;
    public float rate;

    public RoomRates(int room_id,Date start_date, Date end_date, float rate){
        this.room_id = room_id;
        this.start_date = start_date;
        this.end_date = end_date;
        this.rate = rate;
    }
}
