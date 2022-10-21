package com.example.hotelholidayv1.room;

import java.util.Date;

public class Room {


    public enum Types {
        DOUBLE, TRIPLE, SINGLE,SUITE
    }
    public int id_room;
    public int room_number;
    public int floor_number;
    public int promo_id;
    public Types type_room;
    public Date created_at;

    public Room(String room_number, String floor_number, String promo_id, String type_room){
        this.room_number = room_number != null ? Integer.parseInt(room_number):0;
        this.floor_number = floor_number != null ? Integer.parseInt(floor_number) : 0;
        this.promo_id = promo_id != null ? Integer.parseInt(promo_id) : 0;
        this.type_room = Types.valueOf(type_room);
    }


}
