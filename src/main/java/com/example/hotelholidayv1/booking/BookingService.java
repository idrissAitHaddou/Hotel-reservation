package com.example.hotelholidayv1.booking;

import com.example.hotelholidayv1.extras.ExtrasRepository;
import com.example.hotelholidayv1.helpers.DataConverter;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.ListIterator;

public class BookingService {
    public static ResultSet getAllBookingService(int id) {
        return BookingRepository.all(id);
    }
    public static boolean deleteBookingService(int id){
        return BookingRepository.delete(id);
    }

    public static boolean saveBooking(int roomId,String firstname, String lastname, String tel, String matricule, String email, String startDate, String endDate, double rate,int[] extras,int numberOfPerson) throws SQLException {
        Booking booking = new Booking(null, firstname, lastname, tel, matricule,email,startDate,endDate,String.valueOf(rate));
        if (BookingRepository.save(booking)){
            System.out.println("booking saved");
            List<HashMap<String, Object>> bookings = DataConverter.toList(BookingRepository.getLastId());
            int idBooking = Integer.parseInt(String.valueOf(bookings.get(0).get("max")));
            System.out.println(idBooking);
            if(BookingRepository.saveBookingRoom(idBooking,roomId)){
                System.out.println("room booking saved");
                if (extras.length>0){
                   if (BookingRepository.saveBookingExtras(idBooking,numberOfPerson,extras)){
                       System.out.println("extras are saved");
                       return true;
                   }
                }
                return true;
            }
        }
        return false;
    }

    public static ResultSet getBookingByMatricule(String matricule) throws SQLException {
        return BookingRepository.getBookingByMatricule(matricule);
    }
    public static ResultSet getExtrasByBooking(int id) throws SQLException {
        return BookingRepository.getExtrasByBookingId(id);
    }

    public static boolean getPayBooking(String matricule) throws SQLException {
        return BookingRepository.payBooking(matricule);
    }

}
