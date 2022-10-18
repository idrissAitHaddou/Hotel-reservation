package com.example.hotelholidayv1.DB;

import java.sql.*;

public class Connection {
    private static Statement statement;

    static final String url = "jdbc:postgresql://localhost:5432/hotel-holiday";
    static final String user = "postgres";
    static final String password = "admin";

    public static Statement connect(){
        try{
            Class.forName("org.postgresql.Driver");
            java.sql.Connection connection = DriverManager.getConnection(url, user, password);
            statement = connection.createStatement();
        }catch (SQLException | ClassNotFoundException sqlException){
            sqlException.printStackTrace();
            System.out.println("connection failed");
        }
        return statement;
    }


}
