package com.example.hotelholidayv1.room;


import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class RoomService {
    public static ResultSet getAllRoomService(int id) {
        return RoomRepository.all(id);
    }
    public static ResultSet getAllRoomWithDetailsService(String startDate, String endDate) {
        return RoomRepository.allWithImagesAndRates(startDate, endDate);
    }
    public static void storeRoomService(Room room, List<String> images) throws SQLException {
        RoomRepository.save(room,images);
    }
    public static boolean updateRoomService(Room room){
        return RoomRepository.update(room);
    }
    public static boolean deleteRoomService(int id) throws SQLException {
        ResultSet imagesOnRoom = RoomRepository.allImages(id);
        while (imagesOnRoom.next()) {
            File file = new File(imagesOnRoom.getString("src"));
            if(file.exists()) { file.delete(); }
            System.out.println(imagesOnRoom.getString("room_id"));
        }
        return RoomRepository.delete(id);
    }
}
