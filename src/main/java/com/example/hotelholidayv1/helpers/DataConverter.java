package com.example.hotelholidayv1.helpers;

import jakarta.servlet.http.HttpServletRequest;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.util.*;
import java.util.stream.Collectors;

public class DataConverter {

    public static Object requestToObject(HttpServletRequest request, String className) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
//        Class isClass = Class.forName(className);
//        Object obj = isClass.newInstance();
//        Enumeration keys = request.getParameterNames();
//        while (keys.hasMoreElements() )
//        {
//            String key = (String)keys.nextElement();
//            obj.fields.get(0) = ;
//        }
      return null;
    }

    public static List<String> getFieldsTitle(Object obj){
        return Arrays.stream(obj.getClass().getDeclaredFields())
                .map(Field::getName)
                .collect(Collectors.toList());
    }

}
