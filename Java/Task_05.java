/*
5. Нахождение корня
Реализуйте функцию, которая находит корень из числа.
Если число отрицательное, выбрасывайте IllegalArgumentException.
*/

public class Task_5 {

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