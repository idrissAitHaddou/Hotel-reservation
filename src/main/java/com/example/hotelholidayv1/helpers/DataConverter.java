package com.example.hotelholidayv1.helpers;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.*;

public class DataConverter {

    /**
     * Helper method that converts a ResultSet into a list of maps, one per row
     *
     * @param rs ResultSet
     * @return list of maps, one per row, with column name as the key
     * @throws SQLException if the connection fails
     */
    public static List<HashMap<String, Object>> toList(ResultSet rs) throws SQLException
    {
        List<String> wantedColumnNames  = getColumnNames(rs);
        return toList(rs, wantedColumnNames);
    }
    /**
     * Helper method that maps a ResultSet into a list of maps, one per row
     * @param rs ResultSet
     * @param wantedColumnNames of columns names to include in the result map
     * @return list of maps, one per column row, with column names as keys
     * @throws SQLException if the connection fails
     */
    public static List<HashMap<String,Object>> toList(ResultSet rs, List<String> wantedColumnNames) throws SQLException
    {
        List<HashMap<String,Object>> rows = new ArrayList<>();

        while (rs.next())
        {
            HashMap<String, Object> row = new HashMap<>();

            for (String columnName : wantedColumnNames) {
                Object value = rs.getObject(columnName);
                row.put(columnName, value);
            }

            rows.add(row);
        }

        return rows;
    }


    /**
     * Return all column names as a list of strings
     * @param rs query result set
     * @return list of column name strings
     * @throws SQLException if the query fails
     */
    public static List<String> getColumnNames(ResultSet rs) throws SQLException
    {
        List<String> columnNames = new ArrayList<>();

        ResultSetMetaData meta  = rs.getMetaData();

        int numColumns = meta.getColumnCount();
        for (int i = 1; i <= numColumns; ++i)
        {
            columnNames.add(meta.getColumnName(i));
        }

        return columnNames;
    }

    /**
     * Return parsed integer of strings
     * @param str to parse
     * @return parse it integer and if not integer return -1
     * @throws ArithmeticException if the query fails
     */

    public static int parseInt(String str){
        int result = -1;
        try{
            result = Integer.parseInt(str);
        }catch (ArithmeticException arithmeticException){
            arithmeticException.printStackTrace();
        }
        return result;
    }
}
