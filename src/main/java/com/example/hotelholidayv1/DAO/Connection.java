package com.example.hotelholidayv1.DAO;

import java.sql.*;

public class Connection {
    public static java.sql.Connection connection;

    private static final String url = "jdbc:postgresql://localhost:5433/hotel-holiday";
    private static final String user = "postgres";
    private static final String password = "admin";

    public static Statement connect(){
        try{
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(url, user, password);
            return connection.createStatement();
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
            System.out.println("connection failed");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public static void closeConnection() {
        try {
            connection.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    }

}
