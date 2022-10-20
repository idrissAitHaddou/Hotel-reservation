package com.example.hotelholidayv1.DAO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Objects;

public class DAOManager extends Connection {
    protected static ResultSet get(StringBuilder query){
        ResultSet resultSet  = null;
        try {
            if (connect() != null) {
                resultSet = Objects.requireNonNull(connect()).executeQuery(String.valueOf(query));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return resultSet;
    }

    protected static Boolean post(StringBuilder query){
        boolean isExecuted = false;
        try {
            if (connect() != null) {
                if(Objects.requireNonNull(connect()).executeUpdate(String.valueOf(query)) != 0)
                {
                    isExecuted = true;
                }
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return isExecuted;
    }

}
