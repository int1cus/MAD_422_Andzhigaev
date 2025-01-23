/*
12. Проверка делимости
Реализуйте функцию, которая принимает два числа и проверяет,
делится ли первое число на второе. Если второе число равно нулю,
выбрасывайте ArithmeticException.
*/

public class Task_12 {

    public static boolean isDivisible(int num1, int num2) {
        if (num2 == 0) {
            throw new ArithmeticException("На ноль делить нельзя.");
        }
        return num1 % num2 == 0;
    }

    public static void main(String[] args) {
        try {
            System.out.println("Результат: " + isDivisible(25, 5));
            System.out.println("Результат: " + isDivisible(7, 3));
            System.out.println("Результат: " + isDivisible(7, 0));
        }
        catch (ArithmeticException e) {
            System.err.println(e.getMessage());
        }
    }
}