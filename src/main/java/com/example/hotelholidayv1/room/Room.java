package com.example.hotelholidayv1.room;

import java.util.Date;

public class Room {
    public enum Types {
        DOUBLE, TRIPLE, INDIVIDUELLE
    }
    public int id_room;
    public int room_number;
    public int floor_number;
    public int promo_id;
    public Types type_room;
    public Date created_at;
}
