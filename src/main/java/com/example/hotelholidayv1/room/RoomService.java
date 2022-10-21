package com.example.hotelholidayv1.room;


import java.sql.ResultSet;

public class RoomService {
    public static ResultSet getAllRoomService() {
        return RoomRepository.all(0);
    }
    public static void storeRoomService(Room room) {
        RoomRepository.save(room);
    }
    public static void updateRoomService(){

    }
    public static void deleteRoomService(){

    }
}
