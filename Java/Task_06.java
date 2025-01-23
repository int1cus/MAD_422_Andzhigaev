/*
6. Факториал
Напишите функцию, которая вычисляет факториал числа.
Если число отрицательное, выбрасывайте исключение.
*/

public class Task_6 {

    public static int fact(int num) {
        if (num < 0) {
            throw new IllegalArgumentException("Невозможно вычислить факториал отрицательного числа");
        }
        int res = 1;
        for (int i = 1; i <= num; i++) {
            res *= i;
        }
        return res;
    }

    public static void main(String[] args) {
        try {
            System.out.println("Результат: " + fact(4));
            System.out.println("Результат: " + fact(-1));
        }
        catch (IllegalArgumentException e) {
            System.err.println(e.getMessage());
        }
    }
}