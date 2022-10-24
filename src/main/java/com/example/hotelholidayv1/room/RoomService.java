package com.example.hotelholidayv1.room;


import java.sql.ResultSet;

public class RoomService {
    public static ResultSet getAllRoomService(int id) {
        return RoomRepository.all(id);
    }
    public static void storeRoomService(Room room) {
        RoomRepository.save(room);
    }
    public static boolean updateRoomService(Room room){
        return RoomRepository.update(room);
    }
    public static boolean deleteRoomService(int id){
        return RoomRepository.delete(id);
    }
}
