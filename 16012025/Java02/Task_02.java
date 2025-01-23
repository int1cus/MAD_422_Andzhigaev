/*
2. Калькулятор деления
Создайте функцию для деления двух чисел. Если делитель равен нулю,
выбрасывайте ArithmeticException с сообщением о недопустимости деления на ноль.
*/

public class Task_2 {

    public static int divide(int num1, int num2) {
        if (num2 == 0) {
            throw new ArithmeticException("Делить на 0 нельзя");
        }
        return num1 / num2;
    }

    public static void main(String[] args) {
        try {
            System.out.printf("Результат деления: %d", divide(10, 2));
            System.out.printf("\nРезультат деления: %d", divide(10, 0));
        }
        catch (ArithmeticException e) {
            System.err.print("\n" + e.getMessage());
        }
    }
}