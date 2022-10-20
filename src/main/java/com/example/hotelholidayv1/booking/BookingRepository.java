package com.example.hotelholidayv1.booking;


import com.example.hotelholidayv1.DAO.DAOManager;

import java.sql.ResultSet;

public class BookingRepository extends DAOManager {
    ResultSet all(int id){
        StringBuilder query = new StringBuilder("SELECT * FROM bookings ");
        if(id != 0){
            query.append(" WHERE id_booking = ").append(id);
        }
        query.append(";");
        return get(query);
    }
    boolean save(Booking booking){
        StringBuilder query = new StringBuilder("INSERT INTO bookings SET (matricule ,email ,start_date , end_date, rate) values(");
        query.append(booking.matricule);
        query.append(",").append("'").append(booking.email).append("'");
        query.append(",").append("'").append(booking.start_date).append("'");
        query.append(",").append("'").append(booking.end_date).append("'");
        query.append(",").append("'").append(booking.rate).append("'");
        query.append(");");
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

    boolean delete(int id){
        StringBuilder query = new StringBuilder("DELETE FROM bookings WHERE id_booking = ");
        query.append(id);
        query.append(";");
        return post(query);
    }
}
