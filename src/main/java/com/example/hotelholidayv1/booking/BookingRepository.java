package com.example.hotelholidayv1.booking;


import com.example.hotelholidayv1.DAO.DAOManager;

import java.sql.ResultSet;

public class BookingRepository extends DAOManager {
    static ResultSet all(int id){
        StringBuilder query = new StringBuilder("select * from bookings ");
        if(id != -1){
            query.append(" WHERE id_booking = ").append(id);
        }
        query.append(";");
        return get(query);
    }
    static ResultSet getLastId(){
        StringBuilder query = new StringBuilder("select Max(id_booking) from bookings ");
        query.append(";");
        return get(query);
    }

    static ResultSet getBookingByMatricule(String matricule){
        StringBuilder query = new StringBuilder("select distinct * from bookings join room_bookings rb on bookings.id_booking = rb.booking_id join rooms r on rb.room_id = r.id_room where bookings.matricule = '").append(matricule).append("';");
        return get(query);
    }

    static ResultSet getExtrasByBookingId(int id){
        StringBuilder query = new StringBuilder("select * from extras_bookings eb join extras e on eb.extra_id = e.id_extra where eb.booking_id = ").append(id).append(";");
        return get(query);
    }
    static boolean save(Booking booking){
        StringBuilder query = new StringBuilder("INSERT INTO bookings (firstname, lastname, tel, matricule ,email ,start_date , end_date, rate) values(");
        query.append("'").append(booking.firstname).append("'");
        query.append(",").append("'").append(booking.lastname).append("'");
        query.append(",").append("'").append(booking.tel).append("'");
        query.append(",'").append(booking.matricule).append("'");
        query.append(",").append("'").append(booking.email).append("'");
        query.append(",").append("'").append(booking.start_date).append("'");
        query.append(",").append("'").append(booking.end_date).append("'");
        query.append(",").append(booking.rate);
        query.append(");");
        System.out.println(query);
        return post(query);
    }
    static boolean saveBookingRoom(int idBooking, int idRoom){
        StringBuilder query = new StringBuilder("INSERT INTO room_bookings (booking_id,room_id) values(");
        query.append(idBooking).append(",").append(idRoom);
        query.append(");");
        System.out.println(query);
        return post(query);
    }
    static boolean saveBookingExtras(int idBooking, int numberOfPerson, int[] extras){
        StringBuilder query = new StringBuilder("INSERT INTO extras_bookings (booking_id , extra_id , person_number) values ");
        for (int extra: extras) {
            query.append("(").append(idBooking).append(",");
            query.append(extra).append(",");
            query.append(numberOfPerson);
            query.append("),");
        }
        query.deleteCharAt(query.length()-1);
        query.append(";");
        System.out.println(query);
        return post(query);
    }
    boolean update(Booking booking,int id){
        StringBuilder query = new StringBuilder("UPDATE bookings SET");
        query.append(" matricule = ").append("'").append(booking.matricule).append("'");
        query.append(" start_date = ").append("'").append(booking.start_date).append("'");
        query.append(" end_date = ").append("'").append(booking.end_date).append("'");
        query.append(" rate = ").append("'").append(booking.rate).append("'");
        query.append(" email = ").append("'").append(booking.email).append("'");
        query.append(" WHERE id_booking = ").append(id);
        return post(query);
    }

    static boolean delete(int id){
        StringBuilder query = new StringBuilder("DELETE FROM bookings WHERE id_booking = ");
        query.append(id);
        query.append(";");
        return post(query);
    }
    static boolean payBooking(String matricule){
        StringBuilder query = new StringBuilder("UPDATE bookings SET paid = true WHERE matricule = '");
        query.append(matricule).append("';");
        return post(query);
    }
}
