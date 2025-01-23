/*
17. Остаток от деления
Создайте функцию, которая возвращает остаток от деления двух чисел.
Если второе число равно нулю, выбрасывайте исключение.
*/

public class Task_17 {

    public static int getRemainder(int num1, int num2) {
        if (num2 == 0) {
            throw new ArithmeticException("Деление на ноль недопустимо.");
        }
        return num1 % num2;
    }

    public static void main(String[] args) {
        try {
            System.out.println("Остаток от деления: " + getRemainder(5, 2));
            System.out.println("Остаток от деления: " + getRemainder(5, 0));
        }
        catch (ArithmeticException e) {
            System.err.println(e.getMessage());
        }
    }
}