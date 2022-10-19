package com.example.hotelholidayv1.extras;

import java.util.Date;

public class Extras {
    public enum Types {
        breakfast, lunch, dinner, fruits, musique, spa, message, soin, excurion
    }
    public int id_extra;
    public double rate;
    public Types type_extra;
}
