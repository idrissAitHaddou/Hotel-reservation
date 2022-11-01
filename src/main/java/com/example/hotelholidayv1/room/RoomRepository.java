package com.example.hotelholidayv1.room;
import com.example.hotelholidayv1.DAO.DAOManager;
import com.example.hotelholidayv1.helpers.DataConverter;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class RoomRepository extends DAOManager {
    static ResultSet all(int id){
        StringBuilder query = new StringBuilder("SELECT * FROM rooms");
        if(id != -1){
            query.append(" WHERE id_room = ").append(id);
        }
        query.append(";");
        return get(query);
    }

    static ResultSet allWithImagesAndRates(String startDate,String endDate){
        StringBuilder query = new StringBuilder("SELECT * FROM rooms inner join room_rates rr on rooms.id_room = rr.room_id ");
        if(startDate != null && endDate != null ){
            query.append(" WHERE start_date>= ").append("'").append(startDate).append("'").append( " and end_date <= ").append("'").append(endDate).append("'");
        }
        query.append(";");
        return get(query);
    }
    static ResultSet roomWithImagesAndRates(int idRoom){
        StringBuilder query = new StringBuilder("SELECT * FROM rooms inner join room_rates rr on rooms.id_room = rr.room_id ");
        if(idRoom != -1 ){
            query.append(" WHERE rooms.id_room = ").append(idRoom);
        }
        query.append(";");
        System.out.println(query);
        return get(query);
    }
    static boolean save(Room room, List<String> images) throws SQLException {
        StringBuilder query = new StringBuilder("INSERT INTO rooms ( room_number, floor_number, promo_id, type_room ) values(");
        query.append(room.room_number);
        query.append(",").append("'").append(room.floor_number).append("'");
        if (room.promo_id != 0)
            query.append(",").append(room.promo_id);
        else
            query.append(",").append(" NULL ");
        query.append(",").append("'").append(room.type_room).append("'");
        query.append(");");
        int room_id = -1;
        post(query);
        StringBuilder selectQuery = new StringBuilder("SELECT max(id_room) from rooms;");
        ResultSet max = get(selectQuery);
        if(max.next()){
            room_id = DataConverter.parseInt(max.getString("max"));
        }
        if(images.size()>0 && room_id != -1){
            StringBuilder queryImage = new StringBuilder("INSERT INTO images ( src, room_id ) values");
            for (String image:images) {
                if(image != null) {
                    queryImage.append("('").append(image).append("'");
                    queryImage.append(",'").append(room_id).append("'),");
                }
            }
            queryImage.deleteCharAt(queryImage.length() - 1);
            return post(queryImage);
        }
        return false;
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

    static boolean addImages(int room_id, List<String> images) throws SQLException {
        if(images.size()>0 && room_id != -1){
            StringBuilder queryImage = new StringBuilder("INSERT INTO images ( src, room_id ) values");
            for (String image:images) {
                if(image != null) {
                    queryImage.append("('").append(image).append("'");
                    queryImage.append(",'").append(room_id).append("'),");
                }
            }
            queryImage.deleteCharAt(queryImage.length() - 1);
            return post(queryImage);
        }
        return false;
    }

    public static boolean updateOne(int room_id, int promo_id){
        StringBuilder query = new StringBuilder("UPDATE rooms SET ");
        query.append("promo_id = ").append(promo_id);
        query.append(" WHERE id_room = ").append(room_id);
        System.out.println(query);
        return post(query);
    }

    public static boolean delete(int id){
        StringBuilder query = new StringBuilder("DELETE FROM rooms WHERE id_room = ");
        query.append(id);
        query.append(";");
        return post(query);
    }
    public static boolean deleteImages(int id){
        StringBuilder query = new StringBuilder("DELETE FROM images WHERE id_image = ");
        query.append(id);
        query.append(";");
        return post(query);
    }
    static ResultSet allImages(int roomId){
        StringBuilder query = new StringBuilder("SELECT * FROM images");
        query.append(" WHERE room_id = ").append(roomId);
        query.append(";");
        return get(query);
    }
    static ResultSet allImagesWithId(int id){
        StringBuilder query = new StringBuilder("SELECT * FROM images");
        query.append(" WHERE id_image = ").append(id);
        query.append(";");
        return get(query);
    }
}