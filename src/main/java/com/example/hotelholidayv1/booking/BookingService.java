package com.example.hotelholidayv1.booking;

import com.example.hotelholidayv1.extras.ExtrasRepository;

import java.sql.ResultSet;

public class BookingService {
    public static ResultSet getAllBookingService(int id) {
        return BookingRepository.all(id);
    }
    public static boolean deleteBookingService(int id){
        return BookingRepository.delete(id);
    }
}
