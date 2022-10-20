package com.example.hotelholidayv1.payment;

import com.example.hotelholidayv1.DAO.DAOManager;

import java.sql.ResultSet;

public class PaymentRepository extends DAOManager {
    ResultSet all(int id){
        StringBuilder query = new StringBuilder("SELECT * FROM payments ");
        if(id != 0){
            query.append(" WHERE id_payment = ").append(id);
        }
        query.append(";");
        return get(query);
    }
    boolean save(Payment payment){
        StringBuilder query = new StringBuilder("INSERT INTO payments SET (  booking_id,status ,type_payment ) values(");
        query.append(payment.booking_id);
        query.append(",").append("'").append(payment.status).append("'");
        query.append(",").append("'").append(payment.type_card).append("'");
        query.append(");");
        return post(query);
    }
    boolean update(Payment payment,int id){
        StringBuilder query = new StringBuilder("UPDATE payments SET");
        query.append(" booking_id = ").append(payment.booking_id);
        query.append(" type_card = ").append(payment.type_card);
        query.append(" status = ").append(payment.status);
        query.append(" WHERE id_payment = ").append(id);
        return post(query);
    }

    boolean delete(int id){
        StringBuilder query = new StringBuilder("DELETE FROM payments WHERE id_payment = ");
        query.append(id);
        query.append(";");
        return post(query);
    }
}
