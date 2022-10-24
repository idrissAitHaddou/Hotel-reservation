package com.example.hotelholidayv1.extras;

import com.example.hotelholidayv1.room.Room;
import com.example.hotelholidayv1.room.RoomRepository;
import com.example.hotelholidayv1.user.User;
import com.example.hotelholidayv1.user.UserRepository;

import java.sql.ResultSet;

public class ExtrasService {
    public static ResultSet getAllExtrasService(int id) {
        return ExtrasRepository.all(id);
    }
    public static void storeExtrasService(Extras extra) {
        ExtrasRepository.save(extra);
    }
    public static boolean updateExtrasService(Extras extra){
        return ExtrasRepository.update(extra);
    }
    public static boolean deleteExtrasService(int id){
        return ExtrasRepository.delete(id);
    }
}
