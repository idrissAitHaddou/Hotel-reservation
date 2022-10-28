package com.example.hotelholidayv1.promotion;

import com.example.hotelholidayv1.room.RoomRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;

public class PromotionService {
    public static String addPromotionservice(HttpServletRequest request, Integer[] roomsId, Part file, String uploadPath) throws ParseException, IOException, SQLException {
        int isIdPromo = 0;
        String newFileName = "";
        long unixTime = System.currentTimeMillis() / 1000L;
        String fileName = getFileName( file );
        String newName = "";
        try {
            if(!fileName.equals("Default.file") && fileName != null) {
                unixTime = System.currentTimeMillis() / 1000L;
                String fullPath = uploadPath + File.separator + fileName;
                String extension = fileName.substring(fileName.lastIndexOf('.') + 1);
                String name = fileName.substring(0,fileName.lastIndexOf('.') - 1);
                newName = name + unixTime + "." + extension;
                newFileName = uploadPath + File.separator + newName;
                file.write(fullPath);
                File file1 = new File(fullPath);
                File file2 = new File(newFileName);
                file1.renameTo(file2);
            }
            Promotion promotion = PromotionServlet.convertToPromoObject(request, newName);
            PromotionRepository.save(promotion);
            ResultSet isPromo = PromotionRepository.lastPromotion();
            for (Integer rooms: roomsId) {
                while (isPromo.next()) {
                    RoomRepository.updateOne(rooms, isPromo.getInt("id_promo"));
                    isIdPromo = isPromo.getInt("id_promo");
                }
            }
            ResultSet promotions = PromotionRepository.all();
            while (promotions.next()) {
                if(Integer.parseInt(promotions.getString("id_promo")) != isIdPromo) {
                    File imagePromo = new File(uploadPath + File.separator + promotions.getString("image_src"));
                    if(imagePromo.exists()) { imagePromo.delete(); }
                }
            }
            PromotionRepository.delete(isIdPromo);
        }catch (IOException e) {
            System.out.println(e.getMessage());
        }
       return newName;
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
}
