package com.example.hotelholidayv1.roomRates;


public class RoomRates {
    public int id_room_rate;
    public int room_id;
    public String start_date;
    public String end_date;
    public float rate;

    public RoomRates(String id_room_rate,String room_id, String start_date, String end_date, String rate){
        this.id_room_rate = id_room_rate != null ? Integer.parseInt(id_room_rate):0;
        this.room_id = room_id != null ? Integer.parseInt(room_id):0;
        this.start_date = start_date ;
        this.end_date = end_date;
        this.rate = rate != null? Float.parseFloat(rate) : 0;
    }
}
