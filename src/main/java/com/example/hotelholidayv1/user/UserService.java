package com.example.hotelholidayv1.user;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class UserService {

    public static ResultSet getAllUserService(int id) throws SQLException {
       return UserRepository.all(id);
    }

    public static boolean loginService(User user) throws SQLException {
        user.password = passwordHashing(user.password);
        ResultSet response = UserRepository.login(user);
        while (response.next()) {
            if(response.getString("password").equals(user.password) && response.getString("email").equals(user.email)) {
                return true;
            }
        }
        return false;
    }

    public static HashMap<String, String> getAllStaticsUserService() throws SQLException {
        HashMap<String, String> counts = new HashMap<>();
        ResultSet roomsCount = UserRepository.allStatics("roomscount", "rooms", "type_room != 'SUITE' ");
        ResultSet suitesCount = UserRepository.allStatics("suitecount", "rooms", "type_room = 'SUITE' ");
        ResultSet bookingsCount = UserRepository.allStatics("bookingscount", "bookings", "");

        ResultSet singleCount = UserRepository.allStatics("singlecount", "rooms", "type_room = 'SINGLE' ");
        ResultSet doubleCount = UserRepository.allStatics("doublecount", "rooms", "type_room = 'DOUBLE' ");
        ResultSet triplecount = UserRepository.allStatics("triplecount", "rooms", "type_room = 'TRIPLE' ");

        counts.put("roomscount", loopResultSet(roomsCount, "roomscount"));
        counts.put("suitecount", loopResultSet(suitesCount, "suitecount"));
        counts.put("bookingscount", loopResultSet(bookingsCount, "bookingscount"));

        counts.put("singleCount", loopResultSet(singleCount, "singleCount"));
        counts.put("doubleCount", loopResultSet(doubleCount, "doubleCount"));
        counts.put("triplecount", loopResultSet(triplecount, "triplecount"));

        counts.put("firstname", loopResultSet(getAllUserService(-1), "firstname"));
        counts.put("lastname", loopResultSet(getAllUserService(-1), "lastname"));
        counts.put("email", loopResultSet(getAllUserService(-1), "email"));

        return counts;
    }

    public static String loopResultSet(ResultSet res, String columnName) throws SQLException {
        while (res.next()) {
            return res.getString(columnName);
        }
        return "";
    }

    public static boolean updateUserService(User user){
        return UserRepository.update(user);
    }

    public static boolean updatePasswordService(User user){
        user.password = passwordHashing(user.password);
        return UserRepository.updatePassword(user);
    }

    public static boolean checkPassowrdUserService(User user) throws SQLException {
        user.password = passwordHashing(user.password);
        ResultSet response = UserRepository.checkPassword(user);
        while (response.next()) {
            if(response.getString("password").equals(user.password)) {
                return true;
            }
        }
        return false;
    }

    public static String passwordHashing(String password) {
        MessageDigest messageDigest = null;
        try {
            messageDigest = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            System.out.println(e.getMessage());
        }
        messageDigest.update(password.getBytes());
        byte[] resultByteArray = messageDigest.digest();
        StringBuilder sb = new StringBuilder();
        for(Byte res:resultByteArray) {
            sb.append(String.format("%02x", res));
        }
        return sb.toString();
    }
}
