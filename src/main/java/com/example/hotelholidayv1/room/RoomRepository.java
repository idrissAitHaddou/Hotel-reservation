package com.example.hotelholidayv1.room;
import com.example.hotelholidayv1.DAO.DAOManager;
import com.example.hotelholidayv1.user.User;

import java.sql.ResultSet;
public class RoomRepository extends DAOManager {
    ResultSet all(int id){
        StringBuilder query = new StringBuilder("SELECT * FROM rooms ");
        if(id != 0){
            query.append(" WHERE id_rooms = ").append(id);
        }
        query.append(";");
        return get(query);
    }
    boolean save(Room room){
        StringBuilder query = new StringBuilder("INSERT INTO rooms SET ( room_number, floor_number, promo_id, type_room ) values(");
        query.append(room.room_number);
        query.append(",").append("'").append(room.floor_number).append("'");
        query.append(",").append(room.promo_id);
        query.append(",").append("'").append(room.type_room).append("'");
        query.append(");");
        return post(query);
    }
    boolean update(Room room,int id){
        StringBuilder query = new StringBuilder("UPDATE admins SET");
        query.append(" room_number = ").append("'").append(room.room_number).append("'");
        query.append(" floor_number = ").append("'").append(room.floor_number).append("'");
        query.append(" promo_id = ").append(room.promo_id);
        query.append(" type_room = ").append("'").append(room.type_room).append("'");
        query.append(" WHERE id_room = ").append(id);
        return post(query);
    }

    boolean delete(int id){
        StringBuilder query = new StringBuilder("DELETE FROM rooms WHERE id_room = ");
        query.append(id);
        query.append(";");
        return post(query);
    }

}
