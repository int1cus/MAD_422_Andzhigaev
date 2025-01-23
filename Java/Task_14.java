/*
14. Парольная проверка
Создайте функцию для проверки сложности пароля.
Если пароль содержит менее 8 символов, выбрасывайте
исключение WeakPasswordException.
*/
import java.util.Arrays;
import java.util.List;

public class Task_14 {

    public static class WeakPasswordException extends Exception {
        public WeakPasswordException(String message) {
            super(message);
        }
    }

    public static void checkPasswordStrength(String password) throws WeakPasswordException {
        if (password == null || password.length() < 8) {
            throw new WeakPasswordException("Пароль слишком слабый. Минимальная длина — 8 символов.");
        }
        System.out.println("Пароль надежный.");
    }

    public static void main(String[] args) {
        try {
            checkPasswordStrength("12345678");
            checkPasswordStrength("");
        }
        catch (WeakPasswordException e) {
            System.err.println(e.getMessage());
        }
    }
}