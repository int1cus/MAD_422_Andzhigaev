/*
8. Калькулятор возведения в степень
Реализуйте функцию, которая возводит число в степень.
Если степень отрицательная, выбрасывайте исключение.
*/

public class Task_8 {

    public static int pow(int num, int power) {
        if (power < 0) {
            throw new IllegalArgumentException("Степень отрицательная");
        }
        return (int) Math.pow(num, power);
    }

    public static void main(String[] args) {
        try {
            System.out.println("Результат: " + pow(2,2));
            System.out.println("Результат: " + pow (2, -2));
        }
        catch (IllegalArgumentException e) {
            System.err.println(e.getMessage());
        }
    }
}