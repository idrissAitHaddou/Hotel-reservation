package com.example.hotelholidayv1.DAO;

import java.sql.*;

public class Connection {
    public static Statement statement;

    private static final String url = "jdbc:postgresql://localhost:5433/hotel-holiday";
    private static final String user = "postgres";
    private static final String password = "admin";

    public static Statement connect(){
        try{
            Class.forName("org.postgresql.Driver");
            java.sql.Connection connection = DriverManager.getConnection(url, user, password);
            System.out.println("connection successfully");
            return connection.createStatement();
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
            System.out.println("connection failed");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return null;
    }


}
