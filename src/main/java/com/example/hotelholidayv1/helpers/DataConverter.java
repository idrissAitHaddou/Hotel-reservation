package com.example.hotelholidayv1.helpers;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static jdk.nashorn.api.scripting.ScriptUtils.convert;

public class DataConverter {

    public static <T> ArrayList<Object> fromRsToArray(ResultSet rsData, String className) throws ClassNotFoundException, SQLException, InvocationTargetException, InstantiationException, IllegalAccessException {
        ArrayList<Object> dataArray = new ArrayList<>();
        Class<?> targetClass = Class.forName(className);
        for (Constructor<?> ctor : targetClass.getConstructors()) {
            Class<?>[] paramTypes = ctor.getParameterTypes();

            // If the arity matches, let's use it.
//            int numberOfColumn = (int) rsData.getColumnCount();
//            if (paramTypes.length == numberOfColumn) {

                // Convert the String arguments into the parameters' types.
                Object[] convertedArgs = new Object[paramTypes.length];
                while (rsData.next()){
                    for (int i = 0; i < convertedArgs.length; i++) {
                        convertedArgs[i] = convert(paramTypes[i], rsData.getString(paramTypes[i].getModifiers()));
                    }
                // Instantiate the object with the converted arguments.
                    dataArray.add(ctor.newInstance(convertedArgs));
                }

            }

      return dataArray;
    }

//    public Object instantiate(List<String> args,String className) throws ClassNotFoundException {
//        Class<?> targetClass =  Class.forName(className);
//        for (Constructor<?> ctor : targetClass.getConstructors()) {
//            Class<?>[] paramTypes = ctor.getParameterTypes();
//
//    }



}
