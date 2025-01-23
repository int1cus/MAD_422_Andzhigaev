/*
18. Квадратный корень
Реализуйте функцию, которая находит квадратный корень числа.
Если число отрицательное, выбрасывайте исключение.
*/

public class Task_18 {

    public static int findSqrt(int num) {
        if (num < 0) {
            throw new IllegalArgumentException("Невозможно извлечь корень из отрицательного числа");
        }
        return (int) Math.sqrt(num);
    }

    public static void main(String[] args) {
        try {
            System.out.println("Результат: " + findSqrt(4));
            System.out.println("Результат: " + findSqrt(-1));
        }
        catch (IllegalArgumentException e) {
            System.err.println(e.getMessage());
        }
    }
}