package com.example.hotelholidayv1.user;


import com.example.hotelholidayv1.helpers.DataConverter;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserService {

    public static void getAllUserService() {
    }
    public static void storeUserService(User user) {
        UserRepository.save(user);
    }
    public static void updateUserService(){

    }
    public static void deleteUserService(){

    }
}
