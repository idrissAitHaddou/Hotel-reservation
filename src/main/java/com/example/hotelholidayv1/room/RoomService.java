package com.example.hotelholidayv1.room;


import com.example.hotelholidayv1.helpers.DataConverter;
import com.example.hotelholidayv1.helpers.Methods;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class RoomService {
    public static ResultSet getAllRoomService(int id) {
        return RoomRepository.all(id);
    }
    public static ResultSet getAllRoomWithDetailsService(String startDate, String endDate) {

        return RoomRepository.allWithImagesAndRates(startDate, endDate);
    }
    // check availability of a room with id
    public static ResultSet checkRoomAvailability(String startDate, String endDate,int idRoom){
        return RoomRepository.checkAvailability(startDate,endDate,idRoom);
    }
    public static ResultSet getOneRoomWithDetailsService(int idRoom) {

        return RoomRepository.roomWithImagesAndRates(idRoom);
    }

    public static HashMap<String,Object> getRoomDetails(int idRoom) throws SQLException {

        ResultSet rooms = RoomRepository.all(idRoom);
        List<HashMap<String,Object>> roomList = DataConverter.toList(rooms);
        if(roomList.size() > 0){
            HashMap<String,Object> room = roomList.get(0);
            ResultSet images = getAllImageService(idRoom);
            room.put("images",DataConverter.toList(images));
            ResultSet rates = getAllRatesRoomService(idRoom);
            List<HashMap<String, Object>> ratesList = DataConverter.toList(rates);
            double totalPrice = 0;
            for (HashMap<String, Object> rate : ratesList) {
                totalPrice += (double) rate.get("rate");
            }
            room.put("avg",totalPrice/ratesList.size());
            room.put("rates",ratesList);
            return room;
        }
       return null;

    }
    public static ResultSet getAllImageService(int idRoom){
        return RoomRepository.allImages(idRoom);
    }
    public static ResultSet getAllRatesRoomService(int idRoom){
        return RoomRepository.allRates(idRoom);
    }

    public static void storeRoomService(HttpServletRequest request, Room room,String uploadPath) throws SQLException {
        List<String> images = new ArrayList<>();
        try {
            long unixTime;
            for ( Part part : request.getParts()) {
                String fileName = getFileName( part );
                System.out.println(fileName);
                if(!fileName.equals("Default.file") && fileName != null) {
                    unixTime = System.currentTimeMillis() / 1000L;
                    String fullPath = uploadPath + File.separator + fileName;
                    String extension = fileName.substring(fileName.lastIndexOf('.') + 1);
                    String name = fileName.substring(0,fileName.lastIndexOf('.') - 1);
                    String newName = name + unixTime + "." + extension;
                    String newFileName = uploadPath + File.separator + newName;
                    part.write(fullPath);
                    File file1 = new File(fullPath);
                    File file2 = new File(newFileName);
                    file1.renameTo(file2);
                    images.add(newName);
                }
            }
        } catch (ServletException e) {
            System.out.println(e.getMessage());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        images.add(request.getParameter("images"));
        RoomRepository.save(room,images);
    }

    /*
     * Récupération du nom du fichier dans la requête.
     */
    public static String getFileName( Part part ) {
        for ( String content : part.getHeader( "content-disposition" ).split( ";" ) ) {
            if ( content.trim().startsWith( "filename" ) )
                return content.substring( content.indexOf( "=" ) + 2, content.length() - 1 );
        }
        return "Default.file";
    }

    /*get room rates from start date to end date*/
    public static ResultSet getRateByDateService(String startDate, String endDate, int idRoom){
        return RoomRepository.getRateByDate(startDate,endDate,idRoom);
    }

    public static boolean updateRoomService(Room room,HttpServletRequest request, String uploadPath) throws SQLException {
        List<String> images = new ArrayList<>();
        try {
            long unixTime;
            for ( Part part : request.getParts()) {
                String fileName = getFileName( part );
                System.out.println(fileName);
                if(!fileName.equals("Default.file") && fileName != null) {
                    unixTime = System.currentTimeMillis() / 1000L;
                    String fullPath = uploadPath + File.separator + fileName;
                    String extension = fileName.substring(fileName.lastIndexOf('.') + 1);
                    String name = fileName.substring(0,fileName.lastIndexOf('.') - 1);
                    String newName = name + unixTime + "." + extension;
                    String newFileName = uploadPath + File.separator + newName;
                    part.write(fullPath);
                    File file1 = new File(fullPath);
                    File file2 = new File(newFileName);
                    file1.renameTo(file2);
                    images.add(newName);
                }
            }
        } catch (ServletException e) {
            System.out.println(e.getMessage());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        images.add(request.getParameter("images"));
        RoomRepository.addImages(room.id_room, images);
        RoomRepository.update(room);
        return true;
    }
    public static boolean deleteRoomService(int id, String uploadPath) throws SQLException {
        ResultSet imagesOnRoom = RoomRepository.allImages(id);
        while (imagesOnRoom.next()) {
            File file = new File(uploadPath + File.separator + imagesOnRoom.getString("src"));
            if(file.exists()) { file.delete(); }
        }
        return RoomRepository.delete(id);
    }

    public static boolean deleteRoomImageService(HttpServletRequest request, String uploadPath) throws SQLException {
        ResultSet imagesOnRoom = RoomRepository.allImagesWithId(Integer.parseInt(request.getParameter("id")));
        while (imagesOnRoom.next()) {
            File file = new File(uploadPath + File.separator + imagesOnRoom.getString("src"));
            if(file.exists()) { file.delete(); }
        }
         RoomRepository.deleteImages(Integer.parseInt(request.getParameter("id")));
        return true;
    }
}
