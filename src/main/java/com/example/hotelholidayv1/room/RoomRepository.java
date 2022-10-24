package com.example.hotelholidayv1.room;
import com.example.hotelholidayv1.DAO.DAOManager;

import java.sql.ResultSet;
public class RoomRepository extends DAOManager {
    static ResultSet all(int id){
        StringBuilder query = new StringBuilder("SELECT * FROM rooms ORDER BY room_number ASC");
        if(id != -1){
            query.append(" WHERE id_room = ").append(id);
        }
        query.append(";");
        return get(query);
    }
    static boolean save(Room room){
        StringBuilder query = new StringBuilder("INSERT INTO rooms ( room_number, floor_number, promo_id, type_room ) values(");
        query.append(room.room_number);
        query.append(",").append("'").append(room.floor_number).append("'");
        if (room.promo_id != 0)
            query.append(",").append(room.promo_id);
        else
            query.append(",").append(" NULL ");
        query.append(",").append("'").append(room.type_room).append("'");
        query.append(");");
        return post(query);
    }
    static boolean update(Room room){
        StringBuilder query = new StringBuilder("UPDATE rooms SET");
        query.append(" room_number = ").append(room.room_number);
        query.append(", floor_number = ").append(room.floor_number);
        if (room.promo_id != 0)
            query.append(",promo_id = ").append(room.promo_id);
        query.append(", type_room = ").append("'").append(room.type_room).append("'");
        query.append(" WHERE id_room = ").append(room.id_room);
        System.out.println(query);
        return post(query);
    }

    static boolean delete(int id){
        StringBuilder query = new StringBuilder("DELETE FROM rooms WHERE id_room = ");
        query.append(id);
        query.append(";");
        return post(query);
    }

}
