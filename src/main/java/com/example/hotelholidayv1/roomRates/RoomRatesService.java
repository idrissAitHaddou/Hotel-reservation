package com.example.hotelholidayv1.roomRates;


import java.sql.ResultSet;

public class RoomRatesService {
    public static ResultSet getAllRoomRatesService(int id) {
        return RoomRatesRepository.all(id);
    }
    public static void storeRoomRatesService(RoomRates roomRate) {
        RoomRatesRepository.save(roomRate);
    }
    public static boolean updateRoomRatesService(RoomRates roomRate){
        return RoomRatesRepository.update(roomRate);
    }
    public static boolean deleteRoomRatesService(int id){
        return RoomRatesRepository.delete(id);
    }
}
