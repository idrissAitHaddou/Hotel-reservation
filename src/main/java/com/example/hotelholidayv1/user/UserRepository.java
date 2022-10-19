package com.example.hotelholidayv1.user;

import com.example.hotelholidayv1.DAO.Connection;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserRepository extends Connection {
    // * get all users
    ResultSet GET() {
        ResultSet user = null;
        String query = "select * from admins";
        try {
            user = statement.executeQuery(query);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return  user;
    }

    // update users
    ResultSet POST(User user) {
        ResultSet userUpdated = null;
        StringBuilder query = new StringBuilder("update admins set firstname = ");
        query.append(user.firstname);
        query.append(", firstname = ");
        query.append(user.lastname);
        query.append(", email = ");
        query.append(user.email);
        query.append(" and id = ");
        query.append(user.id_admin);
        query.append(" ");
        try {
            userUpdated = statement.executeQuery(query.toString());
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return  userUpdated;
    }
}
