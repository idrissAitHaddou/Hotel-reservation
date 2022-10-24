package com.example.hotelholidayv1.payment;

import java.util.Date;

public class Payment {
    public enum Status {
        payed, pending, canceled
    }
    public enum Cards {
        visa, mastercard, paypal, stripe
    }
    public int id_payment;
    public int booking_id;
    public Status status;
    public Cards type_card;

    public Payment(int booking_id, Status status, Cards type_card){
        this.booking_id = booking_id;
        this.status = status;
        this.type_card = type_card;
    }
}
