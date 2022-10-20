package com.example.hotelholidayv1.roomRates;

import com.example.hotelholidayv1.DAO.DAOManager;

import java.sql.ResultSet;

public class RoomRatesRepository extends DAOManager {
    ResultSet all(int id){
        StringBuilder query = new StringBuilder("SELECT * FROM room_rates ");
        if(id != 0){
            query.append(" WHERE id_room_rate = ").append(id);
        }
        query.append(";");
        return get(query);
    }
    boolean save(RoomRates roomRates){
        StringBuilder query = new StringBuilder("INSERT INTO room_rates SET (  room_id, start_date, end_date ,rate ) values(");
        query.append(roomRates.room_id);
        query.append(",").append(roomRates.start_date);
        query.append(",").append(roomRates.end_date);
        query.append(",").append(roomRates.rate);
        query.append(");");
        return post(query);
    }
    boolean update(RoomRates roomRates,int id){
        StringBuilder query = new StringBuilder("UPDATE room_rates SET");
        query.append(" room_id = ").append(roomRates.room_id);
        query.append(" start_date = ").append(roomRates.start_date);
        query.append(" end_date = ").append(roomRates.end_date);
        query.append(" rate = ").append(roomRates.rate);
        query.append(" WHERE id_room_rate = ").append(id);
        return post(query);
    }

    boolean delete(int id){
        StringBuilder query = new StringBuilder("DELETE FROM room_rates WHERE id_room_rate = ");
        query.append(id);
        query.append(";");
        return post(query);
    }
}
