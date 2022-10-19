package com.example.hotelholidayv1.DB;

import java.sql.*;

public class Connection {
    private static Statement statement;

    private static final String url = "jdbc:postgresql://localhost:5433/hotel-holiday";
    private static final String user = "postgres";
    private static final String password = "admin";

    public static void connect(){
        try{
            Class.forName("org.postgresql.Driver");
            java.sql.Connection connection = DriverManager.getConnection(url, user, password);
            statement = connection.createStatement();
            System.out.println("connection successfully");
        } catch (SQLException  e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

}
