package com.example.hotelholidayv1.extras;

import com.example.hotelholidayv1.user.User;
import com.example.hotelholidayv1.user.UserRepository;

public class ExtrasService {
    private static User user = new User();
    public static void getAllExtrasService() {


    }
    public static void storeExtrasService() {
//        extras.type_extra = "breakfast";
        user.email = "ely";
        user.firstname = "idriss";
        user.lastname = "idriss";
        user.password = "admin";
//        UserRepository.save(user);
    }
    public static void updateExtrasService(){

    }
    public static void deleteExtrasService(){

    }

}
