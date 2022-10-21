package com.example.hotelholidayv1.helpers;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.*;

public class DataConverter {

    /**
     * Helper method that converts a ResultSet into a list of maps, one per row
     * @param rs ResultSet
     * @return list of maps, one per row, with column name as the key
     * @throws SQLException if the connection fails
     */
    public static List<?> toList(ResultSet rs) throws SQLException
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
    public static List<?> toList(ResultSet rs, List<String> wantedColumnNames) throws SQLException
    {
        List<Map<String,Object>> rows = new ArrayList<>();

        int numWantedColumns = wantedColumnNames.size();
        while (rs.next())
        {
            Map<String, Object> row = new TreeMap<>();

            for (int i = 0; i < numWantedColumns; ++i)
            {
                String columnName   = wantedColumnNames.get(i);
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

}
