package com.example.hotelholidayv1.room;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class RoomService {
    public static ResultSet getAllRoomService(int id) {
        return RoomRepository.all(id);
    }
    public static void storeRoomService(Room room, List<String> images) throws SQLException {
        RoomRepository.save(room,images);
    }
    public static boolean updateRoomService(Room room){
        return RoomRepository.update(room);
    }
    public static boolean deleteRoomService(int id){
        return RoomRepository.delete(id);
    }
}
