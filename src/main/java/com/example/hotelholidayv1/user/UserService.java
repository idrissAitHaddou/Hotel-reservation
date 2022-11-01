package com.example.hotelholidayv1.user;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserService {

    public static ResultSet getAllUserService(int id) throws SQLException {
       return UserRepository.all(id);
    }
    public static boolean updateUserService(User user){
        return UserRepository.update(user);
    }
    public static boolean checkPassowrdUserService(User user) throws SQLException {
        ResultSet response = UserRepository.checkPassword(user);
        while (response.next()) {
            if(response.getString("password").equals(user.password)) {
                return true;
            }
        }
        return false;
    }
}
