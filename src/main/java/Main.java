import com.example.hotelholidayv1.user.User;
import com.example.hotelholidayv1.user.UserService;

public class Main {
    public static void main(String[] args) {
        System.out.println(UserService.passwordHashing("admin"));
    }
}
