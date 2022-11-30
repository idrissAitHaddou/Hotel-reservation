package com.example.hotelholidayv1.helpers;

import java.sql.Date;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;

public class Methods {

    public static int returnNumberOfPersonByRoom(String type) {
        switch (type) {
            case "SINGLE" -> {
                return 1;
            }
            case "DOUBLE" -> {
                return 2;
            }
            case "TRIPLE" -> {
                return 3;
            }
            case "SUITE" -> {
                return 4;
            }
        }
        return 1;
    }

    public static double getTotalRate(List<HashMap<String,Object>> rooms) {
        double rate = 0;
        for (HashMap<String,Object> room : rooms) {
            rate += Double.parseDouble(String.valueOf(room.get("rate")));
        }
        return rate;
    }

    public static int diffDateInDay(String date1, String date2){
        Long d1 = Date.valueOf(date1).getTime();
        Long d2 = Date.valueOf(date2).getTime();
        return (int) ((d2 - d1) / (1000 * 60 * 60 * 24));
    }
}
