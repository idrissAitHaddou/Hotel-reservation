package com.example.hotelholidayv1.promotion;

import com.example.hotelholidayv1.DAO.DAOManager;

import java.sql.ResultSet;

public class PromotionRepository extends DAOManager {
    ResultSet all(int id){
        StringBuilder query = new StringBuilder("SELECT * FROM promotions ");
        if(id != 0){
            query.append(" WHERE id_promotion = ").append(id);
        }
        query.append(";");
        return get(query);
    }
    boolean save(Promotion promotion){
        StringBuilder query = new StringBuilder("INSERT INTO promotions SET (  image_src,percentage ,start_date, end_date, status ) values(");
        query.append(promotion.image_src);
        query.append(",").append("'").append(promotion.percentage).append("'");
        query.append(",").append("'").append(promotion.start_date).append("'");
        query.append(",").append("'").append(promotion.end_date).append("'");
        query.append(",").append("'").append(promotion.status).append("'");
        query.append(");");
        return post(query);
    }
    boolean update(Promotion promotion,int id){
        StringBuilder query = new StringBuilder("UPDATE promotions SET");
        query.append(" percentage = ").append("'").append(promotion.percentage).append("'");
        query.append(" start_date = ").append("'").append(promotion.start_date).append("'");
        query.append(" end_date = ").append("'").append(promotion.end_date).append("'");
        query.append(" image_src = ").append("'").append(promotion.image_src).append("'");
        query.append(" status = ").append("'").append(promotion.status).append("'");
        query.append(" WHERE id_promotion = ").append(id);
        return post(query);
    }

    boolean delete(int id){
        StringBuilder query = new StringBuilder("DELETE FROM promotions WHERE id_promotion = ");
        query.append(id);
        query.append(";");
        return post(query);
    }
}
