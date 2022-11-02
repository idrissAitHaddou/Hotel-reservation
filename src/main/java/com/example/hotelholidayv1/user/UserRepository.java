package com.example.hotelholidayv1.user;

import com.example.hotelholidayv1.DAO.Connection;
import com.example.hotelholidayv1.DAO.DAOManager;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserRepository extends DAOManager {
    // * get all users
    static ResultSet all(int id) throws SQLException {
        StringBuilder query = new StringBuilder("SELECT * FROM admins ");
        if(id != -1){
            query.append(" WHERE id_admin = ").append(id);
        }
        query.append(";");
        return get(query);
    }

    static ResultSet allStatics(String columnName, String table, String condition) throws SQLException {
        StringBuilder query = new StringBuilder("select count(*) as");
        query.append(" ").append(columnName);
        query.append(" from ").append(table);
        if(!condition.equals("")) {
            query.append(" where  ").append(condition);
        }
        query.append(";");
        return get(query);
    }

    static ResultSet checkPassword(User user) throws SQLException {
        StringBuilder query = new StringBuilder("SELECT * FROM admins");
        query.append(" WHERE password like ").append("'").append(user.password).append("'");
        query.append(";");
        return get(query);
    }
    public static boolean save(User user){
        StringBuilder query = new StringBuilder("INSERT INTO admins ( firstname, lastname, email, password ) values(");
        query.append("'").append(user.firstname).append("'");
        query.append(",").append("'").append(user.lastname).append("'");
        query.append(",").append("'").append(user.email).append("'");
        query.append(",").append("'").append(user.password).append("'");
        query.append(");");
        return post(query);
    }
    static boolean update(User user){
        StringBuilder query = new StringBuilder("UPDATE admins SET");
        query.append(" firstname = ").append("'").append(user.firstname).append("'");
        query.append(" ,lastname = ").append("'").append(user.lastname).append("'");
        query.append(" ,email = ").append("'").append(user.email).append("'");
        return post(query);
    }

    static boolean updatePassword(User user){
        StringBuilder query = new StringBuilder("UPDATE admins SET");
        query.append(" password = ").append("'").append(user.password).append("'");
        query.append(";");
        return post(query);
    }

    boolean delete(int id){
        StringBuilder query = new StringBuilder("DELETE FROM admins WHERE id_admin = ");
        query.append(id);
        query.append(";");
        return post(query);
    }

}
