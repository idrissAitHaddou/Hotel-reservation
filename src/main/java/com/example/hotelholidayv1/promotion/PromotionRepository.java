package com.example.hotelholidayv1.promotion;

import com.example.hotelholidayv1.DAO.DAOManager;

import java.sql.ResultSet;

public class PromotionRepository extends DAOManager {
    static ResultSet all(){
        StringBuilder query = new StringBuilder("SELECT * FROM promotions ");
        query.append(";");
        return get(query);
    }
    static ResultSet lastPromotion() {
        StringBuilder query = new StringBuilder("SELECT * FROM promotions ORDER BY id_promo DESC LIMIT 1;");
        return get(query);
    }
    static boolean save(Promotion promotion){
        StringBuilder query = new StringBuilder("INSERT INTO promotions ( image_src, percentage ,start_date, end_date, status ) values(");
        query.append("").append("'").append(promotion.image_src).append("'");
        query.append(",").append("'").append(promotion.percentage).append("'");
        query.append(",").append("'").append(promotion.start_date).append("'");
        query.append(",").append("'").append(promotion.end_date).append("'");
        query.append(",").append("'").append(promotion.status).append("'");
        query.append(");");
        return post(query);
    }
//    boolean update(Promotion promotion,int id){
//        StringBuilder query = new StringBuilder("UPDATE promotions SET");
//        query.append(" percentage = ").append("'").append(promotion.percentage).append("'");
//        query.append(" start_date = ").append("'").append(promotion.start_date).append("'");
//        query.append(" end_date = ").append("'").append(promotion.end_date).append("'");
//        query.append(" image_src = ").append("'").append(promotion.image_src).append("'");
//        query.append(" status = ").append("'").append(promotion.status).append("'");
//        query.append(" WHERE id_promotion = ").append(id);
//        return post(query);
//    }

     static boolean delete(int id){
        StringBuilder query = new StringBuilder("DELETE FROM promotions WHERE id_promo != ");
        query.append(id);
        query.append(";");
        return post(query);
    }
    static boolean updatePromoImgRepository(int idPromo, String image) {
        StringBuilder query = new StringBuilder("UPDATE promotions SET");
        query.append(" image_src = ").append("'").append(image).append("'");
        query.append(" WHERE id_promo = ").append(idPromo);
        return post(query);
    }
}
