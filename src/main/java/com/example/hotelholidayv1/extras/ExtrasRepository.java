package com.example.hotelholidayv1.extras;

import com.example.hotelholidayv1.DAO.DAOManager;

import java.sql.ResultSet;

public class ExtrasRepository extends DAOManager {
    static ResultSet all(int id){
        StringBuilder query = new StringBuilder("SELECT * FROM extras ");
        if(id != -1){
            query.append(" WHERE id_extra = ").append(id);
        }
        query.append(";");
        return get(query);
    }
    static boolean save(Extras extra){
        StringBuilder query = new StringBuilder("INSERT INTO extras ( rate, type_extra ) values(");
        query.append("'").append(extra.rate).append("'");
        query.append(",").append("'").append(extra.type_extra).append("'");
        query.append(");");
        return post(query);
    }
    static boolean update(Extras extra){
        StringBuilder query = new StringBuilder("UPDATE extras SET");
        query.append(" rate = ").append(extra.rate);
        query.append(", type_extra = ").append("'").append(extra.type_extra).append("'");
        query.append(" WHERE id_extra = ").append(extra.id_extra);
        return post(query);
    }

    static boolean delete(int id){
        StringBuilder query = new StringBuilder("DELETE FROM extras WHERE id_extra = ");
        query.append(id);
        query.append(";");
        return post(query);
    }
}
