package com.example.hotelholidayv1.roomRates;

import com.example.hotelholidayv1.DAO.DAOManager;

import java.sql.ResultSet;
import java.util.List;

public class RoomRatesRepository extends DAOManager {
    static ResultSet all(int id){
        StringBuilder query = new StringBuilder("SELECT * FROM room_rates ");
        if(id != -1){
            query.append(" WHERE id_room_rate = ").append(id);
        }
        query.append(";");
        return get(query);
    }
    static boolean save(RoomRates roomRates){
        StringBuilder query = new StringBuilder("INSERT INTO room_rates (  room_id, start_date, end_date ,rate ) values(");
        query.append(roomRates.room_id);
        query.append(",").append("'").append(roomRates.start_date).append("'");
        query.append(",").append("'").append(roomRates.end_date).append("'");
        query.append(",").append(roomRates.rate);
        query.append(");");
        System.out.println(query);
        return post(query);
    }
    static boolean update(RoomRates roomRates){
        StringBuilder query = new StringBuilder("UPDATE room_rates SET");
        query.append(" start_date = ").append("'").append(roomRates.start_date).append("'");
        query.append(", end_date = ").append("'").append(roomRates.end_date).append("'");
        query.append(", rate = ").append(roomRates.rate);
        query.append(" WHERE id_room_rate = ").append(roomRates.id_room_rate);
        return post(query);
    }

    static boolean delete(int id){
        StringBuilder query = new StringBuilder("DELETE FROM room_rates WHERE id_room_rate = ");
        query.append(id);
        query.append(";");
        return post(query);
    }
}
