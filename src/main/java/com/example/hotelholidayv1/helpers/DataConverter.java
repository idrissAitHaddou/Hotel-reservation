package com.example.hotelholidayv1.helpers;

import java.lang.reflect.Constructor;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DataConverter {

    public <T> ArrayList<T> fromRsToArray(ResultSet rsData){
        ArrayList<T> data = new ArrayList<>();

      return data;
    }

//    public Object instantiate(List<String> args,String className) throws ClassNotFoundException {
//        Class<?> targetClass =  Class.forName(className);
//        for (Constructor<?> ctor : targetClass.getConstructors()) {
//            Class<?>[] paramTypes = ctor.getParameterTypes();
//
//    }

}
