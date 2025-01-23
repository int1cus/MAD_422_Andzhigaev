/*
1. Функция для нахождения максимума
Напишите функцию, которая принимает два числа и возвращает
максимальное из них. Если числа равны, выбрасывайте исключение с сообщением об ошибке.
*/

public class Task_1 {

    public static int findMaxVal(int num1, int num2) {
        if (num1 == num2) {
            throw new IllegalArgumentException ("Числа равны");
        }
        return Math.max(num1, num2);
    }

    public static void main(String[] args) {
        try {
            System.out.printf("Максимальное из двух чисел: %d", findMaxVal(10, 20));
            System.out.printf("\nМаксимальное из двух чисел: %d", findMaxVal(10, 10));
        }
        catch (IllegalArgumentException e) {
            System.err.print("\n" + e.getMessage());
        }
    }
}